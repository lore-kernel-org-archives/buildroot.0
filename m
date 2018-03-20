From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Mar 2018 12:39:14 -0500
Subject: [Buildroot] [PATCH v5 1/1] gobject-introspection: new package
In-Reply-To: <20180318190131.21404-5-aduskett@gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
 <20180318190131.21404-5-aduskett@gmail.com>
Message-ID: <CANQCQparY42yn4WHD_7Ti3Sz9GTmwFQS1FfR40cUvYp7PmsBQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Sun, Mar 18, 2018 at 2:01 PM, Adam Duskett <aduskett@gmail.com> wrote:
>
> GObject introspection is a middleware layer between C
> libraries (using GObject) and language bindings. The C library
> can be scanned at compile time and generate a metadata file,
> in addition to the actual native C library. Then at runtime,
> language bindings can read this metadata and automatically
> provide bindings to call into the C library.
>
> There's an XML format called GIR used by GObject-Introspection.
> The purpose of it is to provide a standard structure to access the
> complete available API that a library or other unit of code exports.
> It is meant to be language agnostic using namespaces to separate
> core, language or library specific functionality.
>
> Cross-compiling gobject-introspection is not an easy task. The main
> issue is that in the process of creating the XML files,
> gobject-introspection must first run and scan the binary, which, if the
> binary is cross-compiled, would not typically be possible from the host
> system.
>
> Because of this limitation, several wrappers are used to call instead
> first out qemu which will then run the native scanner to create the
> binaries.

Wondering if anyone has a concern with the wrappers being relocatable?
 The use case would be a developer builds their own library and wants
to generate GIR using the SDK.

I believe it would just require the wrappers to use full paths so that
the support/misc/relocate-sdk.sh as part of "make sdk" can fixup the
wrappers.   However, the sdk make target and the relocate-sdk.sh would
need to be updated to handle fixing up the staging directory paths...
Unsure if the staging fixup would be a good thing though, as other
files in that folder may not like that (nothing else really should
have absolute paths, right? so maybe it's transparent).  Another
approach would be to make the wrappers relative pathed but that gets
tricky with HOST_DIR and STAGING_DIR having the option of being custom
locations and not in the same output folder.

> +
> +GOBJECT_INTROSPECTION_CONF_OPTS = \
> +       --enable-host-gi \
> +       --disable-static \
> +       --enable-gi-cross-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper \
> +       --enable-gi-ldd-wrapper=$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper \
> +       --disable-introspection-data
> +
> +ifeq ($(BR2_PACKAGE_CAIRO),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
> +endif
> +ifeq ($(BR2_PACKAGE_LIBFFI),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += libffi
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +GOBJECT_INTROSPECTION_DEPENDENCIES += python
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python
> +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python2"
> +else
> +GOBJECT_INTROSPECTION_DEPENDENCIES += python3
> +HOST_GOBJECT_INTROSPECTION_DEPENDENCIES += host-python3
> +GOBJECT_INTROSPECTION_PYTHON_PATH="$(STAGING_DIR)/usr/bin/python3"
> +endif
> +
> +# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
> +GOBJECT_INTROSPECTION_CONF_ENV = \
> +       GI_SCANNER_DISABLE_CACHE=1 \

Does the GI_SCANNER_DISABLE_CACHE stick if a SDK was relocated?
Assuming it's a default which is captured as part of the tool build.

Matt
