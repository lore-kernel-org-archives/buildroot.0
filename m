From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 18:14:10 +0200
Subject: [Buildroot] [PATCH v2 0/4] openpowerlink2
Message-ID: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
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

The openpowerlink2 package provide all patches which should be used by
other openpowerlink2-* packages by using an patch hook.
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
  package/openpowerlink2: new package
  package/openpowerlink2-kernel-drivers: new package
  package/openpowerlink2-pcap-daemon: new package
  package/openpowerlink2-apps-demo-mn-console: new package

 package/Config.in                                  |   1 +
 ...a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch | 153 +++++++++++++++++++++
 ...ink-demos-with-Debug-and-Release-librarie.patch | 124 +++++++++++++++++
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 110 +++++++++++++++
 ...0004-FIX-cmake-install-oplk-headers-files.patch |  30 ++++
 package/openpowerlink2/Config.in                   |  88 ++++++++++++
 .../openpowerlink2-apps-demo-mn-console/Config.in  |   6 +
 .../openpowerlink2-apps-demo-mn-console.mk         |  50 +++++++
 .../openpowerlink2-kernel-drivers/Config.in        |  33 +++++
 .../openpowerlink2-kernel-drivers.mk               |  52 +++++++
 .../openpowerlink2-pcap-daemon/Config.in           |  12 ++
 .../openpowerlink2-pcap-daemon.mk                  |  38 +++++
 package/openpowerlink2/openpowerlink2.hash         |   2 +
 package/openpowerlink2/openpowerlink2.mk           |  72 ++++++++++
 14 files changed, 771 insertions(+)
 create mode 100644 package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
 create mode 100644 package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
 create mode 100644 package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 create mode 100644 package/openpowerlink2/0004-FIX-cmake-install-oplk-headers-files.patch
 create mode 100644 package/openpowerlink2/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-apps-demo-mn-console/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-apps-demo-mn-console/openpowerlink2-apps-demo-mn-console.mk
 create mode 100644 package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
 create mode 100644 package/openpowerlink2/openpowerlink2-pcap-daemon/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-pcap-daemon/openpowerlink2-pcap-daemon.mk
 create mode 100644 package/openpowerlink2/openpowerlink2.hash
 create mode 100644 package/openpowerlink2/openpowerlink2.mk

-- 
1.9.3
