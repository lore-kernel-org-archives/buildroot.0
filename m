From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Nov 2020 15:41:26 +0100
Subject: [Buildroot] [=PATCH v3 4/4] support/scripts/boot-qemu-image.py:
 don't fail if start-qemu.sh is missing
In-Reply-To: <20201115143609.2160080-4-romain.naour@gmail.com>
References: <20201115143609.2160080-1-romain.naour@gmail.com>
 <20201115143609.2160080-4-romain.naour@gmail.com>
Message-ID: <52f921b5-1667-620d-dcab-50d91df63244@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch should be merged in master in order to avoid this failure in gitlab:

https://gitlab.com/buildroot.org/buildroot/-/jobs/849510085

The previous patches of this series is for next.

Best regards,
Romain

Le 15/11/2020 ? 15:36, Romain Naour a ?crit?:
> When boot-qemu-image.py script was added, we wanted to run
> each qemu defconfig in gitlab, so we expect that all qemu
> defconfig generate the script start-qemu.sh in images
> directory.
> 
> Don't make it a hard requirement even if we prefer to be
> able to do a runtime test for each qemu defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/scripts/boot-qemu-image.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index dbbba552ad..4066788c88 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -18,6 +18,10 @@ def main():
>      if not sys.argv[1].startswith('qemu_'):
>          sys.exit(0)
>  
> +    if not os.path.exists('output/images/start-qemu.sh'):
> +        print('qemu-start.sh is missing, cannot test.')
> +        sys.exit(0)
> +
>      qemu_start = os.path.join(os.getcwd(), 'output/images/start-qemu.sh')
>  
>      child = pexpect.spawn(qemu_start, ['serial-only'],
> 
