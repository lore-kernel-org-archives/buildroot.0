From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Dec 2015 06:38:06 +0200
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151201043806.GA2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

On Mon, Nov 30, 2015 at 09:02:15PM -0200, Sergio Prado wrote:
> Musl does not provide a 'sys/queue.h' implementation, and this has been
> a problem for packages that depend on it.
> 
> So lets create a package called sys-queue that will install 'sys/queue.h'
> in the staging directory when enabled.
> 
> Musl toolchain and external toolchain packages will depend on this
> package, so that 'sys/queue.h' will be always installed when compiling
> with a musl based toolchain.
> 
> Tested on ARM and x86 in the following cases:
>   - Buildroot musl toolchain.
>   - External musl toolchain without 'sys/queue.h'.
>   - External musl toolchain with 'sys/queue.h'.
> 
> Fixes:
> http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e
> 
> And possibly many others.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Thanks for working on this.

> +define SYS_QUEUE_INSTALL_STAGING_CMDS
> +	if [ ! -f $(STAGING_DIR)/usr/include/sys/queue.h ]; then \

We generally don't check for existence of files in target/staging, just 
overwrite them. Is there a reason to do this here? As I understand sys-queue 
is now a dependency of the toolchain, so if the toolchain provides sys/queue.h 
it will overwrite this one anyway.

> +		$(INSTALL) -D -m 0644 package/sys-queue/queue.h \
> +			$(STAGING_DIR)/usr/include/sys/queue.h; \
> +	fi
> +endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
