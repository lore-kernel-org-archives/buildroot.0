From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sat, 21 Dec 2013 14:15:44 +0100
Subject: [Buildroot] How to create the package from software using
	"bootstrap" to configure?
Message-ID: <CAMduVEcRz63T4e5Fa_4iDm-H9e9RuOWkDMNTXAHe6VtZsLXhtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to add the avrdude (extended with the linuxspi programmer) to
the buildroot.
The sources generally seem to be autotools-package compatible, but unfortunately
it is necessary to run the "bootstrap" script, before the ./configure.

I tried to create the avrdude.mk file as:

AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
AVRDUDE_SITE = http://github.com/kcuzner/avrdude/tarball/$(AVRDUDE_VERSION)
AVRDUDE_LICENSE = GPLv2
AVRDUDE_INSTALL_TARGET = YES
AVRDUDE_AURORECONF = YES


define AVRDUDE_CONFIGURE_CMDS
        (cd $(@D)/avrdude; \
                ./bootstrap --prefix=$(TARGET_DIR)/usr
--parallel=$(PARALLEL_JOBS) ;\
                ./configure --prefix=$(TARGET_DIR)/usr \
        )
endef

define AVRDUDE_BUILD_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude
endef

define AVRDUDE_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/avrdude install
endef

$(eval $(generic-package))

but it leads to compilation of binaries for my host CPU, not for the target.
What is the proper way to port such packages to  the buildroot.

-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: B191 ACF0 7909 83FA 3F9B  450C 407E 3C4B 4569 D119
confidential: 2BF3 F90F 6EA8 7D35 59FD  5080 78ED 33DE 1312 D8F8
