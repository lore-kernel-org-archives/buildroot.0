From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2012 09:49:12 +0200
Subject: [Buildroot] [PATCH] wireshark: new package
In-Reply-To: <20121024073156.GA29646@sapphire.tkos.co.il>
References: <c866c7ffc05da225311abef42a80696310d22157.1350887157.git.baruch@tkos.co.il>
 <5086CE63.4040302@mind.be> <20121024073156.GA29646@sapphire.tkos.co.il>
Message-ID: <50879D78.4050702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/12 09:31, Baruch Siach wrote:
[snip]
>>> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
>>> new file mode 100644
>>> index 0000000..c89fbf8
>>> --- /dev/null
>>> +++ b/package/wireshark/wireshark.mk
>>> @@ -0,0 +1,10 @@
>>> +WIRESHARK_VERSION = 1.8.3
>>> +WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
>>> +WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
>>> +WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
>>> +WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>>> +WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
>>> +		     prefix=$(STAGING_DIR)/usr --with-sysroot=$(STAGING_DIR) \
>>
>>   Why is the --with-sysroot needed?
>
> Removing --with-sysroot doesn't negatively affect build or run of tshark. I
> get the following line during configure, however:
>
> checking for sysroot... no
>
> Is it significant?

  You'll see that for most autoconf packages.

>>> +		     --enable-static=no
>>
>>   We normally build both dynamic and static libraries, and remove the static
>> library in the target.  Doesn't that work in wireshark?  Can you add a comment
>> to explain that?
>
> Without --enable-static=no build fails with:
>
> ld: tshark: hidden symbol `__GI_atan' isn't defined
>
> My toolchain is external:
>
> powerpc-linux-gnu-gcc (Sourcery G++ Lite 2011.03-38) 4.5.2
>
> Any ideas?

  Nothing right away, except maybe a missing -lm but then I don't see why it
doesn't fail in the non-static case.  But we probably don't want the static
build of tshark anyway, so just keep the --enable-static=no and add comment
explaining why it doesn't work without it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
