From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 09:14:40 +0200
Subject: [Buildroot] [git commit] support/scripts/cve.py: use fast ijson
 backend if available on old ijson versions
Message-ID: <20210417065313.D7A07815B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f31227e628a560887b93fea838f766d76388f256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ijson < 2.5 (as available in Debian 10) use the slow python backend by
default instead of the most efficient one available like modern ijson
versions, significantly slowing down cve checking. E.G.:

time ./support/scripts/pkg-stats --nvd-path ~/.nvd -p avahi --html foobar.html

Goes from
174,44s user 2,11s system 99% cpu 2:58,04 total

To
93,53s user 2,00s system 98% cpu 1:36,65 total

E.G. almost 2x as fast.

As a workaround, detect when the python backend is used and try to use a
more efficient one instead.  Use the yajl2_cffi backend as recommended by
upstream, as it is most likely to work, and print a warning (and continue)
if we fail to load it.

The detection is slightly complicated by the fact that ijson.backends used
to be a reference to a backend module, but is nowadays a string (without the
ijson.backends prefix).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/cve.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 6e97ea193f..965fc2a466 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -28,6 +28,12 @@ import operator
 
 try:
     import ijson
+    # backend is a module in < 2.5, a string in >= 2.5
+    if 'python' in getattr(ijson.backend, '__name__', ijson.backend):
+        try:
+            import ijson.backends.yajl2_cffi as ijson
+        except ImportError:
+            sys.stderr.write('Warning: Using slow ijson python backend\n')
 except ImportError:
     sys.stderr.write("You need ijson to parse NVD for CVE check\n")
     exit(1)
