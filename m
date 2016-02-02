From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 22:57:41 +0100
Subject: [Buildroot] [RFC 1/1] e2fsprogs: support findfs
In-Reply-To: <1454446924-10368-1-git-send-email-james.knight@rockwellcollins.com>
References: <1454446924-10368-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <56B12655.8000105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-02-16 22:02, James Knight wrote:
> The following adjusts e2fsprogs's configure to force the enablement of
> CONFIG_BUILD_FINDFS. The current support for e2fsprogs's findfs is not
> complete; while the findfs symbolic link to e2label is made, e2label
> does not handle the `findfs` argument. By ensuring the
> CONFIG_BUILD_FINDFS flag is set, e2label is built with findfs support.
> Since e2fsprogs already requires libblkid, the build should not be an
> issue; however, using this option prevent a developer from restricting
> findfs-related code in e2label (see alternative below).
> 
> Note that the `--disable-libblkid` configuration argument must remain
> to prevent conflicts with util-linux's libblkid and an e2fsprogs-
> generated variant (see e1ffc2f791b336339909c90559b7db40b455f172).
> 
> An alternative to this approach would be to remove any e2fsprogs's
> findfs references from Buildroot and add the findfs utility to
> util-linux (since the package provides a findfs utility as well).

 Ideally, both should be done :-)


> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> Cc: Zheng Yi <yzheng@techyauld.com>
> ---
>  package/e2fsprogs/0002-support-findfs.patch | 11 +++++++++++
>  package/e2fsprogs/e2fsprogs.mk              |  3 +++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/e2fsprogs/0002-support-findfs.patch
> 
> diff --git a/package/e2fsprogs/0002-support-findfs.patch b/package/e2fsprogs/0002-support-findfs.patch
> new file mode 100644
> index 0000000..4e125fa
> --- /dev/null
> +++ b/package/e2fsprogs/0002-support-findfs.patch
> @@ -0,0 +1,11 @@

 The patch is missing a commit message.

 Did you send it upstream?

> +diff -Naur a/configure.in b/configure.in
> +--- a/configure.in	2016-02-02 15:03:02.440059366 -0500
> ++++ b/configure.in	2016-02-02 15:03:38.265404484 -0500
> +@@ -533,6 +533,7 @@
> + 		[AC_MSG_ERROR([external blkid library not found])], -luuid)
> + 	BLKID_CMT=#
> + 	PROFILED_LIBBLKID=$LIBBLKID
> ++	AC_DEFINE(CONFIG_BUILD_FINDFS, 1)

 Hm, it would be weird if this were allowed... If you add this,
CONFIG_BUILD_FINDFS will be defined if --disable-libblkid was given. if
--enable-libblkid was given, and if nothing is given. So the whole point of the
option is moot. That doesn't sound right...

 Can you check that with upstream, or consult their logs when the option was
introduced?

 Regards,
 Arnout

> + 	AC_MSG_RESULT([Disabling private blkid library])
> + else
> + 	LIBBLKID='$(LIB)/libblkid'$LIB_EXT
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 4b81b44..d16edde 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -12,6 +12,9 @@ E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h l
>  E2FSPROGS_INSTALL_STAGING = YES
>  E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
>  
> +# 0002-support-findfs.patch
> +E2FSPROGS_AUTORECONF = YES
> +
>  # e4defrag doesn't build on older systems like RHEL5.x, and we don't
>  # need it on the host anyway.
>  HOST_E2FSPROGS_CONF_OPTS += --disable-defrag
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
