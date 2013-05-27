From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 10:42:26 +0200
Subject: [Buildroot] [PATCH 01/20] numactl: new package
In-Reply-To: <1369606110-8088-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:11 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gikerv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Will Newton <will.newton@imgtec.com>
 Thomas> [Thomas: updated to 2.0.8, restricted to supported architectures,
 Thomas> added licensing informations, updated to latest Buildroot package
 Thomas> infrastructure]

 Thomas> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in          |    1 +
 Thomas>  package/numactl/Config.in  |   12 ++++++++++++
 Thomas>  package/numactl/numactl.mk |   21 +++++++++++++++++++++
 Thomas>  3 files changed, 34 insertions(+)
 Thomas>  create mode 100644 package/numactl/Config.in
 Thomas>  create mode 100644 package/numactl/numactl.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index d980871..6094c1b 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -852,6 +852,7 @@ source "package/module-init-tools/Config.in"
 Thomas>  endif
 Thomas>  source "package/monit/Config.in"
 Thomas>  source "package/ncdu/Config.in"
 Thomas> +source "package/numactl/Config.in"
 Thomas>  source "package/polkit/Config.in"
 Thomas>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Thomas>  source "package/procps/Config.in"
 Thomas> diff --git a/package/numactl/Config.in b/package/numactl/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..d39a733
 Thomas> --- /dev/null
 Thomas> +++ b/package/numactl/Config.in
 Thomas> @@ -0,0 +1,12 @@
 Thomas> +config BR2_PACKAGE_NUMACTL
 Thomas> +	bool "numactl"
 Thomas> +	# numactl uses some system calls that are not available on all
 Thomas> +	# architectures.
 Thomas> +	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
 Thomas> +		   BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
 Thomas> +	help
 Thomas> +	  numactl allows you to run your application on specific cpus
 Thomas> +	  and memory nodes. It does this by supplying a NUMA memory
 Thomas> +	  policy to the operating system before running your program.
 Thomas> +
 Thomas> +	  http://oss.sgi.com/projects/libnuma/
 Thomas> diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..440847c
 Thomas> --- /dev/null
 Thomas> +++ b/package/numactl/numactl.mk
 Thomas> @@ -0,0 +1,21 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# numactl
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +
 Thomas> +NUMACTL_VERSION = 2.0.8
 Thomas> +NUMACTL_SOURCE = numactl-$(NUMACTL_VERSION).tar.gz
 Thomas> +NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
 Thomas> +NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 Thomas> +NUMCTL_LICENSE_FILES = README

s/NUMCTL/NUMACTL/

The package uses stat64, so it needs largefile support in toolchain.

Committed to next with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
