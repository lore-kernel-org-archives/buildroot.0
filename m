From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 23:42:19 +0200
Subject: [Buildroot] [git commit] pkg-autotools.mk: default host AUTORECONF{,
	_OPT} to the target values
Message-ID: <20131002214311.BEEA79B916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97c687000a3f987440cc73bcfa26ae30bb9af28f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we have patches touching configure.ac and hence need to set
<pkg>_AUTORECONF = YES we also have to remember to set
HOST_<pkg>_AUTORECONF = YES if we build both host and target versions,
which is often forgotten (latest case was bison).

Fix it by making the host versions of _AUTORECONF and _AUTORECONF_OPT
default to whatever the target versions are set to, similar to how we
handle a number of the other variables.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b0eddde..9523529 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -70,12 +70,19 @@ ifndef $(2)_MAKE
  endif
 endif
 
+ifndef $(2)_AUTORECONF
+ ifdef $(3)_AUTORECONF
+  $(2)_AUTORECONF = $($(3)_AUTORECONF)
+ else
+  $(2)_AUTORECONF ?= NO
+ endif
+endif
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
-$(2)_AUTORECONF			?= NO
-$(2)_AUTORECONF_OPT		?=
+$(2)_AUTORECONF_OPT		?= $($(3)_AUTORECONF_OPT)
 $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
