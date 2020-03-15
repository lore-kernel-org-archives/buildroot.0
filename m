From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:02:01 +0100
Subject: [Buildroot] [PATCH 1/3 v6] package/gobject-introspection: fix
 host-linking
In-Reply-To: <ccda32dbb7d04471b987c0b8bed21a2b2c7544ed.1584286382.git.yann.morin.1998@free.fr>
References: <cover.1584286382.git.yann.morin.1998@free.fr>
 <ccda32dbb7d04471b987c0b8bed21a2b2c7544ed.1584286382.git.yann.morin.1998@free.fr>
Message-ID: <20200315220201.60ffcbc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Mar 2020 16:33:19 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> -# Disable introspection data on the host, as it is not needed and
> -# the package will attempt to use the systems libglib2 which will fail
> -# if the systems libglib2 version is older than 2.60.
> -HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
> -	-Dbuild_introspection_data=false
> +# When building, gobject-introspection uses tools/g-ir-scanner to build several
> +# .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> +# links to the system-installed libglib2 path. To remedy this issue, defining
> +# LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> +HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"

So there's really no other way? No way to convince this thing to use
-Wl,-rpath,$(HOST_DIR)/lib when building host binaries ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
