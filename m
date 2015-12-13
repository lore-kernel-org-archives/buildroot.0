From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 19:35:22 +0100
Subject: [Buildroot] [PATCH 13/13 v2] core/pkg-virtual: ignore from
	legal-info output
In-Reply-To: <cover.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <25dd1d1f85baf34f5b4d8cfda7a4c3bd17687ccc.1450031251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Virtual packages really have nothing to save for legal-info, so we just
ignore them.

Currently, packages are only extracted if they define _LICENSE_FILES.
Follow-up patches will always extract and patch non-ignored packages, so
we would potentially see spurious "extracting" and "patching" messages
for virtual packages on the console, which would be a bit strange.
Ignoring virtual packages will get us a cleaner log.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v1 -> v2:
  - use the new _LEGAL_IGNORE variable  (Thomas, Luca, Peter)
---
 docs/manual/adding-packages-virtual.txt | 3 +++
 package/pkg-virtual.mk                  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index a5f17a2..11a497d 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -56,6 +56,9 @@ The +.mk+ for the virtual package should just evaluate the +virtual-package+ mac
 The ability to have target and host packages is also available, with the
 +host-virtual-package+ macro.
 
+.Note:
+Virtual packages are automatically ignored when generating the +legal-info+ output.
+
 ==== Provider's +Config.in+ file
 
 When adding a package as a provider, only the +Config.in+ file requires some
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9c68b51..c347ba3 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -57,6 +57,8 @@ endif
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
+$(2)_LEGAL_IGNORE = YES
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
1.9.1
