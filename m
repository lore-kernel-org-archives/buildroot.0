From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 12:43:32 +0100
Subject: [Buildroot] [RFC 1/4] legal-info: remove FOO_MANIFEST_TARBALL and
	FOO_MANIFEST_SITE defaults
In-Reply-To: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1420199015-16907-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When FOO_SOURCE is non-empty, FOO_MANIFEST_TARBALL is always set.
When FOO_SOURCE is empty, FOO_MANIFEST_TARBALL is not set, but also
never used, due to the if below which defuses the whole legal-info
processing for packages that have FOO_SOURCE explicitly set to an
empty string.

So get rid of the default assignment to "not saved".

Do it for FOO_MANIFEST_SITE as well: it is pointless to have
FOO_MANIFEST_SITE with an empty FOO_SOURCE in a package. A quick
grep session in the sources confirmed this assumption is indeed
true for the current code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..38ef581 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -653,8 +653,6 @@ $(2)_MANIFEST_SITE = $$(call qstrip,$$($(2)_SITE))
 endif
 endif
 endif
-$(2)_MANIFEST_TARBALL ?= not saved
-$(2)_MANIFEST_SITE ?= not saved
 
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
-- 
1.9.1
