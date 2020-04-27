From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 27 Apr 2020 21:45:09 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/environment-setup: new
 package
In-Reply-To: <96aada93-1fbf-19c5-ad8e-e293b121468a@bitdefender.com>
References: <20200425124836.122729-1-angelo@amarulasolutions.com>
 <96aada93-1fbf-19c5-ad8e-e293b121468a@bitdefender.com>
Message-ID: <CA+TH9V=-7jwQSQvoLoAwNvDe4OtHf9N442FHW=HGBX78a4CivA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mircea,

Il giorno lun 27 apr 2020 alle ore 18:22 Mircea GLIGA
<mgliga@bitdefender.com> ha scritto:
>
> Angelo, All
>
> I have some ideas to improve the environment script.
> In order to keep project/team specific customization outside of
> Buildroot, we can add a new configuration variable e.g.
> `BR2_ENVIRONMENT_SETUP_FILE_SNIPPET`.
> We can use this to specify an external, additional file, which adds
> further customizations, e.g. PS1, could be others too
> And right at the end of `ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS`, add
> the contents of that file:
>
> `cat BR2_ENVIRONMENT_SETUP_FILE_SNIPPET >> $(ENVIRONMENT_SETUP_FILE)`
>
> If this new config value is empty, we only have the original version of
> the environment-setup file.

I wouldn't really like to overengineer things like that. I mean, every
company that needs heavy customization of this script could either
generate it from scratch in a post-build script or mangling the
environment-setup installed one.

This script should serve people that don't really need to know the
internals and should be a simple plain good starting point.

If the PS1 thing is so bothering we can remove it, but I strongly
disagree. I want to stress out that is not intended to be a fancy
thing, it only serves the purpose to make it obvious that the user is
not running a normal his normal shell. For this reason, I see
perfectly reasonable to have a different PS1.

> Also, I've added cleanup code(see below) to the variables inside the
> `environment-setup` script:
>
> * take advantage of the fact that we've updated the PATH, so don't use
> absolute paths
> * long absolute paths makes verbose builds difficult to read/follow
> * use the CROSS_COMPILE variable in the definition of AR, CC, etc
>
> This results in a more compact/readable code.
>
> All the best,
> Mircea
>
>
> diff --git a/package/environment-setup/environment-setup.mk
> b/package/environment-setup/environment-setup.mk
> index fc74594459..b057c4fa34 100644
> --- a/package/environment-setup/environment-setup.mk
> +++ b/package/environment-setup/environment-setup.mk
> @@ -5,14 +5,16 @@
>
> ################################################################################
>
>   ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
> +ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP =
> 's+$(TARGET_CROSS)+\$${CROSS_COMPILE}+g'
> +ENVIRONMENT_SETUP_PATH_SED_EXP = 's+$(HOST_DIR)/bin/++g'
>   ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'
>
>   define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
>         cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
> +       printf "export \"CROSS_COMPILE=$(GNU_TARGET_NAME)-\"\n" >>
> $(ENVIRONMENT_SETUP_FILE)
>         for var in $(TARGET_CONFIGURE_OPTS); do \
>                 printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
>         done
> -       printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >>
> $(ENVIRONMENT_SETUP_FILE)
>         printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
>                 --host=$(GNU_TARGET_NAME) \
>                 --build=$(GNU_HOST_NAME) \
> @@ -21,7 +23,7 @@ define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
>                 --sysconfdir=/etc \
>                 --localstatedir=/var \
>                 --program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> -       $(SED) $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
> +       $(SED) $(ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP) -e
> $(ENVIRONMENT_SETUP_PATH_SED_EXP) -e
> $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
>         printf
> "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$
> \"\n" \
>                 >> $(ENVIRONMENT_SETUP_FILE)
>   endef

Good suggestions, will do.


--
Profile: http://it.linkedin.com/in/compagnucciangelo
