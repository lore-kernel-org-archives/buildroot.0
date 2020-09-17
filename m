From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:39:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: disable the e2scrub
 stuff
In-Reply-To: <1600333425.32426.1.camel@aliyun.com>
References: <1600333425.32426.1.camel@aliyun.com>
Message-ID: <20200917213935.67fc4894@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Sep 2020 17:03:45 +0800
Tian Yuanhao via buildroot <buildroot@busybox.net> wrote:

> e2scrub_all depends on the readlink of coreutils. If you use the
> readlink of busybox, an error [1] occurs.
> 
> Embedded systems usually do not use LVM, in which case e2scrub is
> useless.
> 
> There is no single option to completely disable e2scrub, so use a method
> similar to [2] to disable the e2scrub stuff.
> 
> [1]: https://github.com/tytso/e2fsprogs/issues/32
> [2]: https://patchwork.ozlabs.org/project/buildroot/patch/20200717120654.548833-1-antoine.tenart at bootlin.com/
> 
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
> ?package/e2fsprogs/e2fsprogs.mk | 5 ++++-
> ?1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index eb82a55..cf6579d 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -52,7 +52,10 @@ E2FSPROGS_CONF_OPTS = \
> ?	--disable-e2initrd-helper \
> ?	--disable-testio-debug \
> ?	--disable-rpath \
> -	--enable-symlink-install
> +	--enable-symlink-install \
> +	--with-crond-dir=no \
> +	--with-systemd-unit-dir=no \
> +	--with-udev-rules-dir=no

I'm not sure this is really a good solution. Indeed, we probably do
want to install udev rules or systemd services.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
