From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 12:01:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/protoc-gen-lua: new package
In-Reply-To: <1467291218-7710-2-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1467291218-7710-1-git-send-email-tiago.brusamarello@datacom.ind.br>
 <1467291218-7710-2-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <f0019837-550a-99eb-61ea-669503c92582@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tiago,

Le 30/06/2016 ? 14:53, Tiago Brusamarello a ?crit :
> This package adds support to compile Google's Protocol buffers
> for use with Lua scripts. This tool is needed to allow use of the
> 'protobuf-lua' package.
> 
> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
> ---
>  package/Config.in                        |  1 +
>  package/protoc-gen-lua/Config.in         |  6 ++++++
>  package/protoc-gen-lua/protoc-gen-lua.mk | 19 +++++++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/protoc-gen-lua/Config.in
>  create mode 100644 package/protoc-gen-lua/protoc-gen-lua.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e5ddc3e..715f8ab 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1299,6 +1299,7 @@ endif
>  	source "package/poco/Config.in"
>  	source "package/protobuf/Config.in"
>  	source "package/protobuf-c/Config.in"
> +	source "package/protoc-gen-lua/Config.in"

protoc-gen-lua is a host package, so it mustn't be listed here.

>  	source "package/qhull/Config.in"
>  	source "package/qlibc/Config.in"
>  	source "package/startup-notification/Config.in"
> diff --git a/package/protoc-gen-lua/Config.in b/package/protoc-gen-lua/Config.in
> new file mode 100644
> index 0000000..9c71216
> --- /dev/null
> +++ b/package/protoc-gen-lua/Config.in

For the same reason, Config.in must be removed.
Config.in is intended for target packages only.

> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PROTOC_GEN_LUA
> +	bool "protoc-gen-lua"
> +	help
> +		Code generator plugin to use Protocol Buffers from Lua scripts
> +
> +		https://github.com/djungelorm/protobuf-lua
> diff --git a/package/protoc-gen-lua/protoc-gen-lua.mk b/package/protoc-gen-lua/protoc-gen-lua.mk
> new file mode 100644
> index 0000000..315f581
> --- /dev/null
> +++ b/package/protoc-gen-lua/protoc-gen-lua.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# protoc-gen-lua
> +#
> +################################################################################
> +
> +PROTOC_GEN_LUA_VERSION = v1.1.1
> +PROTOC_GEN_LUA_SITE = $(call github,djungelorm,protobuf-lua,$(PROTOC_GEN_LUA_VERSION))
> +PROTOC_GEN_LUA_DEPENDENCIES = host-python-protobuf
> +PROTOC_GEN_LUA_LICENSE = BSD-3c
> +PROTOC_GEN_LUA_LICENSE_FILES = LICENSE
> +
> +define HOST_PROTOC_GEN_LUA_INSTALL_CMDS
> +	# install protoc Lua plugin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/plugin_pb2.py $(HOST_DIR)/usr/bin
> +	$(INSTALL) -m 0755 $(@D)/protoc-plugin/protoc-gen-lua $(HOST_DIR)/usr/bin
> +endef
> +
> +$(eval $(host-generic-package))
> \ No newline at end of file

Please add a new line here.

Also, provide a hash file.

Best regards,
Romain


> 
