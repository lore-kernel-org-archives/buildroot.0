From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:54:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.29
In-Reply-To: <20170408151713.11047-1-bernd.kuhls@t-online.de>
References: <20170408151713.11047-1-bernd.kuhls@t-online.de>
Message-ID: <20170409155442.1be46375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 17:17:13 +0200, Bernd Kuhls wrote:

> +	$(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no) \
> +	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-powerpc-vsx=api,--enable-powerpc-vsx=no) \

Is "api" really the value that we want? configure.ac says:

   [case "$enableval" in
      no|off)
         # disable the default enabling on __ppc64__ systems:
         AC_DEFINE([PNG_POWERPC_VSX_OPT], [0],
                   [Disable POWERPC VSX optimizations])
         # Prevent inclusion of the platform specific files below:
         enable_powerpc_vsx=no;;
      check)
         AC_DEFINE([PNG_POWERPC_VSX_CHECK_SUPPORTED], [],
                   [Check for POWERPC VSX support at run-time])
         AC_MSG_WARN([--enable-powerpc-vsx Please check contrib/powerpc/README file]
            [for the list of supported OSes.]);;
      api)
         AC_DEFINE([PNG_POWERPC_VSX_API_SUPPORTED], [],
                   [Turn on POWERPC VSX optimizations at run-time]);;
      yes|on)
         AC_DEFINE([PNG_POWERPC_VSX_OPT], [2],
                   [Enable POWERPC VSX optimizations])
         AC_MSG_WARN([--enable-powerpc-vsx: please specify 'check' or 'api', if]
            [you want the optimizations unconditionally pass '-maltivec -mvsx']
            [or '-mcpu=power8'to the compiler.]);;

So in the context of Buildroot, a value of "yes" would be more logical,
of course if the PPC processor has VSX instructions. Should we have
another BR2_<foo> Config.in option for VSX ?

It would be nice to use --enable-<foo> / --disable-<foo> instead of
--enable-foo=yes / --enable-foo=no. I know there's an existing instance
of that of libpng.mk, but it would be good to clean it up in a
preparation patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
