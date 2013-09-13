From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 13 Sep 2013 18:24:41 +0200
Subject: [Buildroot] [RFCv1 05/11] toolchain: introduce a virtual package
In-Reply-To: <1378416469-17708-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52333C49.7000504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> This commit introduces a virtual package called 'toolchain', located
> in 'toolchain/toolchain', which simply depends on
> 'toolchain-buildroot' or 'toolchain-external' depending on the
> selected toolchain backend.
>
> For now, toolchain-buildroot and toolchain-external are still manual
> make targets, but the following patches convert those backends to use
> the package infrastructure as well.
>
> In addition to this:
>
>   * The main Makefile is modified to always make BASE_TARGETS point to
>     this new toolchain virtual package.
>
>   * The main Makefile is changed to include all the toolchain/*/*.mk
>     files: the toolchain virtual package, and the toolchain-buildroot
>     and toolchain-external directories.
>
>   * The dependency of the toolchain on prepare dirs and dependencies is
>     moved to the toolchain virtual package. It is moved as a
>     prerequisite of the "toolchain-source" rule to ensure that all
>     directories are prepared before we even start extracting the
>     toolchain.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Makefile                         | 18 +++---------------
>   toolchain/toolchain/toolchain.mk | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+), 15 deletions(-)
>   create mode 100644 toolchain/toolchain/toolchain.mk
>
> diff --git a/Makefile b/Makefile
> index f64a101..f2430eb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -222,11 +222,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
>   #
>   ################################################################################
>   
> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -BASE_TARGETS += toolchain-buildroot
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> -BASE_TARGETS += toolchain-external
> -endif
> +BASE_TARGETS = toolchain

At first sight I thought this might be a bug, because the += becamea =.
But since this is the only place where we set BASE_TARGETS this isnot a
problem of course.

I like this cleanup work, thanks.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
