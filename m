From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Sep 2015 13:29:35 +0100
Subject: [Buildroot] [PATCH] shairport-sync: fix non-existent meta_dir
	member of shairport_cfg struct
Message-ID: <1442838575-11855-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

shairport-sync tries to access to a non-existent member called
"meta_dir" of a "shairport_cfg" struct:

[snip]
if (config.meta_dir)
[snip]

That struct doesn't have that member so it causes a build failure like
this one:

mdns_tinysvcmdns.c: In function 'mdns_tinysvcmdns_register':
mdns_tinysvcmdns.c:121:13: error: 'shairport_cfg' has no member named
'meta_dir'
if (config.meta_dir)

This issue has been reported and fixed upstream:

  https://github.com/mikebrady/shairport-sync/issues/128#issuecomment-141947175

Fixes:

  http://autobuild.buildroot.net/results/89d/89d22ba2d41e05b407cde04c7e57510b36973ce9/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/shairport-sync/shairport-sync.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index dc36c0e..36d5b82 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -10,6 +10,7 @@ SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VE
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
 SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_PATCH = https://github.com/mikebrady/shairport-sync/commit/6ae067af1f695e615415cde69a506ad330dbc45b.patch
 
 # Touching configure.ac with the patches
 SHAIRPORT_SYNC_AUTORECONF = YES
-- 
1.7.1
