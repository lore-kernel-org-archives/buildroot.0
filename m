From: Andreas Naumann <dev@andin.de>
Date: Fri, 17 Mar 2017 09:59:24 +0100
Subject: [Buildroot] [PATCH 1/2] acl: add host variant
In-Reply-To: <20170316223840.23007-1-arnout@mind.be>
References: <20170316223840.23007-1-arnout@mind.be>
Message-ID: <402ef173-377c-e717-c882-bd31b91f2d87@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
thanks for the patch.

However, when I run it I get a
acl_get_fd.c:26:24: fatal error: attr/xattr.h: No such file or directory

I find this file in
output/host/usr/include/attr/xattr.h

but that's outside the sysroot, so probably not included, right?

When I install
apt-get install libattr1-dev
on the host it works.

But we shouldnt depend on that, should we?


regards, Andreas

Am 16.03.2017 um 23:38 schrieb Arnout Vandecappelle (Essensium/Mind):
> We need host-acl to fix issues with fakeroot.
>
> Unfortunately, all the hacks have to be repeated again.
>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Andreas Naumann <dev@andin.de>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/acl/acl.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/package/acl/acl.mk b/package/acl/acl.mk
> index cbe5e93961..b38cc4c0c3 100644
> --- a/package/acl/acl.mk
> +++ b/package/acl/acl.mk
> @@ -37,4 +37,13 @@ endef
>
>  ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
>
> +HOST_ACL_DEPENDENCIES = host-attr
> +HOST_ACL_CONF_OPTS = --enable-gettext=no
> +HOST_ACL_INSTALL_OPTS = \
> +	prefix=$(HOST_DIR)/usr \
> +	exec_prefix=$(HOST_DIR)/usr \
> +	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
> +	install-dev install-lib
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
>
