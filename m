From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:04:39 +0100
Subject: [Buildroot] [git commit] support/script/scancpan: fix corelist check
Message-ID: <20141207220447.3C715800D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18033effada7b0fd1e946c44ea7d30f9ed4e32a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

module could be removed of the core,
so check if the module is currently in the core,
but not if the module was once time included in the core.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
