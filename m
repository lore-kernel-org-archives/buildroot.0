From: William Tambe <tambewilliam@gmail.com>
Date: Sat, 9 May 2020 09:04:03 -0400
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <20200509120149.0540a23c@windsurf.home>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
Message-ID: <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 9, 2020 at 6:01 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 9 May 2020 01:43:56 -0400
> William Tambe <tambewilliam@gmail.com> wrote:
>
> > Nano package fail to build with the following error:
> >
> > nano.h:89:10: fatal error: curses.h: No such file or directory
> >
> > curses.h library can be found in the following path:
> > ./target/usr/include/curses.h
> > ./target/usr/include/ncurses.h
> > ./host/iron-buildroot-linux-gnu/sysroot/usr/include/curses.h
> > ./host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h
> > ./host/include/ncurses/curses.h
> > ./host/include/ncurses/ncurses.h
> >
> > Any idea why the nano package fail to build despite the headers being
> > available ?
>
> You need to provide more details, and especially which version of
> Buildroot you're using, and a defconfig that allows to reproduce the
> issue.

I am using a git clone with master branch @
b365c642369ca76cb138fd0b5be6457865a3d5ce

Below is patch of all the changes I am using on top of above master commit-id:

Date: Sat, 9 May 2020 07:56:33 -0500
Subject: [PATCH] Target IRON support

---
 arch/Config.in                                    | 10 ++++++++++
 arch/Config.in.iron                               |  8 ++++++++
 configs/iron_defconfig                            | 15 +++++++++++++++
 support/gnuconfig/config.sub                      |  1 +
 .../toolchain-external-custom/Config.in.options   |  1 -
 5 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/Config.in.iron
 create mode 100644 configs/iron_defconfig

diff --git a/arch/Config.in b/arch/Config.in
index 94bd2150ca..5bf954be74 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -208,6 +208,12 @@ config BR2_powerpc64le
    http://www.power.org/
    http://en.wikipedia.org/wiki/Powerpc

+config BR2_iron
+ bool "IRON"
+ select BR2_ARCH_HAS_MMU_MANDATORY
+ help
+   IRON is a RISC architecture.
+
 config BR2_riscv
  bool "RISCV"
  select BR2_ARCH_HAS_MMU_MANDATORY
@@ -449,6 +455,10 @@ if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif

+if BR2_iron
+source "arch/Config.in.iron"
+endif
+
 if BR2_riscv
 source "arch/Config.in.riscv"
 endif
diff --git a/arch/Config.in.iron b/arch/Config.in.iron
new file mode 100644
index 0000000000..756b8fde42
--- /dev/null
+++ b/arch/Config.in.iron
@@ -0,0 +1,8 @@
+config BR2_ARCH
+ default "iron"
+
+config BR2_ENDIAN
+ default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+ default "IRON"
diff --git a/configs/iron_defconfig b/configs/iron_defconfig
new file mode 100644
index 0000000000..29cc533f7d
--- /dev/null
+++ b/configs/iron_defconfig
@@ -0,0 +1,15 @@
+BR2_iron=y
+BR2_STATIC_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/iron-toolchain/"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_5=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG is not set
+# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
+BR2_ROOTFS_MERGED_USR=y
+BR2_PACKAGE_NANO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 5b158ac41c..145e662955 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -1229,6 +1229,7 @@ case $cpu-$vendor in
  | pdp10 | pdp11 | pj | pjl | pn | power \
  | powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
  | pru \
+ | iron \
  | pyramid \
  | riscv | riscv32 | riscv64 \
  | rl78 | romp | rs6000 | rx \
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9a8078d314..01e9e214de 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -330,7 +330,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC

 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
  bool "glibc/eglibc"
- depends on !BR2_STATIC_LIBS
  select BR2_TOOLCHAIN_EXTERNAL_GLIBC
  help
    Select this option if your external toolchain uses the GNU C
-- 
2.25.1


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
