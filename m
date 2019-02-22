From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:25:00 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] systemd: Remove instance
 name usage in a non-template unit file
Message-ID: <20190222122544.284418D58D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cb89720a25fe2bb4f93a48655f2da98587a539f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

console-getty.service is not a template unit file (it doesn't have the
@ specifier), so %I doesn't get properly expanded in it. Thus, getty
startup will fail due to invalid options and no getty prompt is launched
on the console.

Fixes:
No getty prompt on boot

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 77c057939ddb669a65f4f10d9e927ad958d516cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/0001-fix-getty-unit.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
index d546e1ab32..a12569f493 100644
--- a/package/systemd/0001-fix-getty-unit.patch
+++ b/package/systemd/0001-fix-getty-unit.patch
@@ -30,7 +30,7 @@ index 3c553240a..fd5ad9456 100644
  # option to preserve environment (-p), followed by '--' for safety, and then
  # the entered username.
 -ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
++ExecStart=-/sbin/getty -L console 115200 vt100
  Type=idle
  Restart=always
  UtmpIdentifier=cons
