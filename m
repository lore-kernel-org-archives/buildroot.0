From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 00:48:27 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56CB9E4B.20004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/16 17:01, Gustavo Zacarias wrote:
> vala/valac can use gir and vapi data files installed by other packages,
> but since these are normally installed to staging and host-vala looks
> for them in the host directory (logically) this leads to failure.
> So wrap them to call the real tool and add this information via
> command-line parameters to them.
> 
> This is required for libgee-granite vala-in-vala bindings.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/vala/vala-wrapper |  2 ++
>  package/vala/vala.mk      | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 package/vala/vala-wrapper
> 
> diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
> new file mode 100644
> index 0000000..ea0bd09
> --- /dev/null
> +++ b/package/vala/vala-wrapper
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +$0- at VALA_VERSION@ --vapidir=@STAGING_DIR@/usr/share/vala/vapi --girdir=@STAGING_DIR@/usr/share/gir-1.0 $@

 This makes it non-relocatable. Instead, just use the ${STAGING_DIR} that is
passed in the environment. That means you can't use vala/c outside of buildroot,
but I don't think that's an issue, right?

> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index 56d4db3..5267f68 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -16,4 +16,22 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
>  # available".
>  HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
>  
> +# We wrap vala & valac to point to the proper gir and vapi data dirs
> +# Otherwise we'll get host directory data which isn't enough
> +define HOST_VALA_INSTALL_WRAPPER
> +	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +		$(HOST_DIR)/usr/bin/valac
> +	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
> +		$(HOST_DIR)/usr/bin/valac

 I would handle vala and valac in a singel SED line.

 Regards,
 Arnout

> +	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
> +		$(HOST_DIR)/usr/bin/valac
> +endef
> +HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
> +
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
