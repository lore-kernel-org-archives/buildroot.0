From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 09:36:48 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20070729174728.EC106A4508@busybox.net>
References: <20070729174728.EC106A4508@busybox.net>
Message-ID: <20070730073648.GD21479@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 29, 2007 at 10:47:28AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-29 10:47:27 -0700 (Sun, 29 Jul 2007)
>New Revision: 19333
>
>Log:
>Add AVR32 support to uClibc
>
>Modified:
>   trunk/buildroot/toolchain/uClibc/uclibc.mk
>
>
>Changeset:
>Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
>===================================================================
>--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-29 17:43:50 UTC (rev 19332)
>+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-29 17:47:27 UTC (rev 19333)

[snip utterly ugly VENDOR specific stuff]

>@@ -241,15 +252,19 @@
> 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
> 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
> 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
>+	
>+	touch $@
>+

Please explain the need for the empty line above (and remove it).

>+$(UCLIBC_DIR)/.oldconfig:	$(UCLIBC_DIR)/.config
> 	$(MAKE1) -C $(UCLIBC_DIR) \
> 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
> 		DEVEL_PREFIX=/usr/ \
> 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
> 		HOSTCC="$(HOSTCC)" \
> 		oldconfig
>-	touch -c $@
>+	touch $@
> 
>-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
>+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.oldconfig
> 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
> 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
> 		DEVEL_PREFIX=/usr/ \
>@@ -359,9 +374,13 @@
> UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
> endif
> 
>-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
>+uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured

NO! I removed this "dependencies" on purpose. Ulf, you keep reverting
fixes. Please explain in detail why you did this.
