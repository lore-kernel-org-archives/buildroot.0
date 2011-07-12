From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jul 2011 17:24:15 +0200
Subject: [Buildroot] [PATCH v3] New packages: acl and attr
In-Reply-To: <4E1BFF3B.4040606@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 12 Jul 2011 10:00:59 +0200")
References: <4E1BFF3B.4040606@visionsystems.de>
Message-ID: <878vs3iktc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> In addition to providing the acl and extended attributes functionality,
 Yegor> these new packages satisfy newer udev versions, so you can build all extras.

Thanks, see below for a few comments..

 Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 Yegor> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> ---
 Yegor>  package/Config.in      |    2 ++
 Yegor>  package/acl/Config.in  |    8 ++++++++
 Yegor>  package/acl/acl.mk     |   28 ++++++++++++++++++++++++++++
 Yegor>  package/attr/Config.in |    7 +++++++
 Yegor>  package/attr/attr.mk   |   27 +++++++++++++++++++++++++++
 Yegor>  5 files changed, 72 insertions(+)
 Yegor>  create mode 100644 package/acl/Config.in
 Yegor>  create mode 100644 package/acl/acl.mk
 Yegor>  create mode 100644 package/attr/Config.in
 Yegor>  create mode 100644 package/attr/attr.mk

 Yegor> Index: b/package/Config.in
 Yegor> ===================================================================
 Yegor> --- a/package/Config.in
 Yegor> +++ b/package/Config.in
 Yegor> @@ -492,6 +492,8 @@
 Yegor>  endmenu
 
 Yegor>  menu "System tools"
 Yegor> +source "package/acl/Config.in"
 Yegor> +source "package/attr/Config.in"
 Yegor>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Yegor>  source "package/bootutils/Config.in"
 Yegor>  endif
 Yegor> Index: b/package/acl/Config.in
 Yegor> ===================================================================
 Yegor> --- /dev/null
 Yegor> +++ b/package/acl/Config.in
 Yegor> @@ -0,0 +1,8 @@
 Yegor> +config BR2_PACKAGE_ACL
 Yegor> +	bool "acl"
 Yegor> +	select BR2_PACKAGE_ATTR
 Yegor> +	help
 Yegor> +	  POSIX Access Control Lists, which are used to define more
 Yegor> +	  fine-grained discretionary access rights for files and
 Yegor> +	  directories.
 Yegor> +	  This package also provides libacl.

No upstream URL? (seems to be http://savannah.nongnu.org/projects/acl)

 Yegor> Index: b/package/acl/acl.mk
 Yegor> ===================================================================
 Yegor> --- /dev/null
 Yegor> +++ b/package/acl/acl.mk
 Yegor> @@ -0,0 +1,28 @@
 Yegor> +#############################################################
 Yegor> +#
 Yegor> +# acl
 Yegor> +#
 Yegor> +#############################################################
 Yegor> +
 Yegor> +ACL_VERSION = 2.2.49
 Yegor> +ACL_SOURCE = acl_$(ACL_VERSION).orig.tar.gz
 Yegor> +ACL_SITE = http://ftp.debian.org/debian/pool/main/a/acl

Why are you using Debian as upstream instead of
http://download.savannah.gnu.org/releases/acl/? Latest release seems to
be 2.2.51.


 Yegor> +++ b/package/attr/Config.in

Ideally this should be 2 independent patches, but ok ..

 Yegor> @@ -0,0 +1,7 @@
 Yegor> +config BR2_PACKAGE_ATTR
 Yegor> +	bool "attr"
 Yegor> +	help
 Yegor> +	  Extended attributes are name:value pairs associated permanently with
 Yegor> +	  files and directories, similar to the environment strings associated
 Yegor> +	  with a process

A trailing dot (.) is missing. Instead of explaining what extended
attributes are, perhaps we should rather explain what the package
contains - E.G. something like:

Utilities/library for manipulating filesystem extended attributes

 Yegor> +	  This package also provides libattr.

No upstream URL (seems to be http://savannah.nongnu.org/projects/attr)

 Yegor> Index: b/package/attr/attr.mk
 Yegor> ===================================================================
 Yegor> --- /dev/null
 Yegor> +++ b/package/attr/attr.mk
 Yegor> @@ -0,0 +1,27 @@
 Yegor> +#############################################################
 Yegor> +#
 Yegor> +# attr
 Yegor> +#
 Yegor> +#############################################################
 Yegor> +
 Yegor> +ATTR_VERSION = 2.4.46
 Yegor> +ATTR_SOURCE = attr_$(ATTR_VERSION).orig.tar.gz
 Yegor> +ATTR_SITE = http://ftp.debian.org/debian/pool/main/a/attr

Again, why Debian instead of http://download.savannah.gnu.org/releases/attr/?


 Yegor> +ATTR_INSTALL_STAGING = YES
 Yegor> +ATTR_CONF_OPT = --enable-gettext=no
 Yegor> +
 Yegor> +# While the configuration system uses autoconf, the Makefiles are
 Yegor> +# hand-written and do not use automake. Therefore, we have to hack
 Yegor> +# around their deficiencies by passing installation paths.
 Yegor> +ATTR_INSTALL_STAGING_OPT = 			\
 Yegor> +	prefix=$(STAGING_DIR)/usr 		\
 Yegor> +	exec_prefix=$(STAGING_DIR)/usr 		\
 Yegor> +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 	\
 Yegor> +	install-dev install-lib
 Yegor> +
 Yegor> +ATTR_INSTALL_TARGET_OPT = 			\
 Yegor> +	prefix=$(TARGET_DIR)/usr 		\
 Yegor> +	exec_prefix=$(TARGET_DIR)/usr 		\
 Yegor> +	install install-lib
 Yegor> +
 Yegor> +$(eval $(call AUTOTARGETS,package,attr))

-- 
Bye, Peter Korsgaard
