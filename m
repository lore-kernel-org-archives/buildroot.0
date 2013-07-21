From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 00:35:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] dropwatch: new package
In-Reply-To: <1374284049-8159-1-git-send-email-tjlee@ambarella.com> (Tzu-Jung
 Lee's message of "Sat, 20 Jul 2013 09:34:09 +0800")
References: <1374284049-8159-1-git-send-email-tjlee@ambarella.com>
Message-ID: <87a9lfr16n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 T> ---
 T>  package/Config.in                           |  1 +
 T>  package/dropwatch/Config.in                 |  7 +++++++
 T>  package/dropwatch/dropwatch-1.4-build.patch | 27 ++++++++++++++++++++++++++
 T>  package/dropwatch/dropwatch.mk              | 30 +++++++++++++++++++++++++++++
 T>  4 files changed, 65 insertions(+)
 T>  create mode 100644 package/dropwatch/Config.in
 T>  create mode 100644 package/dropwatch/dropwatch-1.4-build.patch
 T>  create mode 100644 package/dropwatch/dropwatch.mk

 T> diff --git a/package/Config.in b/package/Config.in
 T> index 286a605..7730317 100644
 T> --- a/package/Config.in
 T> +++ b/package/Config.in
 T> @@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 T>  source "package/dhrystone/Config.in"
 T>  source "package/dstat/Config.in"
 T>  source "package/dmalloc/Config.in"
 T> +source "package/dropwatch/Config.in"
 T>  source "package/gdb/Config.in"
 T>  source "package/iozone/Config.in"
 T>  source "package/kexec/Config.in"
 T> diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
 T> new file mode 100644
 T> index 0000000..69d7cd5
 T> --- /dev/null
 T> +++ b/package/dropwatch/Config.in
 T> @@ -0,0 +1,7 @@
 T> +config BR2_PACKAGE_DROPWATCH
 T> +	bool "dropwatch"
 T> +	help
 T> +	  Dropwatch is a project I am tinkering with to improve the visibility
 T> +	  developers and sysadmins have into the Linux networking stack.

That doesn't really explain what it is about.

How about using the description from the man page instead?
(http://linux.die.net/man/1/dropwatch)

Dropwatch is an interactive utility for monitoring and recording packets
that are dropped by the kernel

 T> +
 T> +	  https://git.fedorahosted.org/git/dropwatch.git

Please use https://fedorahosted.org/dropwatch/ instead.

 T> diff --git a/package/dropwatch/dropwatch-1.4-build.patch b/package/dropwatch/dropwatch-1.4-build.patch
 T> new file mode 100644
 T> index 0000000..eed43e8
 T> --- /dev/null
 T> +++ b/package/dropwatch/dropwatch-1.4-build.patch
 T> @@ -0,0 +1,27 @@
 T> +From 03bab84ca3f102274837e83ee6da4c997a9da018 Mon Sep 17 00:00:00 2001
 T> +From: Tzu-Jung Lee <tjlee@ambarella.com>
 T> +Date: Fri, 12 Jul 2013 20:00:57 +0800
 T> +Subject: [PATCH] build: modify hardcoded gcc to support buildroot
 T> +

It isn't just about buildroot, it is for everything not just using
'gcc'.

Did you send this patch upstream?


 T> +Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
 T> +
 T> +diff --git a/src/Makefile b/src/Makefile
 T> +index 026b6ba..b87ae9f 100644
 T> +--- a/src/Makefile
 T> ++++ b/src/Makefile
 T> +@@ -5,10 +5,10 @@ OBJFILES := main.o lookup.o\
 T> + 	 lookup_bfd.o lookup_kas.o
 T> + 
 T> + dropwatch: $(OBJFILES) 
 T> +-	gcc -g -o dropwatch $(OBJFILES) $(LDFLAGS) 
 T> ++	$(CC) -g -o dropwatch $(OBJFILES) $(LDFLAGS)
 T> + 
 T> + %.o: %.c
 T> +-	gcc $(CFLAGS) $<
 T> ++	$(CC) $(CFLAGS) $<
 T> + clean:
 T> + 	rm -f dropwatch *.o
 T> + 
 T> +-- 
 T> +1.8.3.2
 T> +
 T> diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
 T> new file mode 100644
 T> index 0000000..b9676cb
 T> --- /dev/null
 T> +++ b/package/dropwatch/dropwatch.mk
 T> @@ -0,0 +1,30 @@
 T> +#############################################################
 T> +#
 T> +# dropwatch
 T> +#
 T> +#############################################################

Nit: These ##### lines should be 80 chars.

 T> +
 T> +DROPWATCH_VERSION = 1.4
 T> +DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
 T> +DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
 T> +DROPWATCH_DEPENDENCIES = readline libnl binutils

You should select those packages in Config.in as well then.

 T> +DROPWATCH_LICENSE = GPLv2+
 T> +DROPWATCH_LICENSE_FILE = COPYING
 T> +
 T> +define DROPWATCH_INSTALL_TARGET_CMDS
 T> +  cp $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin

We normally use
$(INSTALL) -D -m 0755 $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin/dropwatch

And normally put it below the build step.

Does it really make sense to put in usr/bin? Don't you need root
permissions to listen for these events?


From the website I see it apparently relies on some out of tree netlink
patches:

Normally, monitoring for dropped packets requires the creation of a
script that periodically polls all the aformentioned interfaces,
checking for a change in various counter values. Dropwatch instead
listens on a netlink socket for the kernel to inform userspace (apps
like dropwatch and any others), that a packet has been dropped. This of
course implies that the kernel has some sort of functionality to this
end. That functionality (called the netlink Drop Monitor protocol), is
currently being reviewed upstream. For those who would like to
experiment with dropwatch now, you can either retrieve the appropriate
kernel patches from the netdev mailing list, or download them here

Is that still the case? Have these been reviewed on the netdev list?
Have they been accepted/rejected?


 T> +endef
 T> +
 T> +define DROPWATCH_BUILD_CMDS
 T> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
 T> +endef
 T> +
 T> +define DROPWATCH_CLEAN_CMDS
 T> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
 T> +endef
 T> +
 T> +define DROPWATCH_UNINSTALL_CMDS
 T> +  rm -f $(TARGET_DIR)/usr/bin/dropwatch
 T> +endef
 T> +
 T> +$(eval $(generic-package))

-- 
Bye, Peter Korsgaard
