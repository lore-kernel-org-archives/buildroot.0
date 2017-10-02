From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:07:31 +0200
Subject: [Buildroot] [PATCH] flex: rework patches to avoid host/target
 difference
In-Reply-To: <20170929172041.1530-1-yann.morin.1998@free.fr>
References: <20170929172041.1530-1-yann.morin.1998@free.fr>
Message-ID: <20171002210731.2b0f6f60@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Sep 2017 19:20:41 +0200, Yann E. MORIN wrote:

> To solve this, we introduce a --disable-program configure option,
> through a patch to the flex configure.ac and Makefile.am. This patch
> makes the current 0001-flex-disable-documentation.patch no longer
> needed. However, since we autoreconfigure the package, we need to
> touch flex.1 to avoid flex from trying to regenerate it (flex.1 has a
> dependency on configure.ac, so if configure.ac is newer than flex.1,
> it regenerates the latter).

So you say we need to "touch flex.1", but we in fact don't do it, and
two paragraphs later you explain why. I guess this commit log needs to
be adjusted a bit.

> Also, since the target flex only installs a static library, we do not
> install the package to TARGET_DIR anymore, only the staging
> installation is done.
> 
> Finally, building the documentation is a PITA, and it depends on
> configure.ac and a few other files generated during the build.

"it depends on configure.ac" is not very clear.

> Touching flex.1 does not work, because autmake will forcibly remove the files

autmake -> automake

> when its prerequisites are too old, but will not gemnerate it.

gemnerate -> generate.


> -# 0001-flex-disable-documentation.patch
> +# 0001-build-make-it-possible-to-disable-the-build-of-the-f.patch
>  # 0002-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch

This commit is no longer accurate with the name of the patches, 0002 is
a different patch, and the previous 0002 is now 0003.

>  FLEX_AUTORECONF = YES
>  FLEX_GETTEXTIZE = YES
> -FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
> +FLEX_CONF_ENV = \
> +	ac_cv_path_M4=/usr/bin/m4 \
>  	ac_cv_func_reallocarray=no

Spurious unrelated change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
