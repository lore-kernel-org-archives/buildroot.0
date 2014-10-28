From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 22:39:18 +0100
Subject: [Buildroot] [PATCH] unzip: Use the "-q" option to silence
 unzipping of source files
In-Reply-To: <1414489391-8707-1-git-send-email-fabio.porcedda@gmail.com>
References: <1414489391-8707-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <54500D06.3020005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/14 10:43, Fabio Porcedda wrote:
> Add and use the "UNZIP" variable instead of calling directly unzip
> because the variable contains the "-q" option to silence "unzip" so it
> doesn't show the list of files extracted just like when tar files are
> being unpacked.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  boot/at91bootstrap/at91bootstrap.mk            | 2 +-
>  package/Makefile.in                            | 1 +
>  package/espeak/espeak.mk                       | 2 +-
>  package/explorercanvas/explorercanvas.mk       | 2 +-
>  package/gtest/gtest.mk                         | 2 +-
>  package/jquery-mobile/jquery-mobile.mk         | 2 +-
>  package/jquery-ui-themes/jquery-ui-themes.mk   | 2 +-
>  package/jquery-ui/jquery-ui.mk                 | 2 +-
>  package/jquery-validation/jquery-validation.mk | 2 +-
>  package/libjson/libjson.mk                     | 2 +-
>  package/opentyrian-data/opentyrian-data.mk     | 2 +-
>  package/python-keyring/python-keyring.mk       | 2 +-
>  package/rapidjson/rapidjson.mk                 | 2 +-
>  package/sam-ba/sam-ba.mk                       | 2 +-
>  package/urg/urg.mk                             | 2 +-
>  package/zxing/zxing.mk                         | 2 +-
>  16 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
> index e3f9dc0..0c10296 100644
> --- a/boot/at91bootstrap/at91bootstrap.mk
> +++ b/boot/at91bootstrap/at91bootstrap.mk
> @@ -17,7 +17,7 @@ AT91BOOTSTRAP_INSTALL_IMAGES = YES
>  AT91BOOTSTRAP_INSTALL_TARGET = NO
>  
>  define AT91BOOTSTRAP_EXTRACT_CMDS
> -	unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
> +	$(UNZIP) $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
>  	mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
>  	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
>  endef
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ff2ee2d..c655bd4 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -221,6 +221,7 @@ INSTALL := $(shell which install || type -p install)
>  FLEX := $(shell which flex || type -p flex)
>  BISON := $(shell which bison || type -p bison)
>  SED := $(shell which sed || type -p sed) -i -e
> +UNZIP := $(shell which unzip || type -p unzip) -qd

 -qd doesn't look right - the -d option should be followed with the directory in
which to extract. In some places you replaced "unzip -d" with "$(UNZIP)", in
other places it was "unzip .... -d ..." which you replaced with "$(UNZIP) ....
-d ...".

 I'm not in favour of splitting options like this. So I'd remove the -d from UNZIP.


>  
>  APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
>  
> diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
> index 9a83d4f..6991034 100644
> --- a/package/espeak/espeak.mk
> +++ b/package/espeak/espeak.mk
> @@ -21,7 +21,7 @@ ESPEAK_DEPENDENCIES = pulseaudio
>  endif
>  
>  define ESPEAK_EXTRACT_CMDS
> -	unzip -d $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)
> +	$(UNZIP) $(@D) $(DL_DIR)/$(ESPEAK_SOURCE)

 Here's an example where it's split.

>  	mv $(@D)/espeak-$(ESPEAK_VERSION)-source/* $(@D)
>  	$(RM) -r $(@D)/espeak-$(ESPEAK_VERSION)-source
>  endef
> diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
> index e45621b..7665af9 100644
> --- a/package/explorercanvas/explorercanvas.mk
> +++ b/package/explorercanvas/explorercanvas.mk
> @@ -11,7 +11,7 @@ EXPLORERCANVAS_LICENSE = Apache-2.0
>  EXPLORERCANVAS_LICENSE_FILES = COPYING
>  
>  define EXPLORERCANVAS_EXTRACT_CMDS
> -	unzip -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
> +	$(UNZIP) $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
>  endef
>  
>  define EXPLORERCANVAS_INSTALL_TARGET_CMDS
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 6a95350..3f3e889 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -22,7 +22,7 @@ GTEST_LICENSE_FILES = LICENSE
>  GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
>  
>  define GTEST_EXTRACT_CMDS
> -	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
> +	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)

 Here's an example where the second -d is still present.


 Regards,
 Arnout


>  endef
>  
>  define GTEST_INSTALL_STAGING_CMDS
> diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
> index 3a634ed..8bf92b0 100644
> --- a/package/jquery-mobile/jquery-mobile.mk
> +++ b/package/jquery-mobile/jquery-mobile.mk
> @@ -10,7 +10,7 @@ JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
>  JQUERY_MOBILE_LICENSE = MIT
>  
>  define JQUERY_MOBILE_EXTRACT_CMDS
> -	unzip -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
> +	$(UNZIP) $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
>  endef
>  
>  JQUERY_MOBILE_INSTALLED_FILES = \

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
