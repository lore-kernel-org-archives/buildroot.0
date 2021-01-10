From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 19:42:04 +0100
Subject: [Buildroot] [git commit] core/pkg-infra: allow per site-method
 sub-version strings
Message-ID: <20210110205118.C7F8F870BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02798cfa76dfba6938eb350a1f9eb2bef6df8a5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we want to change the format of an archive we generate (e.g. those
we generate from git trees), the hashes of those archives will change.

To avoid any issue (e.g. an older Buildroot using newer archives, or the
other way around) that would conclude that the hashes do not match, we
want to change the filenames of the generated archives whenever we
change their format.

Introduce a new internal variable, specific to each site method, that we
can set to include a "format version" for the archives generated from
that site method.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index c7597a3a45..11090cb628 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -43,7 +43,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 # Helper to build the extension for a package archive, based on various
 # conditions.
 # $(1): upper-case package name
-pkg_source_ext = .tar.gz
+pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD)).tar.gz
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
