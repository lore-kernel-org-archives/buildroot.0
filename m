From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 23:10:12 +0100
Subject: [Buildroot] [PATCH v6 02/28] core/pkg-infra: Add generic qmake
 package infrastructure
In-Reply-To: <20200217212350.29750-3-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-3-anaumann@ultratronik.de>
Message-ID: <20200309231012.6067b99f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Mon, 17 Feb 2020 22:23:24 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> This provides generic functions for Qt5 qmake based packages. It will make it
> possible to remove lots of redefinition of QT5_xxx_{CONFIGURE|BUILD|
> INSTALL_STATGING}_CMDS. Additionally it provides a generic target install
> method which will make most of the package specific commands obsolete.
> 
> This is done by re-running the install step of the qmake generated Makefile
> with the package build directory prepended (to the staging/host path). Even
> though this does create lengthy pathes it allows for easy separation of the
> staging files from the host destined files by just omitting the resulting
> BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.
> The cleanup of many files we dont want in target is deferred to the
> target-finalize step. In addition to what's being removed already, we also have
> to cleanup some Qt5 specific files (prl) and the documentation directory.
> 
> This approach was chosen over copying all files recorded in the pkg-files-list
> after some discussion which Thomas Petazzoni summed up:
> "We don't yet use pkg-files-list really as part of the build
> process anywhere, I feel a bit more comfortable at this point with what
> Andreas is proposing."
> 
> Getting rid of the many conditional install commands is possible because qmake
> already takes care of this when generating the Makefile install targets with the
> given or autodetected configure options of each package.
> 
> However, custom install steps may have to remain in cases where a particular
> buildroot option has no corresponding setting in the packages configuration
> options.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

I've applied to master, after doing some small changes, see below.

> +An additional variable, specific to the QMake infrastructure, can
> +also be defined.
> +
> +* +LIBFOO_QMAKE_OPTS+, to specify additional options to pass to the
> +  +qmake+ script at every step of the package build process: configure,
> +  build and installation. By default, empty.

This option doesn't exist in your qmake-package infra, only CONF_OPTS
exists, so I've dropped this QMAKE_OPTS description.

> +define inner-qmake-package
> +
> +$(2)_CONF_ENV			?=
> +$(2)_CONF_OPTS			?=
> +$(2)_MAKE_ENV			?=
> +$(2)_MAKE_OPTS			?=
> +$(2)_INSTALL_STAGING_OPTS	?= install
> +$(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)

I've added a:

$(2)_DEPENDENCIES += qt5base

here, since all packages that use qmake-package need qmake, and qmake
is provided by qt5base.

Of course, I have then dropped the addition of qt5base as an explicit
dependency in the next patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
