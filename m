From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Sep 2016 00:48:58 +0200
Subject: [Buildroot] [PATCH v2 1/2] pahomqtt-c: new package
In-Reply-To: <1474881160-30450-1-git-send-email-Pranit.Sirsat@imgtec.com>
References: <1474881160-30450-1-git-send-email-Pranit.Sirsat@imgtec.com>
Message-ID: <401acd7b-ca31-6e39-0ab2-e2fa60daf17d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Pranit,

 Thank you for this contribution. I have a few remarks. Could you fix and resubmit?


On 26-09-16 11:12, Pranit Tanaji Sirsat wrote:
> mqtt client c library
> 
> Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Signed-off-by: Pranit Tanaji Sirsat <Pranit.Sirsat@imgtec.com>
> 
> ---
> Changes v1 -> v2:
>   - remove updates to DEVELOPERS file (suggested by Baruch Siach)
> ---
>  package/Config.in                  |  1 +
>  package/pahomqtt-c/Config.in       | 11 +++++++++++
>  package/pahomqtt-c/pahomqtt-c.hash |  2 ++
>  package/pahomqtt-c/pahomqtt-c.mk   | 18 ++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/pahomqtt-c/Config.in
>  create mode 100644 package/pahomqtt-c/pahomqtt-c.hash
>  create mode 100644 package/pahomqtt-c/pahomqtt-c.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ca6c15..c0d92ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1239,6 +1239,7 @@ menu "Networking"
>  	source "package/openpgm/Config.in"
>  	source "package/openzwave/Config.in"
>  	source "package/ortp/Config.in"
> +	source "package/pahomqtt-c/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
>  	source "package/rabbitmq-c/Config.in"
> diff --git a/package/pahomqtt-c/Config.in b/package/pahomqtt-c/Config.in
> new file mode 100644
> index 0000000..53ccef2
> --- /dev/null
> +++ b/package/pahomqtt-c/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PAHOMQTT_C
> +	bool "pahomqtt-c"
> +	depends on !BR2_STATIC_LIBS  # dlopen()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  MQTT client C library
> +
> +	  https://eclipse.org/paho/clients/c/
> +
> +comment "pahomqtt-c needs a toolchain w/ threads and dynamic library support"
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/pahomqtt-c/pahomqtt-c.hash b/package/pahomqtt-c/pahomqtt-c.hash
> new file mode 100644
> index 0000000..4bd1e5c
> --- /dev/null
> +++ b/package/pahomqtt-c/pahomqtt-c.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  970b9621efc24251441d386274cd0a90cf6ad52b64031f3c8cb53fdd5526f5f3  pahomqtt-c-v1.1.0.tar.gz
> diff --git a/package/pahomqtt-c/pahomqtt-c.mk b/package/pahomqtt-c/pahomqtt-c.mk
> new file mode 100644
> index 0000000..2a533d1
> --- /dev/null
> +++ b/package/pahomqtt-c/pahomqtt-c.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# pahomqtt-c
> +#
> +################################################################################
> +
> +PAHOMQTT_C_VERSION = v1.1.0
> +PAHOMQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHOMQTT_C_VERSION))

 Since upstream calls it paho.mqtt.c but we don't want . in package names, I
would call the package paho-mqtt-c.

> +PAHOMQTT_C_LICENSE = EPLv1.0, EDLv1.0

 Although we already have two packages that use this convention, we really
should follow the SPDX convention, so EPL-1.0. Also, EDLv1.0 is just BSD-3c
(cfr. [1]). And finally, as I understand it, the intention is that the code can
be distributed either under EPL or under EDL. So in my opinion it should be:

PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3c

> +PAHOMQTT_C_LICENSE_FILES = epl-v10 edl-v10
> +PAHOMQTT_C_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +PAHOMQTT_C_DEPENDENCIES = openssl
> +PAHOMQTT_C_CONF_OPTS = -DPAHO_WITH_SSL=TRUE

 Add an explicit -DPAHO_WITH_SSL=FALSE in the else branch.

 Also, I think it would be good to add a global -DPAHO_BUILD_DOCUMENTATION=FALSE
and -DPAHO_BUILD_SAMPLES=FALSE. But those are already the default so maybe not
needed.

 Regards,
 Arnout


> +endif
> +
> +$(eval $(cmake-package))
> 

[1] http://spdx-legal.spdx.narkive.com/wmb1FKZ8/new-license-request#post2
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
