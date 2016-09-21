From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 22 Sep 2016 01:31:43 +0200
Subject: [Buildroot] [PATCH 3/3] package/ola: add patch to fix build with
	GCC 6
In-Reply-To: <20160921233143.28149-1-joerg.krause@embedded.rocks>
References: <20160921233143.28149-1-joerg.krause@embedded.rocks>
Message-ID: <20160921233143.28149-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2d5/2d55b5d88a06c7b8e6baeb96973009a451e992d9/
http://autobuild.buildroot.net/results/899/89922e61c583cf1d11bd0bafdd5586c35d8f6e15/
http://autobuild.buildroot.net/results/d5b/d5b8fe66ff8d9ea91e87ef6fbe8274f5e24aa7b0/
http://autobuild.buildroot.net/results/89b/89b136e6dced6ca9842a1f23141b0cb999f783da/
.. and many more.

Building OLA with a GCC 6 cross-toolchain fails:

```
/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
-Wall -Wformat -W -isystem
/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-pthread -c -o libs/acn/e131_transmit_test.o
libs/acn/e131_transmit_test.cpp
/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
-Wall -Wformat -W -isystem
/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-pthread -c -o libs/acn/E131TestFramework.o
libs/acn/E131TestFramework.cpp
In file included from
/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/ext/string_conversions.h:41:0,
                 from
/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/bits/basic_string.h:5402,
                 from
/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/string:52,
                 from ./tools/ola_trigger/config.ypp:2:
/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/cstdlib:75:25:
fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
```

The C++ library in GCC 6 now provides its own `<stdlib.h>` header that
wraps the C library header of the same name, so in `<cstdlib>` the
header include

```
#include <stdlib.h>
```

has become

```
#include_next <stdlib.h>
```

`#include_next` is sensitive to the order of directories in the
preprocessor's search path, so if that order is changed with `-isystem`
then the compiler can't find the right header:

```
[1] /usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
[2] /opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0
[..]
End of search list.
```

`<cstdlib>` is located in [2] whereas `<stdlib.h>` (C library header) is
in [1]. In this case, the `#include_next <stdlib.h>` statement in
`<cstdlib>`, located in [2], is evaluated **after** the search path [1],
so the compiler does not find the right system header.

The problem here is that the OLA build system replaces the `-I` in the CFLAGS
from libprotobuf with `-isystem` to fix some warnings treated as errors
in the libprotobuf header files.

`-isystem` should be used to suppress warnings in system headers only
and the libprotobuf header files are not system files.

The correct fix is to compile with less restrictions and remove
`-Werror` for the build. This is already done by passing
`--disable-fatal-warnings` to OLA.

Fix the reordering of the GCC search paths by removing the replacement of
`-I` with `-isystem`.

Upstream status: https://github.com/OpenLightingProject/ola/pull/1126

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../ola/0002-Remove-replacing-I-with-isystem.patch | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/ola/0002-Remove-replacing-I-with-isystem.patch

diff --git a/package/ola/0002-Remove-replacing-I-with-isystem.patch b/package/ola/0002-Remove-replacing-I-with-isystem.patch
new file mode 100644
index 0000000..010c99a
--- /dev/null
+++ b/package/ola/0002-Remove-replacing-I-with-isystem.patch
@@ -0,0 +1,106 @@
+From bbb03794def326c2e8ad2de523c5a61a4c8cb464 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 22 Sep 2016 00:58:58 +0200
+Subject: [PATCH] Remove replacing -I with -isystem
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building OLA with a GCC 6 cross-toolchain fails:
+
+```
+/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
+-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
+-Wall -Wformat -W -isystem
+/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
+-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
+-pthread -c -o libs/acn/e131_transmit_test.o
+libs/acn/e131_transmit_test.cpp
+/usr/bin/arm-linux-g++ -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE
+-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./include -I./include
+-Wall -Wformat -W -isystem
+/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include -pthread
+-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
+-pthread -c -o libs/acn/E131TestFramework.o
+libs/acn/E131TestFramework.cpp
+In file included from
+/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/ext/string_conversions.h:41:0,
+                 from
+/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/bits/basic_string.h:5402,
+                 from
+/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/string:52,
+                 from ./tools/ola_trigger/config.ypp:2:
+/opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/cstdlib:75:25:
+fatal error: stdlib.h: No such file or directory
+ #include_next <stdlib.h>
+                         ^
+compilation terminated.
+```
+
+The C++ library in GCC 6 now provides its own `<stdlib.h>` header that
+wraps the C library header of the same name, so in `<cstdlib>` the
+header include
+
+```
+#include <stdlib.h>
+```
+
+has become
+
+```
+#include_next <stdlib.h>
+```
+
+`#include_next` is sensitive to the order of directories in the
+preprocessor's search path, so if that order is changed with `-isystem`
+then the compiler can't find the right header:
+
+```
+[1] /usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
+[2] /opt/ext-toolchain/arm-buildroot-linux-gnueabihf/include/c++/6.1.0
+[..]
+End of search list.
+```
+
+`<cstdlib>` is located in [2] whereas `<stdlib.h>` (C library header) is
+in [1]. In this case, the `#include_next <stdlib.h>` statement in
+`<cstdlib>`, located in [2], is evaluated **after** the search path [1],
+so the compiler does not find the right system header.
+
+The problem is that the OLA build system replaces the `-I` in the CFLAGS
+from libprotobuf with `-isystem` to fix some warnings treated as errors
+in the libprotobuf header files.
+
+`-isystem` should be used to suppress warnings in system headers only
+and the libprotobuf header files are not system files.
+
+The correct fix is to compile with less restrictions and remove
+`-Werror` for the build.
+
+As using `-isystem` is reordering GCCs search path and using `-isystem`
+is really not necessary, remove the faulty replacement of `-I`.
+
+Upstream status: https://github.com/OpenLightingProject/ola/pull/1126
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ config/ola.m4 | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/config/ola.m4 b/config/ola.m4
+index 2796cfb..d3b8cc8 100644
+--- a/config/ola.m4
++++ b/config/ola.m4
+@@ -24,9 +24,6 @@ AC_DEFUN([PROTOBUF_SUPPORT],
+ AC_REQUIRE_CPP()
+ PKG_CHECK_MODULES(libprotobuf, [protobuf >= $1])
+ 
+-# We want to replace -I with -isystem here to disable errors in the .h files
+-# See https://groups.google.com/forum/#!topic/open-lighting/39Mj0KXlCIk
+-libprotobuf_CFLAGS=`echo $libprotobuf_CFLAGS | sed 's/-I/-isystem /'`
+ AC_SUBST([libprotobuf_CFLAGS])
+ 
+ AC_ARG_WITH([protoc],
+-- 
+2.10.0
+
-- 
2.10.0
