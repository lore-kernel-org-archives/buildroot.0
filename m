From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon,  3 Nov 2014 20:37:18 +0100
Subject: [Buildroot] [PATCH] python-netifaces: bump to 0.10.4
Message-ID: <1415043438-4920-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change download location and remove obsolete patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-netifaces-ifaddrs-uclibc.patch          | 31 ----------------------
 package/python-netifaces/python-netifaces.mk       |  4 +--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch

diff --git a/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch b/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch
deleted file mode 100644
index 375b08d..0000000
--- a/package/python-netifaces/python-netifaces-ifaddrs-uclibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-[PATCH] fix compile error in ifaddrs() for HAVE_SOCKET_IOCTLS variant
-
-Used on E.G. uClibc. This variant seems to have bitrotten somewhat.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- netifaces.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: netifaces-0.6/netifaces.c
-===================================================================
---- netifaces-0.6.orig/netifaces.c
-+++ netifaces-0.6/netifaces.c
-@@ -624,7 +624,7 @@
-   if (ioctl (sock, SIOCGIFHWADDR, &ifr) == 0) {
-     found = TRUE;
- 
--    if (string_from_sockaddr (ifr->CNAME(ifr_addr), buffer, sizeof (buffer)) == 0) {
-+    if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0) {
-       PyObject *hwaddr = PyString_FromString (buffer);
-       PyObject *dict = PyDict_New ();
-       PyObject *list = PyList_New (1);
-@@ -633,7 +633,7 @@
-       if (!hwaddr || !dict || !list || !family) {
-         Py_XDECREF (hwaddr);
-         Py_XDECREF (dict);
--        Py_XDECREF (list)
-+        Py_XDECREF (list);
-         Py_XDECREF (family);
-         Py_XDECREF (result);
-         close (sock);
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index f3b9beb..4aa53e6 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.7
+PYTHON_NETIFACES_VERSION = 0.10.4
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces/
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
-- 
1.8.3.2
