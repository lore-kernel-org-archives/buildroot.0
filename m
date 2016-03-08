From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Mar 2016 21:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] taskd: new package
In-Reply-To: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
References: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20160308201703.GA3856@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

Sorry for the dlong delay... Here's my review, there ar ea few comments,
see below...

On 2015-10-18 17:36 -0400, Ben Boeckel spake thusly:
> Taskwarrior is a task management suite of tools. Taskd is the
> synchronization server for it.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/taskd/Config.in b/package/taskd/Config.in
> new file mode 100644
> index 0000000..534881f
> --- /dev/null
> +++ b/package/taskd/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_TASKD
> +	bool "taskd"

taskd uses fork(), so you need to depend on BR2_USE_MMU.

> +	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_UTIL_LINUX

gnutls and util-linux both depend on BR2_USE_WCHAR, so you need to
propagate that dependency.

However, taskd depends on widechar for itself, so you also need that
dependency anyway.

Otherwise, sems OK...

Care to fix and respin, please? In the meantime, I marked your patch
as Changes Requested in our patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  Task management synchronization daemon.
> +
> +	  http://taskwarrior.org/
> diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
> new file mode 100644
> index 0000000..0bdf81d
> --- /dev/null
> +++ b/package/taskd/taskd.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# taskd
> +#
> +################################################################################
> +
> +TASKD_VERSION = 1.1.0
> +TASKD_SOURCE = taskd-$(TASKD_VERSION).tar.gz
> +TASKD_SITE = http://taskwarrior.org/download
> +TASKD_LICENSE = MIT
> +TASKD_LICENSE_FILES = COPYING LICENSE
> +TASKD_DEPENDENCIES = gnutls util-linux
> +
> +$(eval $(cmake-package))
> -- 
> 2.6.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
