From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  7 Sep 2015 21:06:59 +0200
Subject: [Buildroot] [PATCH v2 0/1] package/freeswitch: new package
Message-ID: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is v2 of the freeswitch patch. It should address all comments by
Thomas (http://patchwork.ozlabs.org/patch/506197/).

Please note that compiling freeswitch is still broken with uClibc-NG:

make[7]: Entering directory '/home/br/br2_next/output/build/freeswitch-7cf1238137d8876a1a34d28a54d60d328c44d895/libs/spandsp/src'
[...]
awgn.c: In function 'awgn_init_dbov':
awgn.c:110:5: error: void value not ignored as it ought to be
     s->rms = pow(10.0, level/20.0)*32768.0;

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_FREESWITCH=y

A related gcc bug report can be found here:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55695

The problem was discussed on the musl mailing list:
  thread.gmane.org/gmane.linux.lib.musl.general/2468/

Compilation works with uClibc however...

To enable vlc with an uClibc-toolchain for use with
BR2_PACKAGE_FREESWITCH_VIDEO I have a local patch to fix vlc with
uClibc, this patch is not finished yet.

Regards, Bernd

Bernd Kuhls (1):
  package/freeswitch: new package

 package/Config.in                          |   1 +
 package/freeswitch/0001-cross_git.patch    |  17 ++
 package/freeswitch/0002-jpeg.patch         |  24 +++
 package/freeswitch/0003-aarch64_zrtp.patch |  22 ++
 package/freeswitch/Config.in               | 311 ++++++++++++++++++++++++++++
 package/freeswitch/freeswitch.mk           | 322 +++++++++++++++++++++++++++++
 6 files changed, 697 insertions(+)
 create mode 100644 package/freeswitch/0001-cross_git.patch
 create mode 100644 package/freeswitch/0002-jpeg.patch
 create mode 100644 package/freeswitch/0003-aarch64_zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.mk

-- 
2.1.4
