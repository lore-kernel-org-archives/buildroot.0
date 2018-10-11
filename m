From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 11 Oct 2018 18:12:47 +0200
Subject: [Buildroot] [V2 3/4] pkg-perl: add a target which upgrades all
 packages from metacpan
In-Reply-To: <20181011161248.13457-1-francois.perrad@gadz.org>
References: <20181011161248.13457-1-francois.perrad@gadz.org>
Message-ID: <20181011161248.13457-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 07348bd5d..74a116075 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -57,6 +57,10 @@ endif
 #       used no matter the setting
 $(2)_PREFER_INSTALLER ?= MB
 
+ifeq ($(4),target)
+SCANCPAN_ALL_DISTRIB += $$($(2)_DISTNAME)
+endif
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -199,6 +203,11 @@ $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
 endef
 
+# global target which upgrades all packages
+.PHONY: scancpan
+scancpan:
+	utils/scancpan -force -target $(SCANCPAN_ALL_DISTRIB)
+
 ################################################################################
 # perl-package -- the target generator macro for Perl packages
 ################################################################################
-- 
2.17.1
