From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 23:58:47 +0200
Subject: [Buildroot] [RFC] libv4l: Bump version to 1.0.1
In-Reply-To: <1403963761-7924-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1403963761-7924-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140628235847.0396216d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sat, 28 Jun 2014 10:56:01 -0300, Ezequiel Garcia wrote:
> Quite some work has been done from 0.8.3 to 1.0.1, and as a result
> this commit is very intrusive. The biggest change is the move to an
> autotools package.
> 
> Then, the options that enable utilities individually have been deprecated
> and moved to Config.in.legacy. Instead, we introduce new option to select
> either all the utilities. This change loses granularity in favor of
> maintainability.
> 
> Peter's patch has been rebased to apply on top of v1.0.1, and Riku's patch
> has been dropped given it was properly upstreamed and is part of v1.0.1.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  Config.in.legacy                                   | 40 ++++++++++++++++++
>  package/libv4l/Config.in                           | 49 ++--------------------
>  ...1-fixup-lfs-mismatch-in-preload-libraries.patch | 45 ++++++++++++++++++++
>  package/libv4l/libv4l-01-largefile.patch           | 39 -----------------
>  .../libv4l-02-use-openat-when-available.patch      | 34 ---------------
>  package/libv4l/libv4l.mk                           | 44 +++++++------------
>  6 files changed, 103 insertions(+), 148 deletions(-)
>  create mode 100644 package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
>  delete mode 100644 package/libv4l/libv4l-01-largefile.patch
>  delete mode 100644 package/libv4l/libv4l-02-use-openat-when-available.patch

Thanks, the patch looks good in principle, but unfortunately it doesn't
apply on the latest master, due to conflicts in libv4l.mk. Can you
respin on top of the latest master and resend? I think you can get rid
of the [RFC] tag as well, I don't think there's anything really
controversial or requiring discussion here.


> -config BR2_PACKAGE_LIBV4L_DECODE_TM6000
> -	bool "decode_tm6000"
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +config BR2_PACKAGE_LIBV4L_UTILS
> +	bool "v4l-utils tools"
>  	help
> -	  Tool to decode tm6000 proprietary format streams
> -
> -comment "decode_tm6000 needs an (e)glibc toolchain"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> -
> -config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
> -	bool "ir-keytable"
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> -	help
> -	  Tool to alter keymaps of Remote Controller devices
> -
> -comment "ir-keytable needs an (e)glibc toolchain"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> -
> -config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
> -	bool "v4l2-compliance"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	help
> -	  Tool to test v4l2 API compliance of drivers
> -
> -comment "v4l2-compliance needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> -
> -config BR2_PACKAGE_LIBV4L_V4L2_CTL
> -	bool "v4l2-ctl"
> -	depends on BR2_INSTALL_LIBSTDCPP

Can you make sure that the programs do not need C++ support, since
you're getting rid of the dependency entirely?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
