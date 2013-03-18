From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Mon, 18 Mar 2013 13:38:24 +1100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com><20130313083725.4605312e@skate><201303131910.06613.yann.morin.1998@free.fr><20130314084816.00d23bd7@skate><EE5E77B503DE9A478B63A89AAD2585EDB66A63@vpane.excalyptech.com>
 <20130315092525.0fd38998@skate>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A64@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 15 Mar 2013 at 19:25:25, Thomas Petazzoni wrote:

> Nothing in Buildroot tries to get rebuilt automatically when there are
> configuration changes. This has been the Buildroot policy for a long
> time, and only the Crosstool-NG backend was moving away from this
> general policy.

I understand that's the idea, however, as it is now the internal
buildroot toolchain will attempt to rebuild uClibc if the uClibc
configuration file changes. I'm assuming it is via the following
dependency chain (found in toolchain/uClibc/uclibc.mk"):

    $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched
$(UCLIBC_CONFIG_FILE)
    $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
    $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured
$(UCLIBC_DIR)/.config
    $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured
$(gcc_intermediate) $(LIBFLOAT_TARGET)

> See http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013 (search for
> "Switching to ct-ng as the default toolchain backend has been in the
> plans for several years").

Thanks that's quite useful.

Cheers,
Przemyslaw Wrzos
