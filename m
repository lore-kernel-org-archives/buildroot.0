From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Sep 2017 23:23:09 +0200
Subject: [Buildroot] [PATCH 1/9] dumb-init: new package
In-Reply-To: <20170920030210.19446-2-christian@paral.in>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-2-christian@paral.in>
Message-ID: <afa4f137-1ef8-6257-64ca-5ffc4b0f4d6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 05:02, Christian Stewart wrote:
> dumb-init is a minimal init process to act as PID 1 for containers.
> 
> dumb-init can be used to satisfy docker-engine's docker-init binary
> requirement.
> 
> In many cases docker-init backing processes like dumb-init must be static, as
> they are executed inside a container in an unknown environment.

 I really don't understand this requirement. The container is supposed to
contain this dumb-init executable as well as the rest of the Buildroot-generated
filesystem, right? So all required libs + dynamic loader will be there. Why does
it need to be static, then? Is it going to be executed outside of the container?

 For docker-client, I can understand, because there the point is that
docker-engine runs outside of the container while within the container you have
some other OS, and docker-client is supposed to run inside the container as well.

 So please improve your explanation :-) Also, add it to the help text, so that
the user gets an idea why they would want to enable the option.

> This
> patch includes an option to specifically compile dumb-init statically, even if
> the system is compiled dynamically.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

[snip]
> diff --git a/package/dumb-init/Config.in b/package/dumb-init/Config.in
> new file mode 100644
> index 0000000000..aaad119a15
> --- /dev/null
> +++ b/package/dumb-init/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_DUMB_INIT
> +	bool "dumb-init"
> +	help
> +	  dumb-init is a simple but valid init binary to
> +	  act as PID 1 for containers.

 Please wrap at 72 columns, not less.

> +
> +	  https://github.com/Yelp/dumb-init
> +
> +if BR2_PACKAGE_DUMB_INIT
> +
> +config BR2_PACKAGE_DUMB_INIT_STATIC
> +	bool "build static"
> +	help
> +	  Enables static compilation for dumb-init.
> +
> +endif
> diff --git a/package/dumb-init/dumb-init.hash b/package/dumb-init/dumb-init.hash
> new file mode 100644
> index 0000000000..4705ce4368
> --- /dev/null
> +++ b/package/dumb-init/dumb-init.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	v1.2.0.tar.gz
> diff --git a/package/dumb-init/dumb-init.mk b/package/dumb-init/dumb-init.mk
> new file mode 100644
> index 0000000000..cc24ffafa1
> --- /dev/null
> +++ b/package/dumb-init/dumb-init.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# dumb-init
> +#
> +################################################################################
> +
> +DUMB_INIT_VERSION = v1.2.0
> +DUMB_INIT_SITE = https://github.com/Yelp/dumb-init/archive
> +DUMB_INIT_SOURCE = $(DUMB_INIT_VERSION).tar.gz
> +DUMB_INIT_LICENSE = MIT
> +DUMB_INIT_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PACKAGE_DUMB_INIT_STATIC),y)
> +DUMB_INIT_CFLAGS += -static
> +endif
> +
> +define DUMB_INIT_BUILD_CMDS
> +	$(TARGET_CC) \
> +		$(DUMB_INIT_CFLAGS) \

 You also have to pass TARGET_CFLAGS and TARGET_LDFLAGS. Probably the easiest is
to collect those in DUMB_INIT_CFLAGS as well. Well, that's assuming you don't
remove that option :-)

 Regards,
 Arnout

> +		-o $(@D)/dumb-init $(@D)/dumb-init.c
> +endef
> +
> +define DUMB_INIT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/dumb-init $(TARGET_DIR)/usr/bin/dumb-init
> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
