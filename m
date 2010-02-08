From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 8 Feb 2010 09:30:38 +0100
Subject: [Buildroot] Adding a package with source code in-tree
In-Reply-To: <bdca99241002060300o11573c5by2fdb5cbb357677a2@mail.gmail.com>
References: <bdca99241002050818h3c7e5f5ewbe4596cfc9e1ae43@mail.gmail.com>
	<e4b6ec781002051728n59b384b7k42117629f60d7e12@mail.gmail.com>
	<bdca99241002060300o11573c5by2fdb5cbb357677a2@mail.gmail.com>
Message-ID: <2c9a759f1002080030k201a6cbeh86ac1e08fca235@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastian,

On Sat, Feb 6, 2010 at 12:00, Sebastian Schuberth <sschuberth@gmail.com> wrote:
> Hi,
>
> thanks for the suggestion, but in fact I want my package to be built
> when I type "make" in the buildroot root directory, just like any
> other package. So I assume that's not possible, and I would have to
> put my source code into some tar file and upload that to a server?

No, you can easily accomplish this either by using a manual makefile,
or by overriding selected rules in an autotools-based makefile.

Below is an example of a manual makefile (beware though, I've modified
this one slightly, thus I'm not sure that this is completely
working... Bugs may exist!).

I've also got quite a few examples that skip the copying step. The
clean target is empty, although it should obviously call clean in the
general case.

Regards,
Anders

-------------------
#############################################################
#
# BOOTCOUNT -- clears the bootcounter in the GPBR
#
#############################################################
BOOTCOUNT_VERSION = 1.0
BOOTCOUNT_SOURCE = bootcount

BOOTCOUNT_DIR = $(BUILD_DIR)/bootcount-$(BOOTCOUNT_VERSION)
BOOTCOUNT_BIN = bootcount.ko

BOOTCOUNT_LINUX_VERSION=$(strip $(subst '',,$(BR2_LINUX26_VERSION)))
BOOTCOUNT_KDIR=/lib/modules/$(BOOTCOUNT_LINUX_VERSION)/extra
BOOTCOUNT_TARGET_BINARY=$(BOOTCOUNT_KDIR)/$(BOOTCOUNT_BIN)

BR2_PACKAGE_BOOTCOUNT_DIR = $(BASE_DIR)/../../



$(BOOTCOUNT_DIR)/.source:
	mkdir -p $(BOOTCOUNT_DIR)
	cp -r $(BR2_PACKAGE_BOOTCOUNT_DIR)/$(BOOTCOUNT_SOURCE)/* $(BOOTCOUNT_DIR)
	touch $@

$(BOOTCOUNT_DIR)/$(BOOTCOUNT_BIN): $(BOOTCOUNT_DIR)/.source
	$(MAKE) V=1 -C $(BOOTCOUNT_DIR) ARCH=$(BR2_ARCH)
CROSS_COMPILE=$(KERNEL_CROSS) KDIR=$(LINUX_DIR)

$(TARGET_DIR)/$(BOOTCOUNT_TARGET_BINARY): $(BOOTCOUNT_DIR)/$(BOOTCOUNT_BIN)
	$(MAKE) INSTALL_MOD_PATH=$(TARGET_DIR) -C $(BOOTCOUNT_DIR)
KDIR=$(LINUX_DIR) modules_install
	touch $@

bootcount: linux26 $(TARGET_DIR)/$(BOOTCOUNT_TARGET_BINARY)

bootcount-source: $(BOOTCOUNT_DIR)/.source

bootcount-install: $(TARGET_DIR)/$(BOOTCOUNT_TARGET_BINARY)

bootcount-uninstall:
	-rm -f $(TARGET_DIR)/$(BOOTCOUNT_TARGET_BINARY)

bootcount-clean:

bootcount-dirclean:
	-rm -rf $(BOOTCOUNT_DIR)


#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_BOOTCOUNT),y)
TARGETS+=bootcount
endif
