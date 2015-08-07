From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Aug 2015 15:28:59 +0200
Subject: [Buildroot] [PATCHv3 0/4] openpowerlink bump to v2.2
Message-ID: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
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
and each of them must be packaged separately in Buildroot.

"With version 2.0, the source code has been cleanly split into an
application-oriented user library and a time-critical stack driver."

This complicates the packaging but it helps to refine the dependencies
compared to openpowerlink v1 build system.
(openpowerlink v1 requires C++ only for the qt demo)

The openpowerlink package provide all patches which should be used by
other openpowerlink-* packages by using an patch hook.
Doing this avoids patches duplication over all sub-packages.

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

Romain Naour (4):
  package/openpowerlink: bump to v2.2.0
  package/openpowerlink-kernel-drivers: new package
  package/openpowerlink-pcap-daemon: new package
  package/openpowerlink-apps-demo-mn-console: new package

 package/Config.in                                  |   3 +
 .../openpowerlink-apps-demo-mn-console/Config.in   |   6 +
 .../openpowerlink-apps-demo-mn-console.hash        |   1 +
 .../openpowerlink-apps-demo-mn-console.mk          |  50 +++++++
 package/openpowerlink-kernel-drivers/Config.in     |  33 +++++
 .../openpowerlink-kernel-drivers.hash              |   1 +
 .../openpowerlink-kernel-drivers.mk                |  54 +++++++
 package/openpowerlink-pcap-daemon/Config.in        |  12 ++
 .../openpowerlink-pcap-daemon.hash                 |   1 +
 .../openpowerlink-pcap-daemon.mk                   |  38 +++++
 ...a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch | 158 +++++++++++++++++++++
 ...a-better-regex-for-cmake-system-processor.patch |  89 ------------
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 133 +++++++++++++++++
 ...-fix-user-space-stack-enable-shared-build.patch |  54 -------
 ...0003-FIX-cmake-install-oplk-headers-files.patch |  34 +++++
 ...-FIX-Fix-name-of-sched_priority-element-2.patch |  96 +++++++++++++
 .../0005-FIX-add-missing-header-sys-time.h.patch   |  47 ++++++
 package/openpowerlink/Config.in                    | 116 ++++++---------
 package/openpowerlink/openpowerlink.hash           |   3 +
 package/openpowerlink/openpowerlink.mk             | 104 +++++++-------
 20 files changed, 763 insertions(+), 270 deletions(-)
 create mode 100644 package/openpowerlink-apps-demo-mn-console/Config.in
 create mode 120000 package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.hash
 create mode 100644 package/openpowerlink-apps-demo-mn-console/openpowerlink-apps-demo-mn-console.mk
 create mode 100644 package/openpowerlink-kernel-drivers/Config.in
 create mode 120000 package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.hash
 create mode 100644 package/openpowerlink-kernel-drivers/openpowerlink-kernel-drivers.mk
 create mode 100644 package/openpowerlink-pcap-daemon/Config.in
 create mode 120000 package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.hash
 create mode 100644 package/openpowerlink-pcap-daemon/openpowerlink-pcap-daemon.mk
 create mode 100644 package/openpowerlink/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
 delete mode 100644 package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
 create mode 100644 package/openpowerlink/0002-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 delete mode 100644 package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
 create mode 100644 package/openpowerlink/0003-FIX-cmake-install-oplk-headers-files.patch
 create mode 100644 package/openpowerlink/0004-FIX-Fix-name-of-sched_priority-element-2.patch
 create mode 100644 package/openpowerlink/0005-FIX-add-missing-header-sys-time.h.patch
 create mode 100644 package/openpowerlink/openpowerlink.hash

-- 
2.4.3
