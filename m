From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Dec 2015 23:19:06 +0100
Subject: [Buildroot] [PATCH 1/2 for 2015.11.x] support/check-host-rpath:
	remove trailing '/' in host dir
In-Reply-To: <cover.1449008170.git.yann.morin.1998@free.fr>
References: <cover.1449008170.git.yann.morin.1998@free.fr>
Message-ID: <b8b895896ff04a0551c1d4b63a623e8c24eb9dfa.1449008170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Despite the comment saying so, the trailing '/' in the host directory is
not removed. note however that it is properly removed from extracted
RPATH tags.

This is not visible when the host directory is our default $(O)/host
location, but breaks for user-supplied external host ditrectory, when
the user leaves a trailing slash in the path.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Peter, for the maintenance branch over 2015.11.
Sorry for the mess, it's a case I did not test...
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
-- 
1.9.1
