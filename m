From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:13 +0100
Subject: [Buildroot] [PATCH 18/21 RFC] core/legal-info: add package version
	to license directory
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <a6798f2185141fcc3bad7c4aa2ee566be7adcc5d.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we save the source archives in a directory named after the
package and its version, do the same for the license files, for
consistenmcy.

Also save the version string in the all-licenses list.

However, do not print the version string when warning about undefined
_LICENSE_FILES (it's ugly otherwise).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6e53c59..d808055 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -801,10 +801,10 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # is that the license still applies to the files distributed as part
 # of the rootfs, even if the sources are not themselves redistributed.
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
+	@$$(call legal-license-nofiles,$$($(2)_RAWNAME)-$$($(2)_VERSION),$$(call UPPERCASE,$(4)))
 	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME)-$$($(2)_VERSION),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
-- 
1.9.1
