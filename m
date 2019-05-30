From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 14:59:54 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/systemd: really
 fixup patch 20/21
Message-ID: <20190530125505.77DA38E145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8022f7c98470270d644a559e313efe7defe121f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The commit was not amended after performing the fixup mentioned in commit
ae43e724e84dde3 (package/systemd: fix memory leak in systemd-journald).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0020-basic-process-util-limit-command-line-lengths-to-_SC.patch  | 5 +++--
 .../0021-process-util-don-t-use-overly-large-buffer-to-store-.patch  | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
index fd2fce7790..90a1b57a66 100644
--- a/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
+++ b/package/systemd/0020-basic-process-util-limit-command-line-lengths-to-_SC.patch
@@ -1,8 +1,7 @@
 From 2d5d2e0cc5171c6795d2a485841474345d9e30ab Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
 Date: Wed, 5 Dec 2018 18:48:23 +0100
-Subject: [PATCH 1/2] basic/process-util: limit command line lengths to
- _SC_ARG_MAX
+Subject: [PATCH] basic/process-util: limit command line lengths to _SC_ARG_MAX
 
 This affects systemd-journald and systemd-coredump.
 
@@ -46,6 +45,8 @@ $ journalctl -o export -n1 'MESSAGE=Something logged' --output-fields=_CMDLINE|w
 2MB might be hard for some clients to use meaningfully, but OTOH, it is
 important to log the full commandline sometimes. For example, when the program
 is crashing, the exact argument list is useful.
+
+Signed-off-by: Jonah Petri <jonah@petri.us>
 ---
  src/basic/process-util.c | 73 +++++++++++++++++-------------------------------
  1 file changed, 25 insertions(+), 48 deletions(-)
diff --git a/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch b/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch
index 7ac2482129..d599cfe5e2 100644
--- a/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch
+++ b/package/systemd/0021-process-util-don-t-use-overly-large-buffer-to-store-.patch
@@ -1,14 +1,15 @@
 From eb1ec489eef8a32918bbfc56a268c9d10464584d Mon Sep 17 00:00:00 2001
 From: Michal Sekletar <msekleta@redhat.com>
 Date: Tue, 22 Jan 2019 14:29:50 +0100
-Subject: [PATCH 2/2] process-util: don't use overly large buffer to store
- process command line
+Subject: [PATCH] process-util: don't use overly large buffer to store process command line
 
 Allocate new string as a return value and free our "scratch pad"
 buffer that is potentially much larger than needed (up to
 _SC_ARG_MAX).
 
 Fixes #11502
+
+Signed-off-by: Jonah Petri <jonah@petri.us>
 ---
  src/basic/process-util.c | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)
