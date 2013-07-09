From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  9 Jul 2013 10:47:46 +0200
Subject: [Buildroot] [PATCH 2/4] package: add toolchain dependency to
	inner-generic-package
In-Reply-To: <1373359668-18099-1-git-send-email-fabio.porcedda@gmail.com>
References: <1373359668-18099-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1373359668-18099-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the dependency from the target toolchain explicit.
This way we can buid from command line a package that use
innger-generic-package right after the configuration phase.

This is a step forward top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-autotools.mk | 2 +-
 package/pkg-generic.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 09deef2..4195fde 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -202,7 +202,7 @@ endef
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool host-toolchain $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 668f011..7e46126 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -302,7 +302,12 @@ endif
 $(2)_REDISTRIBUTE		?= YES
 
 
-$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($$($(2)_TYPE),target)
+$(2)_DEPENDENCIES += toolchain
+endif
+
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
1.8.1.4
