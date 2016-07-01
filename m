From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:22:38 +0200
Subject: [Buildroot] [PATCH v2 11/15] toolchain/toolchain-external: add
 libgfortran and libquadmath to the TOOLCHAIN_EXTERNAL_LIBS list
In-Reply-To: <20160701162920.19632-12-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-12-s.martin49@gmail.com>
Message-ID: <20160701232238.3d0f725c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:16 +0200, Samuel Martin wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
> +# fortran needs quadmath on x86 and x86_64
> +ifeq ($(BR2_I386)$(BR2_x86_64),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
> +endif
> +endif

OK. Then maybe on the internal toolchain backend side, we should keep
things simple for libquadmath:

 1/ Disable it when we know it's not supported (wchar missing)

 2/ Forcefully enable it when Fortran is enabled and we're on
    i386/x86_64

 3/ Copy it only when Fortran is enabled and i386/x86_64

Which is pretty much what you did originally I believe.

This way, only the people who care about Fortran support will have
libquadmath copied to their target. If in the future some other
non-Fortran related package needs libquadmath, we can revisit this at
this time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
