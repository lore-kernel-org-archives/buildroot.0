From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Apr 2019 23:25:19 +0200
Subject: [Buildroot] [PATCH] package/most: added version 5.1.0
In-Reply-To: <alpine.DEB.2.20.1904121806020.19094@defender.svolli.xa>
References: <alpine.DEB.2.20.1904121806020.19094@defender.svolli.xa>
Message-ID: <26e4b5dc-0f99-2d9e-7fe8-6133ba66c8c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sven Oliver,

 Thank you for your patch. A few comments.

 The subject line should be:

package/most: new package

On 12/04/2019 18:07, Sven Oliver Moll wrote:
> 
> Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
> 
[snip]
> diff --git a/package/most/Config.in b/package/most/Config.in
> new file mode 100644
> index 0000000000..c8909a024e
> --- /dev/null
> +++ b/package/most/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_MOST
> +??? bool "most"
> +??? depends on BR2_PACKAGE_SLANG

 In almost all cases, we use 'select' of another package rather than 'depends
on'. Otherwise, the user should manually select each and every library that the
tools they want depend on.

 You do have to propagate the architecture and toolchain dependencies, though.
So this should become:

	depends on BR2_USE_MMU # slang
	select BR2_PACKAGE_SLANG

> +??? help
> +????? most is a powerful pager
> +
> +????? https://www.jedsoft.org/most/
> +
> +comment "most depends on slang library"

 With the select, the comment is not needed. We don't need a comment for the MMU
dependency because it's considered an architecture dependency and the user can't
do anything to fix it anyway.

> +??? depends on !BR2_PACKAGE_SLANG
> diff --git a/package/most/most.hash b/package/most/most.hash
> new file mode 100644
> index 0000000000..76cbec0cda
> --- /dev/null
> +++ b/package/most/most.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501?
> most-5.1.0.tar.gz

 Please also add a hash for the license file.

> diff --git a/package/most/most.mk b/package/most/most.mk
> new file mode 100644
> index 0000000000..7ff8d2ea95
> --- /dev/null
> +++ b/package/most/most.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# most
> +#
> +################################################################################
> +
> +MOST_SITE = http://www.jedsoft.org/releases/most
> +MOST_VERSION = 5.1.0
> +MOST_SOURCE = most-$(MOST_VERSION).tar.gz

 This is the default so not needed.


> +MOST_LICENSE = GPL-2.0

 All source files seem to have the "or any later version" clause, so this should
be GPL-2.0+.

> +MOST_LICENSE_FILES = COPYING

 I would include COPYRIGHT as well, since it includes the author (which needs to
be provided according to GPL).

> +
> +define MOST_BUILD_CMDS
> +??? # remove version check of slang library
> +??? # - check assumes self-hosting compile
> +??? # - slang version is sufficiant due to building from buildroot
> +??? $(SED) 's/ slangversion / /g' $(@D)/src/Makefile

 This is better handled as a post-patch hook. Also, you shouldn't include the
comments inside the define, otherwise they'll be printed during the build.


 Could you take into account these comments and resend the patch? Thanks!

 Regards,
 Arnout

> +??? $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define MOST_INSTALL_TARGET_CMDS
> +??? $(INSTALL) -D -m 0755 $(@D)/src/objs/most $(TARGET_DIR)/usr/bin/most
> +endef
> +
> +$(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
