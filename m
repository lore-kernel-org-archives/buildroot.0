From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:57 +0100
Subject: [Buildroot] [PATCH 07/11] manual: update troubleshooting.txt
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332285001-12881-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/troubleshooting.txt |   44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/docs/manual/troubleshooting.txt b/docs/manual/troubleshooting.txt
index 4eddddd..db9277d 100644
--- a/docs/manual/troubleshooting.txt
+++ b/docs/manual/troubleshooting.txt
@@ -1,2 +1,46 @@
 Troubleshooting
 ===============
+
+LZO package configuration failure due to incorrect host architecture detection
+------------------------------------------------------------------------------
+
+Typical error output
+~~~~~~~~~~~~~~~~~~~~
+
+------------------------
+configure: Configuring LZO 2.03
+checking build system type... Invalid configuration `x86_64-unknown-linux-': machine `x86_64-unknown-linux' not recognized
+configure: error: /bin/sh autoconf/config.sub x86_64-unknown-linux- failed
+------------------------
+
+Actually this is a known ccache/zlib issue (see
+https://bugs.busybox.net/show_bug.cgi?id=4808) that occurs when the
+zlib version of the host system is more recent that the one provided
+by Buildroot. This misleads the Buildroot host binary +ccache+.
+
+This bug has been spotted, then fixed shortly after the Buildroot
+2012.02 release.
+
+If you are using the release 2012.02 or elder and got this issue, then
+applying this patch
+http://git.buildroot.net/buildroot/patch/package/ccache/ccache.mk?id=7ea11dafff37c5403432f691cf3c46d1d5566e46
+should fix it.
+
+Solution
+~~~~~~~~
+
+* Get the upstream patch:
++
+-----------------------
+ $ wget -O /tmp/ccache-Force-ccache-to-use-its-internal-zlib.patch \
+    "http://git.buildroot.net/buildroot/patch/package/ccache/ccache.mk?id=7ea11dafff37c5403432f691cf3c46d1d5566e46"
+------------------------
+
+* Apply this patch and rebuild ccache:
++
+------------------------
+ $ cd buildroot
+ $ patch -p1 < /tmp/ccache-Force-ccache-to-use-its-internal-zlib.patch
+ $ make host-ccache-dirclean
+ $ make
+------------------------
-- 
1.7.9.4
