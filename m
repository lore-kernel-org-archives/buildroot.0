From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:46:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/vim: fix build for the host if
 NLS is disabled
In-Reply-To: <1554124857-10946-1-git-send-email-email@gmail.com>
References: <1554124857-10946-1-git-send-email-email@gmail.com>
Message-ID: <20190401214626.679bff62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon,  1 Apr 2019 16:20:57 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

>  HOST_VIM_DEPENDENCIES = host-ncurses
> +HOST_VIM_CONF_OPTS = --with-tlib=ncurses \
> +		     --enable-gui=no \
> +		     --without-x \
> +		     --disable-acl \
> +		     --disable-gpm \
> +		     --disable-selinux \
> +		     --disable-nls

Indentation should have been just one tab. I fixed that up and applied.

However, for target packages, we are passing --enable-nls/--disable-nls
in the autotools-package infrastructure. Perhaps we should simply do
the same for host packages and always pass --disable-nls ? We have a
few host packages already passing --disable-nls:

package/acl/acl.mk:ACL_CONF_OPTS = --disable-nls
package/acl/acl.mk:HOST_ACL_CONF_OPTS = --disable-nls
package/attr/attr.mk:ATTR_CONF_OPTS = --disable-nls
package/attr/attr.mk:HOST_ATTR_CONF_OPTS = --disable-nls
package/gcc/gcc-initial/gcc-initial.mk: --disable-nls \
package/gutenprint/gutenprint.mk:       --disable-nls \
package/gutenprint/gutenprint.mk:       --disable-nls-macos \
package/lvm2/lvm2.mk:   --disable-nls \
package/ushare/ushare.mk:USHARE_CONF_OPTS += --disable-nls
package/vim/vim.mk:     --disable-nls

Since it works for target packages, I think it should be OK to do the
same for host packages, no?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
