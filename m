From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 08:19:26 +0100
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c:new package
In-Reply-To: <1447412958-25453-1-git-send-email-joris.lijssens@gmail.com>
References: <1447412958-25453-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <5649837E.1040609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joris,

On 13-11-15 12:09, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in                  |  1 +
>  package/rabbitmq-c/Config.in       |  9 +++++++++
>  package/rabbitmq-c/rabbitmq-c.hash |  2 ++
>  package/rabbitmq-c/rabbitmq-c.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/rabbitmq-c/Config.in
>  create mode 100644 package/rabbitmq-c/rabbitmq-c.hash
>  create mode 100644 package/rabbitmq-c/rabbitmq-c.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0a80afb..7092be4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1058,6 +1058,7 @@ menu "Networking"
>  	source "package/ortp/Config.in"
>  	source "package/qdecoder/Config.in"
>  	source "package/qpid-proton/Config.in"
> +	source "package/rabbitmq-c/Config.in"
>  	source "package/rtmpdump/Config.in"
>  	source "package/slirp/Config.in"
>  	source "package/snmppp/Config.in"
> diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
> new file mode 100644
> index 0000000..55ce93d
> --- /dev/null
> +++ b/package/rabbitmq-c/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_RABBITMQ_C
> +	bool "rabbitmq-c"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  This is a C-language AMQP client library for use with v2.0+ of 
> +	  the RabbitMQ broker.
> +
> +

 Redundant empty line.

> +	  https://github.com/alanxz/rabbitmq-c
> diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
> new file mode 100644
> index 0000000..9f7d071
> --- /dev/null
> +++ b/package/rabbitmq-c/rabbitmq-c.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 0b9b81d05b3e629c3449521690de400fe4539a8ba1feacadcbd6e9a50c8a4625 rabbitmq-c-v0.7.1.tar.gz
> diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
> new file mode 100644
> index 0000000..cd81ddf
> --- /dev/null
> +++ b/package/rabbitmq-c/rabbitmq-c.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# rabbitmq-c
> +#
> +################################################################################
> +
> +RABBITMQ_C_VERSION = v0.7.1
> +RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))

 I believe that there is a maintainer upload:

https://github.com/alanxz/rabbitmq-c/releases/download/v0.7.1/rabbitmq-c-0.7.1.tar.gz

 We prefer to use that one.

> +RABBITMQ_C_LICENSE = MIT
> +RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
> +RABBITMQ_C_INSTALL_STAGING = YES
> +RABBITMQ_C_DEPENDENCIES = openssl

 I would add -DDO_DOCS=OFF -DBUILD_API_DOCS to _CONF_OPTS otherwise doxygen will
be called when it exists on the host (needlessly increasing build time).

 The tools are only built when the popt library is found. I don't know how large
and how useful the tools are, but we probably want a config option to enable
them and then add popt to dependencies and -DBUILD_TOOLS=ON to _CONF_OPTS.

 It looks like openssl is optional (at least there is a cmake option
-DENABLE_SSL_SUPPORT=OFF to disable it).


 Regards,
 Arnout


> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
