From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 10:01:50 +0200
Subject: [Buildroot] [PATCH V2 1/1] nvme: Allow libudev support
In-Reply-To: <1461030864-11359-1-git-send-email-sam@mendozajonas.com>
References: <1461030864-11359-1-git-send-email-sam@mendozajonas.com>
Message-ID: <20160419100150.158d763f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 11:54:24 +1000, Samuel Mendoza-Jonas wrote:
> Commands like 'nvme list' require libudev but support for libudev is
> decided at compile time, and in buildroot this is hard disabled.
> Add a check for udev and if it is available build nvme with udev
> support.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

I've applied, after doing a few changes (since below).

> diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
> index 7c4bd8e..3571494 100755
> --- a/package/nvme/nvme.mk
> +++ b/package/nvme/nvme.mk
> @@ -8,11 +8,17 @@ NVME_VERSION = v0.3
>  NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
>  NVME_LICENSE = GPLv2+
>  NVME_LICENSE_FILES = LICENSE

I've added a comment here that insists on the fact that yes, LIBUDEV=0
enables udev support, while LIBUDEV=1 disables udev support, which is a
bit counter-intuitive.

> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +NVME_DEPENDENCIES += udev
> +NVME_MAKE_OPTS = LIBUDEV=0

I've changed to use += here

> +else
> +NVME_MAKE_OPTS = LIBUDEV=1

and here, since it's a bit more future proof. It will avoid mistakes if
someone adds NVME_MAKE_OPTS = <something> outside of the conditional
block.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
