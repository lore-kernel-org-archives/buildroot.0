From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 19:08:35 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
	KCONFIG_FILE
In-Reply-To: <cover.1428512591.git.yann.morin.1998@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
Message-ID: <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only check that the variable is defined, which is not
enough since we really want it to be non-empty.

We however can't check it points to an existing file, because the
package might well not be extracted yet, and we may use an internal
defconfig. If that file does not eventually exist, there will be a
failure down the road at build time when we try to copy it...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index fd9f19d..fe8d266 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -68,7 +68,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # FOO_KCONFIG_FILE is required
-ifndef $(2)_KCONFIG_FILE
+ifeq ($$($(2)_KCONFIG_FILE),)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
-- 
1.9.1
