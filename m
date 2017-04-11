From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 11 Apr 2017 14:49:45 -0700
Subject: [Buildroot] [PATCH v3] package/xen: Update to version 4.8.0
In-Reply-To: <20170404070405.14db1e0f@free-electrons.com>
References: <20170331181114.968-1-alistair.francis@xilinx.com>
 <20170401145657.5ed91b47@free-electrons.com>
 <CAKmqyKOAZFuJ2oEa-VZC0bUf9nV8-PKxz4z=4gHEok++a=Sh9A@mail.gmail.com>
 <20170404070405.14db1e0f@free-electrons.com>
Message-ID: <CAKmqyKNaKWyvLbyTxT7W77r6hnD2Sp+NE2XBWbdMY=rUxZVniQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 3, 2017 at 10:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 3 Apr 2017 14:59:53 -0700, Alistair Francis wrote:
>> On Sat, Apr 1, 2017 at 5:56 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Hello,
>> >
>> > On Fri, 31 Mar 2017 11:11:14 -0700, Alistair Francis wrote:
>> >
>> >> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" $@
>> >> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" $@
>> >> +
>> >> + include/config/%.conf: include/config/auto.conf.cmd $(KCONFIG_CONFIG)
>> >> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" silentoldconfig
>> >> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" silentoldconfig
>> >> +
>> >> + # Allow people to just run `make` as before and not force them to configure
>> >> + $(KCONFIG_CONFIG):
>> >> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" defconfig
>> >> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" defconfig
>> >
>> > I'm sorry, but this looks completely wrong. HOSTCC and HOST_EXTRACFLAGS
>> > refer to the host compiler and host compiler flags, and you're passing
>> > flags for the target into them...
>>
>> I'm not changing anything related to HOSTCC flags, I'm leaving that as
>> they always have been in Xen.
>
> Of course you are changing things. You are changing:
>
> HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" defconfig
>
> to:
>
> HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" defconfig
>
> So indeed, you're not changing HOSTCC or HOSTCXX, but you are passing
> HOST_EXTRACFLAGS to the value APPEND_CFLAGS.
>
> And HOST_EXTRACFLAGS as the name suggests seems to be flags for
> building *host* programs (i.e built for the build machine). And you're
> using that to pass through APPEND_CFLAGS *target* flags.
>
>> All I'm doing is ensuring that the APPEND_CFLAGS argument is passed
>> into all instances of make.
>
> Yes, and that is wrong because APPEND_CFLAGS contains target flags.
>
>> >> +# We need to change CFLAGS to APPEND_CFLAGS for the Xen build system to work
>> >> +XEN_TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))
>
> See here: you're changing TARGET_CONFIGURE_OPTS from:
>
>         CFLAGS="$(TARGET_CFLAGS)"
>
> to
>
>         APPEND_CFLAGS="$(TARGET_CFLAGS)"
>
> So APPEND_CFLAGS really contains target flags, and Xen will use them
> when building host programs. This is not good.

Ok, I have figured this out.

All I need to do it pass in '-Wno-error' to the host flags. I can do
that by just passing in: HOST_EXTRACFLAGS="-Wno-error" when running
make. Then no changes to Xen's build system are required.

I'll send a patch out now.

Thanks,

Alistair

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
