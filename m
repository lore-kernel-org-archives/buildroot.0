From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 12:52:09 +0100
Subject: [Buildroot] [git commit] bcache-tools: fix build with gcc-5
Message-ID: <20151217115520.F38DD8230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=462843e0130c9b3117ed293d372ee21ab9987bb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a Debian patch to fix a build failure with gcc-5:

bcache.c:125:9: warning: 'crc_table' is static but used in inline
function 'crc64' which is not static
...
make-bcache.c:277: undefined reference to `crc64'

This issue has been reported upstream but is not yet fixed.

Fixes:

  http://autobuild.buildroot.net/results/410/410954d33206475d70b8e5ba55a2c955a229af9b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...on-t-inline-crc64-for-gcc-5-compatability.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
new file mode 100644
index 0000000..1a437a8
--- /dev/null
+++ b/package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch
@@ -0,0 +1,35 @@
+Don't inline crc64 for gcc-5 compatability
+
+This patch is backported from Debian and it fixes the following error:
+
+bcache.c:125:9: warning: 'crc_table' is static but used in inline
+function 'crc64' which is not static
+...
+make-bcache.c:277: undefined reference to `crc64'
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From: David Mohr <david@mcbf.net>
+Date: Tue, 26 May 2015 20:34:31 -0600
+Subject: Don't inline crc64 for gcc-5 compatability
+
+Forwarded: http://article.gmane.org/gmane.linux.kernel.bcache.devel/2919
+
+By James Cowgill, see Debian bug #777798
+---
+ bcache.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bcache.c b/bcache.c
+index 8f37445..8b4b986 100644
+--- a/bcache.c
++++ b/bcache.c
+@@ -115,7 +115,7 @@ static const uint64_t crc_table[256] = {
+ 	0x9AFCE626CE85B507ULL
+ };
+ 
+-inline uint64_t crc64(const void *_data, size_t len)
++uint64_t crc64(const void *_data, size_t len)
+ {
+ 	uint64_t crc = 0xFFFFFFFFFFFFFFFFULL;
+ 	const unsigned char *data = _data;
