From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 15:33:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <1429623019-12174-1-git-send-email-lionel.orry@gmail.com>
References: <1429623019-12174-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <20150421153349.715c50f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Tue, 21 Apr 2015 15:30:19 +0200, Lionel Orry wrote:
> The current configuration system does not check for cached variables for
> these flags, and thus they are always disabled when cross-compiling.
> This patch fixes the configuration system to use cached variables and
> enables them at configuration time.
> 
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> ---
>  ...e.m4-make-kernel-specific-flags-cacheable.patch | 204 +++++++++++++++++++++
>  package/zeromq/zeromq.mk                           |  10 +
>  2 files changed, 214 insertions(+)
>  create mode 100644 package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
> 
> diff --git a/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
> new file mode 100644
> index 0000000..9b6e808
> --- /dev/null
> +++ b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
> @@ -0,0 +1,204 @@
> +From 2eee4dd2b1668124f377f6da1d511249086a1449 Mon Sep 17 00:00:00 2001
> +From: Lionel Orry <lionel.orry@gmail.com>
> +Date: Fri, 6 Feb 2015 09:45:21 +0100
> +Subject: [PATCH 1/1] acinclude.m4: make kernel-specific flags cacheable
> +
> +Specifically when cross-compiling, one can be willing to force these
> +variable values using the environment of a config.cache file. This
> +commit makes this possible.
> +
> +The affected variables are:
> +
> +* libzmq_cv_sock_cloexec
> +* libzmq_cv_so_keepalive
> +* libzmq_cv_tcp_keepcnt
> +* libzmq_cv_tcp_keepidle
> +* libzmq_cv_tcp_keepintvl
> +* libzmq_cv_tcp_keepalive
> +
> +Signed-off-by: Lionel Orry <lionel.orry@gmail.com>

Could you state whether this patch is upstream or not?

> +# Assume these flags are always available. It is true, at least for
> +# SOCK_CLOEXEC, since linux v2.6.27.
> +# Note: the flag TCP_KEEPALIVE is NOT available so we do not include it.
> +ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
> +				  libzmq_cv_so_keepalive=yes \

Only one tab for indentation on continuation lines.

Also, I must say I still don't quite understand why an AC_TRY_RUN() is
needed here. Isn't an AC_TRY_LINK() to test if the relevant flags
exists sufficient?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
