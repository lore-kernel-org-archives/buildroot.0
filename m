From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Feb 2021 15:12:50 +0100
Subject: [Buildroot] [PATCH 1/7] core: introduce BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210210141256.6438-1-patrickdepinguin@gmail.com>
References: <20210210141256.6438-1-patrickdepinguin@gmail.com>
Message-ID: <20210210141256.6438-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Some packages have optional runtime assertions, extra traces, or other
elements that can help in debugging problems. However, such runtime elements
can negatively influence performance.

In a test program performing 100K gRPC calls from a client to a local server
and receiving the returned response, we see following execution time:

    - runtime debug enabled: 1065 seconds
    - runtime debug disabled:  48 seconds

This is more than a factor 20 (!) difference. Analysis shows that the
problem mostly stems from libabseil-cpp (a dependency of gRPC) which enables
mutex deadlock analysis when the preprocessor flag 'NDEBUG' is not set,
which adds a 'backtrace()' call on every lock/unlock.  Potentially worse,
when libunwind is enabled and linked with the test program, 'backtrace()' is
not provided by glibc but by libunwind itself.

For production systems, users expect good performance out-of-the-box. In the
example above, the difference is huge and unless explicitly tested and
analyzed, users may not realize that the performance could be much better.

Address this problem by introducing a new option BR2_ENABLE_RUNTIME_DEBUG,
which can be used by packages or package infrastructures to set the
necessary flags.

Note that BR2_ENABLE_RUNTIME_DEBUG is orthogonal to BR2_ENABLE_DEBUG: the
former changes runtime behavior, while the latter is only expected to add
debug symbols to the build. Today, the cmake build system does introduce a
runtime impact when BR2_ENABLE_DEBUG is set, but that will be rectified in a
subsequent commit.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Config.in b/Config.in
index e35a78fb71..94e3076ca7 100644
--- a/Config.in
+++ b/Config.in
@@ -412,6 +412,19 @@ config BR2_DEBUG_3
 endchoice
 endif
 
+config BR2_ENABLE_RUNTIME_DEBUG
+	bool "build packages with runtime debugging info"
+	help
+	  Some packages may have runtime assertions, extra traces, and
+	  similar runtime elements that can help debugging. However,
+	  these elements may negatively influence performance so should
+	  normally not be enabled on production systems.
+
+	  Enable this option to enable such runtime debugging.
+
+	  Note: disabling this option is not a guarantee that all
+	  packages effectively removed these runtime debugging elements.
+
 config BR2_STRIP_strip
 	bool "strip target binaries"
 	default y
-- 
2.26.2
