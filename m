From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:42:56 +0100
Subject: [Buildroot] [PATCH] package/collectd: Specify correct FP layout
 for PowerPC
In-Reply-To: <20171031003539.919-1-andrew.smirnov@gmail.com>
References: <20171031003539.919-1-andrew.smirnov@gmail.com>
Message-ID: <20171101104256.4da2b465@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 17:35:39 -0700, Andrey Smirnov wrote:
> PowerPC stores floating point as big endian, so, in order for
> 'network' plugin to work correctly (and potentially any user of
> htond() in collectd's codebase), --with-fp-layout=endianflip as
> opposed to --with-fp-layout=nothing needs to be specified during
> configuration phase.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/collectd/collectd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 626fba81bf..80791b618d 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -24,9 +24,15 @@ COLLECTD_PLUGINS_DISABLE = \
>  
>  COLLECTD_CONF_ENV += LIBS="-lm"
>  
> +ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
> +COLLECTD_FP_LAYOUT=endianflip
> +else
> +COLLECTD_FP_LAYOUT=nothing
> +endif

I am not sure that the problem is PowerPC vs. rest of the world, but
rather big endian vs. little endian. For example, OpenWRT is using
endianflip on all big endian platforms, and "nothing" on all little
endian platforms:
https://dev.openwrt.org/browser/packages/utils/collectd/Makefile?rev=28960.

So I believe the correct patch is to use:

ifeq ($(BR2_ENDIAN),"BIG")
COLLECTD_FP_LAYOUT = endianflip
else
COLLECTD_FP_LAYOUT = normal
endif

However, there is a third FP layout called "intswap", and I'm not sure
in which situations it should be used. Some additional investigation of
collectd configure.ac script is probably needed to understand the
AC_RUN_IFELSE() tests it does to figure out what the FP layout is when
doing a native build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
