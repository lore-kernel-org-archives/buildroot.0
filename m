From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Jan 2017 15:22:22 -0600
Subject: [Buildroot] [PATCH 1/1] python: disable _ssl.c build when
	--disable-ssl
Message-ID: <1484169742-28866-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam <adam.allison@rockwellcollins.com>

When --disable-ssl is provided as an option,
prevent the building of _ssl.c.
Without this change, some GCC toolchains fail
to build the _ssl module depending on the
build configuration
(we observed 4.85 worked and 4.9.4).

Signed-off-by: Adam Allison <adam.allison@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/python/111-optional-ssl.patch | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/python/111-optional-ssl.patch b/package/python/111-optional-ssl.patch
index 956d2a0..1584d64 100644
--- a/package/python/111-optional-ssl.patch
+++ b/package/python/111-optional-ssl.patch
@@ -4,7 +4,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 ---
  configure.in |    6 ++++++
- 1 file changed, 6 insertions(+)
+ setup.py     |    4 ++++
+ 2 files changed, 10 insertions(+)
 
 Index: b/configure.ac
 ===================================================================
@@ -23,3 +24,20 @@ Index: b/configure.ac
  AC_ARG_ENABLE(dbm,
  	AS_HELP_STRING([--disable-dbm], [disable DBM]),
  	[ if test "$enableval" = "no"; then
+ 
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -806,6 +806,10 @@
+                                       '/usr/contrib/ssl/lib/'
+                                      ] )
+ 
++        if '--disable-ssl' in sysconfig.get_config_var("CONFIG_ARGS"):
++            ssl_incs = None
++            ssl_libs = None
++
+         if (ssl_incs is not None and
+             ssl_libs is not None):
+             exts.append( Extension('_ssl', ['_ssl.c'],
+
-- 
1.9.1
