From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:28 +0100
Subject: [Buildroot] [PATCH 15/16 v5] core/pkg-virtual: ignore from
	legal-info output
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <1ff09064e06f1622d495a97ddb9de520c26a0145.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Virtual packages really have nothing to save for legal-info, so we just
ignore them, to avoid spurious "extracting" and "patching" messages
while running legal-info.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v3 -> v4:
  - rephrase the .Note  (Luca)
  - drop now-incorrect blurb from the commit log  (Luca)

Changes v1 -> v2:
  - use the new _LEGAL_IGNORE variable  (Thomas, Luca, Peter)
---
 docs/manual/adding-packages-virtual.txt | 5 +++++
 package/pkg-virtual.mk                  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index a5f17a2..3857927 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -56,6 +56,11 @@ The +.mk+ for the virtual package should just evaluate the +virtual-package+ mac
 The ability to have target and host packages is also available, with the
 +host-virtual-package+ macro.
 
+.Note:
+The +virtual-package+ infrastructure automatically marks virtual packages to be
+excluded from the +legal-info+ output (by internally setting +FOO_LEGAL_IGNORE+
+to 'YES').
+
 ==== Provider's +Config.in+ file
 
 When adding a package as a provider, only the +Config.in+ file requires some
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 244c1d0..445f09a 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -59,6 +59,8 @@ endif
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
+$(2)_LEGAL_IGNORE = YES
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
1.9.1
