From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 3 Apr 2017 14:59:53 -0700
Subject: [Buildroot] [PATCH v3] package/xen: Update to version 4.8.0
In-Reply-To: <20170401145657.5ed91b47@free-electrons.com>
References: <20170331181114.968-1-alistair.francis@xilinx.com>
 <20170401145657.5ed91b47@free-electrons.com>
Message-ID: <CAKmqyKOAZFuJ2oEa-VZC0bUf9nV8-PKxz4z=4gHEok++a=Sh9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 1, 2017 at 5:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 31 Mar 2017 11:11:14 -0700, Alistair Francis wrote:
>
>> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" $@
>> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" $@
>> +
>> + include/config/%.conf: include/config/auto.conf.cmd $(KCONFIG_CONFIG)
>> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" silentoldconfig
>> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" silentoldconfig
>> +
>> + # Allow people to just run `make` as before and not force them to configure
>> + $(KCONFIG_CONFIG):
>> +-    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" defconfig
>> ++    $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)" HOST_EXTRACFLAGS="$(APPEND_CFLAGS)" defconfig
>
> I'm sorry, but this looks completely wrong. HOSTCC and HOST_EXTRACFLAGS
> refer to the host compiler and host compiler flags, and you're passing
> flags for the target into them...

I'm not changing anything related to HOSTCC flags, I'm leaving that as
they always have been in Xen.

All I'm doing is ensuring that the APPEND_CFLAGS argument is passed
into all instances of make.

>
>> +# We need to change CFLAGS to APPEND_CFLAGS for the Xen build system to work
>> +XEN_TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))
>
> Why is this needed in the first place? Wasn't the workaround from Yann
> E. Morin working fine to avoid the CFLAGS issue?

The issue that Yann fixed was different, it was related to a double
definition of __OBJECT_FILE__. AFAIK it isn't needed with Xen 4.8, at
least I haven't seen any issues with my testing.

The other option is to just hard code remove -Werror from the Xen
source. The problem with that is it is in multiple places so we need
to keep removing it for every new version.

Thanks,

Alistair

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
