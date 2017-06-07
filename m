From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 7 Jun 2017 12:12:05 +0200
Subject: [Buildroot] [PATCH v1 0/2] v4l-utils build on noMMU platform
Message-ID: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to pass V4L2 compliancy tests on STM32 devices -which are MMU less-,
compliancy utilities -at least v4l2-compliance and cec-compliance- have to be built.
Unfortunately the support of shared libraries (dlopen()) and fork() is a must
have in v4l-utils (libv4l buildroot package).
This have been fixed by:
 - revisiting --disable-libv4l to --disable-dyn-libv4l; first naming
   suggests that libv4l will not be built which is not the case
   (only the dynamic support of libv4l is disabled in this case)
 - for the sake of coherency, configure.ac variables USE_V4L2_CTL & USE_V4L2_COMPLIANCE
   have been changed to USE_V4L2_CTL_LIBV4L & USE_V4L2_COMPLIANCE_LIBV4L
   for the same reason.
 - adding an option --disable-libv4l to really not build libv4l
   - libraries which require dlopen() and libv4lconvert which
     require fork(). For the sake of simplicity, the entire lib/ folder
     is not built with this option.
   - The contrib/ folder is also not built in that case because of its dependency
     on libv4l/libv4lconvert libraries.
   - The utility rds-ctl is also not built for the same reason.
   - configure.ac is also fixed to not trig error on dlopen() missing, further
     test on "enable_shared" will automatically disable the build of libv4l
     and items which have libv4l has dependency.
 - fix configure.ac to allow build of v4l-utils utilities with uclinux.
All those patches have been accepted upstream and are merged in master branch,
see git://linuxtv.org/v4l-utils.git
d57bb8af0c71d82b702e35a7362aa077189dd593 configure.ac: add USE_LIBV4L to summary

Changes are needed in buildroot Config.in in order to remove MMU related
dependencies and let throw build even if no MMU and no shared libraries support.

In order to build the V4L2 compliancy tools, below options have to be selected
in buildroot menuconfig or platform configuration file:
+#v4l utilities
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_LIBV4L=y
+BR2_PACKAGE_LIBV4L_UTILS=y

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

---

Hugues Fruchet (2):
  package/libv4l: upstream patches for noMMU platform
  package/libv4l: build of v4l2 utilities on noMMU platform

 ...04-configure.ac-clarify-configure-summary.patch |  72 ++++++++++
 ...c-revisit-v4l2-ctl-compliance-using-libv4.patch |  43 ++++++
 ...c-revisit-disable-libv4l-to-disable-dyn-l.patch | 114 +++++++++++++++
 ...07-configure.ac-add-disable-libv4l-option.patch | 155 +++++++++++++++++++++
 ...gure.ac-fix-build-of-v4l-utils-on-uclinux.patch |  30 ++++
 ...09-configure.ac-add-USE_LIBV4L-to-summary.patch |  27 ++++
 package/libv4l/Config.in                           |  11 +-
 package/libv4l/libv4l.mk                           |   6 +
 8 files changed, 449 insertions(+), 9 deletions(-)
 create mode 100644 package/libv4l/0004-configure.ac-clarify-configure-summary.patch
 create mode 100644 package/libv4l/0005-configure.ac-revisit-v4l2-ctl-compliance-using-libv4.patch
 create mode 100644 package/libv4l/0006-configure.ac-revisit-disable-libv4l-to-disable-dyn-l.patch
 create mode 100644 package/libv4l/0007-configure.ac-add-disable-libv4l-option.patch
 create mode 100644 package/libv4l/0008-configure.ac-fix-build-of-v4l-utils-on-uclinux.patch
 create mode 100644 package/libv4l/0009-configure.ac-add-USE_LIBV4L-to-summary.patch

-- 
1.9.1
