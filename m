From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 21:54:55 +0200
Subject: [Buildroot] [git commit] package/pkg-utils.mk: add dl_dir to
 show-info output
Message-ID: <20190925194954.311BF8F558@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f304caab11ebb6140e942ced9fc12c79dfa609c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It can be useful for scripts to be able to access a package's source
file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
However, with the subdirectories in DL_DIR which can be overridden with
PKG_DL_SUBDIR, that is no longer easy.

Therefore, this patch adds dl_dir to the package information. It prints
just PKG_DL_SUBDIR, to avoid dumping absolute paths to the buildroot
directory in the show-info output.

It can be used with the following jq script to get a newline-separated
list of all downloaded files:

make show-info | jq -r '.[] | ("dl/" + .dl_dir + "/" + .downloads[]?.source)'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 74ade437d9..63b19e812b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -99,6 +99,7 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	"dl_dir": "$($(1)_DL_SUBDIR)",
 	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
 	"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING)),
 	"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES)),
