From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 09:54:41 +0100
Subject: [Buildroot] [git commit] dt: add patch to fix failures on newer
	toolchains
Message-ID: <20160322085721.2EC2181861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=facda719099f53b8b79efcd6966d4cfe8ffd2719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On newer toolchains (glibc >= 2.20) _BSD_SOURCE behaviour was deprecated
in favour if the _DEFAULT_SOURCE macro. See man 7 feature_test_macros.
Add patch from Fedora to also consider _DEFAULT_SOURCE. Fixes:
http://autobuild.buildroot.net/results/9e2/9e2126b0e68d0d59d37616a268adb810efd8281a/

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dt/0002-dt-default-source-define.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/dt/0002-dt-default-source-define.patch b/package/dt/0002-dt-default-source-define.patch
new file mode 100644
index 0000000..8c9daae
--- /dev/null
+++ b/package/dt/0002-dt-default-source-define.patch
@@ -0,0 +1,20 @@
+Patch taken from Fedora:
+http://pkgs.fedoraproject.org/cgit/rpms/dt.git/commit/dt-default-source-define.patch?id=a3107b34a3efc6af66a5f892514f233bb66eb6b5
+
+_BSD_SOURCE was deprecated, hence switch to use _DEFAULT_SOURCE as well
+to avoid the build from breaking on newer toolchains.
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff -rupN dt.v18.32.old/common.h dt.v18.32/common.h
+--- dt.v18.32.old/common.h	2013-03-01 23:52:30.000000000 +0100
++++ dt.v18.32/common.h	2014-09-24 17:41:40.777604710 +0200
+@@ -127,7 +127,7 @@ typedef volatile slarge_t	v_slarge;
+ 
+ #endif /* defined(_WIN64) */
+ 
+-#elif defined(__GNUC__) && defined(_BSD_SOURCE) || defined(SCO) || defined(__QNXNTO__) || defined(SOLARIS) || defined(HP_UX) || defined(AIX) || defined(_NT_SOURCE) 
++#elif defined(__GNUC__) && defined(_BSD_SOURCE) || defined (_DEFAULT_SOURCE) ||  defined(SCO) || defined(__QNXNTO__) || defined(SOLARIS) || defined(HP_UX) || defined(AIX) || defined(_NT_SOURCE) 
+ 
+ #define QuadIsLongLong
+ typedef unsigned long long int	large_t;
