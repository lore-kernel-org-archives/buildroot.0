From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 16:01:59 +0100
Subject: [Buildroot] [git commit] libserial: fix build on sparc
Message-ID: <20190116150305.70FC08139A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f179a5a9f258c4a97d96e44e0e65549e1de6b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On certain architectures (namely Sparc), the maximum baud rate exposed
by the kernel headers is B2000000. Therefore, the current libserial
code doesn't build for the Sparc and Sparc64 architectures due to
this.

In order to address this problem, this patch tests the value of
__MAX_BAUD. If it's higher than B2000000 then we assume we're on an
architecture that supports all baud rates up to B4000000. Otherwise,
we simply don't support the baud rates above B2000000.

Fixes build failures such as:

SerialPort.cpp: In member function 'int LibSerial::SerialPort::Implementation::GetBitRate(const LibSerial::BaudRate&) const':
SerialPort.cpp:1226:14: error: 'BAUD_2000000' is not a member of 'LibSerial::BaudRate'
         case BaudRate::BAUD_2000000:

Fixes:
 - http://autobuild.buildroot.org/results/63ba95b6786464fa8e75af64593010df84530079

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...cpp-don-t-use-high-baudrates-when-not-ava.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch b/package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch
new file mode 100644
index 0000000000..4f97f598c4
--- /dev/null
+++ b/package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch
@@ -0,0 +1,53 @@
+From fc0f031563146b91d255c752a61624f6dd3c14d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 15 Jan 2019 08:33:27 +0100
+Subject: [PATCH] SerialPort.cpp: don't use high baudrates when not available
+
+On certain architectures (namely Sparc), the maximum baud rate exposed
+by the kernel headers is B2000000. Therefore, the current libserial
+code doesn't build for the Sparc and Sparc64 architectures due to
+this.
+
+In order to address this problem, this patch tests the value of
+__MAX_BAUD. If it's higher than B2000000 then we assume we're on an
+architecture that supports all baud rates up to B4000000. Otherwise,
+we simply don't support the baud rates above B2000000.
+
+Fixes build failures such as:
+
+SerialPort.cpp: In member function 'int LibSerial::SerialPort::Implementation::GetBitRate(const LibSerial::BaudRate&) const':
+SerialPort.cpp:1226:14: error: 'BAUD_2000000' is not a member of 'LibSerial::BaudRate'
+         case BaudRate::BAUD_2000000:
+
+Fixes:
+ - http://autobuild.buildroot.org/results/63ba95b6786464fa8e75af64593010df84530079
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/crayzeewulf/libserial/pull/127]
+---
+ src/SerialPort.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/SerialPort.cpp b/src/SerialPort.cpp
+index e3240eb..18daac0 100644
+--- a/src/SerialPort.cpp
++++ b/src/SerialPort.cpp
+@@ -1223,6 +1223,7 @@ namespace LibSerial
+             baud_rate_as_int = 1500000 ;
+             break ;
+ 
++#if __MAX_BAUD > B2000000
+         case BaudRate::BAUD_2000000:
+             baud_rate_as_int = 2000000 ;
+             break ;
+@@ -1242,6 +1243,7 @@ namespace LibSerial
+         case BaudRate::BAUD_4000000:
+             baud_rate_as_int = 4000000 ;
+             break ;
++#endif /* __MAX_BAUD */
+         default:
+             // If an incorrect baud rate was specified, throw an exception.
+             throw std::runtime_error(ERR_MSG_INVALID_BAUD_RATE) ;
+-- 
+2.14.1
+
