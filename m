From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Fri, 11 May 2007 16:31:49 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <46433B79.50101@rcn.com>
References: <46432A7D.6050808@rcn.com>  <46433B79.50101@rcn.com>
Message-ID: <1178893909.11554.75.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This actually causes an override of the .patched target in
> toolchain/kernel-headers/kernel-headers-new.makefile.
> 
> Suggestions?

I just bumped into the same issue myself.

in toolchain/kernel-headers/kernel-headers-new.makefile

I had to change

$(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
toolchain/kernel-headers \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
ifeq ($(BR2_PACKAGE_OPENSWAN),y)
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
endif
        touch $@


to

$(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX_HEADERS_UNPACK_DIR)/.unpacked
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
toolchain/kernel-headers \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
ifeq ($(BR2_PACKAGE_OPENSWAN),y)
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
endif
        touch $@

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
