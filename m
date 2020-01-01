From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 10:14:53 +0100
Subject: [Buildroot] [PATCH v2] package/apitrace: fix build failure due
 to gcc bug 68485 and 85180
In-Reply-To: <20191231195922.127164-1-giulio.benetti@benettiengineering.com>
References: <20191231180851.7d079afb@windsurf>
 <20191231195922.127164-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200101091453.GF3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2019-12-31 20:59 +0100, Giulio Benetti spake thusly:
> The apitrace package exhibits gcc bug 68485 when built for the
> Microblaze architecture with optimization enabled, which causes a build
> failure. This is mainly due to 3rd party brotli embedded in apitrace
> that already has been fixed in Buildroot as single package. After
> working around this bug overriding -O0 to CFLAGS(Brotli is a C program),
> gcc bug 81580 showed off while compiling C++ files.
> 
> So, as done for other packages in Buildroot, work around this gcc bug by
> setting optimization to -O0(in CFLAGS) if
> BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y. And do the same(but in CXXFLAGS) if
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y as already done for other packages.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a46/a46626cc50f07f41d831614306f556d346d31429/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, with a slight reorganising of the code Thanks!

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * Added comments into apitrace.mk
> * Improved commit log
> ---
>  package/apitrace/apitrace.mk | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
> index e6f8a2b1c5..2b74ba26df 100644
> --- a/package/apitrace/apitrace.mk
> +++ b/package/apitrace/apitrace.mk
> @@ -21,4 +21,22 @@ endif
>  # Gui was never tested, so we prefer to explicitly disable it
>  APITRACE_CONF_OPTS += -DENABLE_GUI=false
>  
> +APITRACE_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +# This works around embedded Brotli build failure
> +APITRACE_CFLAGS += -O0
> +endif
> +
> +APITRACE_CONF_OPTS += -DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)"
> +
> +APITRACE_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +# This works around Apitrace itself build failure
> +APITRACE_CXXFLAGS += -O0
> +endif
> +
> +APITRACE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"
> +
>  $(eval $(cmake-package))
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
