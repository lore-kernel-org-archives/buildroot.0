From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 16:39:53 +0100
Subject: [Buildroot] [git commit] Makefile: work around a bug in newly
 released make 4.3
Message-ID: <20200305152837.30E518F3B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e2128bf5072e5f2fd69e2fc0239558782dfc677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several users of rolling-release distributions have been reporting on
IRC that Buildroot is broken now that they have switched to the newly
released make 4.3.

It turns out that the constructs we use to generated and include the
internal br2-external related fragments is no longer working with
make-4.3.

Indeed, an upstream bug report [0] seems to imply that it so far was
working by chance. There has been no further feedback, whether this is
really considered a fix for a previous ill-defined behaviour, or an
actual regression...

In the meantime, we add a workaround, suggested in that same bug report,
that fixes the issue for make 4.3, and that should not break on older
make versions either (verified on all relevant versions: from 3.81,
3.82, 4.0, 4.1, and 4.2).

[0] https://savannah.gnu.org/bugs/?57676

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Mircea Gliga <mgliga@bitdefender.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 31624f77a2..09e769f613 100644
--- a/Makefile
+++ b/Makefile
@@ -188,6 +188,9 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
 $(error $(BR2_EXTERNAL_ERROR))
 endif
 
+# Workaround bug in make-4.3: https://savannah.gnu.org/bugs/?57676
+$(BASE_DIR)/.br2-external.mk:;
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
