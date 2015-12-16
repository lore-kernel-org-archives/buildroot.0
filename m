From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Dec 2015 23:47:05 +0100
Subject: [Buildroot] [PATCH 04/13 v2] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <56714B61.8040308@lucaceresoli.net>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
 <56714B61.8040308@lucaceresoli.net>
Message-ID: <5671E9E9.4090705@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Luca Ceresoli wrote:
[...]
>> +# Download actual sources if they differ from the extracted sources
>> +# (e.g. for external toolchains)
>> +#
>> +# We need to provide PKG and PKGDIR, because there's no .stamp file for
>> +# the legal-info step.
>> +$(1)-legal-source:    PKG=$(2)
>> +$(1)-legal-source:    PKGDIR=$(pkgdir)
>> +$(1)-legal-source:
>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>> +    $$(call
>> DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
>> +endif # actuall sources != sources
>
> actuall sources -> actual source
>
>> +endif # actuall source != ""
>
> actuall -> actual
>
> With these fixed:
>   Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> [Tested with a minimal Sourcery ARM 2014.05 config]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Hey, NO! This patch is wrong.

It makes off-line legal-info work, and that's what I tested
successfully:

   $ make clean
   $ rm -fr dl/
   $ make source
   $ make legal-info (offline)

with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y

But it breaks online 'make legal-info' when _ACTUAL_SOURCES have not
yet been downloaded, i.e.:

   $ make clean
   $ rm -fr dl/
   $ make legal-info
   [...]
   cp: cannot stat 
'/home/murray/devel/buildroot/dl/arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2': 
No such file or directory

I think this is because you moved the downloading of _ACTUAL_SOURCE
from the $(1)-legal-info to $(1)-legal-source, and the former does not
depend on the latter.

Perhaps we just need this?

   $(1)-legal-info: $(1)-legal-source

Sorry for having missed this during my first review.

-- 
Luca
