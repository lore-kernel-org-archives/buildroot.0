From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Feb 2019 09:41:56 +0100
Subject: [Buildroot] [PATCH] qemu: Update defconfigs to Linux 4.19.16
In-Reply-To: <20190206221441.11654-1-gerome.burlats@smile.fr>
References: <20190206221441.11654-1-gerome.burlats@smile.fr>
Message-ID: <20190207094156.106ebb0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gerome,

Thanks a lot for working on this, it's very useful to have our qemu
defconfigs regularly updated and tested!

On Wed,  6 Feb 2019 23:14:41 +0100
Gerome Burlats <gerome.burlats@smile.fr> wrote:

> Linux version are changed to 4.19.16 (LTS) for all qemu defconfigs, except for riscv.
> riscv are left unchanged because they have a custom Linux repository causing more difficulties when upgrading to 4.19 for riscv32.

Word missing at the beginning: "riscv *defconfigs* are left"

> And for the riscv64, it has been updated recently to Linux 4.20 by another contributor.
> 
> Patch for arm-versatile-nommu is changed into a git format
> 
> Add cache attributes for xtensa-lx60-nommu config because the commit https://github.com/torvalds/linux/commit/7bb516ca5424e12b42124fab2906b6da9c81ba9c added a new config variable for memory cache attribute: CONFIG_MEMMAP_CACHEATTR
> 
> All these updated configs have been built successfully.
> 
> Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
> Cc: Romain Naour <romain.naour@smile.fr>

Also, please wrap the lines of the commit log to 72 characters.

> I did not make Qemu tests for all the configs yet. I am looking over the Bootlin toolchains-builder project in order to make these tests with Gitlab CI

Actually, maybe it would make sense for those qemu defconfigs to be
runtime tested as part of the .gitlab-ci.yml that is in Buildroot
itself ?

This would probably require extending:

.defconfig_script:
    script:
        - echo 'Configure Buildroot'
        - make ${CI_JOB_NAME}
        - echo 'Build buildroot'
        - |
            make > >(tee build.log |grep '>>>') 2>&1 || {
                echo 'Failed build last output'
                tail -200 build.log
                exit 1
            }

with some additional commands to see if it is a qemu defconfig, and if
it is, run it under Qemu.


> diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> index 883bd0de6e..246a96aa37 100644
> --- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> +++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> @@ -1,10 +1,27 @@
> -Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>

Why is this line removed ?

> -From LKML.
> +From 150e839cfcc35fc1c09f3d8eaa0b331e98683e2f Mon Sep 17 00:00:00 2001
> +From: Gerome Burlats <gerome.burlats@smile.fr>

Please assign the authorship to Waldemar, who did the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
