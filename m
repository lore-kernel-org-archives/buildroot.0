From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:15:48 +0200
Subject: [Buildroot] [PATCH 15/18] pkg-utils.mk: patch_sub_makefile
In-Reply-To: <20180820115519.24046-16-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-16-chrismcc@gmail.com>
Message-ID: <20180912231548.537ced1b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:16 -0700, Christopher McCrory wrote:
> suggested and written by Fran?ois
> Fix incorrectly generated Makefiles in subdirectories, usually perl
> packages.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

Fran?ois, you did not review/ack this patch. Could you have a look ?

I was wondering if there was really no way to pass these values through
the environment.

One comment below.

> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index c3acc22b17..7dbdb427a6 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -95,3 +95,19 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
>  	} && \
>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
>  endef
> +
> +# Used to fix makefiles in subdirectories, usually perl packages see 
> +# perl-template-toolkit and perl-xml-parser
> +# use: $(call patch_sub_makefile,$(@D)/xs/Makefile)
> +
> +define patch_sub_makefile
> +	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(1)
> +	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(1)
> +	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(1)
> +	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(1)
> +	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(1)
> +	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(1)
> +	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(1)
> +	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(1)
> +endef

To be more consistent with other package infrastructures, I think I'd
prefer a <pkg>_PATCH_XS_MAKEFILES variable that Perl packages can fill
in with the list of XS Makefiles that need to be patched.

So perhaps something like:

define PKG_PERL_PATCH_XS_MAKEFILE_HOOK

	... like you did, but using $($(PKG)_PATCH_XS_MAKEFILES)
endef

and then, in the inner-perl-package, do something like this:

ifneq ($$($(2)_PATCH_XS_MAKEFILES),)
$(2)_POST_PATCH_HOOKS += PKG_PERL_PATCH_XS_MAKEFILE_HOOK
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
