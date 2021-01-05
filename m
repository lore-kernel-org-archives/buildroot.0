From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 23:27:16 +0100
Subject: [Buildroot] [PATCH] package/open62541: new package
In-Reply-To: <1579212339-5234-1-git-send-email-yann.cardaillac@smile.fr>
References: <1579212339-5234-1-git-send-email-yann.cardaillac@smile.fr>
Message-ID: <20210105232716.559eca71@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jan 2020 23:05:39 +0100
Yann CARDAILLAC <yann.cardaillac@smile.fr> wrote:

> From: Yann CARDAILLAC <ycardaillac@sepro-group.com>
> 
> Signed-off-by: Yann CARDAILLAC <ycardaillac@sepro-group.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Your patch was about to be one year old, so it was time to act and
apply it, which is now done, with a number of changes. See below.

> ---
>  package/Config.in                |  1 +
>  package/open62541/Config.in      | 62 ++++++++++++++++++++++++++++++++
>  package/open62541/open62541.hash |  3 ++
>  package/open62541/open62541.mk   | 57 +++++++++++++++++++++++++++++
>  4 files changed, 123 insertions(+)

I've added an entry in the DEVELOPERS file.
> diff --git a/package/Config.in b/package/Config.in
> index 4c94914680..748446f3b4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -499,6 +499,7 @@ endmenu
>  	source "package/ofono/Config.in"
>  	source "package/on2-8170-modules/Config.in"
>  	source "package/open2300/Config.in"
> +	source "package/open62541/Config.in"

You added it in the Hardware section, I believe it belongs better to
the Networking libraries part, so I moved it there.

> +if BR2_PACKAGE_OPEN62541
> +
> +choice
> +	prompt "choose UA_NAMESPACE_ZERO"

Changed to:

+       prompt "namespace zero nodes"

and added a help text:

+       help
+         Namespace zero contains the standard-defined nodes. The full
+         namespace zero may not be required for all applications.

> +
> +config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_NONE
> +	bool "NONE"
> +	help
> +	  Don't set the UA_NAMESPACE_ZERO.

Changed to:

+config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_DEFAULT
+       bool "default"
+       help
+         Use the default namespace zero contents.


> +
> +config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL
> +	bool "MINIMAL"

Changed to lower case.

> +	help
> +	  A barebones namespace zero that is compatible with most
> +	  clients.  But this namespace 0 is so small that it does
> +	  not pass the CTT
> +	  (Conformance Testing Tools of the OPC Foundation).
> +
> +config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED
> +	bool "REDUCED"

Changed to lower case.

> +	help
> +	  Small namespace zero that passes the CTT.
> +
> +config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
> +	bool "FULL"

Changed to lower case.

> +	help
> +	  Full namespace zero generated from the official XML
> +	  definitions.
> +
> +endchoice
> +
> +menu "Advanced build options"
> +
> +config BR2_PACKAGE_OPEN62541_JSON_ENCODING
> +	bool "json encoding"
> +
> +config BR2_PACKAGE_OPEN62541_PUBSUB
> +	bool "publish/subscribe"

I've added a help text.

> +config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
> +	bool "publish/subscribe deltaframes"

I've added a help text.

> +config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
> +	bool "publish/subscribe informationmodel"
> +	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
> +	select BR2_PACKAGE_OPEN62541_PUBSUB

Dropped this select, and instead moved the pubsub options in a if
BR2_PACKAGE_OPEN62541_PUBSUB ... endif block. Also added a help text.

> +config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
> +	bool "publish/subscribe informationmodel methods"
> +	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
> +	select BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL

I dropped this option, because it's not even documented in the
open62541 manual, so I couldn't add some reasonable help text. We can
always re-add it later if you submit a patch with more details.

> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> new file mode 100644
> index 0000000000..b3d2eb7dd5
> --- /dev/null
> +++ b/package/open62541/open62541.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# open62541
> +#
> +################################################################################
> +
> +OPEN62541_VERSION = v1.0

Changed to:

+OPEN62541_VERSION = 1.0
+OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)

so that the _VERSION variable doesn't have the "v" prefix.

> +OPEN62541_SITE_METHOD = git
> +OPEN62541_SITE = git://github.com/open62541/open62541.git
> +OPEN62541_GIT_SUBMODULES = YES
> +OPEN62541_INSTALL_STAGING = YES
> +OPEN62541_LICENSE = MPL-2.0
> +OPEN62541_LICENSE_FILES = LICENSE
> +
> +# Don't use git discribe to get the version number.
> +OPEN62541_CONF_OPTS += -DGIT_EXECUTABLE=NO \
> +	-DOPEN62541_VERSION=$(OPEN62541_VERSION)

Changed to:

+# Don't use git describe to get the version number.
+# Disable hardening options to let Buildroot handle it.
+OPEN62541_CONF_OPTS = \
+       -DGIT_EXECUTABLE=NO \
+       -DOPEN62541_VERSION=$(OPEN62541_VERSION) \
+       -DUA_ENABLE_HARDENING=OFF

i.e: fix the typo on discribe -> describe, replace += by =, and daded
the UA_ENABLE_HARDENING=OFF option as suggested by Romain.

> +ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
> +OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
> +else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
> +OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
> +else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
> +OPEN62541_CONF_OPTS +=  -DUA_NAMESPACE_ZERO=FULL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=ON
> +else
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB),y)
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB=ON
> +else
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES),y)
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=ON
> +else
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_DELTAFRAMES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL),y)
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=ON
> +else
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS),y)
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
> +else
> +OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=OFF
> +endif

Dropped this last chunk, as I dropped the option.

Also, added a patch suggested by Heiko that removes the need for a C++
compiler.

Do not hesitate to have a look at
https://git.buildroot.org/buildroot/commit/?id=b36ea68b5ad0f89ffd92cac3f91654e180683b1c
for the final result. If there are build failures in the next days,
you'll receive an e-mail about such build failures.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
