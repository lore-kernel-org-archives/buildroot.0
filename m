From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 21:38:52 +0100
Subject: [Buildroot] [PATCH] Allow selection of individual Liberation
	font sets
In-Reply-To: <1354496791-13337-1-git-send-email-cdhmanning@gmail.com> (Charles
 Manning's message of "Mon, 3 Dec 2012 14:06:31 +1300")
References: <1354496791-13337-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <87a9sbqz37.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Manning <cdhmanning@gmail.com> writes:

 Charles> We don't always want all the font sets on small systems.

Committed with minor changes, see below.

 Charles> Signed-off-by: Charles Manning <cdhmanning@gmail.com>
 Charles> ---
 Charles>  package/liberation/Config.in     |   26 ++++++++++++++++++++++++++
 Charles>  package/liberation/liberation.mk |   28 +++++++++++++++++++++++++++-
 Charles>  2 files changed, 53 insertions(+), 1 deletions(-)

 Charles> diff --git a/package/liberation/Config.in b/package/liberation/Config.in
 Charles> index 48d4195..11be2b5 100644
 Charles> --- a/package/liberation/Config.in
 Charles> +++ b/package/liberation/Config.in
 Charles> @@ -5,3 +5,29 @@ config BR2_PACKAGE_LIBERATION
 Charles>  	  three most commonly used fonts on Microsoft systems:
 Charles>  	  Times New Roman, Arial, and Courier New.
 
 Charles> +config BR2_PACKAGE_LIBERATION_SELECT_ALL
 Charles> +	bool "Select all Liberation fonts"
 Charles> +	depends on BR2_PACKAGE_LIBERATION
 Charles> +	default y
 Charles> +	help
 Charles> +	  Select all Liberation fonts. Otherwise elect individual fonts
 Charles> +

I've dropped this option as people can just enable all 3 suboptions (and
I default them to y to keep existing configs working).

 Charles> +if !BR2_PACKAGE_LIBERATION_SELECT_ALL
 Charles> +
 Charles> +menu "Individual Liberation Fonts"
 Charles> +
 Charles> +config BR2_PACKAGE_LIBERATION_SELECT_MONO
 Charles> +	bool "Liberation Mono fonts"
 Charles> +	default n

The Kconfig names and description are quite long, so I changed these to
be:

config BR2_PACKAGE_LIBERATION_MONO
       bool "mono fonts"
       default y

 Charles> +
 Charles> +config BR2_PACKAGE_LIBERATION_SELECT_SANS
 Charles> +	bool "Liberation Sans fonts"
 Charles> +	depends on !BR2_PACKAGE_LIBERATION_SELECT_ALL
 Charles> +	default n
 Charles> +
 Charles> +config BR2_PACKAGE_LIBERATION_SELECT_SERIF
 Charles> +	bool "Liberation Serif fonts"
 Charles> +	default n
 Charles> +endmenu
 Charles> +
 Charles> +endif
 Charles> diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
 Charles> index 7d55650..277d426 100644
 Charles> --- a/package/liberation/liberation.mk
 Charles> +++ b/package/liberation/liberation.mk
 Charles> @@ -9,9 +9,35 @@ LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
 Charles>  LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 
 Charles> +ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_ALL),y)
 Charles> +BR2_PACKAGE_LIBERATION_SELECT_MONO = y
 Charles> +BR2_PACKAGE_LIBERATION_SELECT_SANS = y
 Charles> +BR2_PACKAGE_LIBERATION_SELECT_SERIF = y
 Charles> +endif

BR2_* variables should be considered readonly in the .mk files and not
changed here.

 Charles> +
 Charles> +ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_MONO),y)
 Charles> +define LIBERATION_INSTALL_MONO
 Charles> +	$(INSTALL) -m 644 $(@D)/LiberationMono*.ttf $(LIBERATION_TARGET_DIR)
 Charles> +endef
 Charles> +endif
 Charles> +
 Charles> +ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_SANS),y)
 Charles> +define LIBERATION_INSTALL_SANS
 Charles> +	$(INSTALL) -m 644 $(@D)/LiberationSans*.ttf $(LIBERATION_TARGET_DIR)
 Charles> +endef
 Charles> +endif
 Charles> +
 Charles> +ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_SERIF),y)
 Charles> +define LIBERATION_INSTALL_SERIF
 Charles> +	$(INSTALL) -m 644 $(@D)/LiberationSerif*.ttf $(LIBERATION_TARGET_DIR)
 Charles> +endef
 Charles> +endif
 Charles> +
 Charles>  define LIBERATION_INSTALL_TARGET_CMDS
 Charles> +	$(LIBERATION_INSTALL_MONO)
 Charles> +	$(LIBERATION_INSTALL_SANS)
 Charles> +	$(LIBERATION_INSTALL_SERIF)
 Charles>  	mkdir -p $(LIBERATION_TARGET_DIR)
 Charles> -	$(INSTALL) -m 644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)

The mkdir should go before the installs.

-- 
Bye, Peter Korsgaard
