From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Mar 2014 12:11:56 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: disable build for unsupported
 architectures.
In-Reply-To: <1396001767-4910-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1396001767-4910-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140328121156.6d49c688@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 28 Mar 2014 11:16:07 +0100, Eric Le Bihan wrote:
> Systemd only supports the architectures defined in
> src/shared/architecture.h. This list does not contain ARC, Blackfin,
> Xtensa, Microblaze and Nios2, so this package is disabled for these
> architectures.
> 
> Fixes
> http://autobuild.buildroot.net/results/bcc/bcce95eb0748505c0d62db21a6e420aae3c3181b/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/Config.in |    2 ++
>  system/Config.in          |    2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 838e13e..66b5fc4 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_SYSTEMD
>  	bool "systemd"
>  	depends on BR2_INIT_SYSTEMD
>  	depends on !BR2_avr32 # no epoll_create1
> +	depends on !BR2_arc && !BR2_bfin && !BR2_xtensa
> +	depends on !BR2_microblaze && !BR2_nios2

Maybe it's better to use positive logic here, and only explicitly allow
systemd on the architectures that it supports. This way if tomorrow we
add support for a new architecture, we won't get weird failures.

In package/systemd/Config.in:

config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
	bool
	default y if BR2_arm || BR2_powerpc || BR2_...

and then use "depends on BR2_PACKAGE_SYSTEM_ARCH_SUPPORTS" where needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
