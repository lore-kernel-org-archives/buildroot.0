From: David Raeman <draeman@bbn.com>
Date: Fri, 29 Jul 2016 00:18:33 -0400
Subject: [Buildroot] [PATCH 1/1] host-python: Find headers provided by
	-isystem flag in CPPFLAGS
In-Reply-To: <20160728220029.GI5862@free.fr>
References: <20160728220029.GI5862@free.fr>
Message-ID: <20160729041833.27902-1-draeman@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Python setup.py logic will enable and disable modules for compilation
based on which libraries it believes are available.  The logic in this
script parses certain arguments out of CPPFLAGS to determine search
directories, and then it checks for existence of various system libaries
and headers within those search directories.

This patch will allow the logic to consider include directories that
are specified using the -isystem flag.  The default logic only considers
include directories specified using the -I flag.

Signed-off-by: David Raeman <draeman@bbn.com>
---
 package/python/116-search-isystem-inc.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/python/116-search-isystem-inc.patch

diff --git a/package/python/116-search-isystem-inc.patch b/package/python/116-search-isystem-inc.patch
new file mode 100644
index 0000000..af0c788
--- /dev/null
+++ b/package/python/116-search-isystem-inc.patch
@@ -0,0 +1,24 @@
+Allow Python to find system header files in locations specified with
+flag -isystem in addition to the default behavior of searching -I.
+
+These directories are not used for complication, but are used to
+perform existence-checks for library header files so that Python
+can determine which modules should be built for the system.
+
+Signed-off-by: David Raeman <draeman@bbn.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py	2016-07-28 23:46:37.574969153 -0400
++++ b/setup.py	2016-07-29 00:01:02.928906258 -0400
+@@ -478,6 +478,10 @@
+                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
+             env_val = sysconfig.get_config_var(env_var)
+             if env_val:
++                # For the purpose of finding search directories, treat the
++                # -isystem flag as if it were a -I flag.
++                env_val = re.sub(r'(?i)(^|\s+)-isystem\s*', ' -I', env_val)
++
+                 # To prevent optparse from raising an exception about any
+                 # options in env_val that it doesn't know about we strip out
+                 # all double dashes and any dashes followed by a character
-- 
2.9.2
