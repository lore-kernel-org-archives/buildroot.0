From: Jan Heylen <heyleke@gmail.com>
Date: Mon, 13 Feb 2017 08:09:07 +0100
Subject: [Buildroot] [RFC] host-packages debugging config
Message-ID: <CAGszK3i=BkQKFMdbmH+_-oxVWh=i3LDXvZf=7nScrPP4Zg2deA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was debugging a tool on 'host', and therefore I enabled BR2_ENABLE_DEBUG.
Although the documentation doesn't explicitly mention it is only for target
packages, it is only for target packages ;-) ...  it does already mention
'all libs and bins in the staging' where host packages don't go.

So either I propose to explicitly state it in the documentation:

diff --git a/Config.in b/Config.in
index ccd777e..e9d54a2 100644
--- a/Config.in
+++ b/Config.in
@@ -368,7 +368,7 @@ config BR2_CCACHE_USE_BASEDIR
 endif

 config BR2_ENABLE_DEBUG
-       bool "build packages with debugging symbols"
+       bool "build target packages with debugging symbols"
        help
          Build packages with debugging symbols enabled. All libraries
          and binaries in the 'staging' directory will have debugging

or to avoid confusion with 'stripped' target:

diff --git a/Config.in b/Config.in
index ccd777e..e9d54a2 100644
--- a/Config.in
+++ b/Config.in
@@ -368,7 +368,7 @@ config BR2_CCACHE_USE_BASEDIR
 endif

 config BR2_ENABLE_DEBUG
-       bool "build packages with debugging symbols"
+       bool "build target (staging) packages with debugging symbols"
        help
          Build packages with debugging symbols enabled. All libraries
          and binaries in the 'staging' directory will have debugging


Or (e.g. for Makefile.in here) I change the facts and also enable debugging
on host packages with that option enabled: (and mention it in the
documentation)

diff --git a/Config.in b/Config.in
index ccd777e..4f4e04f 100644
--- a/Config.in
+++ b/Config.in
@@ -377,6 +377,9 @@ config BR2_ENABLE_DEBUG
          binaries are stripped on the target is controlled by the
          BR2_STRIP_* options below.

+      For host pacakges, debugging symbols will be enalbed in
+      output/host.
+
 if BR2_ENABLE_DEBUG
 choice
        prompt "gcc debug level"

diff --git a/package/Makefile.in b/package/Makefile.in
index 688d5b1..9e5a218 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -129,19 +129,19 @@ ifeq ($(BR2_OPTIMIZE_S),y)
 TARGET_OPTIMIZATION = -Os
 endif
 ifeq ($(BR2_DEBUG_1),y)
-TARGET_DEBUGGING = -g1
+DEBUGGING = -g1
 endif
 ifeq ($(BR2_DEBUG_2),y)
-TARGET_DEBUGGING = -g2
+DEBUGGING = -g2
 endif
 ifeq ($(BR2_DEBUG_3),y)
-TARGET_DEBUGGING = -g3
+DEBUGGING = -g3
 endif

 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION)
$(TARGET_DEBUGGING)
+TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION)
$(DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
-TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(DEBUGGING)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))

 ifeq ($(BR2_BINFMT_FLAT),y)
@@ -217,7 +217,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q

 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)

-HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
+HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include $(DEBUGGING)
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)


A third option I see is that we create some similar config opitons for
debugging/optimisation/... in the 'host utilities' submenu (which we could
rename to 'host', give it a more upper position, and bring some more
structure. That last point was already on the discussion table I believe?)


What would be a good direction?

br,

Jan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170213/a451a829/attachment.html>
