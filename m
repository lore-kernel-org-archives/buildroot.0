From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 15:28:03 +0100
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <201509241332.t8ODWvNZ013481@ms-omx03.plus.so-net.ne.jp>
References: <201509241332.t8ODWvNZ013481@ms-omx03.plus.so-net.ne.jp>
Message-ID: <56040873.30608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

are you able to download squeezelite? I'm having this problem:

>>> squeezelite v1.8 Downloading
Doing shallow clone
Initialized empty Git repository in
/br/output/build/.squeezelite-v1.8.tar.gz.pb3XtQ/squeezelite-v1.8/
remote: Counting objects: 82, done.
Unpacking objects: 100% (82/82), done.
warning: Remote branch v1.8 not found in upstream origin, using HEAD instead
fatal: unable to read tree 668edec073bef579bedf43817f65aee3a592d0ef

On 09/24/2015 02:32 PM, kei-k at ca2.so-net.ne.jp wrote:
> Dear, reviewers.
> 
> Thank you for your many comment and suggestions.
> 
> I'm very sorry to post patches so many times.
> I think I reflected all feedbacks except TARGET_CONFIGURE_OPTS issue.
> I'm not sure the right way to fix this, so would anyone suggest me?

TARGET_CONFIGURE_OPTS is a variable which defines PATH, CC, LD and more
things. You can have a look at it in package/Makefile.in, line #247.

Instead of passing CC="$(TARGET_CC)" LD="$(TARGET_LD) to the make
command, you could just pass $(TARGET_CONFIGURE_OPTS).

There is a comment at the end where I show you how to use it.

> 
> v11 -> v12
> - remove -DRESAMPLE_MP, because libsoxr is compiled without
>   openMP support in buildroot, so meaningless for now.
> - add -DLINKALL to resolve symbols in optional libraries (libsoxr, etc).
> - add more configuration options : ffmpeg, DSD, Visualizer.
>   lirc support is not included for now, because more work will be
>   necessary to use it (eg: modifying package/lirc-tools to add
>   LIRC_TOOLS_INSTALL_STAGING = YES).

Remember the changelog goes below "---".

> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---

Here is where the changelog should be.

Please read:

http://buildroot.org/downloads/manual/manual.html#submitting-patches

Scroll down until "21.5.2. Patch revision changelog" subsection.

>  package/Config.in                  |    1 +
>  package/squeezelite/Config.in      |   46 ++++++++++++++++++++++++++++++++++++
>  package/squeezelite/squeezelite.mk |   42 ++++++++++++++++++++++++++++++++
>  3 files changed, 89 insertions(+), 0 deletions(-)
>  create mode 100644 package/squeezelite/Config.in
>  create mode 100644 package/squeezelite/squeezelite.mk
> 
[snip]
> diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
> new file mode 100644
> index 0000000..9611b97
> --- /dev/null
> +++ b/package/squeezelite/squeezelite.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# squeezelite
> +#
> +################################################################################
> +
> +SQUEEZELITE_VERSION = v1.8
> +SQUEEZELITE_SITE = https://code.google.com/p/squeezelite
> +SQUEEZELITE_SITE_METHOD = git
> +SQUEEZELITE_LICENSE = GPLv3
> +SQUEEZELITE_LICENSE_FILE = LICENSE.txt
> +SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
> +SQUEEZELITE_MAKE_OPTS = -DLINKALL
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_FF),y)
> +SQUEEZELITE_DEPENDENCIES += ffmpeg
> +SQUEEZELITE_MAKE_OPTS += -DFFMPEG
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_DSD),y)
> +SQUEEZELITE_MAKE_OPTS += -DDSD
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_RESAMPLE),y)
> +SQUEEZELITE_DEPENDENCIES += libsoxr
> +SQUEEZELITE_MAKE_OPTS += -DRESAMPLE
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
> +SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
> +endif
> +
> +define SQUEEZELITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

Here is where you could use the $(TARGET_CONFIGURE_OPTS) variable:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all

Perhaps using $(TARGET_CONFIGURE_OPTS) as environment variable would
work as well, and since it also defines PATH, then $(TARGET_MAKE_ENV)
wouldn't be needed:

	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all


Regards,

Vincent.

> +endef
> +
> +define SQUEEZELITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
> +endef
> +
> +$(eval $(generic-package))
> 
