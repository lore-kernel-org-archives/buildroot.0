From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:54:40 +0200
Subject: [Buildroot] [git commit] directfb: add options for divine and sawman
Message-ID: <20150910122136.A5CD081F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5ac8f64916e2b428566cb1d08c58b1543d11ec7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since DirectFB 1.7.x, the divine (virtual input) and sawman (window
manager) features have been merged in DirectFB itself rather than
being shipped as separate tarballs. This commit creates additional
options to enable those features.

Upcoming commits will get rid of the existing divine and sawman
Buildroot packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../directfb/0005-add-missing-idivine-header.patch |   65 ++++++++++++++++++++
 package/directfb/Config.in                         |   10 +++
 package/directfb/directfb.mk                       |   12 ++++
 3 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/package/directfb/0005-add-missing-idivine-header.patch b/package/directfb/0005-add-missing-idivine-header.patch
new file mode 100644
index 0000000..7823eb7
--- /dev/null
+++ b/package/directfb/0005-add-missing-idivine-header.patch
@@ -0,0 +1,65 @@
+Add idivine.h, which is missing from DirectFB tarballs
+
+The idivine.h file was taken from the DirectFB Git repository.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/lib/divine/idivine.h
+===================================================================
+--- /dev/null
++++ b/lib/divine/idivine.h
+@@ -0,0 +1,54 @@
++/*
++   (c) Copyright 2012-2013  DirectFB integrated media GmbH
++   (c) Copyright 2001-2013  The world wide DirectFB Open Source Community (directfb.org)
++   (c) Copyright 2000-2004  Convergence (integrated media) GmbH
++
++   All rights reserved.
++
++   Written by Denis Oliver Kropp <dok@directfb.org>,
++              Andreas Shimokawa <andi@directfb.org>,
++              Marek Pikarski <mass@directfb.org>,
++              Sven Neumann <neo@directfb.org>,
++              Ville Syrj????l???? <syrjala@sci.fi> and
++              Claudio Ciccani <klan@users.sf.net>.
++
++   This library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2 of the License, or (at your option) any later version.
++
++   This library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with this library; if not, write to the
++   Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++   Boston, MA 02111-1307, USA.
++*/
++
++
++
++#ifndef __IDIVINE_H__
++#define __IDIVINE_H__
++
++#include <divine.h>
++
++/*
++ * private data struct of IDiVine
++ */
++typedef struct {
++     int                         ref;      /* reference counter */
++
++     DiVine                     *divine;
++} IDiVine_data;
++
++/*
++ * IDiVine constructor/destructor
++ */
++DFBResult IDiVine_Construct( IDiVine *thiz );
++
++void      IDiVine_Destruct ( IDiVine *thiz );
++
++#endif
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index d71858e..f8865e8 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -45,6 +45,16 @@ config BR2_PACKAGE_DIRECTFB_TRACE
 	help
 	  Enable call tracing for DirectFB applications
 
+config BR2_PACKAGE_DIRECTFB_DIVINE
+	bool "divine"
+	help
+	  Enable the DiVine feature (virtual input)
+
+config BR2_PACKAGE_DIRECTFB_SAWMAN
+	bool "sawman"
+	help
+	  Enable the SawMan feature (window manager)
+
 config BR2_PACKAGE_DIRECTFB_ATI128
 	bool "compile ati128 graphics driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index d44e658..ea579f5 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -53,6 +53,18 @@ ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
 DIRECTFB_CONF_OPTS += --enable-trace
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_DIVINE),y)
+DIRECTFB_CONF_OPTS += --enable-divine
+else
+DIRECTFB_CONF_OPTS += --disable-divine
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_SAWMAN),y)
+DIRECTFB_CONF_OPTS += --enable-sawman
+else
+DIRECTFB_CONF_OPTS += --disable-sawman
+endif
+
 DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
 	$(if $(BR2_PACKAGE_DIRECTFB_CLE266),cle266) \
