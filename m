From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2019 08:02:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/cups-filters: fix
 ln -r workaround for older patch versions
Message-ID: <20191005055706.F2E0E88221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d371c8762683e430c19db3b6d14d5b6bf4fac67e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/d06/d06f908cbe80340312bdfe1b75cb577b68cd46d8/

0001-install-support-old-ln-versions-without-the-r-option.patch adds a
ln-srf script for older distributions to emulate 'ln -r', but GNU patch <
2.7 does not handle the git patch permission extensions - So ensure it is
executable.

https://savannah.gnu.org/forum/forum.php?forum_id=7361

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 292c8e9be9..e5d7318961 100644
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
