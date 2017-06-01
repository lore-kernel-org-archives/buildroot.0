From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 15:58:29 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] oracle-mysql: add patch
	to fix gcc 6.x build issue
Message-ID: <20170601144622.D725C8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6acc39ae87ecfaf40d6dc58bf55ebff73f60ae2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes:

 http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 19e78e509e5e729437d2188b28aee7655340c67d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../oracle-mysql/0008-fix-type-conversion.patch    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/oracle-mysql/0008-fix-type-conversion.patch b/package/oracle-mysql/0008-fix-type-conversion.patch
new file mode 100644
index 0000000..65babf4
--- /dev/null
+++ b/package/oracle-mysql/0008-fix-type-conversion.patch
@@ -0,0 +1,22 @@
+Fix type conversion
+
+Fixes the following build error with gcc 6.x:
+
+protocol.cc:27:40: error: narrowing conversion of ''\37777777776'' from 'char' to 'uchar {aka unsigned char}' inside { } [-Wnarrowing]
+ static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/server-tools/instance-manager/protocol.cc
+===================================================================
+--- a/server-tools/instance-manager/protocol.cc
++++ b/server-tools/instance-manager/protocol.cc
+@@ -24,7 +24,7 @@
+ #include <m_string.h>
+ 
+ 
+-static uchar eof_buff[1]= { (char) 254 }; /* Marker for end of fields */
++static uchar eof_buff[1]= { (uchar) 254 }; /* Marker for end of fields */
+ static const char ERROR_PACKET_CODE= (char) 255;
+ 
+ 
