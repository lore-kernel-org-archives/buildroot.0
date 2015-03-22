From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:58:12 +0100
Subject: [Buildroot] [PATCH 6/7] docs/manual: update documentation about
 <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1425147313-17380-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EE694.5030508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> This commit updates the Buildroot manual for the variables used to
> indicate where to download the source code from:
> 
>  - It updates the description of <pkg>_SOURCE to make it clear that
>    Buildroot assume that the tarball is hosted at <pkg>_SITE.
> 
>  - It updates the description of <pkg>_PATCH to indicate that not only
>    file names (assumed to be hosted at <pkg>_SITE) can be used, but
>    also full URLs. This allows to match with what the current code is
>    doing.
> 
>  - It updates the description of <pkg>_EXTRA_DOWNLOADS to also
>    indicate that full URLs are now accepted, following the change made
>    in the previous commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-generic.txt | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index e3029ed..2e46d55 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -204,18 +204,20 @@ information is (assuming the package name is +libfoo+) :
>      +LIBFOO_VERSION = cb9d6aa9429e838f0e54faa3d455bcbab5eef057+ +
>      +LIBFOO_VERSION = stable+
>  
> -* +LIBFOO_SOURCE+ may contain the name of the tarball of
> -  the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
> -  defaults to +LIBFOO_SOURCE+. If none are specified, then
> -  the value is assumed to be
> -  +libfoo-$(LIBFOO_VERSION).tar.gz+. +
> -  Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
> +* +LIBFOO_SOURCE+ may contain the name of the tarball of the package,
> +  which Buildroot will use to download the tarball from
> +  +LIBFOO_SITE+. If +HOST_LIBFOO_SOURCE+ is not specified, it defaults
> +  to +LIBFOO_SOURCE+. If none are specified, then the value is assumed
> +  to be +libfoo-$(LIBFOO_VERSION).tar.gz+. + Example: +LIBFOO_SOURCE =

 The + was there to mark a line split, so there should be a newline after the +.

 Otherwise, looks good to me.

 Regards,
 Arnout

> +  foobar-$(LIBFOO_VERSION).tar.bz2+
>  
>  * +LIBFOO_PATCH+ may contain a space-separated list of patch file
> -  names, that will be downloaded from the same location as the tarball
> -  indicated in +LIBFOO_SOURCE+, and then applied to the package source
> -  code. If +HOST_LIBFOO_PATCH+ is not specified, it defaults to
> -  +LIBFOO_PATCH+. Note that patches that are included in Buildroot
> +  names, that Buildroot will download and apply to the package source
> +  code. If an entry contains +://+, then Buildroot will assume it is a
> +  full URL and download the patch from this location. Otherwise,
> +  Buildroot will assume that the patch should be downloaded from
> +  +LIBFOO_SITE+. If +HOST_LIBFOO_PATCH+ is not specified, it defaults
> +  to +LIBFOO_PATCH+. Note that patches that are included in Buildroot
>    itself use a different mechanism: all files of the form
>    +<packagename>-*.patch+ present in the package directory inside
>    Buildroot will be applied to the package after extraction (see
> @@ -246,10 +248,12 @@ information is (assuming the package name is +libfoo+) :
>      +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
>      +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
>  
> -* +LIBFOO_EXTRA_DOWNLOADS+ lists a number of additional files that
> -  Buildroot should download from +LIBFOO_SITE+ in addition to the main
> -  +LIBFOO_SOURCE+ (which usually is a tarball). Buildroot will not do
> -  anything with those additional files, except download files: it will
> +* +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
> +  files that Buildroot should download. If an entry contains +://+
> +  then Buildroot will assume it is a complete URL and will download
> +  the file using this URL. Otherwise, Buildroot will assume the file
> +  to be downloaded is located at +LIBFOO_SITE+. Buildroot will not do
> +  anything with those additional files, except download them: it will
>    be up to the package recipe to use them from +$(BR2_DL_DIR)+.
>  
>  * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
