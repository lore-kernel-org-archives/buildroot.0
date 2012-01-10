From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Jan 2012 13:41:49 +0100
Subject: [Buildroot] [git commit] python-netifaces: fix build on setups
	without getifaddrs
Message-ID: <20120110124715.6B84E901F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c57ebe4dd97e123a6ede9869d094eb50f0fbd05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E.G. default uClibc configuration. Patch sent upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../python-netifaces-ifaddrs-uclibc.patch          |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch b/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch
new file mode 100644
index 0000000..375b08d
--- /dev/null
+++ b/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch
@@ -0,0 +1,31 @@
+[PATCH] fix compile error in ifaddrs() for HAVE_SOCKET_IOCTLS variant
+
+Used on E.G. uClibc. This variant seems to have bitrotten somewhat.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ netifaces.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: netifaces-0.6/netifaces.c
+===================================================================
+--- netifaces-0.6.orig/netifaces.c
++++ netifaces-0.6/netifaces.c
+@@ -624,7 +624,7 @@
+   if (ioctl (sock, SIOCGIFHWADDR, &ifr) == 0) {
+     found = TRUE;
+ 
+-    if (string_from_sockaddr (ifr->CNAME(ifr_addr), buffer, sizeof (buffer)) == 0) {
++    if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0) {
+       PyObject *hwaddr = PyString_FromString (buffer);
+       PyObject *dict = PyDict_New ();
+       PyObject *list = PyList_New (1);
+@@ -633,7 +633,7 @@
+       if (!hwaddr || !dict || !list || !family) {
+         Py_XDECREF (hwaddr);
+         Py_XDECREF (dict);
+-        Py_XDECREF (list)
++        Py_XDECREF (list);
+         Py_XDECREF (family);
+         Py_XDECREF (result);
+         close (sock);
