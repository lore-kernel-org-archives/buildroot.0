From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 19 Mar 2012 00:28:54 +0100
Subject: [Buildroot] [PATCH] pkg-infra: use ?= instead of ifdef
Message-ID: <1332113334-20119-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ifdef considers a variable undefined if it is defined as empty.  In the
GENTARGETS/AUTOTARGETS/CMAKETARGETS infrastructure, the ifdef construct
is often used to default to the value from the target-variable if the
host-variable is not defined.  However, this makes it impossible to
override the host-variable as empty.  Therefore, use ?= instead to assign
the defaults.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I didn't touch the _VERSION infrastructure because I'm afraid to break it.
In fact, I think it already is broken (I don't see how that /-to-_
substitution can work for host-packages).

 package/Makefile.autotools.in |   28 +++++++++-------------------
 package/Makefile.cmake.in     |    8 +-------
 package/Makefile.package.in   |   38 ++++++++++++++------------------------
 3 files changed, 24 insertions(+), 50 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index fd118dc..8d0d7f2 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -57,28 +57,18 @@ endef
 define AUTOTARGETS_INNER
 
 # define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
- endif
-endif
+$(2)_SUBDIR ?= $($(3)_SUBDIR)
 
-ifndef $(2)_LIBTOOL_PATCH
- ifdef $(3)_LIBTOOL_PATCH
-  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
- else
-  $(2)_LIBTOOL_PATCH ?= YES
- endif
+ifdef $(3)_LIBTOOL_PATCH
+ $(2)_LIBTOOL_PATCH ?= $($(3)_LIBTOOL_PATCH)
+else
+ $(2)_LIBTOOL_PATCH ?= YES
 endif
 
-ifndef $(2)_MAKE
- ifdef $(3)_MAKE
-  $(2)_MAKE = $($(3)_MAKE)
- else
-  $(2)_MAKE ?= $(MAKE)
- endif
+ifdef $(3)_MAKE
+ $(2)_MAKE ?= $($(3)_MAKE)
+else
+ $(2)_MAKE ?= $(MAKE)
 endif
 
 $(2)_CONF_ENV			?=
diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 1cd65e4..58d3889 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -38,13 +38,7 @@
 define CMAKETARGETS_INNER
 
 # define package-specific variables to default values
-ifndef $(2)_SUBDIR
- ifdef $(3)_SUBDIR
-  $(2)_SUBDIR = $($(3)_SUBDIR)
- else
-  $(2)_SUBDIR ?=
- endif
-endif
+$(2)_SUBDIR ?= $($(3)_SUBDIR)
 
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index f7b6566..6e6f2d6 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -501,36 +501,26 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
-ifndef $(2)_SOURCE
- ifdef $(3)_SOURCE
-  $(2)_SOURCE = $($(3)_SOURCE)
- else
-  $(2)_SOURCE			?= $$($(2)_BASE_NAME).tar.gz
- endif
+ifdef $(3)_SOURCE
+ $(2)_SOURCE ?= $($(3)_SOURCE)
+else
+ $(2)_SOURCE ?= $$($(2)_BASE_NAME).tar.gz
 endif
 
-ifndef $(2)_PATCH
- ifdef $(3)_PATCH
-  $(2)_PATCH = $($(3)_PATCH)
- endif
-endif
+$(2)_PATCH ?= $($(3)_PATCH)
 
-ifndef $(2)_SITE
- ifdef $(3)_SITE
-  $(2)_SITE = $($(3)_SITE)
- else
-  $(2)_SITE			?= \
+ifdef $(3)_SITE
+ $(2)_SITE ?= $($(3)_SITE)
+else
+ $(2)_SITE ?= \
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
- endif
 endif
 
-ifndef $(2)_SITE_METHOD
- ifdef $(3)_SITE_METHOD
-  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
- else
-	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
- endif
+ifdef $(3)_SITE_METHOD
+ $(2)_SITE_METHOD ?= $($(3)_SITE_METHOD)
+else
+ # Try automatic detection using the scheme part of the URI
+ $(2)_SITE_METHOD ?= $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
 endif
 
 ifeq ($$($(2)_SITE_METHOD),local)
-- 
tg: (b6a507c..) t/no-ifdef-in-gentargets (depends on: master)
