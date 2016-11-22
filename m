From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 22 Nov 2016 14:11:09 +0100
Subject: [Buildroot] [PATCH 1/1] host-python3: Do not use the system OpenSSL.
In-Reply-To: <515ff5e8-2077-f5e9-52eb-7e061b48203a@green-communications.fr>
References: <515ff5e8-2077-f5e9-52eb-7e061b48203a@green-communications.fr>
Message-ID: <20161122131109.4459-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python3 currently detect if there is an usable OpenSSL installation
and conditionnaly compiles the 'ssl', '_ssl' and '_hashlib' modules.
This may break compilation if the system's OpenSSL has been updated to
1.1.0 because of a bug in python, see https://bugs.python.org/issue26470
for details.

Unlike Python 2.7, Python 3 unconditionnaly compiles fallbacks for
common hash algorithm, so disabling OpenSSL will still leave Python 3
with implementations of common hash algorithm.

This adds a patch to configure.ac patch to implement a --disable-openssl
option.
---
 .../0031-Add-an-option-to-disable-openssl.patch    | 23 ++++++++++++++++++++++
 package/python3/python3.mk                         |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 package/python3/0031-Add-an-option-to-disable-openssl.patch

diff --git a/package/python3/0031-Add-an-option-to-disable-openssl.patch b/package/python3/0031-Add-an-option-to-disable-openssl.patch
new file mode 100644
index 0000000..d437520
--- /dev/null
+++ b/package/python3/0031-Add-an-option-to-disable-openssl.patch
@@ -0,0 +1,23 @@
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Subject: [PATCH] Add an option to disable openssl support.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -3027,6 +3027,12 @@
+     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
+   	  fi])
+ 
++AC_ARG_ENABLE(openssl,
++	AS_HELP_STRING([--disable-openssl], [disable openssl support]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
++	  fi])
++
+ AC_SUBST(TK)
+ AC_ARG_ENABLE(tk,
+ 	AS_HELP_STRING([--disable-tk], [disable tk]),
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f355ae9..8bfae79 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -36,7 +36,8 @@ HOST_PYTHON3_CONF_OPTS += 	\
 	--enable-unicodedata	\
 	--disable-test-modules	\
 	--disable-idle3		\
-	--disable-ossaudiodev
+	--disable-ossaudiodev	\
+	--disable-openssl
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
-- 
2.10.2
