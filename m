From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 16:17:52 +0200
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <CAH=K+6khOEyfhomv9HMbOnB7eNcgiX4V0Z_vALNLDAdL5QLVww@mail.gmail.com>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161025220305.1cb73355@free-electrons.com>
 <CAH=K+6khOEyfhomv9HMbOnB7eNcgiX4V0Z_vALNLDAdL5QLVww@mail.gmail.com>
Message-ID: <20161026161752.0fa1a3da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 09:06:12 -0500, Sam Voss wrote:

> Assuming you have already done a `make linux-savedefconfig` and have
> an older version to compare against (example files given below), it
> would be used (from the
> buildroot root directory) as follows:
> 
> ./support/scripts/gen-config-fragment.sh
> output/build/linux-4.8.1/defconfig  board/qemu/x86_64/linux-4.8.config

[...]

> Giving output file of - output/build/linux-4.8.1/defconfig.fragment
> 
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_DEVTMPFS=y
> # CONFIG_X86_MPPARSE is not set

OK, understood. So in fact, you have reimplemented the diffconfig tool
available in the Linux kernel scripts/ directory. For your two
configuration files, it shows:

thomas at skate:/tmp$ ~/projets/linux-2.6/scripts/diffconfig config1 config2 
-DEVTMPFS y
-DEVTMPFS_MOUNT y
-X86_MPPARSE n

Though I agree that your output format is better, as it can be re-used
as a fragment as-is.

However, calling it gen-config-fragment looks a bit wrong to me. What
about diffconfig, like in the Linux kernel?

> Should I add an example execution of this in the header of the script?
>  Something like the following?
> 
> #
> # Linux Example
> # ./support/scripts/gen-config-fragment.sh <output
> dir>/build/linux-x.y.z/defconfig  
> board/custom-board/linux-x.y.z.config
> #
> # Busybox Example using default base config
> # ./support/scripts/gen-config-fragment.sh <output
> dir>/build/busybox-x.y.z/.config  
> #
> # Busybox Example using custom base config
> # ./support/scripts/gen-config-fragment.sh <output
> dir>/build/busybox-x.y.z/.config board/custom-board/busybox.config  

No need to give so many examples, but just one example would be good.

In terms of implementation, should we re-use the diffconfig tool from
the kernel, simply tweaked in terms of output format?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
