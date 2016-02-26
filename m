From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 00:43:40 +0100
Subject: [Buildroot] [v3,
 3/4] barebox: user selection of build output images
In-Reply-To: <1453329821-3167-4-git-send-email-pieter@boesman.nl>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-4-git-send-email-pieter@boesman.nl>
Message-ID: <56D0E32C.3050207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/16 23:43, Pieter Smith wrote:
> A non-default image can be selected as the barebox build output in the images/
> directory. This typically is needed to select the appropriate image generated
> by multi-platform support defconfigs (E.g. am335x).
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/Config.in              | 36 ++++++++++++++++++++++++++++++++++++
>  boot/barebox/barebox-1/barebox-1.mk | 13 +++++++++++--
>  boot/barebox/barebox-2/barebox-2.mk |  7 +++++++
>  3 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index f848afe..fe76f8a 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -149,6 +149,24 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
>  	  A space-separated list of configuration fragment files,
>  	  that will be merged to the main Barebox configuration file.
>  
> +choice
> +	prompt "Barebox image file"
> +	default BR2_TARGET_BAREBOX_USE_DEFAULT_IMAGE
> +
> +config BR2_TARGET_BAREBOX_USE_DEFAULT_IMAGE
> +	bool "Using the default image file"
> +
> +config BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
> +	bool "Using a specific image file"
> +
> +endchoice
> +
> +config BR2_TARGET_BAREBOX_IMAGE_FILE
> +	string "Image file path"
> +	depends on BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
> +	help
> +	  Name of the built barebox image file in the barebox images directory
> +
>  endif

 If we deprecate barebox pre-2012.10, then we can simplify this a lot:

config BR2_TARGET_BAREBOX_IMAGE_FILE
	string "Image file path"
	default "barebox-flash-image"
	help
	  Name of the built barebox image file in the barebox images directory


 Even if we don't want to deprecate barebox pre-2012.10, I'd prefer to keep this
simple config and do the handling of legacy barebox.bin in the .mk file. For
pre-2012.10, you'd have to explicitly set it to barebox.bin instead (which
should be mentioned in the help text then).

 We should find a good way to deal with the images/ part of the path, however.
This could e.g. be done in the .mk file, by checking both the top dir and the
images dir.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
