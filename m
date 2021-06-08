From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Jun 2021 17:18:36 +0200
Subject: [Buildroot] [PATCHv2 0/3] Fix gdb pretty printers for libstdcxx
Message-ID: <20210608151840.20917-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

This series fixes the gdb pretty printers for libstdcxx, provided by gcc.

Patch 1 fixes a segfault in gdb 9.2 when Python 3 support is enabled. The fix is
already present in gdb 10.1+.

Patch 2 makes sure that the auto-load file provided by gcc for libstdcxx
pretty-printers, is using valid paths, rather than the paths the external
toolchain was built with.

Finally, patch 3 makes sure that gdb will actually load the fixed auto-load
file, by adding the buildroot sysroot as a 'safe path' in gdbinit.


After this series, it suffices to start up gdb, load the buildroot-provided
gdbinit file, and start debugging a binary. From the moment libstdcxx.so is
loaded, gdb will automatically load the pretty-printer file. Printing C++ STL
objects like std::map, std::vector, etc. will now be shown in the 'pretty'
manner. In order to show the 'raw' object without pretty-printing, use the '/r'
modifier to the 'print' command.

Note: the pretty-printing logic is written in Python, so Python support for
host-gdb needs to be enabled.

Best regards,
Thomas

---
v2:
- handle cases with more than one loadfile and more than one pythondir
- make command silent with $(Q)

Thomas De Schampheleire (3):
  package/gdb: fix gdb 9.2 segfault with Python 3.9 support
  toolchain/toolchain-external: fixup gdb pretty-printer loader for
    libstdcxx
  toolchain: mark sysroot as 'safe' path for gdb auto-load

 ...x-Python3.9-related-runtime-problems.patch | 227 ++++++++++++++++++
 toolchain/helpers.mk                          |   3 +-
 .../pkg-toolchain-external.mk                 |  21 ++
 3 files changed, 250 insertions(+), 1 deletion(-)
 create mode 100644 package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch

-- 
2.26.3
