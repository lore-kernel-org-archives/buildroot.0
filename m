From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 22:47:16 +0200
Subject: [Buildroot] [PATCH v3 1/1] capnproto: new package
In-Reply-To: <1531185777-23485-1-git-send-email-JoelsonCarl@gmail.com>
References: <1531185777-23485-1-git-send-email-JoelsonCarl@gmail.com>
Message-ID: <0cf44e67-b175-8271-7694-2290f9b3a3f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joel,

 Thanks for picking this up. Unfortunately, I have more feedback :-)

On 10-07-18 03:22, Joel Carlson wrote:
> Adds the capnproto package. This also builds a host variant to generate
> the capnp compiler that can be used to compile message definitions into
> C++ code. Includes a patch from upstream to fix an issue with uclibc.
> 
> The top level of the repository is not where compilation occurs, but
> rather within a 'c++' folder, so the package extraction commands are
> altered to only extract the c++ folder so that the rest of the autotools
> framework will work correctly. Extraction also saves the LICENSE file
> that was in the top-level.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
> This is me digging up yet another old patch...
> Original v2 is here: https://patchwork.ozlabs.org/patch/787341/
> 
> Changes v2->v3:
>   - commit message about the package and not reiterating the help text
>   - changed to grab source from github, and modify extraction to get
>     appropriate directories
>   - modified patch to fix uclibc issue and point at upstream commit
>   - change order of dependencies to list hardware (MMU) first
> 
> Tested with test-pkg -a: 47 builds, 5 skipped, 0 build failed, 0 legal-info failed

 Excellent!

> ---
[snip]
> diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
> new file mode 100644
> index 0000000..d4f3e56
> --- /dev/null
> +++ b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
> @@ -0,0 +1,33 @@
> +From e651ac5febc59e3e2b5d3365ededbe5362756da2 Mon Sep 17 00:00:00 2001
> +From: Koen Martens <gmc@sonologic.nl>
> +Date: Wed, 12 Jul 2017 18:49:32 +0200
> +Subject: [PATCH] Do not use execinfo.h with uclibc (#511)
> +
> +Upstream commit: https://github.com/capnproto/capnproto/commit/e651ac5febc59e3e2b5d3365ededbe5362756da2
> +
> +Signed-off-by: Koen Martens <gmc@sonologic.nl>

 You'll have to add your own SoB here as well. Especially since you modified it.

> +
> +---
> +This patch has been hand-edited as the git repository at the top level has a
> +'c++' folder that the 'src' folder resides within, but the buildroot package
> +is setup to extract the internals of the 'c++' folder only.
> +---
[snip]
> diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
> new file mode 100644
> index 0000000..3b0e55b
> --- /dev/null
> +++ b/package/capnproto/capnproto.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-v0.6.1.tar.gz

 Could you also add a hash of the license file?

> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> new file mode 100644
> index 0000000..09b1f91
> --- /dev/null
> +++ b/package/capnproto/capnproto.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# capnproto
> +#
> +################################################################################
> +
> +CAPNPROTO_VERSION = v0.6.1
> +CAPNPROTO_SITE = $(call github,capnproto,capnproto,$(CAPNPROTO_VERSION))
> +CAPNPROTO_LICENSE = MIT
> +CAPNPROTO_LICENSE_FILES = LICENSE
> +CAPNPROTO_INSTALL_STAGING = YES
> +CAPNPROTO_AUTORECONF = YES

 You need to add a comment, like # Fetched from Github, with no configure script

> +CAPNPROTO_CONF_OPTS = --with-external-capnp
> +# Needs the capnproto compiler on the host to generate C++ code from message
> +# definitions
> +CAPNPROTO_DEPENDENCIES = host-autoconf host-capnproto
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)

 This typically means that it would also depend on BR2_TOOLCHAIN_HAS_ATOMIC.
Apparently, we don't have a gcc >= 4.8 that doesn't have
BR2_TOOLCHAIN_HAS_ATOMIC in our autobuilders, so test-pkg wouldn't have captured
that.

> +CAPNPROTO_CONF_ENV += LIBS=-latomic
> +endif
> +
> +# The actual source to be compiled is within a 'c++' folder at the top-level,
> +# so extract just that c++ folder. But the LICENSE file is in the top-level
> +# directory, so extract that as well.

 Why does CAPNPROTO_SUBDIR=c++ not work? That would be a lot simpler.


 Regards,
 Arnout


> +define CAPNPROTO_EXTRACT_CMDS
> +	$(TAR) -C $(CAPNPROTO_DIR) --strip-components=2 $(TAR_OPTIONS) \
> +		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
> +		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/c++
> +	$(TAR) -C $(CAPNPROTO_DIR) --strip-components=1 $(TAR_OPTIONS) \
> +		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
> +		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/LICENSE
> +endef
> +
> +define HOST_CAPNPROTO_EXTRACT_CMDS
> +	$(TAR) -C $(HOST_CAPNPROTO_DIR) --strip-components=2 $(TAR_OPTIONS) \
> +		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
> +		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/c++
> +	$(TAR) -C $(HOST_CAPNPROTO_DIR) --strip-components=1 $(TAR_OPTIONS) \
> +		$(CAPNPROTO_DL_DIR)/$(CAPNPROTO_SOURCE) \
> +		capnproto-$(subst v,,$(CAPNPROTO_VERSION))/LICENSE
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
