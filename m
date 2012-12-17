From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 21:35:15 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <CAGduivyvZNaaC8jdLzt1yVju3DS0Vu0fdaQYdHzK6LoRE==nYw@mail.gmail.com>
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
 <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87pq29bq11.fsf@dell.be.48ers.dk>
 <CAGduivyvZNaaC8jdLzt1yVju3DS0Vu0fdaQYdHzK6LoRE==nYw@mail.gmail.com>
Message-ID: <50CF8203.1010601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 00:15, Maxime Hadjinlian wrote:
> On Sun, Dec 16, 2012 at 11:17 PM, Peter Korsgaard<jacmet@uclibc.org>  wrote:
>>>>>>> "Maxime" == Maxime Hadjinlian<maxime.hadjinlian@gmail.com>  writes:
>>
>>   Maxime>  This fix is needed for the 64bits build because Netatalk will assume the library
>>   Maxime>  are stored in [..]/lib64/ instead of [..]/lib/
>>
>> Hmm, we still seem to have issues on the autobuilders:
>>
>> http://autobuild.buildroot.net/results/cf5c3ce94c229204bfa0f19b1009c13a9bcc1dfc/build-end.log
>>
>>   Maxime>  +++ b/package/netatalk/netatalk.mk
>>   Maxime>  @@ -8,7 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
>>   Maxime>   NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
>>
>>   Maxime>   NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
>>   Maxime>  -NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
>>   Maxime>  +NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_LIB)/usr/lib
>>
>>
>> I guess you meant STAGING_DIR instead here, will fix.
> This is strange because I tested with a 64 bits build and I had'nt the
> problem anymore.. And I don't remember rewriting the patch before
> sending it here. But then again, you're totally right, this does'nt
> make sense. I'm really wondering how it could have worked for me :/

 I guess it was an accident then :-)

 configure checks for libdb by doing: ls $bdblibdir/lib$lib.*
and bdblibdir="${bdbdir}/${atalk_libname}" and atalk_libname="lib64" for 
most 64-bit architectures.

 So you happened to have an existing /usr/lib/lib64/libdb* on your build 
machine...

 BDB_LIB isn't even used by configure, so I don't think does patch does 
much :-)


 The problem I encounter in my build is that configure uses `ls ...` to 
find the library, and my /bin/ls is linked against libacl.so.1. It seems 
LD_LIBRARY_PATH is overridden because ls fails with:

/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.14' not found (required by /home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libacl.so.1

 And indeed, configure sets:
eval export $shlibpath_var=$bdblibdir

 This is OK for native builds, but not for cross-builds...

 Looking a bit further into macros/db3-check.m4, it looks even worse:
after that configure step, there is an
eval export $shlibpath_var=$saved_shlibpath_var
which expands to
export LD_LIBRARY_PATH=LD_LIBRARY_PATH
:-)

 I'll try to cook a fix and send a patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
