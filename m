From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Dec 2019 20:08:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsamixergui: fix build with latest
 alsa-lib
Message-ID: <20191204190853.2591386-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa-lib created a separated libatopology library since version 1.2.1:
https://github.com/alsa-project/alsa-lib/commit/75d393a563efb578c79364a277087c6326267f52

However, atopology is not correctly detected when cross-compiling
So pass --disable-alsatest and --enable-alsa-topology as suggested by
upstream (see https://github.com/alsa-project/alsa-lib/pull/16)

Fixes:
 - http://autobuild.buildroot.org/results/564c1561e83e0c064f3859d25e68dec96640e060

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsamixergui/alsamixergui.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index 24e2497f3b..b1eb5c2f3d 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -18,4 +18,6 @@ ALSAMIXERGUI_CONF_ENV = \
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
+ALSAMIXERGUI_CONF_OPTS = --disable-alsatest --enable-alsa-topology
+
 $(eval $(autotools-package))
-- 
2.24.0
