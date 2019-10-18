From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 20:54:26 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/cups-filters: fix
 ln -r workaround for older patch versions
Message-ID: <20191018185033.76893826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe0f84179435cbc1e1db4a4ded76130da68661c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

0001-install-support-old-ln-versions-without-the-r-option.patch adds a
ln-srf script for older distributions to emulate 'ln -r', but GNU patch <
2.7 does not handle the git patch permission extensions - So ensure it is
executable.

https://savannah.gnu.org/forum/forum.php?forum_id=7361

Fixes:
    http://autobuild.buildroot.net/results/5c88115b92abc1360a979cd46e00332f61c41cb4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index fa7627ee96..47e1b11bfd 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -22,6 +22,16 @@ CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--with-pdftops=pdftops \
 	--with-jpeg
 
+# 0001-install-support-old-ln-versions-without-the-r-option.patch adds
+# a ln-srf script for older distributions, but GNU patch < 2.7 does
+# not handle the git patch permission extensions - So ensure it is
+# executable
+define CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
+	chmod +x $(@D)/ln-srf
+endef
+
+CUPS_FILTERS_POST_PATCH_HOOKS += CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE
+
 # After 0002-filter-texttotext.c-link-with-libiconv-if-needed.patch autoreconf
 # needs config.rpath and ABOUT-NLS, which are not in v1.25.4 yet. Fake them.
 define CUPS_FILTERS_ADD_MISSING_FILE
