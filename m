From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 9 Aug 2018 12:19:42 -0500
Subject: [Buildroot] [PATCH] core/legal-info: Add package dependencies
 with licenses to the manifest
In-Reply-To: <20180809170055.13334-1-sojkam1@fel.cvut.cz>
References: <20180809170055.13334-1-sojkam1@fel.cvut.cz>
Message-ID: <CANQCQpaDnvpfFUuHZGJFfM=s6n8NrGthOyay9f_WbJXJz5EMHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal,

On Thu, Aug 9, 2018 at 12:08 PM <sojkam1@fel.cvut.cz> wrote:
>
> From: Michal Sojka <michal.sojka@cvut.cz>
>
> This adds one column to the legal-info manifest table. It contains the
> dependencies of the given package and their licenses. This information
> is useful when assessing license compatibility of the packages and
> their libraries.
>
> An example of the content of the new column for the MPD package is
> shown below:
>
>     "alsa-lib (LGPL-2.1+ (library), GPL-2.0+ (aserver)),
>     boost (BSL-1.0), libid3tag (GPL-2.0+), libmad (GPL-2.0+),
>     libzlib (Zlib), skeleton-init-common (unknown),
>     skeleton-init-sysv (unknown),
>     toolchain-external-linaro-arm (unknown), "

This output is definitely good verbose data to look at for possible
licensing violations/inheritance.  Maybe it would be better show as a
part of the dependency graph?

>
> Signed-off-by: Michal Sojka <sojka@merica.cz>
> ---
>  Makefile               |  6 +++---
>  package/pkg-generic.mk |  2 +-
>  package/pkg-utils.mk   | 15 +++++++++++++--
>  3 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f79d39fd26..ba60a5a08f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -781,9 +781,9 @@ legal-info-clean:
>  legal-info-prepare: $(LEGAL_INFO_DIR)
>         @$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
>         @$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
> -       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
> -       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
> -       @$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
> +       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,TARGET)
> +       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,HOST)

I'd suggest not changing the existing format and append the new data
as a new field on the end.  Some people might have scripts using this
data which would be impacted by keeping the host/target field last and
inserting dependencies before it.

Matt
