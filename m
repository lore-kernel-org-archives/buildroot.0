From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Feb 2011 22:47:34 +0100
Subject: [Buildroot] [PATCH 02/13] util-linux: convert to autotargets
	and bump to 2.18
In-Reply-To: <1294431182-27793-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 7 Jan 2011 17:12:51 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bp2kkhhl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 Gustavo> +++ b/package/util-linux/Config.in
 Gustavo> @@ -1,8 +1,12 @@
 Gustavo> -config BR2_PACKAGE_UTIL-LINUX
 Gustavo> +config BR2_PACKAGE_UTIL_LINUX
 Gustavo>  	bool "util-linux"
 Gustavo>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 Gustavo>  	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 Gustavo> -	depends on BR2_INET_RPC
 Gustavo> +	select BR2_PACKAGE_E2FSPROGS if BR2_LARGEFILE
 Gustavo> +	select BR2_PACKAGE_E2FSPROGS_LIBBLKID if BR2_LARGEFILE
 Gustavo> +	select BR2_PACKAGE_E2FSPROGS_LIBUUID if BR2_LARGEFILE
 Gustavo> +	depends on BR2_PROGRAM_INVOCATION
 Gustavo> +	depends on BR2_USE_WCHAR
 Gustavo>  	help
 Gustavo>  	  Various useful/essential Linux utilities.

I think it would be good to mention to the user that he's not getting
mount+fsck if he doesn't enable LARGEFILE, E.G.:

+comment "mount and fsck requires a toolchain with LARGEFILE support"
+       depends on BR2_PACKAGE_UTIL_LINUX && !BR2_LARGEFILE
 
 Gustavo> +++ b/package/util-linux/util-linux.mk
 Gustavo> @@ -3,100 +3,50 @@

It unfortunately doesn't build here if I enable largefile support. It
dies with:

make[8]: *** No rule to make target `-luuid', needed by `libblkid.la'.  Stop.
make[8]: *** Waiting for unfinished jobs....
  CC     crc32.lo
  CC     md5.lo
make[7]: *** [all-recursive] Error 1
make[6]: *** [../../../shlibs/blkid/src/libblkid.la] Error 2

It also seems like we always need host-pkg-config as a dep.

Could you take a look at it?

-- 
Bye, Peter Korsgaard
