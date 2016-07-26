From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Jul 2016 11:57:17 +0930
Subject: [Buildroot] [PATCH] package/pflash: new package
In-Reply-To: <20160726000756.560aa52e@free-electrons.com>
References: <1469426487-19558-1-git-send-email-joel@jms.id.au>
 <20160726000756.560aa52e@free-electrons.com>
Message-ID: <CACPK8XeOj5AyLk6iNZZ2-0ouc2O5W30YRfpZTLAQ=nPxEPZ1cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 26, 2016 at 7:37 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 25 Jul 2016 15:31:27 +0930, Joel Stanley wrote:
>
>> diff --git a/package/pflash/Config.in b/package/pflash/Config.in
>> new file mode 100644
>> index 000000000000..315989724088
>> --- /dev/null
>> +++ b/package/pflash/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PFLASH
>> +     bool "pflash"
>> +     depends on BR2_arm || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
>
> Is there something that makes it inherently usable only on those
> architectures?

Yeah, the 'libflash' library selects different backends depending on it's

>
>> diff --git a/package/pflash/pflash.mk b/package/pflash/pflash.mk
>> new file mode 100644
>> index 000000000000..ab19ad699866
>> --- /dev/null
>> +++ b/package/pflash/pflash.mk
>> @@ -0,0 +1,32 @@
>> +################################################################################
>> +#
>> +# pflash
>> +#
>> +################################################################################
>> +
>> +PFLASH_VERSION = skiboot-5.2.4
>> +
>> +PFLASH_SITE = $(call github,open-power,skiboot,$(PFLASH_VERSION))
>
> So skiboot is a much much larger repository, with lots of other things,
> and you're building just the external/pflash subdirectory of it.
>
> Are you sure we'll never want to have a package for other things in the
> skiboot repository?

We might want to package other tools in the future.

How should I change the packaging of pflash?

>
>> +PFLASH_INSTALL_STAGING = YES
>
> You're not specifying any PFLASH_INSTALL_STAGING_CMDS, so this is
> useless.

Thanks for clearing that up. I've fixed it in v2.

>
>> +PFLASH_LICENSE = Apache 2.0
>> +PFLASH_LICENSE_FILE = LICENCE
>> +
>> +PFLASH_MAKE_OPTS += CROSS_COMPILE="$(TARGET_CROSS)" \
>> +                 PFLASH_VERSION=$(PFLASH_VERSION) \
>> +                 DESTDIR=$(TARGET_DIR) \
>
> DESTDIR should only be passed at install time.

Okay.

>
>> +                 -C $(@D)/external/pflash \
>
> Unneeded trailing \

Okay.

>
> Also, we prefer the -C option and its argument to be part of the build
> and install commands themselves.

Even though we would be replicating them for every invocation of make?
I think it's better placed in a variable so changes can be made in one
place.

Cheers,

Joel
