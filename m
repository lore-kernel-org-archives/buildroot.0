From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 16:49:12 +0100
Subject: [Buildroot] [PATCH] package/zeromq: fix build failure due to
 binutils bug 21464
In-Reply-To: <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
References: <20210314223616.5bfcc62f@windsurf.home>
 <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
Message-ID: <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/17/21 4:45 PM, Giulio Benetti wrote:
> The zeromq package exhibits binutils bug 21464 when built for the Nios2
> architecture with optimization enabled, which causes a build failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/zeromq/zeromq.mk | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
> index 182699403c..135b07b6c6 100644
> --- a/package/zeromq/zeromq.mk
> +++ b/package/zeromq/zeromq.mk
> @@ -23,12 +23,20 @@ ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
>   	libzmq_cv_tcp_keepidle=yes \
>   	libzmq_cv_tcp_keepintvl=yes
>   
> +ZEROMQ_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
>   # Internal error, aborting at dwarf2cfi.c:2752 in connect_traces
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
>   ifeq ($(BR2_m68k_cf),y)
> -ZEROMQ_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-defer-pop"
> +ZEROMQ_CXXFLAGS += -fno-defer-pop
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464),y)
> +ZEROMQ_CXXFLAGS += -O0
>   endif
>   
> +ZEROMQ_CONF_OPTS += CXXFLAGS="$(ZEROMQ_CXXFLAGS)"
> +
>   # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
>   # for the rest of the build as well (which automatically includes stdc++).
>   ifeq ($(BR2_STATIC_LIBS),y)
> 

this patch works around binutils bug 21464 for this package.
The other packages affected by binutils bug 21464 seem affected by 
another bug instead and at the moment can't be worked around, I'll try 
to find a possible work around.

-- 
Giulio Benetti
Benetti Engineering sas
