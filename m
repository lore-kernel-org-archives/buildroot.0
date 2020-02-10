From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 14:13:26 +0100
Subject: [Buildroot] [PATCH v4 6/9] board/qemu: add post-image script
 for gitlab qemu testing
In-Reply-To: <20200209180327.455426-7-romain.naour@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-7-romain.naour@smile.fr>
Message-ID: <20200210141326.289a52ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  9 Feb 2020 19:03:24 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> This commit add the same post-image script for each qemu board
> in order to generate start-qemu.sh in BINARIES_DIR.
> The start-qemu.sh script can be used by Buildroot user to start
> Qemu or by a gitlab CI.
> 
> To find the correct qemu command line in the readme.txt, we use
> the second post script argument which must contain "$(BR2_DEFCONFIG)"
> 
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> 
> Doing a basename allow to retrieve the name of the defconfig
> file (ex: qemu_aarch64_virt_defconfig) that should match
> on on the "tag" previously introduced in the readme.txt.
> 
> The script start-qemu.sh is able to modify the qemu command
> line if CI_JOB_NAME defined in the environment. This allow
> to disable the graphical output and redirect serial I/Os to
> console.
> 
> Only sh4/sh4eb needs a special handling by adding
> "-serial stdio -display none" instead of "-display none".
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Is it really a good idea to automatically start Qemu at the end of the
build of those defconfigs ? While I understand how it makes sense for
Gitlab CI, it is not very practical/convenient for normal users.

Can't we start the test under Qemu by a separate command from
.gitlab-ci.yml instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
