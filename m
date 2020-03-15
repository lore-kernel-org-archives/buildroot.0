From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:23:35 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] Makefile: work around a
 bug in newly released make 4.3
Message-ID: <20200315101054.30AA182B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdb4a9e110b67ebe3336a3003ad18761e0550f71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit 9e2128bf5072e5f2fd69e2fc0239558782dfc677)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 1afc305220..31960c8ffc 100644
--- a/Makefile
+++ b/Makefile
@@ -189,6 +189,9 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
 $(error $(BR2_EXTERNAL_ERROR))
 endif
 
+# Workaround bug in make-4.3: https://savannah.gnu.org/bugs/?57676
+$(BASE_DIR)/.br2-external.mk:;
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
