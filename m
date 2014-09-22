From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 23 Sep 2014 00:27:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/gnupg2: configure script looks
 at the wrong stdint.h
In-Reply-To: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
References: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5420A26F.8010200@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 20/09/2014 22:07, Romain Naour a ?crit :
> The configure test "checking absolute name of <stdint.h>..." return
> the absolute path of a stdint.h file from the toolchain sources.
> 
> The contents of this file is completely different and obviously
> does not contain intmax_t definitions.
> 
> Use gl_cv_absolute_stdint_h to indicate the correct file that
> is in staging directory.
> 
> Fixes:
> http://autobuild.buildroot.net/results/92a/92af55396670685f12ed0ebcddfe2d082ed5aeb7/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/gnupg2/gnupg2.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 33b5bc0..1e3506a 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -17,7 +17,8 @@ GNUPG2_CONF_OPT = \
>  	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
>  	--with-libassuan-prefix=$(STAGING_DIR)/usr \
>  	--with-ksba-prefix=$(STAGING_DIR)/usr \
> -	--with-pth-prefix=$(STAGING_DIR)/usr
> +	--with-pth-prefix=$(STAGING_DIR)/usr \
> +	gl_cv_absolute_stdint_h=$(STAGING_DIR)/usr/include/stdint.h
>  
>  ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
>  define GNUPG2_REMOVE_GPGV2
> 

This is a weird bug...

The problem is in the configure script at line 14668:

      gl_cv_absolute_stdint_h=`(eval "$ac_cpp conftest.$ac_ext") 2>&5 |
sed -n '\#/stdint.h#{s#.*"\(.*/stdint.h\)".*#\1#;s#^/[^/]#//&#;p;q;}'`

Let's try to analyze the problem:

Here is the content of conftest.c:
cat conftest.c
#include <stdint.h>

The first part "$(eval $ac_cpp conftest.$ac_ext)" is the same as arm-linux-cpp conftest.c

Here is the stdout:
# 1 "conftest.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "conftest.c"
# 150 "conftest.c"
# 1 "/home/naourr/git/buildroot/test/gnupg/host/opt/ext-toolchain/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/include/stdint.h" 1 3 4
# 9 "/home/naourr/git/buildroot/test/gnupg/host/opt/ext-toolchain/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.3/include/stdint.h" 3 4
# 1 "/home/naourr/git/buildroot/test/gnupg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdint.h" 1 3 4
# 26 "/home/naourr/git/buildroot/test/gnupg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdint.h" 3 4
# 1 "/home/naourr/git/buildroot/test/gnupg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h" 1 3 4
# 187 "/home/naourr/git/buildroot/test/gnupg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/features.h" 3 4
# 1 "/home/naourr/git/buildroot/test/gnupg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_config.h" 1 3 4
[...]

Then, the output of arm-linux-cpp is filtered out with the sed command in order to keep the first line containing "stdint.h"

For now, I don't know why 4.8.3/include/stdint.h is listed by arm-linux-cpp and I don't understand entirely the sed command.

I tried to autoreconf the package to rebuild the configure script but without success.

After my investigation on this problem, I found these links:
http://lists.gnupg.org/pipermail/gnupg-devel/2013-December/028116.html
http://bugs.gnupg.org/gnupg/issue1547

To be continued...

Best regards,
Romain Naour
