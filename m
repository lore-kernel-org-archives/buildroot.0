From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 9 Jun 2018 19:20:03 -0300 (BRT)
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <20180609094647.21460-1-yann.morin.1998@free.fr>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
Message-ID: <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Yann Morin" <yann.morin.1998@free.fr>, "Thomas De Schampheleire" <patrickdepinguin@gmail.com>, "DATACOM"
> <casantos@datacom.com.br>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Sent: Saturday, June 9, 2018 6:46:47 AM
> Subject: [PATCH] docs/manual: document filesystems

[...]
> 
> diff --git a/docs/manual/adding-filesystems.txt
> b/docs/manual/adding-filesystems.txt
> new file mode 100644
> index 0000000000..4731526c0f
> --- /dev/null
> +++ b/docs/manual/adding-filesystems.txt
> @@ -0,0 +1,119 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +=== Infrastructure for filesystems

Shouldn't this be a separate chapter instead of a section of packages?
Filesystems are different from packages, regardless the syntactical
similarities in the configurations and recipe files. See also the
comment below about the hooks section.

> +
> +As for packages, Buildroot provides an infrastructure to build
> +filesystems.
> +
> +The filesystem infrastructure follows a carefully-crafted sequence:
> +
> +1. Assemble an intermediate, internal tarball from the +target/+
> +   directory:
> +  * create users and groups,
> +  * set the correct rights on files,
> +  * create device nodes,
> +  * create the intermediate tarball;
> +2. Then for each filesystem:
> +  * extract the intermediate tarball to a filesystem-specific
> +    +$(TARGET_DIR)+,
> +  * execute the filesystem pre-gen hooks (see below),
> +  * optionally, touch everything to a specific date, for reproducibility,
> +  * execute the filesystem commands,
> +  * execute the filesystem post-gen hooks (see below),
> +  * remove the filesystem-specific +$(TARGET_DIR)+;
> +3. Remove the intermediate tarball.
> +
> +[[filesystem-tutorial]]
> +==== +filesystem+ tutorial
> +
> +Let's look at an example filesytem. First and foremost, like for a
> +package, create a directory named from your filesystem, e.g. +foo+.
> +
> +Then, create a +Config.in+ file describing the menuconfig entries
> +for the filesystem. Be sure to have that +Config.in+ included from
> ++fs/Config.in+ (or from the +Config.in+ of your *br2-external* tree).
> +For example:
> +
> +----
> +01: config BR2_TARGET_ROOTFS_FOO
> +02: 	bool "foo root filesystem"
> +03: 	help
> +04: 	  Build a foo root filesystem.
> +05:
> +06: if BR2_TARGET_ROOTFS_FOO
> +07:
> +08: config BR2_TARGET_ROOTFS_FOO_FORMAT_BAR
> +09: 	bool "bar format"
> +10: 	help
> +11: 	  Enable the bar format.
> +12:
> +13: endif
> +----
> +
> +Then, in the same directory, create a +foo.mk+ file describing how
> +to actually assemble the filesystem image from the content of
> ++$(TARGET_DIR)+. Be sure that this +.mk+ file is included in the
> +Makefile code (automatic for built-in filesystems, not for filesystems
> +in a *br2-external* tree.) For example:
> +
> +----
> +01:
> ################################################################################
> +02: #
> +03: # foo filesystem
> +04: #
> +05:
> ################################################################################
> +06:
> +07: ROOTFS_FOO_DEPENDENCIES = host-foo-utils
> +08:
> +09: ifeq ($(BR2_TARGET_ROOTFS_FOO_FORMAT_BAR),y)
> +10: ROOTFS_FOO_OPTS = --format=bar
> +11: else
> +12: ROOTFS_FOO_OPTS = --format=foo
> +13: endif
> +14:
> +15: define ROOTFS_FOO_CMD
> +16: 	$(HOST_DIR)/bin/mkfs.foo \
> +17: 		--root-dir=$(TARGET_DIR) \
> +18: 		--option-foo --option-bar \
> +19: 		$(ROOTFS_FOO_OPTS) \
> +20: 		--output-file=$(@)
> +21: endef
> +22:
> +23: $(eval $(rootfs))
> +----
> +
> +On line 7, we specify the dependencies on packages needed to build the
> +filesystem. Usually, those dependencies are one or more host-packages
> +that provide the filesystem generator.
> +
> +On lines 9 to 13, we define a conditional set of options, depending on
> +the user's choice.
> +
> +On lines 15 to 21, we define the actual command that will generate the
> +filesystem image.
> +
> +Finally, on line 23, we invoke the +rootfs+ macro that generates all the
> +Makefile rules that actually allow the filesystem to be built.
> +
> +[[filesystem-reference]]
> +==== +filesystem+ reference
> +
> +If one compares a package with a filesystem, one may notice that the
> +variables for a filesystem start with the prefix +ROOTFS_+, when the
> +variables for packages have no prefix.
> +
> +There is a single macro that a filesystem may set:
> +
> +* +ROOTFS_FOO_CMD+ contains the commands to execute to actually
> +  generate the filesystem iamge from the content of the +$(TARGET_DIR)+
> +  directory.
> +
> +Additionally, like for packages, there are a set of hooks; see
> +xref:hooks[] for details.

There are two fundamental differences between packages and filesystem
images:

Filesystem images are always rebuilt and installed while packages are
built/installed once and rebuilt/re-installed only on explicit calls
to "make pkg-name-{reconfigure,rebuild,reinstall}".

Packages are supposed to install, remove or modify files in the global
$(TARGET_DIR) hierarchy. Genarating filesystem images do not modify the
contents of the global $(TARGET_DIR) and user-provided rootfs extensions
must not do this.

[Side note: we could add an optional "paranoid mode" config which would
trigger a checksum generation/checking right before/after the creation
of the rootfs images.] 

> +And here is a list of variables that may be used (but may *not* be set):

"must" not be set.

> +
> +* +$(TARGET_DIR)+ is the directory containing the +target/+ directory.
> +
> +* +$(@)+ is the filename where to store the filesystem image into.
> diff --git a/docs/manual/adding-packages-hooks.txt
> b/docs/manual/adding-packages-hooks.txt
> index 0ce79f8907..34d5801169 100644
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt

Consider moving the hooks section to a separate chapter if you put the
filesystem text in a separate chapter too.

[...]

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
