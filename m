From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Wed, 14 Oct 2015 16:51:24 -0300
Subject: [Buildroot] [PATCH v3 0/2] Add support for AXFS filesystem type
Message-ID: <1444852286-12219-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds support for using the AXFS filesystem type.

The Advanced XIP File System is a Linux kernel filesystem driver that
enables files to be executed directly from flash or ROM memory rather
than being copied into RAM. It has the ability to store individual
*pages* in a file uncompressed/XIP or compressed/Demand Paged.

At the moment, the FS is not supported in Linux mainline (v4.3-rc5), so
the kernel has to be built with the axfs patches to be able to read it.
Patches can be found here: https://github.com/jaredeh/axfs
NOTE: adding this as a kernel extension is planned.

The mkfs.axfs utility is used to create an AXFS file system image. It
can receive an additional argument using the -i flag which points to a
CSV file that indicates which pages the user desires to have marked for
XIP within the file system image.

This patch only adds support for 'XIP all' mode, so all the files that
have the execute attribute set will be XIP'ed. Support for more options
(including AXFS profiling tool) will be submitted in following patches.

More info can be found here:
* http://elinux.org/AXFS
* http://www.academypublisher.com/ojs/index.php/jcp/article/viewFile/03017989/370
* http://docslide.us/documents/application-execute-in-place-xip-with-linux-and-axfs.html

Changes from v2:
* Added host-zlib as a dependency.
* Fixed LICENSE_FILES path.
* Expanded explanation in config help.

Changes from v1:
* Removed unnecessary call to $(generic-package) in axfsutils.mk.

Thanks,

Ariel D'Alessandro (2):
  axfsutils: add new package
  axfs: add new filesystem type

 fs/Config.in                   |  1 +
 fs/axfs/Config.in              | 16 ++++++++++++++++
 fs/axfs/axfs.mk                | 13 +++++++++++++
 package/axfsutils/axfsutils.mk | 23 +++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 fs/axfs/Config.in
 create mode 100644 fs/axfs/axfs.mk
 create mode 100644 package/axfsutils/axfsutils.mk

-- 
2.6.1
