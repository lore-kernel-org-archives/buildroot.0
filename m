From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] pkg-generic: introduce _DL_SUBDIR
Message-ID: <20180402154921.5B3CF8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddf3feb1047da7e728f89329f2eed6529bcf8636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This per package variable can be used to specify the download
subdirectory used by that package.

The use case here is for example linux-headers and linux, which share
the same sources (because they are the same upstream project), so we
don't want to download twice the kernel, nor store it multiple times
either.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 20ee73d438..3c6a1839ff 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -432,7 +432,8 @@ endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
+$(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
+$(2)_DL_DIR = $$(DL_DIR)/$$($(2)_DL_SUBDIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
 ifndef $(2)_SUBDIR
