From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 6 Mar 2015 08:53:23 +0100
Subject: [Buildroot] [PATCH v2] lmbench: fix build with libtirpc
In-Reply-To: <7760c8e2eb6de04f4acc5b4fd348cb35216bc2b7.1425615675.git.baruch@tkos.co.il>
References: <7760c8e2eb6de04f4acc5b4fd348cb35216bc2b7.1425615675.git.baruch@tkos.co.il>
Message-ID: <CAHkwnC9QDdr1k00RcbS6Mu=JAn_6Ka2HxU_g9kFL9T+0Yx4Mhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 6, 2015 at 5:21 AM, Baruch Siach <baruch@tkos.co.il> wrote:
<snip>
> +
> +-LDLIBS=-lm
> ++LDLIBS="${LDLIBS} -lm"

Because we already do that for CFLAGS, instead of adding a patch just use sed:

 define LMBENCH_CONFIGURE_CMDS
        $(call CONFIG_UPDATE,$(@D))
        sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
+       sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
        sed -i '/cd .*doc/d' $(@D)/src/Makefile
        sed -i '/include/d' $(@D)/src/Makefile
        touch $@
 endef


> + # check for HP-UX's ANSI compiler
> + echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
> diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
> index 59e750c5892f..224ec6983a66 100644
> --- a/package/lmbench/lmbench.mk
> +++ b/package/lmbench/lmbench.mk
> @@ -11,12 +11,11 @@ LMBENCH_LICENSE = lmbench license (based on GPLv2)
>  LMBENCH_LICENSE_FILES = COPYING COPYING-2
>
>  LMBENCH_CFLAGS = $(TARGET_CFLAGS)
> -LMBENCH_LDLIBS = $(TARGET_LDFLAGS)

Why you don't want to use the TARGET_LDFLAGS variable anymore? This
change is not needed to fix this build failure.

BR
-- 
Fabio Porcedda
