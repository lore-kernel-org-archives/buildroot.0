From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 14:41:43 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080706073442.174E03C67A@busybox.net>
References: <20080706073442.174E03C67A@busybox.net>
Message-ID: <20080707124143.GB15840@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 06, 2008 at 12:34:41AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2008-07-06 00:34:41 -0700 (Sun, 06 Jul 2008)
>New Revision: 22663
>
>Log:
>Replace configuring GLIB with autodetect
>
>Modified:
>   trunk/buildroot/Config.in
>   trunk/buildroot/Makefile
>
>
>Changeset:
>Modified: trunk/buildroot/Config.in
>===================================================================
>--- trunk/buildroot/Config.in	2008-07-06 07:00:11 UTC (rev 22662)
>+++ trunk/buildroot/Config.in	2008-07-06 07:34:41 UTC (rev 22663)
>@@ -78,17 +78,6 @@
> 
> 	  The default is $(BASE_DIR)/dl
> 
>-config BR2_HOST_GLIB
>-	string "Location of host Gnome library"
>-	default "/usr"
>-	help
>-	  Directory where Gnome is installed on the host
>-	  Gnome applications is installed in $(BR2_HOST_LIB)/bin 
>-	  This is needed to build libgtk etc.
>-	  The default is /usr
>-	  It can be overridden by the BUILDROOT_HOST_GLIB
>-	  shell variable
>-
> source	"target/device/Config.in.mirrors"
> 
> config BR2_STAGING_DIR
>
>Modified: trunk/buildroot/Makefile
>===================================================================
>--- trunk/buildroot/Makefile	2008-07-06 07:00:11 UTC (rev 22662)
>+++ trunk/buildroot/Makefile	2008-07-06 07:34:41 UTC (rev 22663)
>@@ -57,12 +57,6 @@
> endif
> LOCAL:=$(BR2_LOCAL)
> 
>-ifneq ($(BUILDROOT_HOST_GLIB),)
>-HOST_GLIB:=$(BUILDROOT_HOST_GLIB)
>-else
>-HOST_GLIB:=$(BR2_HOST_GLIB)
>-endif
>-
> # To put more focus on warnings, be less verbose as default
> # Use 'make V=1' to see the full commands
> ifdef V
>@@ -128,6 +122,10 @@
> HOSTLD:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLD)" || type -p $(HOSTLD) || echo ld)
> HOSTLN:=$(shell $(CONFIG_SHELL) -c "which $(HOSTLN)" || type -p $(HOSTLN) || echo ln)
> HOSTNM:=$(shell $(CONFIG_SHELL) -c "which $(HOSTNM)" || type -p $(HOSTNM) || echo nm)
>+HOST_GLIB_BIN:=`dirname $(shell $(CONFIG_SHELL) -c "which glib-genmarshal" || echo /usr/bin/glib-genmarshal)`
>+HOST_GLIB:=$(shell $(CONFIG_SHELL) -c "dirname $(HOST_GLIB_BIN)" || echo /usr)

I don't see why
1) "/usr" is a valid fallback here?
2) this stuff is needed in the first place.

If glib-genmarshal is not in your PATH then it is perfectly fine to
fail. If it is in your PATH (which it should be, iff you have it
installed), the it should be found by configure.

Put short, this change should be dropped in my POV.

>+
>+
> ifndef CFLAGS_FOR_BUILD
> CFLAGS_FOR_BUILD:=-g -O2
> endif
>@@ -522,3 +520,4 @@
> 	@echo LOCAL=$(LOCAL)
> 	@echo BR2_DL_DIR=$(BR2_DL_DIR)
> 	@echo HOST_GLIB=$(HOST_GLIB)
>+	@echo HOST_GLIB_BIN=$(HOST_GLIB_BIN)

As already said, you're leaking your local debug stuff into the tree,
please don't do that.
