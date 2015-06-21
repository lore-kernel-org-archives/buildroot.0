From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:38:04 +0200
Subject: [Buildroot] [git commit] directfb: add an option for debugging
	support
Message-ID: <20150621073809.62A5F8083F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b488f356ed1a8ed9bd84d7e32203fe6730f261b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DirectFB provides two options for debug:
* --enable-debug-support (default is yes)
* --enable-debug (default is no)
The first one provides the functions to print debug information. These
functions can be called inside DirectFB, or by an external DirectFB
driver in another package.
The second one enables verbose mode in DirectFB, using these functions.

Buildroot currently provides an option for the second one only. The
first one - which is necessary for the second one - is always enabled,
because this is the default value.

The new option (BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT) makes it possible
to disable debugging support (--disable-debug-support) in order to
build the library with no debug feature at all.

When debugging support is disabled, the target installation path of
drivers (/usr/lib/directfb-<version>) is suffixed with -pure. The
public library (/usr/lib/libdirectfb.so) remains unchanged.

Some external DirectFB drivers will install into
/usr/lib/directfb-<version>-pure in release mode. For that reason, it
is important that DirectFB can be configured to use this directory.

Signed-off-by: C??dric Marie <cedric.marie@openmailbox.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in   |   14 ++++++++++++++
 package/directfb/directfb.mk |    5 +++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 7759f8f..2b0d5c7 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -20,8 +20,22 @@ config BR2_PACKAGE_DIRECTFB_MULTI
 comment "directfb multi application needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
+config BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
+	bool "directfb debugging support"
+	default y
+	help
+	  Compile DirectFB with debugging support. It provides
+	  functions to print debug information, for DirectFB as well as
+	  external DirectFB drivers.
+
+	  When disabled, DirectFB does not print any debug information.
+	  The drivers will be installed to and loaded from
+	  /usr/lib/directfb-<version>-pure instead of
+	  /usr/lib/directfb-<version>.
+
 config BR2_PACKAGE_DIRECTFB_DEBUG
 	bool "directfb debugging"
+	depends on BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
 	help
 	  Compile DirectFB with lots of debug output
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e3dc506..ad1dd18 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -39,9 +39,14 @@ DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
 DIRECTFB_DEPENDENCIES += linux-fusion
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
+DIRECTFB_CONF_OPTS += --enable-debug-support
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
 DIRECTFB_CONF_OPTS += --enable-debug
 endif
+else
+DIRECTFB_CONF_OPTS += --disable-debug-support
+endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
 DIRECTFB_CONF_OPTS += --enable-trace
