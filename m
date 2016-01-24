From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 24 Jan 2016 16:54:59 +0200
Subject: [Buildroot] [PATCH v4 0/4] yp-tools, ypbind-mt: new packages
Message-ID: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

This patch series adds the yp-tools and yp-bind packages to Buildroot.

This is the fourth attempt to submit an acceptable patch series for these
packages and is labeled as "v4" although the patch files themselves do not have
the same content as the equivalently numbered patch files from previous versions
of series.

Changes v3 -> v4:
  - Added comment to my yp-tools configure.ac patch 0000-remove-Wcast-align-\
    from-configure.ac.patch to indicate that my original patch that actually
    fixes the cast align problem was applied to the upstream.

  - Changed the Config.in web site URL's for yp-tools and yp-bind from the
    github repo URL's to the http://www.linux-nis.org/nis URL's.

  - Added comments in the *.mk files for yp-tools and ypbind-mt to explain
    the reason for choosing github over the web site Download links for the
    package sources.

  - Replaced the S70ypbind rc script with an original work based on the upstream
    author's rc script for SuSe. The current version is designed for simplicity.

  - Re-ordered the patches by 1) package/Config.in changes required by both of
    the new packages, 2) changes to other packages required by ypbind-mt, 3) the
    yp-tools package with all of its files and 4) the ypbind-mt package with all
    of its files.

Changes v2 -> v3:
  - Not changed: I retained the mapv4v6addr.h in its entirety rather than
    patching nis-hosts.c as per TP's request. The reason for this is that the
    two files have different licensing, as explained in the comments in
    yp-tools.mk. I think that patching an BSD-style licensed file in
    in its entirety, with it's copyright and license, into a GPLv2 file
    is not correct policy, and extracting the map_v4v6_address from
    mapv4v6addr.h without the copyright and license notice is a clear
    violation of license.
    
  - At TP's request, I added the 0000-remove-Wcast-align-from-configure\
    .ac.patch to squelch the -Wcast-align warning that causes the ARM
    build to fail, instead of the original 0001-Change-do_ypcall_tr-\
    param-resp-to-ypresp_val.patch that actually fixed the bug. My
    personal opinion is that it would have been better to leave the fix
    rather than to squelch the warning.

  - Added "comment" to the Config.in regarding glibc dependency.

  - Added a patch to linux-pam.mk to enable NIS support if yp-tools is
    selected.

  - Performed menuconfig UI testing and build testing for absolute
    minimal configurations using the following toolchains:
      - br-arm-basic-2015.11-rc1
      - br-arm-full-2015.11-rc1
      - br-arm-cortex-a9-musl-2015.11-rc1
      - br-arm11-full-nothread-2015.11-rc1
      - br-arm-full-static-2015.11-rc1
      - ia32-2012.09-62-i686-pc-linux-gnu-i386-linux
      - crosstool-ng GCC 5.1 arm-mxs-linux-gnueabihf

Jonathan Ben Avraham (4):
  Add yp-tools and ypbind-mt to packages menu
  linux-pam: Enable NIS support if yp-tools selected
  yp-tools: new package
  ypbind-mt: new package

 package/Config.in                                  |    2 +
 package/linux-pam/linux-pam.mk                     |    9 +-
 ...0000-remove-Wcast-align-from-configure.ac.patch |   19 ++++
 package/yp-tools/Config.in                         |   15 ++++
 package/yp-tools/mapv4v6addr.h                     |   69 +++++++++++++++
 package/yp-tools/yp-tools.hash                     |    2 +
 package/yp-tools/yp-tools.mk                       |   30 +++++++
 .../ypbind-mt/0001-Remove_man_dir_from_build.patch |   16 ++++
 package/ypbind-mt/Config.in                        |   17 ++++
 package/ypbind-mt/S70ypbind                        |   93 ++++++++++++++++++++
 package/ypbind-mt/ypbind-mt.mk                     |   24 +++++
 11 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 package/yp-tools/0000-remove-Wcast-align-from-configure.ac.patch
 create mode 100644 package/yp-tools/Config.in
 create mode 100644 package/yp-tools/mapv4v6addr.h
 create mode 100644 package/yp-tools/yp-tools.hash
 create mode 100644 package/yp-tools/yp-tools.mk
 create mode 100644 package/ypbind-mt/0001-Remove_man_dir_from_build.patch
 create mode 100644 package/ypbind-mt/Config.in
 create mode 100755 package/ypbind-mt/S70ypbind
 create mode 100644 package/ypbind-mt/ypbind-mt.mk

-- 
1.7.9.5
