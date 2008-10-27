From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2008 10:30:49 +0100
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from
 configure options
In-Reply-To: <87ej22bdu7.fsf@macbook.be.48ers.dk>
References: <200810250216.21072.markus.heidelberg@web.de>
	<87fxmjdt0t.fsf@macbook.be.48ers.dk>
	<200810270807.15968.markus.heidelberg@web.de>
	<87ej22bdu7.fsf@macbook.be.48ers.dk>
Message-ID: <20081027103049.47ef9fd4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Oct 2008 10:13:20 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Probably it's handled with the libintl stuff when !BR2_ENABLE_LOCALE.

Concerning libglib2 and iconv, I have the following workaround/patch in
my tree to disable pulling libiconv when !BR2_ENABLE_LOCALE. The
problem is that I'm using an external toolchain (having too many
troubles with buildroot-generated toolchains). Because the toolchain is
external, BR2_ENABLE_LOCALE is not set. But the toolchain already
contains libiconv, so I don't want to add it as a dependency. But the
following patch is just a workaround, I haven't thought about a proper
fix for now.

Bogus check if the toolchain is external.
---
 package/libglib2/Config.in   |    1 -
 package/libglib2/libglib2.mk |    4 ----
 2 files changed, 5 deletions(-)

Index: buildroot/package/libglib2/Config.in
===================================================================
--- buildroot.orig/package/libglib2/Config.in
+++ buildroot/package/libglib2/Config.in
@@ -2,7 +2,6 @@
 	bool "libglib2"
 	select BR2_PACKAGE_GETTEXT
 	select BR2_PACKAGE_LIBINTL
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
Index: buildroot/package/libglib2/libglib2.mk
===================================================================
--- buildroot.orig/package/libglib2/libglib2.mk
+++ buildroot/package/libglib2/libglib2.mk
@@ -49,8 +49,4 @@
 
 LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-LIBGLIB2_DEPENDENCIES+=libiconv
-endif
-
 $(eval $(call AUTOTARGETS,package,libglib2))


Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
