From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 15:02:00 +0200
Subject: [Buildroot] [PATCH] nettle: fix ARM NEON build breakage
In-Reply-To: <1367670147-3436-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 4 May 2013 09:22:27 -0300")
References: <1367670147-3436-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mwsavqyf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Nettle's ARM NEON optimizations use some assembly constructs that aren't
 Gustavo> friendly with binutils < 2.21 and since we can't know for sure which
 Gustavo> binutils version we've got when using an external toolchain just disable
 Gustavo> NEON optimizations for now. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/3c6f91379f90d438b4da3dd330cf89e1dd746aaf/

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/nettle/nettle.mk | 9 ++-------
 Gustavo>  1 file changed, 2 insertions(+), 7 deletions(-)

 Gustavo> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
 Gustavo> index b3d2730..9405ff7 100644
 Gustavo> --- a/package/nettle/nettle.mk
 Gustavo> +++ b/package/nettle/nettle.mk
 Gustavo> @@ -4,19 +4,14 @@ NETTLE_DEPENDENCIES = gmp
 Gustavo>  NETTLE_INSTALL_STAGING = YES
 Gustavo>  NETTLE_LICENSE = LGPLv2.1+
 Gustavo>  NETTLE_LICENSE_FILES = COPYING.LIB
 Gustavo> +# NEON support breaks with binutils < 2.21
 Gustavo> +NETTLE_CONF_OPT = --disable-arm-neon
 
 Gustavo>  # ARM assembly requires v6+ ISA
 Gustavo>  ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
 Gustavo>  NETTLE_CONF_OPT += --disable-assembler
 Gustavo>  endif
 
 Gustavo> -# ARM NEON
 Gustavo> -ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 Gustavo> -NETTLE_CONF_OPT += --enable-arm-neon
 Gustavo> -else
 Gustavo> -NETTLE_CONF_OPT += --disable-arm-neon
 Gustavo> -endif

It's a pity we have to disable it for setups where we know it works
(E.G. internal toolchain with all other binutils versions than
2.20.1). Why not just change it to:

# NEON supports needs binutils 2.21+
ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_BINUTILS_VERSION_2_20_1),yy)
NETTLE_CONF_OPT += --enable-arm-neon
..

-- 
Bye, Peter Korsgaard
