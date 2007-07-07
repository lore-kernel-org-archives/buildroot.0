From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 11:33:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070707073437.22ECBA682B@busybox.net>
References: <20070707073437.22ECBA682B@busybox.net>
Message-ID: <20070707093316.GK4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 12:34:37AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-07 00:34:37 -0700 (Sat, 07 Jul 2007)
>New Revision: 19014
>
>Log:
>Avoid stripping a script file
>
>Modified:
>   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
>
>
>Changeset:
>Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
>===================================================================
>--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-06 16:57:06 UTC (rev 19013)
>+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-07 07:34:37 UTC (rev 19014)
>@@ -249,7 +249,15 @@
> 	fi
> 	# Strip the host binaries
> ifeq ($(GCC_STRIP_HOST_BINARIES),true)
>-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
>+	if [ -e $(STAGING_DIR)/usr/bin/*-gccbug ] ; then \

testing for existance doesn't work on all solaris test(1).
What you really want is perhaps something like ifneq $((..$(wildcard..)),)

>+		mkdir -p "$(STAGING_DIR)/tmp" ; \

If by now $(STAGING_DIR) could not be created, then something is
fundamentally wrong (the -p is superfluous).

>+		mv $(STAGING_DIR)/usr/bin/*-gccbug  $(STAGING_DIR)/tmp ; \
>+		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
>+		mv $(STAGING_DIR)/tmp/*-gccbug $(STAGING_DIR)/usr/bin ; \
>+		rmdir "$(STAGING_DIR)/tmp" ; \
>+	else \
>+		-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/* ; \
>+	fi
