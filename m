From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 14 Aug 2015 18:20:24 +0200
Subject: [Buildroot] [PATCHv5] openpowerlink bump to v2.2.1
Message-ID: <1439569225-7199-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From doc/openpowerlink.md:
"The openPOWERLINK release V2.X is an evolution of the openPOWERLINK V1 stack.
Running the kernel and user layers of openPOWERLINK on different processors in
a multi-processor/multi-platform architecture, required fundamental changes in
the Communication Abstraction Layer. Additionally, the existing code base was
greatly improved so that it is easier to understand and maintain. Due to these
reasons a new major release was started."

The openpowerlink2 package archive contains several cmake projects,
and each of them should be packaged separately in Buildroot.

"With version 2.0, the source code has been cleanly split into an
application-oriented user library and a time-critical stack driver."

This complicates the packaging in Buildroot, so a top level CMakeLists.txt
has been added to the build system.

All patches fix several issues with the cmake build system and will be
submitted upstream.

There is one project for the EPL (Ethernet PowerLink) stack
libraries wich provides:
 * an user space EPL stack to be linked into application
 * an user space EPL stack pcap daemon
 * an kernel space EPL library interface

There are two projects for the EPL network driver:
 * pcap daemon driver
 * kernel module driver.

Note: On x86/x86_64 only few EPL ethernet driver are available for
the EPL kernel stack implementation:
 * Intel 82573
 * Intel 8255x
 * Intel I210
 * Realtek RTL-8111/8168 (new since V2.1.0)
 * Realtek RTL-8139

There is one project for each demo application:
 * demo_cn_embedded
 * demo_mn_embedded
 * demo_cn_console
 * demo_mn_console
 * demo_mn_qt

Only demo_mn_console will be packaged in Buildroot for now.

[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/

Romain Naour (1):
  package/openpowerlink: bump to v2.2.1

 Config.in.legacy                                   |  17 +++
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 133 ++++++++++++++++
 ...a-better-regex-for-cmake-system-processor.patch |  89 -----------
 ...0002-FIX-cmake-install-oplk-headers-files.patch |  34 +++++
 ...-fix-user-space-stack-enable-shared-build.patch |  54 -------
 ...se-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch | 154 +++++++++++++++++++
 ...ROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch | 125 +++++++++++++++
 .../0005-FIX-Add-top-level-CMakeLists.txt.patch    | 170 +++++++++++++++++++++
 package/openpowerlink/Config.in                    | 131 ++++++++--------
 package/openpowerlink/openpowerlink.hash           |   3 +
 package/openpowerlink/openpowerlink.mk             | 143 ++++++++++++-----
 11 files changed, 805 insertions(+), 248 deletions(-)
 create mode 100644 package/openpowerlink/0001-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 delete mode 100644 package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
 create mode 100644 package/openpowerlink/0002-FIX-cmake-install-oplk-headers-files.patch
 delete mode 100644 package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
 create mode 100644 package/openpowerlink/0003-FIX-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
 create mode 100644 package/openpowerlink/0004-FIX-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
 create mode 100644 package/openpowerlink/0005-FIX-Add-top-level-CMakeLists.txt.patch
 create mode 100644 package/openpowerlink/openpowerlink.hash

-- 
2.4.3
