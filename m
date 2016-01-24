From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Jan 2016 01:45:58 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libsoil: fix build using old
 versions of patch
In-Reply-To: <1453593223-10558-2-git-send-email-ricardo.martincoski@gmail.com>
References: <1453593223-10558-1-git-send-email-ricardo.martincoski@gmail.com>
 <1453593223-10558-2-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <56A41EC6.1030904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-01-16 00:53, Ricardo Martincoski wrote:
> Well-formed patch fails to apply
> - patch v2.6:
> Hunk #1 FAILED at 1.
> Hunk #2 FAILED at 23.
> - patch v2.6.1:
> can't find file to patch at input line 11
> Perhaps you used the wrong -p or --strip option?
> [snap]
> No file to patch.  Skipping patch.
> 2 out of 2 hunks ignored
> Patch failed!  Please fix 0001-fix-makefile.patch!
> 
> Old versions of the tool "patch" cannot handle spaces in filenames.
> The same does not occur using "patch" v2.7 or any later.
> 
> Workaround: when a file with space in the name needs to be patched,
> one or two hooks must be used.
> A POST_EXTRACT hook renames the file to replace spaces with
> underscores.
> The patch file must be generated using diff between two source-trees
> that have the file renamed with spaces replaced by underscores.
> A POST_PATCH hook could rename the file to its original name if needed.

 My first reaction was: this is going to be too complicated. But now I see it,
it's not so bad.


 However, I have a few small comments.

> 
> Fixes:
> http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
> http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v1 -> v2:
>  - use 1 or 2 hooks to rename the file that contains spaces
>    (based on the suggestion to use a symlink from Thomas DS)
>  - change the patch file to be applied on the renamed file
>  - do not use the 2nd rename hook for libsoil (Thomas P)
> 
> Symlink and hard link cannot be used because patch unlinks them.
> So I renamed the file before patching it.
> 
> I used POST_EXTRACT instead of PRE_PATCH because some developer could
> use 'make package-extract', create a copy of the extracted directory,
> edit the needed files and then use diff to create the patch.

 You should always use package-patch before creating a patch for a package,
because you have to be sure that it still applies together with all other patches.

 That said, I think post extract is in this case a bit cleaner.

> 
> I hand-edited the patch, but it could also be generated following
> the procedure added to the manual by [PATCH v2 2/2]
> 
> I tested by inspection of the logs produced by:
> for V in 2.5 2.5.4 2.5.9 2.6 2.6.1 2.7 2.7.1 2.7.2 2.7.3 2.7.4 2.7.5 ; do \
>  rm -rf build/libsoil-20080707/ ; \
>  PATH=/home/ricardo/src/patch-$V:/home/ricardo/src/patch-$V/src:$PATH patch -v | tee loghook-$V ; \
>  PATH=/home/ricardo/src/patch-$V:/home/ricardo/src/patch-$V/src:$PATH make libsoil-patch 2>&1 | tee -a loghook-$V ; \
>  grep -H fPIC build/libsoil-20080707/projects/makefile/alternate* | tee -a loghook-$V ; \
>  echo '----------' ; \
> done
> ---
[snip]
> diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
> index eb8c2ce..9ef0498 100644
> --- a/package/libsoil/libsoil.mk
> +++ b/package/libsoil/libsoil.mk
> @@ -11,13 +11,19 @@ LIBSOIL_INSTALL_STAGING = YES
>  LIBSOIL_DEPENDENCIES = libgl
>  LIBSOIL_LICENSE = Public Domain, MIT
>  LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
> -LIBSOIL_MAKEFILE = "../projects/makefile/alternate Makefile.txt"
> +LIBSOIL_MAKEFILE = "../projects/makefile/alternate_Makefile.txt"

 The quotes could be removed now.

>  
>  define LIBSOIL_EXTRACT_CMDS
>  	$(UNZIP) -d $(@D) $(DL_DIR)/$(LIBSOIL_SOURCE)
>  	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
>  endef
>  
> +define REMOVE_SPACE_FROM_FILENAME
> +	cd $(@D)/projects/makefile/ && \
> +		mv alternate\ Makefile.txt alternate_Makefile.txt

 Here I would prefer quotes rather than backslash. It is not at all obvious that
make will not interpret the backslash.


 Regards,
 Arnout

> +endef
> +LIBSOIL_POST_EXTRACT_HOOKS += REMOVE_SPACE_FROM_FILENAME
> +
>  define LIBSOIL_BUILD_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
>  		-C $(@D)/src
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
