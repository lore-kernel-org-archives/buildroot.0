From: Markus Mayer <code@mmayer.net>
Date: Tue,  4 Jul 2017 16:54:43 -0700
Subject: [Buildroot] [PATCH 0/2] Add linux-tool-tmon
Message-ID: <20170704235445.35255-1-code@mmayer.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markus Mayer <mmayer@broadcom.com>

Linux includes a tool for thermal monitoring (linux/tools/thermal/tmon).
This series enables building this tool alongside other userspace tools
bundled with the Linux kernel (known in buildroot as linux-tools).

In order to add linux-tool-tmon, we need to first stop relying on
alphabetical sorting of the linux-tool*.mk files.

Currently, the build system relies on linux-tool-*.mk files (i.e. the
sub-makefiles) to be sorted alphabetically such that linux-tools.mk
(the main makefile for linux-tools) will come last, therefore ensuring
that the sub-makefiles are included before the main makefile. So far,
this assumption has held true. Unfortunately, linux-tool-tmon.mk breaks
it. Sorted in the C locale, linux-tool-tmon.mk comes after
linux-tools.mk.

To ensure that the inclusion order remains correct, the logic to
include the linux-tool*mk has been modified.

Markus Mayer (2):
  Makefile: don't rely on linux-tools being sorted alphabetically
  package/linux-tools: add tmon

 Makefile                               |  6 +++++-
 package/linux-tools/Config.in          |  7 +++++++
 package/linux-tools/linux-tool-tmon.mk | 30 ++++++++++++++++++++++++++++++
 package/linux-tools/linux-tools.mk     |  8 +++-----
 4 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 package/linux-tools/linux-tool-tmon.mk

-- 
2.13.0
