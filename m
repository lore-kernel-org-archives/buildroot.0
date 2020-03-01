From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 18:48:26 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: test_systemd.py: add
 linux fragment to enable CONFIG_BINFMT_MISC
In-Reply-To: <20200301162647.438549-2-romain.naour@smile.fr>
References: <20200301162647.438549-1-romain.naour@smile.fr>
 <20200301162647.438549-2-romain.naour@smile.fr>
Message-ID: <20200301174826.GT8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Applied to master, thanks.

I just moved the kernel fragment with the others in the conf/ sub-dir of
the test infra. Yeah, the lxc fragment is not there, though, but that's
the outlier now.

Regards,
Yann E. MORIN.

On 2020-03-01 17:26 +0100, Romain Naour spake thusly:
> While investigating [1] one units failed due to missing kernel option
> CONFIG_BINFMT_MISC needed by "proc-sys-fs-binfmt_misc.mount" service.
> 
> It's because the kernel support autofs4 but not MISC binaries.
> 
> Since the systemd test infra use the default defconfig (vexpress),
> we need to provide a linux fragment to enable CONFIG_BINFMT_MISC.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/testing/tests/init/systemd-linux/linux.fragment | 2 ++
>  support/testing/tests/init/test_systemd.py              | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 support/testing/tests/init/systemd-linux/linux.fragment
> 
> diff --git a/support/testing/tests/init/systemd-linux/linux.fragment b/support/testing/tests/init/systemd-linux/linux.fragment
> new file mode 100644
> index 0000000000..7c992ff71b
> --- /dev/null
> +++ b/support/testing/tests/init/systemd-linux/linux.fragment
> @@ -0,0 +1,2 @@
> +# Needed for binfmt_misc service: "Arbitrary Executable File Formats File System"
> +CONFIG_BINFMT_MISC=y
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index a324ba8569..0300b58be8 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -13,10 +13,11 @@ class InitSystemSystemdBase(InitSystemBase):
>          BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>          BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
>          BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
>          BR2_LINUX_KERNEL_DTS_SUPPORT=y
>          BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
>          # BR2_TARGET_ROOTFS_TAR is not set
> -        """
> +        """.format(infra.filepath("tests/init/systemd-linux/linux.fragment"))
>  
>      def check_init(self):
>          super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
