From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:26:20 +0200
Subject: [Buildroot] [PATCH 1/1] nfs-utils: bump to version 2.3.3
In-Reply-To: <20180915190119.18189-1-fontaine.fabrice@gmail.com>
References: <20180915190119.18189-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916152620.74dc2aa2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for working on this update! Did you do some runtime testing to
verify that NFS works as expected after this update ? See more
comments/questions below.

On Sat, 15 Sep 2018 21:01:19 +0200, Fabrice Fontaine wrote:

> diff --git a/package/nfs-utils/0005-nfs-utils-2.3.2-no-werror.patch b/package/nfs-utils/0005-nfs-utils-2.3.2-no-werror.patch
> new file mode 100644
> index 0000000000..60cf1d2d08
> --- /dev/null
> +++ b/package/nfs-utils/0005-nfs-utils-2.3.2-no-werror.patch
> @@ -0,0 +1,56 @@
> +https://bugs.gentoo.org/656984
> +
> +Don't build with -Werror flags.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from: https://gitweb.gentoo.org/repo/gentoo.git/plain/net-fs/nfs-utils/files/nfs-utils-2.3.2-no-werror.patch]

Do we really need this patch? Does it work to do
CFLAGS="$(TARGET_CFLAGS) -Wno-error" instead ?

If we really need this patch, then:

 - It should preferably be in a form that is upstream-acceptable, i.e
   with an option to enable/disable werror.

 - It should be Git-formatted, because upstream uses Git.

> diff --git a/package/nfs-utils/0006-fix-usage-of-with-rpcgen-internal.patch b/package/nfs-utils/0006-fix-usage-of-with-rpcgen-internal.patch
> new file mode 100644
> index 0000000000..7e733e0995
> --- /dev/null
> +++ b/package/nfs-utils/0006-fix-usage-of-with-rpcgen-internal.patch
> @@ -0,0 +1,34 @@
> +From cc9a9b1a724b8da7fb0834824bb0e69ff4611a3c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 15 Sep 2018 20:55:12 +0200
> +Subject: [PATCH] fix usage of --with-rpcgen=internal
> +
> +Since commit
> +http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=fd5ccdc449a0ef79498191aecb3e44120e813618,
> +internal rpcgen can't be used anymore since RPCGEN_PATH is set to empty
> +and is not updated if rpcgen_path is equal to internal.
> +
> +To fix this, change the default value of RPCGEN_PATH from empty to
> +internal
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index e82ff14..60f8431 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -149,7 +149,7 @@ AC_ARG_WITH(rpcgen,
> + 	[AC_HELP_STRING([--with-rpcgen=internal], [use internal rpcgen instead of system one])],
> + 	rpcgen_path=$withval,
> + 	rpcgen_path=yes )
> +-	RPCGEN_PATH=
> ++	RPCGEN_PATH="internal"
> + 	if test "$rpcgen_path" = "yes"; then
> + 	    for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
> + 	    do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done

I am wondering if it wouldn't be better to do this:


 148 AC_ARG_WITH(rpcgen,
 149         [AC_HELP_STRING([--with-rpcgen=internal], [use internal rpcgen instead of system one])],
 150         rpcgen_path=$withval,
 151         rpcgen_path=yes )
 152         RPCGEN_PATH=
 153         if test "$rpcgen_path" = "yes"; then
 154             for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
 155             do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
-156         elif test "$rpcgen_path" != "internal"; then
+156         elif test "$rpcgen_path" != "no"; then
 157             RPCGEN_PATH=$rpcgen_path
 158         fi
 159         AC_SUBST(RPCGEN_PATH)
 160         AM_CONDITIONAL(CONFIG_RPCGEN, [test "$RPCGEN_PATH" = "internal"])

Make sure to send this patch upstream also :)

In addition, it would be nice to submit all our patches upstream, to reduce
the backlog of patches we have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
