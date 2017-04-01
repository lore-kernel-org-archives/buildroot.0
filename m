From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:48:56 +0200
Subject: [Buildroot] [PATCH v2 2/2] linux: Add CIP SLTS easy selection
 option
In-Reply-To: <1488925428-12805-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1488925428-12805-1-git-send-email-angelo.compagnucci@gmail.com>
 <1488925428-12805-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170401184856.33d00f4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Mar 2017 23:23:48 +0100, Angelo Compagnucci wrote:
> This patch adds an easy way to select the CIP project SLTS
> kernel within the kernel menu.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

> +	config BR2_LINUX_KERNEL_LATEST_CIP_VERSION_TAG
> +		bool "Latest tagged version (v4.4.48-cip2)"
> +		help
> +		  Use the latest tagged version
> +
> +	config BR2_LINUX_KERNEL_LATEST_CIP_VERSION_BRANCH
> +		bool "Latest released version"
> +		help
> +		  Always use the latest released version at the time of compiling

I still won't take a patch that adds an option like this. It makes the
build non reproducible, which is plain and simply unacceptable in
Buildroot. So until you remove this, this patch cannot be accepted.

> +else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
> +LINUX_SITE = $(call gitlab,cip-project,cip-kernel-4.4,$(LINUX_VERSION))
> +LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2

According to
https://wiki.linuxfoundation.org/civilinfrastructureplatform/start,
gitlab is only a mirror, and the official Git repository is
https://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git/.

And in fact, according to
https://lists.cip-project.org/pipermail/cip-dev/2017-March/000167.html,
they even say that the gitlab mirror is no longer updated that
regularly due to technical issues.

So could you rework your patch using git.kernel.org instead of gitlab
(and therefore dropping the gitlab helper), and also dropping the
BR2_LINUX_KERNEL_LATEST_CIP_VERSION_BRANCH option ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
