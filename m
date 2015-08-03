From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Aug 2015 22:41:14 +0200
Subject: [Buildroot] [PATCH v1 1/3] aufs-standalone: new package
In-Reply-To: <1438387017-10597-1-git-send-email-christian@paral.in>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
Message-ID: <20150803204114.GP3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-31 16:56 -0700, Christian Stewart spake thusly:
> aufs-standalone is a metapackage that downloads the correct
> aufs-standalone sources for patching the kernel with the aufs
> filesystem. The package is not selectable because it does nothing but
> download the sources on default. It is a dependency of the Aufs kernel
> extension.

I've started reviewing this aufs series. I have some preliminary
comments, but they are just that, inital comments. The series, although
a good basis to start working, is far from being ready.

So, do not just re-send the series after fixing after my comments. Just
hold on it for yet a little while...

> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/aufs-standalone/aufs-standalone.mk b/package/aufs-standalone/aufs-standalone.mk
> new file mode 100644
> index 0000000..ebf5ab6
> --- /dev/null
> +++ b/package/aufs-standalone/aufs-standalone.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# aufs-standalone
> +#
> +# patches for the linux kernel, used by the extension.
> +#
> +################################################################################
> +
> +# linux-headers
> +AUFS_STANDALONE_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_STANDALONE_VERSION))

BR2_PACKAGE_AUFS_STANDALONE_VERSION is defined nowhere in this patch.

> +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)

Ditto BR2_PACKAGE_AUFS_STANDALONE_3X and the other similar variables...

> +AUFS_STANDALONE_MAJOR_VERSION = aufs3
> +endif
> +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
> +AUFS_STANDALONE_MAJOR_VERSION = aufs4
> +endif
> +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)
> +AUFS_STANDALONE_SITE = git://git.code.sf.net/p/aufs/aufs3-standalone

No need to duplicate the conditional bloc; just move the variable
asignment within the previos condition.

> +endif
> +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
> +AUFS_STANDALONE_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_STANDALONE_VERSION))
> +endif
> +AUFS_STANDALONE_LICENSE = GNU

'GNU' is not a known license. Probably you meant 'GPLv2'.

Regards,
Yann E. MORIN.

> +AUFS_STANDALONE_LICENSE_FILES = COPYING
> +
> +$(eval $(generic-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
