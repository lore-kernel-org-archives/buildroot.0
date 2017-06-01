From: Christian Stewart <christian@paral.in>
Date: Thu, 1 Jun 2017 11:36:43 -0700
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
Message-ID: <CA+h8R2qveTiXHgqHz63y3ji01KXgvhQwOP+oKTAgfccB5wm4mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Wed, May 31, 2017 at 7:29 PM, Christian Stewart <christian@paral.in> wrote:
> Compiling against 2017.05
> /output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam.so: incompatible target
> /output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
> error: /lib/libpam_misc.so: incompatible target
> collect2: error: ld returned 1 exit status


I have bisected the issue down to this commit:

400eaa3452e9380ec77ac62266530055506ea6e7 is the first bad commit
commit 400eaa3452e9380ec77ac62266530055506ea6e7
Author: Fabio Estevam <festevam@gmail.com>
Date:   Mon Feb 20 08:57:33 2017 -0300

    linux: bump default to version 4.10

    Signed-off-by: Fabio Estevam <festevam@gmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

:040000 040000 126b4402798481ff4f718cffc974f612c3f374f3
07e93971d57d6f591d0ba4c957febb048fda48ef M      linux

Bisecting using this script:

probe-issue.bash:

#!/bin/bash
set -eo pipefail
make clean
cat > defconfig <<'_EOF'
BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_LINUX_PAM=y
_EOF
make defconfig BR2_DEFCONFIG=defconfig
make systemd

buildroot:

git bisect run ../probe-issue.bash

Reliable failure is systemd attempting to link against /lib/libpam.so.

Thanks,
Christian Stewart
