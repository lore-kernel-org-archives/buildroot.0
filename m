From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Dec 2020 18:29:31 +0100
Subject: [Buildroot] [PATCH 3/9 v2] core/pkg-infra: allow per site-method
 compression
In-Reply-To: <cover.1607966969.git.yann.morin.1998@free.fr>
References: <cover.1607966969.git.yann.morin.1998@free.fr>
Message-ID: <44338d32338b3e9d150542194681e7523d00815e.1607966969.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far, we've used the .tar.gz extension for the archives we generate
(e.g .from git repositories).

This is essentialy a historical accident, as this was the default
extension we had back then for archives downloaded via http/ftp.

But nowadays, some packages are really big (linux, linux-firmware...)
and the generated archives are very big.

When we change the format of generated archives, we may also want to
change the compression scheme, so allow for that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c97e22236e..f2a977915b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -514,7 +514,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
-$(2)_SOURCE_EXT = $$(BR_SUB_VERSION_$$($(2)_SITE_METHOD)).tar.gz
+$(2)_SOURCE_EXT = $$(BR_SUB_VERSION_$$($(2)_SITE_METHOD)).tar$$(or $$(BR_SITE_METHOD_Z_$$($(2)_SITE_METHOD)),.gz)
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
-- 
2.25.1
