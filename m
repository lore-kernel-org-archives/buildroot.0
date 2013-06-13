From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Jun 2013 08:08:10 +0200
Subject: [Buildroot] [PATCH] freetype: fix includedir
In-Reply-To: <1371094112-7523-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371094112-7523-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <51B961CA.6080405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/06/13 05:28, Gustavo Zacarias wrote:
> Set includedir to point to staging because freetype-config and
> freetype2.pc otherwise point to /usr/include causing all kind of havoc
> because it expands configure --prefix now instead of using the
> .pc/-config one.

  I think this is the wrong fix.

  The FREETYPE_CONFIG_SCRIPTS approach doesn't work in this case because 
this script doesn't use ${prefix} in front of it's includedir. I think 
the better fix is to use a custom POST_INSTALL_STAGING_HOOK that sets 
SYSROOT=$(STAGING_DIR) at the beginning of the script.

  The .pc file should be handled by our modified pkg-config.

  Regards,
  Arnout

>
> Fixes:
> http://autobuild.buildroot.net/results/1c7/1c70ce0ff350623cc38baf4b8b61c8a7a8586aba/
> ...and many others.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/freetype/freetype.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index 16f00fe..4ea678b 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -9,6 +9,7 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>   FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
>   FREETYPE_INSTALL_STAGING = YES
>   FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
> +FREETYPE_CONF_OPT = --includedir="$(STAGING_DIR)/usr/include"
>   FREETYPE_LICENSE = Dual FTL/GPLv2+
>   FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
>   FREETYPE_DEPENDENCIES = host-pkgconf \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
