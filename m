From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Tue, 04 Aug 2015 11:42:58 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a copy of
 libiberty.a in host library dir
In-Reply-To: <55B64251.6010404@openwide.fr>
References: <1437039568-22957-1-git-send-email-viallard@syscom-instruments.com>
 <55B64251.6010404@openwide.fr>
Message-ID: <55C08922.4000600@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/2015 04:38 PM, Romain Naour wrote:
>
> The --disable-install-libiberty option was broken, that's why the internal
> libiberty.a was installed in HOST_DIR.
>
> Hopefully, the same patch apply on gcc-4.7:
> http://patchwork.ozlabs.org/patch/500445/
>
> Care to test it ?
>

Hi Romain,

I tested the above patch but it doesn't work. The library 'libiberty.a' 
is copied in 'output/host/usr/lib/'.

Maybe I missed somethings ?

I put the patch in the file 
'package/gcc/4.7.4/920-fix-disable-install-libiberty-option.patch' and 
add --disable-install-libiberty flag in HOST_GCC_COMMON_CONF_OPTS 
variable of the gcc package.

----
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index be242cb..c23fe40 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -93,7 +93,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
         --with-gmp=$(HOST_DIR)/usr \
         --with-mpfr=$(HOST_DIR)/usr \
         --with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-       --with-bugurl="http://bugs.buildroot.net/"
+       --with-bugurl="http://bugs.buildroot.net/" \
+       --disable-install-libiberty

  # Don't build documentation. It takes up extra space / build time,
  # and sometimes needs specific makeinfo versions to work
----

and did the following command:
$ rm -rf output && make

I see the flag --disable-install-libiberty in my log so it seems to be 
applied but the problem is always there.

Have you tried the patch on your side ?

Regards,
Anthony.
