From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:33:51 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <1479460224-6119-2-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-2-git-send-email-jezz@sysmic.org>
Message-ID: <20161118123351.69e79602@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:10 +0100, J?r?me Pouiller wrote:

> diff --git a/Makefile b/Makefile
> index eff814b..17e49e4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -249,6 +249,10 @@ ifeq ($(BR2_REPRODUCIBLE),y)
>  export TZ=UTC
>  export LANG=C
>  export LC_ALL=C
> +export SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH)

Why do you do this instead of just doing

export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(SOURCE_DATE_CHANGES))

> +SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
> +SOURCE_DATE_CHANGES = $(shell date -d `echo $(BR2_VERSION) | sed 's/^\(....\)\.\(..\).*/\1-\2-01T23:59:59/'` +%s)

Why don't we change the way BR2_VERSION is defined in order to avoid having to do this?

BR2_VERSION_DATE = 2016.11
BR2_VERSION = $(BR2_VERSION)-rc1

for example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
