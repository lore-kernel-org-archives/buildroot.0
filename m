From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Jan 2013 19:08:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/dvb-apps: requires iconv
In-Reply-To: <57bb7483b3bae28b6dfb63a4faf6b81346b161f4.1357672284.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 8 Jan 2013 20:11:51 +0100")
References: <cover.1357672284.git.yann.morin.1998@free.fr>
 <cover.1357672284.git.yann.morin.1998@free.fr>
 <57bb7483b3bae28b6dfb63a4faf6b81346b161f4.1357672284.git.yann.morin.1998@free.fr>
Message-ID: <87r4lr8udh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Use libiconv if the toolchain does not have locales.
 Yann> Fixes (for example):
 Yann>     http://autobuild.buildroot.net/results/c5776c95ac128f7c7eadc2fe746ad89f8c1ef49a

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> ---
 Yann>  package/dvb-apps/Config.in   |    1 +
 Yann>  package/dvb-apps/dvb-apps.mk |    3 ++-
 Yann>  2 files changed, 3 insertions(+), 1 deletions(-)

 Yann> diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
 Yann> index ca8dc54..7f76330 100644
 Yann> --- a/package/dvb-apps/Config.in
 Yann> +++ b/package/dvb-apps/Config.in
 Yann> @@ -14,6 +14,7 @@ comment "dvb-apps utils needs LARGEFILE support in the toolchain"
 Yann>  config BR2_PACKAGE_DVB_APPS_UTILS
 Yann>  	bool "dvb-apps utilities"
 Yann>  	depends on BR2_LARGEFILE
 Yann> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Yann>  	help
 Yann>  	  A small number of DVB test and utility programs,
 Yann>  	  including szap and dvbscan.
 Yann> diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
 Yann> index f914799..a1ad0c4 100644
 Yann> --- a/package/dvb-apps/dvb-apps.mk
 Yann> +++ b/package/dvb-apps/dvb-apps.mk
 Yann> @@ -20,10 +20,11 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
 
 Yann>  ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 Yann>  # Utilitiess are selected, build and install everything
 Yann> +DVB_APPS_DEPENDENCIES    = $(if $(BR2_ENABLE_LOCALE),,libiconv)
 Yann>  DVB_APPS_INSTALL_STAGING = YES
 
 Yann>  define DVB_APPS_BUILD_CMDS
 Yann> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) V=1
 Yann> +	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -liconv" $(MAKE) -C $(@D) V=1

Ehh, that's wrong. You should only link against libiconv if we've built
it.

Care to fix and resend?


-- 
Bye, Peter Korsgaard
