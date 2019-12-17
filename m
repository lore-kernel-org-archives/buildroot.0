From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2019 22:09:53 +0100
Subject: [Buildroot] [git commit] package/pkg-generic.mk: also apply
 extractor-pkg-dependency to <pkg>_EXTRA_DOWNLOADS
Message-ID: <20191217210914.481DA8B8C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bf95d3b55cdbafd8034d935e2206c32b78d31dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, the extractor dependencies were only calculated for
<pkg>_SOURCE, so if the package manually downloads another file using
<pkg>_EXTRA_DOWNLOADS and then extracts it with $(call
suitable-extractor), we are missing the corresponding dependency on
the appropriate extracting tool.

Since the vast majority of <pkg>_EXTRA_DOWNLOADS are compressed files
that will be uncompressed at build time, it makes sense to derive the
corresponding extractor dependencies directly in the common package
infrastructure, rather than having each and every package using
<pkg>_EXTRA_DOWNLOADS making this effort.

On a system without xzcat, before this patch:

$ make printvars VARS=HOST_GETTEXT_TINY_EXTRACT_DEPENDENCIES
HOST_GETTEXT_TINY_EXTRACT_DEPENDENCIES=host-tar

After this patch:

$ make printvars VARS=HOST_GETTEXT_TINY_EXTRACT_DEPENDENCIES
HOST_GETTEXT_TINY_EXTRACT_DEPENDENCIES=host-tar    host-xz

This commit most notably fixes the build of host-gettext-tiny on
systems without xzcat, and with per-package support enabled. Indeed,
the main _SOURCE for gettext-tiny is a .gz file, but it has a .xz file
in its _EXTRA_DOWNLOADS, which is then extracted. Except that xzcat
being missing from the dependencies, it is not built.

Fixes:

  http://autobuild.buildroot.net/results/83c6d47c06334bef27791a59bdd491b1de124c49/

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6c0105a1e1..268d999efb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -644,7 +644,9 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
-$(2)_EXTRACT_DEPENDENCIES += $$(call extractor-pkg-dependency,$$($(2)_SOURCE))
+$(2)_EXTRACT_DEPENDENCIES += \
+	$$(foreach dl,$$($(2)_ALL_DOWNLOADS),\
+		$$(call extractor-pkg-dependency,$$(notdir $$(dl))))
 endif
 
 ifeq ($$(BR2_CCACHE),y)
