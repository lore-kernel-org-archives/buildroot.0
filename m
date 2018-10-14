From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 14:25:40 +0200
Subject: [Buildroot] [PATCH 1/6] core: add a variable that points to the
 package's hash file
In-Reply-To: <cover.1539519817.git.yann.morin.1998@free.fr>
References: <cover.1539519817.git.yann.morin.1998@free.fr>
Message-ID: <16d8389f860cf95a579f2600364b7e3cb6decbe7.1539519817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package has a version selection (e.g. Qt5), the licensing terms
may be different across versions, but lie in similarly named files (e.g.
'LICENSE').

However, when we check a file, all the hashes for it must match. So, we
can't have the hashes for two different content of the same file. We
overcame that limitation in the legal-license-file macro, which checks
whether a package has a .hash file in a versioned subdir.

For consistency, we would like to also store the source hashes in that
per-version subdir.

Rather than reconstruct the path to the hash file everywhere we need it,
add a variable that points to it.

Existing users will be converted over in followup patches.

Note: the check for a missing hash file is done in the check-hash helper
script, so this variable must always yield a filename, even of a missing
file, thus we do not use $(wildcard...) to resolve the hash file path;
we use $(wildcard...) only to check if the versioned .hash file exists.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index daf24594de..7dfad2d1be 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -434,6 +434,12 @@ else
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
+$(2)_HASH_FILE = \
+	$$(strip \
+		$$(if $$(wildcard $$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
+			$$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
+			$$($(2)_PKGDIR)/$$($(2)_RAWNAME).hash))
+
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
 endif
-- 
2.14.1
