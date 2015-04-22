From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:13:16 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150422221316.5412b477@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Apr 2015 23:36:28 +0200, Thomas Petazzoni wrote:
> This commit removes BR2_LINUX_KERNEL_EXT_RTAI_PATCH because this
> option never worked. It was added in commit
> 8797a9cd1fe6723db34b0c125d0d9d04e3483e8d, which added package/rtai/
> and RTAI as a Linux extension.
> 
> The option prompt says "Path for RTAI patch file", so let's say you
> specify /home/foo/bar/myrtai.patch as the value for
> BR2_LINUX_KERNEL_EXT_RTAI_PATCH.
> 
> Then the code does:
> 
> RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
> 
> and we have a package called 'rtai', so the normal logic of
> <pkg>_PATCH applies. Since the <pkg>_PATCH value does not contain
> ftp://, http:// or https://, the package infrastructure will try to
> download $(RTAI_SITE)/$(RTAI_PATCH), i.e:
> 
>    https://www.rtai.org/userfiles/downloads/RTAI/home/foo/bar/myrtai.patch
> 
> Pretty clear that it has no chance of working.
> 
> Now, let's assume an URL is used as the value of
> BR2_LINUX_KERNEL_EXT_RTAI_PATCH, such as
> http://foo.com/bar/myrtai.patch. In this case, it will be properly
> downloaded by the package infrastructure. But then, the following code
> kicks in:
> 
> define RTAI_PREPARE_KERNEL
>        $(APPLY_PATCHES)                        \
>                $(LINUX_DIR)                    \
>                $(dir $(RTAI_PATCH))            \
>                $(notdir $(RTAI_PATCH))
> endef
> 
> The value of $(dir $(RTAI_PATCH)) will be http://foo.com/bar/. How
> can $(APPLY_PATCHES) make use of such a stupid patch location?
> 
> Bottom line is that this feature has never worked, so there is not
> even a point in adding Config.in.legacy support for it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/Config.ext.in     |  6 ------
>  linux/linux-ext-rtai.mk | 11 -----------
>  2 files changed, 17 deletions(-)

I've applied, after adding Config.in.legacy handling as suggested by
Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
