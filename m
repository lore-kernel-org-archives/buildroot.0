From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 14:03:46 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/ipsec-tools: add
	security patch to fix CVE-2015-4047
Message-ID: <20170606120755.D7D1D82A0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42f2157f197f74921c21ee36eddc9b3d5550281d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Cherry-picked from master branch:
https://git.buildroot.net/buildroot/commit/?id=ff97e66c56512644577e8e86019f92bf935ed29e
and renumbered patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/0002-CVE-2015-4047.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/ipsec-tools/0002-CVE-2015-4047.patch b/package/ipsec-tools/0002-CVE-2015-4047.patch
new file mode 100644
index 0000000..f53fe5c
--- /dev/null
+++ b/package/ipsec-tools/0002-CVE-2015-4047.patch
@@ -0,0 +1,26 @@
+ipsec-tools: CVE-2015-4047: null pointer dereference crash in racoon
+
+See: https://bugs.gentoo.org/show_bug.cgi?id=550118
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-vpn/ipsec-tools/files/ipsec-tools-CVE-2015-4047.patch
+
+See also
+https://sources.debian.net/src/ipsec-tools/1:0.8.2%2B20140711-8/debian/patches/bug785778-null-pointer-deref.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ./src/racoon/gssapi.c    9 Sep 2006 16:22:09 -0000       1.4
++++ ./src/racoon/gssapi.c    19 May 2015 15:16:00 -0000      1.6
+@@ -192,6 +192,11 @@
+	gss_name_t princ, canon_princ;
+	OM_uint32 maj_stat, min_stat;
+ 
++	if (iph1->rmconf == NULL) {
++		plog(LLV_ERROR, LOCATION, NULL, "no remote config\n");
++		return -1;
++	}
++
+	gps = racoon_calloc(1, sizeof (struct gssapi_ph1_state));
+	if (gps == NULL) {
+		plog(LLV_ERROR, LOCATION, NULL, "racoon_calloc failed\n");
