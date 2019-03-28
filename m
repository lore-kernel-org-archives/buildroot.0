From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Thu, 28 Mar 2019 16:14:25 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <20190328121441.02648d09@windsurf> (Thomas Petazzoni's message of
 "Thu, 28 Mar 2019 12:14:41 +0100")
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf> <87bm1w9ck5.fsf@haabendal.dk>
 <20190328121441.02648d09@windsurf>
Message-ID: <87tvfnav5a.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello Esben,
>
> On Wed, 27 Mar 2019 23:28:58 +0100
> Esben Haabendal <esben.haabendal@gmail.com> wrote:
>
>> > If it has been resolved in glibc 2.23, should
>> > we remove those work-arounds ?  
>> 
>> It depends.  If we do that, people using external toolchains with glibc
>> older than 2.23 would see breakage.
>> 
>> > I just would like to make sure we don't work around this problem in
>> > different ways in different packages.  
>> 
>> Sounds like a good plan.  Unfortunately, I don't see that any of the
>> proposed workaround generally good.
>> 
>> For packages where large file support is not deemed an important
>> feature, The -U_FILE_OFFSET_BITS workaround is good.  But for packages
>> where large file support could be relevant, it seems like a bad idea to
>> disable it just to stay compatible with old glibc versions that only a
>> few people use together with new buildroot versions.
>> 
>> If you like, I will switch to the -U_FILE_OFFSET_BITS for mtree
>> package.  I personally don't need large file support...
>
> OK, I did a bit of testing, taking as example the libcgroup package. I
> confirmed that without -U_FILE_OFFSET_BITS, libcgroup fails to build
> with the Sourcery ARM toolchain (old glibc), but builds perfectly fine
> with the Linaro toolchain (recent glibc).
>
> So, from there, you have two options:
>
>  (1) You don't have much time and you're not willing to not much
>      additional work. In this case, use the -U_FILE_OFFSET_BITS trick in
>      mtree. This way, we have the same quirk/workaround everywhere for this
>      fts.h problem.
>
>  (2) You have more time. In this case, add a hidden option in
>      toolchain/Config.in called BR2_TOOLCHAIN_HAS_BROKEN_FTS. This hidden
>      option should be selected by the broken ARM Codesourcery toolchain.
>      Then all packages that do the -U_FILE_OFFSET_BITS trick can be changed
>      to only do it when BR2_TOOLCHAIN_HAS_BROKEN_FTS is enabled
>      (including mtree, of course).
>
>      Obviously, this leaves old custom external toolchains potentially
>      broken, as for these, the work around will not be applied. If this
>      turns out to really be a problem in practice, we can always add an
>      option BR2_TOOLCHAIN_EXTERNAL_CUSTOM_HAS_BROKEN_FTS, and let the
>      user enable it + a check that if this option is not enabled, the
>      external toolchain really does not have broken fts.h.
>
> Let me know which option you chose :-)

I think I will give option 2 a try.  Sounds like a nice solution :-)

/Esben
