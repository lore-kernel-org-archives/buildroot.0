From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Dec 2015 12:30:41 +0100
Subject: [Buildroot] [PATCH 04/13 v2] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <56714B61.8040308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Almost all packages which are saved for legal-info have their source
> archives downloaded as part of 'make source', which makes an off-line
> build completely possible [0].
>
> However, for the pre-configured external toolchains, the source tarball
> is different, as the main tarball is a binary package. And that source
> tarball is only downloaded during the legal-info phase, which makes it
> inconvenient for full off-line builds.
>
> We fix that in two steps:
>
>    - first, we move the declaration of _ACTUAL_SOURCE_TARBALL and _SITE
>      earlier in the pkg-generic.mk file, so we get those definitions at
>      the time we define the -source and -all-source rules;
>
>    - second, we add a new rule, $(1)-legal-source which only
>      $(1)-all-source depends on, so that we only download it for a
>      top-level 'make source', not as part of the standard download
>      mechanism (i.e. only what is really needed to build).
>
> This way, we can do a complete [0] off-line build and are still able to
> generate legal-info, while at the same time we do not incur any download
> overhead during a simple build.
>
> Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
> not empty. However, since _ACTUAL_SOURCE_TARBALL default to the value of
> _SOURCE, it can not be empty when _SOURCE is not. Thus, we'd get a
> spurious report of a missing hash for the tarball, since it was not in
> a standard package rule (configure, build, install..) and thus would
> miss the PKG and PKGDIR variables to find the .hash file.
>
> We fix that in this commit as well, by:
>
>    - setting PKG and PKGDIR just for the -legal-source rule;
>
>    - only downloading _ACTUAL_SOURCE_TARBALL if it is not empty *and* not
>      the same as _SOURCE (to avoid a second report about the hash).
>
> [0] Save for nodejs which invarriably wants to download stuff at build
> time. Sigh... :-( Fixing that is work for another time...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>

Thanks for the very detailed commit log message. It's very useful!

Just a couple of minor notes below.

[...]
> +# Download actual sources if they differ from the extracted sources
> +# (e.g. for external toolchains)
> +#
> +# We need to provide PKG and PKGDIR, because there's no .stamp file for
> +# the legal-info step.
> +$(1)-legal-source:	PKG=$(2)
> +$(1)-legal-source:	PKGDIR=$(pkgdir)
> +$(1)-legal-source:
> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> +	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> +endif # actuall sources != sources

actuall sources -> actual source

> +endif # actuall source != ""

actuall -> actual

With these fixed:
  Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

[Tested with a minimal Sourcery ARM 2014.05 config]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
