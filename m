From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2015 23:28:14 +0100
Subject: [Buildroot] [git commit] support/check-host-rpath: remove trailing
	'/' in host dir
Message-ID: <20151202225655.BD6CB80AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f42e262199ffc550e1a2e930cfb5e78c442e9c61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Despite the comment saying so, the trailing '/' in the host directory is
not removed. Note however that it is properly removed from extracted
RPATH tags.

This is not visible when the host directory is our default $(O)/host
location, but breaks for user-supplied external host directory, when
the user leaves a trailing slash in the path.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-host-rpath | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index dc9e17f..48d69da 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -14,7 +14,7 @@ main() {
     local file ret
 
     # Remove duplicate and trailing '/' for proper match
-    hostdir="$( sed -r -e 's:/+:/:g;' <<<"${hostdir}" )"
+    hostdir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${hostdir}" )"
 
     ret=0
     while read file; do
