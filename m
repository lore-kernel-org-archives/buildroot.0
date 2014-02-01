From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Feb 2014 16:44:58 +0100
Subject: [Buildroot] [PATCH v2 2/2] gummiboot: new package
In-Reply-To: <1391257869-26562-2-git-send-email-cvubrugier@yahoo.fr>
References: <1391257869-26562-1-git-send-email-cvubrugier@yahoo.fr>
 <1391257869-26562-2-git-send-email-cvubrugier@yahoo.fr>
Message-ID: <20140201154457.GA3574@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe, Thomas, All,

On 2014-02-01 13:31 +0100, Christophe Vu-Brugier spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
[--SNIP--]
> diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
> new file mode 100644
> index 0000000..ad04cec
> --- /dev/null
> +++ b/boot/gummiboot/Config.in
> @@ -0,0 +1,46 @@
> +config BR2_TARGET_GUMMIBOOT
> +	bool "gummiboot"
> +	select BR2_PACKAGE_GNU_EFI
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

Probablt this should also depends on BR2_i386 || BR2_x86_64, I guess...

> +	help
> +	  gummiboot is a simple UEFI boot manager which executes
> +	  configured EFI images. The default entry is selected by a
> +	  configured pattern (glob) or an on-screen menu.
> +
> +	  gummiboot operates on the EFI System Partition (ESP)
> +	  only. Configuration file fragments, kernels, initrds, other
> +	  EFI images need to reside on the ESP. Linux kernels need to
> +	  be built with CONFIG_EFI_STUB to be able to be directly
> +	  executed as an EFI image.
> +
> +	  See the Grub2 help text for details on preparing an EFI
> +	  capable disk image using Gummiboot: the instructions are
> +	  exactly the same, except that the Gummiboot configuration
> +	  files will be located in /loader/ inside the EFI partition.
> +
> +	  http://freedesktop.org/wiki/Software/gummiboot/
> +
> +if BR2_TARGET_GUMMIBOOT
> +
> +choice
> +	prompt "Target"

... otherwise this choice would have no entry in case a non-x86
architecture is slected:

> +config BR2_TARGET_GUMMIBOOT_I386
> +	bool "i386"
> +	select BR2_PACKAGE_GNU_EFI_IA32
> +	# We unfortunately can't easily build gummiboot 32 bits when
> +	# the selected target architecture is x86-64
> +	depends on BR2_i386
> +
> +comment "32 bits gummiboot is only available for i386"
> +	depends on BR2_x86_64
> +
> +config BR2_TARGET_GUMMIBOOT_X86_64
> +	bool "x86-64"
> +	select BR2_PACKAGE_GNU_EFI_X64
> +	depends on BR2_x86_64
> +
> +endchoice
> +
> +endif # BR2_TARGET_GUMMIBOOT
[--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
