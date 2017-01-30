From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 15:36:54 +0100
Subject: [Buildroot] [PATCH v4 1/1] git-crypt: new package
In-Reply-To: <20170130135517.5010-1-francesconegri@gmail.com> (Francesco
 Negri's message of "Mon, 30 Jan 2017 14:55:17 +0100")
References: <20170130132702.85804-1-francesconegri@gmail.com>
 <20170130135517.5010-1-francesconegri@gmail.com>
Message-ID: <87efzk8vi1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francesco" == Francesco Negri <francesconegri@gmail.com> writes:

 > Signed-off-by: Francesco Negri <francesconegri@gmail.com>
 > ---
 > Changes v3 -> v4:
 >   - more accurate info on licenses
 > ---
 >  package/Config.in                |  1 +
 >  package/git-crypt/Config.in      | 15 +++++++++++++++
 >  package/git-crypt/git-crypt.hash |  2 ++
 >  package/git-crypt/git-crypt.mk   | 21 +++++++++++++++++++++
 >  4 files changed, 39 insertions(+)
 >  create mode 100644 package/git-crypt/Config.in
 >  create mode 100644 package/git-crypt/git-crypt.hash
 >  create mode 100644 package/git-crypt/git-crypt.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 6a3a1a7c7..067ff3cc9 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -138,6 +138,7 @@ menu "Development tools"
 >  	source "package/gawk/Config.in"
 >  	source "package/gettext/Config.in"
 >  	source "package/git/Config.in"
 > +	source "package/git-crypt/Config.in"
 >  	source "package/gperf/Config.in"
 >  	source "package/grep/Config.in"
 >  	source "package/jq/Config.in"
 > diff --git a/package/git-crypt/Config.in b/package/git-crypt/Config.in
 > new file mode 100644
 > index 000000000..4e1ca4a2b
 > --- /dev/null
 > +++ b/package/git-crypt/Config.in
 > @@ -0,0 +1,15 @@
 > +config BR2_PACKAGE_GIT_CRYPT
 > +	bool "git-crypt"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	depends on BR2_USE_MMU # git
 > +	select BR2_PACKAGE_GIT

git is only used at runtime, not build time - So we normally add a
comment about that (and drop it from GIT_CRYPT_DEPENDENCIES).

 > new file mode 100644
 > index 000000000..fc3e44f81
 > --- /dev/null
 > +++ b/package/git-crypt/git-crypt.mk
 > @@ -0,0 +1,21 @@
 > +################################################################################
 > +#
 > +# git-crypt
 > +#
 > +################################################################################
 > +
 > +GIT_CRYPT_VERSION = 0.5.0
 > +GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
 > +GIT_CRYPT_DEPENDENCIES = git openssl
 > +GIT_CRYPT_LICENSE = GPLv3+, MIT
 > +GIT_CRYPT_LICENSE_FILES = COPYING parse_options.hpp
 > +
 > +define GIT_CRYPT_BUILD_CMDS
 > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all

The reason you had to add TARGET_CONFIGURE_OPTS before make was that the
build system hardcoded -lcrypto to link with openssl. This is
unfortunately not enough when linking statically as you also have to
consider the dependencies of openssl (E.G. zlib).

So I changed it to host pkg-config to get the libraries needed for
openssl and pass those in LDFLAGS.

> +endef
 > +
 > +define GIT_CRYPT_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 0755 $(@D)/git-crypt $(TARGET_DIR)/usr/bin/git-crypt

The buildsystem has a sensible 'make install' target, so I rewrote it to
use that.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
