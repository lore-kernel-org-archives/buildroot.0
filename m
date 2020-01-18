From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:29:23 +0100
Subject: [Buildroot] [PATCH v5 1/1] package/tar: bump target version to
 1.32
In-Reply-To: <20200118022637.53884-1-james.hilliard1@gmail.com>
References: <20200118022637.53884-1-james.hilliard1@gmail.com>
Message-ID: <20200118122923.GU22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-01-17 19:26 -0700, James Hilliard spake thusly:
> From: Luc Creti <luc.creti@atos.net>
> The host tar is used to create the archives in the VCS download backends
> (git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
> they generate the archives.
> 
> So, all the archives that have been generated before 1.30 was released
> are not bit-for-bit reproducible (even though the extracted content
> would be), so the hashes we have for those archives would not match.
> 
> Hence host-tar requires a patch to restore reproducibility.

This makes me nervous for two reasons:

  - first, this is a patch that has zero chance of getting upstream, so
    we'll be stuck with it indefinitely, and this is not good.

  - second, we try to avoid conditional patching as much as possible.

So, I'm sorry, but no.

I think it would be much easier to bump just the target variant, and
keep the host variant at 1.29. I know there has been such a patch posted
a while back from Luc Creti (via Carlos), and I think I prefer that one.

I'm going to have a deeper look at it right now.

Regards,
Yann E. MORIN.

> Extract host-tar with tar from build host instead of using cpio.gz.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12256
> 
> Signed-off-by: Luc Creti <luc.creti@atos.net>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v0->v1:
>   - Commit message rewritten based on comment from Yann E. MORIN
> Changes v1->v2:
>   - Title modified to enphasize that host-tar is kept at 1.29
> Changes v2->v3
>   - Add a comment in the .mk file that explains why the host-tar package
>     is kept at 1.29 and not bumped to any higher version
>   - Add missing spaces around '='
>   - Spell Author name as 'Luc Creti'
> Changes v3->v4
>   - Bump host-tar to 1.31 and patch it to restore reproducibility.
> Changes v4->v5
>   - Don't use cpio.gz.
> ---
>  .../0001-tar-fix-reproducibility-issue.patch  | 42 +++++++++++++++++++
>  package/tar/tar.hash                          |  3 +-
>  package/tar/tar.mk                            | 19 +++++----
>  3 files changed, 55 insertions(+), 9 deletions(-)
>  create mode 100644 package/tar/host/0001-tar-fix-reproducibility-issue.patch
> 
> diff --git a/package/tar/host/0001-tar-fix-reproducibility-issue.patch b/package/tar/host/0001-tar-fix-reproducibility-issue.patch
> new file mode 100644
> index 0000000000..a2417694e4
> --- /dev/null
> +++ b/package/tar/host/0001-tar-fix-reproducibility-issue.patch
> @@ -0,0 +1,42 @@
> +From e79e62e3e066545ba5319e2a905e62a0bb47e9e1 Mon Sep 17 00:00:00 2001
> +From: Felix Fietkau <nbd@nbd.name>
> +Date: Mon, 19 Dec 2016 21:06:07 +0100
> +Subject: [PATCH] tar: fix reproducibility issue
> +
> +Force root/root as names for uid0/gid0 instead of using the system
> +names. This helps make packed download tarballs more reproducible
> +
> +Signed-off-by: Felix Fietkau <nbd@nbd.name>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[James Hilliard: import patch from openwrt]
> +---
> + src/create.c | 13 ++-----------
> + 1 file changed, 2 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/create.c b/src/create.c
> +index bb9c115..1baee36 100644
> +--- a/src/create.c
> ++++ b/src/create.c
> +@@ -543,17 +543,8 @@ write_gnu_long_link (struct tar_stat_info *st, const char *p, char type)
> +   union block *header;
> + 
> +   header = start_private_header ("././@LongLink", size, 0);
> +-  if (! numeric_owner_option)
> +-    {
> +-      static char *uname, *gname;
> +-      if (!uname)
> +-	{
> +-	  uid_to_uname (0, &uname);
> +-	  gid_to_gname (0, &gname);
> +-	}
> +-      UNAME_TO_CHARS (uname, header->header.uname);
> +-      GNAME_TO_CHARS (gname, header->header.gname);
> +-    }
> ++  UNAME_TO_CHARS ("root", header->header.uname);
> ++  GNAME_TO_CHARS ("root", header->header.gname);
> + 
> +   strcpy (header->buffer + offsetof (struct posix_header, magic),
> + 	  OLDGNU_MAGIC);
> +-- 
> +2.20.1
> +
> diff --git a/package/tar/tar.hash b/package/tar/tar.hash
> index 60309bab8f..0a0516ddd9 100644
> --- a/package/tar/tar.hash
> +++ b/package/tar/tar.hash
> @@ -1,4 +1,3 @@
>  # Locally calculated after checking signature
> -sha256	402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024	tar-1.29.tar.xz
> -sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
> +sha256	d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8	tar-1.32.tar.xz
>  sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 6f609d7a02..84d79680b9 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TAR_VERSION = 1.29
> +TAR_VERSION = 1.32
>  TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
>  TAR_SITE = $(BR2_GNU_MIRROR)/tar
>  # busybox installs in /bin, so we need tar to install as well in /bin
> @@ -29,15 +29,11 @@ endif
>  
>  $(eval $(autotools-package))
>  
> -# host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
> -# of needing tar to build tar.
> -HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
>  define HOST_TAR_EXTRACT_CMDS
>  	mkdir -p $(@D)
>  	cd $(@D) && \
> -		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(TAR_DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i --preserve-modification-time
> -	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
> -	rmdir $(@D)/tar-$(TAR_VERSION)
> +		$(call suitable-extractor,$(TAR_SOURCE)) $(TAR_DL_DIR)/$(TAR_SOURCE) \
> +		| tar --strip-components=1 -xf -
>  endef
>  
>  HOST_TAR_CONF_OPTS = --without-selinux
> @@ -47,4 +43,13 @@ HOST_TAR_CONF_ENV = \
>  	CC="$(HOSTCC_NOCCACHE)" \
>  	CXX="$(HOSTCXX_NOCCACHE)"
>  
> +# host-tar is used to create the archives in the VCS download backends and tar
> +# 1.30 and forward have changed the archive format. So archives generated with
> +# earlier versions are not bit-for-bit reproducible and the hashes would not
> +# match. We add a patch that restores the origional format to host-tar.
> +define HOST_TAR_APPLY_PATCHES
> +	$(APPLY_PATCHES) $(@D) package/tar/host \*.patch
> +endef
> +HOST_TAR_POST_PATCH_HOOKS += HOST_TAR_APPLY_PATCHES
> +
>  $(eval $(host-autotools-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
