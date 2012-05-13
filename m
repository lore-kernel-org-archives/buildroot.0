From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:38:18 +0200
Subject: [Buildroot] [PATCH v2 08/11] manual: add troubleshooting.txt
In-Reply-To: <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336905501-9757-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel MARTIN <s.martin49@gmail.com>


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/troubleshooting.txt

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b35b5f6..aa0952e 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -17,6 +17,7 @@ include::starting-up.txt[]
 
 include::working-with.txt[]
 
+include::troubleshooting.txt[]
 
 
 
diff --git a/docs/manual/troubleshooting.txt b/docs/manual/troubleshooting.txt
new file mode 100644
index 0000000..db9277d
--- /dev/null
+++ b/docs/manual/troubleshooting.txt
@@ -0,0 +1,46 @@
+Troubleshooting
+===============
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
1.7.10.2
