From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  3 Dec 2014 19:05:37 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: fix corelist check
Message-ID: <1417629937-27137-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

module could be removed of the core,
so check if the module is currently in the core,
but not if the module was once time included in the core.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 7ff647d..0eac132 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -569,8 +569,8 @@ sub fetch {
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
-            next if !$test && $modname =~ m|^Test|; 
-            next if Module::CoreList::first_release( $modname );
+            next if !$test && $modname =~ m|^Test|;
+            next if Module::CoreList::is_core( $modname, undef, $] );
             # we could use the host Module::CoreList data, because host perl and
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
-- 
2.1.0
