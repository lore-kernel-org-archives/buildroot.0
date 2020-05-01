From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 01 May 2020 09:51:11 +0000
Subject: [Buildroot] When building the net-next kernel,
 buildroot is asking for all the kernel config options one by one to
 enable
In-Reply-To: <mailman.9169.1588194216.91065.buildroot@busybox.net>
References: <mailman.9169.1588194216.91065.buildroot@busybox.net>
Message-ID: <d2386527cdcc0e718a0ecaa1abd5ecdf@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Message: 3
> Date: Wed, 29 Apr 2020 07:32:55 -0500 (CDT)
> From: Ganesh <ganesh45in@gmail.com>
> To: buildroot at busybox.net
> Subject: [Buildroot] When building the net-next kernel, buildroot is
> 	asking for all the kernel config options one by one to enable

Hi Ganesh,

> I have done the following steps before starting the kernel build:
> 
> 1. Put my defconfig inside the kernel/arch/arm/config
> 2. Go to buildroot directory, make <my_project_defconfig>
> 3. make
> 
> my_project_defconfig has the following lines of concern:
> 
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="<kernel path of the defconfig>"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="My_dts.dts"

Just some remarks about your project configuration:

1. Ideally, you should not copy your kernel defconfig to the kernel tree 
manually, it might get overwritten by the rsync() command. Just 
configure the external location in Buildroot via 
"BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE". File locations are relative to 
the Buildroot directory or absolute and may use BR2_* environment 
variables.

2. The rsync() for the kernel tree will copy any existing .config* files 
into the build location, which may be responsible for your strange 
issue. Remove configuration fragments from your source tree or modify 
the rsync() command.

2. To verify that the correct kernel config is picked up, run
   # make linux-nconfig
from the Buildroot directory and check the configuration.

3. An in-tree DTS name is relative to the dts directory 
(arch/arm/boot/dts) and without the file extension (.dts).

Kind regards,
Andreas
