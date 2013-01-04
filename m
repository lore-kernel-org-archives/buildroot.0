From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 22:45:04 +0100
Subject: [Buildroot] [PATCH] imagemagick: fix Magick[++|Core|Wand]-config
In-Reply-To: <1357250947-23296-5-git-send-email-stefan.froberg@petroprogram.com>
 ("Stefan =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Fri, 4 Jan 2013 00:09:04
 +0200")
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357250947-23296-5-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <87fw2glj1b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 Stefan> ---
 Stefan>  package/imagemagick/imagemagick.mk |   19 +++++++++++++++++++
 Stefan>  1 files changed, 19 insertions(+), 0 deletions(-)

 Stefan> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 Stefan> index 0476ace..00aa81f 100644
 Stefan> --- a/package/imagemagick/imagemagick.mk
 Stefan> +++ b/package/imagemagick/imagemagick.mk
 Stefan> @@ -119,6 +119,25 @@ define IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 Stefan>  		     Magick MagickCore MagickWand Wand Magick++))
 Stefan>  endef
 
 Stefan> +define IMAGEMAGICK_STAGING_IMAGEMAGICK_CONFIG_FIXUP
 Stefan> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick-config
 Stefan> +	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick-config


It's nicer to change the file with a single sed (-e) invocation, instead
of two.

 Stefan> +
 Stefan> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/Magick++-config

Some of these files only gets installed if certainly packages /
toolchain configurations are enabled, so the build fails with errors
like:

/bin/sed: can't read /home/peko/source/buildroot/test/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/Magick++-config: No such file or directory

So you need to check if the files exist first.

-- 
Bye, Peter Korsgaard
