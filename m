From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 12:47:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/rtai: add license
In-Reply-To: <20191124093446.1023544-1-fontaine.fabrice@gmail.com>
References: <20191124093446.1023544-1-fontaine.fabrice@gmail.com>
Message-ID: <20191124114732.GG32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

Thanks for looking into all those missing licensing terms. That's much
appreciated. :-)

On 2019-11-24 10:34 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rtai/rtai.hash | 1 +
>  package/rtai/rtai.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
> index f0afafbd7c..1a3e97559b 100644
> --- a/package/rtai/rtai.hash
> +++ b/package/rtai/rtai.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
>  sha256 13669da744a0ba411bdb8e47fa47b6e19171646ae42c8dbb2735d12e555fb1a3 rtai-4.0.1.tar.bz2
> +sha256 3590a0b20d24116a646bfefb0cd5abf5fdbc43c22f66df190d83aeb085beb169 rtai-lab/scilab5/RTAI/license.txt
> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> index 90f2cc4c8d..d6450c5550 100644
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -7,6 +7,8 @@
>  RTAI_VERSION = 4.0.1
>  RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
>  RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
> +RTAI_LICENSE = GPL-2.0+
> +RTAI_LICENSE_FILES = rtai-lab/scilab5/RTAI/license.txt 

You are referring to a license file in the rtai-lab/ sub-directory, but
we explicitly disable building of rtai-lab altogether with
--disable-rtailab:
    https://git.buildroot.org/buildroot/tree/package/rtai/rtai.mk#n27

And the GNUMakefile.am will not include the rtai-lab/ subdirectory
when --disable-rtailab is used:

    if CONFIG_RTAI_LAB
    OPTDIRS += rtai-lab
    endif

So this is probably not the correct license file we should be using.

The 'addons' subdir is conditional to CONFIG_RTAI_DRIVERS_SERIAL or
CONFIG_RTAI_DRIVERS_16550A or CONFIG_RTAI_CPLUSPLUS or
CONFIG_RTAI_COMEDI_LXRT or CONFIG_RTAI_RTDM, and they all default to
'no' if not explicitly enabled, and we do not explicitly enable any of
those.

So, it seems only the 'base' subdir is used. And in that subdir, we can
find a few files which bear a "GNU Lesser General Public License" notice
too.

So, the licensing terms are a bit more complicated than what this patch
suggestes.

Could you review this more in depth, and provide a commit log that
explains all the resultant licenses and license files, please?

Regards,
Yann E. MORIN.

>  RTAI_INSTALL_STAGING = YES
>  
>  # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
> -- 
> 2.24.0
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
