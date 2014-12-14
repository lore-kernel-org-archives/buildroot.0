From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Dec 2014 00:02:11 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: Add new
 Qt5CinematicExperience package.
In-Reply-To: <1415095550-26839-1-git-send-email-pierre.lemagourou@openwide.fr>
References: <1415095550-26839-1-git-send-email-pierre.lemagourou@openwide.fr>
Message-ID: <20141214230211.GH4121@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre, All,

(Thomas, a question for you toward the end.)

On 2014-11-04 11:05 +0100, pierre.lemagourou at openwide.fr spake thusly:
> From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>

Thank you for your contribution. Sorry for the delay in reviewing this
patch; here is my review...

Mostly eye-candy, but I have not done a build-time test so far.

> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
> ---
> v0: Initial commit
>  qt5cinex is a package for Qt5 Cinematic Experience demo. This
>  application demonstrates the power of Qt5 and few of the new additions
>  available in QtQuick 2.0.

A changelog for the first submission is not ncessary. But what you wrote
could well have gone either in the commit log itself, or even in the
help entry, especially since that's the introductory sentence on the
upstream website.

> ---
>  package/Config.in                                  |  1 +
>  package/qt5cinex/Config.in                         | 26 +++++++++
>  ...nex-0001-Fix-execution-problem-with-Qt5.3.patch | 62 ++++++++++++++++++++++
>  package/qt5cinex/qt5cinex.hash                     |  8 +++
>  package/qt5cinex/qt5cinex.mk                       | 37 +++++++++++++
>  5 files changed, 134 insertions(+)
>  create mode 100644 package/qt5cinex/Config.in
>  create mode 100644 package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch
>  create mode 100644 package/qt5cinex/qt5cinex.hash
>  create mode 100644 package/qt5cinex/qt5cinex.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 28cf703..d91860c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -190,6 +190,7 @@ comment "Graphic applications"
>  	source "package/gnuplot/Config.in"
>  	source "package/jhead/Config.in"
>  	source "package/mesa3d-demos/Config.in"
> +	source "package/qt5cinex/Config.in"
>  	source "package/rrdtool/Config.in"
>  
>  comment "Graphic libraries"
> diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
> new file mode 100644
> index 0000000..4490bcd
> --- /dev/null
> +++ b/package/qt5cinex/Config.in
> @@ -0,0 +1,26 @@
> +comment "Qt5 Cinematic Experience needs Qt5 graphical effects"
> +	depends on !BR2_PACKAGE_QT5GRAPHICALEFFECTS
> +
> +config BR2_PACKAGE_QT5CINEX
> +	bool "Qt5 Cinematic Experience"
> +	depends on BR2_PACKAGE_QT5GRAPHICALEFFECTS
> +	select BR2_PACKAGE_QT5BASE_NETWORK
> +	select BR2_PACKAGE_QT5BASE_PNG
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5BASE_EGLFS

You need to propagate the dependencies of EGLFS, like so:

    depends on BR2_PACKAGE_HAS_LIBEGL # eglfs
    depends on BR2_PACKAGE_QT5_GL_AVAILABLE # eglfs

> +

No empty line.

> +	help
> +	  UX demo application that shows some graphical features of Qt5.
> +	  The name 'Cinematic Experience' reflects how it's possible to build
> +	  user interfaces with increased dynamics.
> +
> +	  http://quitcoding.com/?page=work#cinex

As said above, we like to replicate whatever first few sentences are on
the upstream website, so you could just replicate it here, like so:

    help
      This application demonstrates the power of Qt5 and few of the new
      additions available in QtQuick 2.0.

      http://quitcoding.com/?page=work#cinex

> +if BR2_PACKAGE_QT5CINEX
> +
> +config BR2_PACKAGE_QT5CINEX_RPI
> +	bool "RaspberryPI Edition"

This should at least "depends on BR2_arm".

Also, does it use either or both of rpi-userland or rpi-firmware at
build time or at runtime?

If so, you should add proper dependencies, for example:

- if build or runtime dependency, add in Config.in:
    config BR2_PACKAGE_QT5CINEX_RPI
        bool "RaspberryPI Edition"
        depends on BR2_PACKAGE_RPI_USERLAND

- if runtime dependency, add in qt5cinex.mk:
    QT5CINEX_RPI_DEPENDENCIES += rpi-userland

(but that's just an example.)

> +	help
> +	  High definifition version of the application optimised for Raspberry PI cards.

Keep lines below ~72 chars.

> +endif
> diff --git a/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch b/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch
> new file mode 100644
> index 0000000..48e0c83
> --- /dev/null
> +++ b/package/qt5cinex/qt5cinex-0001-Fix-execution-problem-with-Qt5.3.patch

Not your fault, but we now mandate patches to be named like git patches,
i.e.: 0001-Fix-execution-problem-with-Qt5.3.patch        

> @@ -0,0 +1,62 @@
> +From 6ecfcf724522fa37a695a4612f4638c2890d29f9 Mon Sep 17 00:00:00 2001
> +From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
> +Date: Thu, 23 Oct 2014 17:41:08 +0200
> +Subject: [PATCH] Fix execution problem with Qt5.3.
> +
> +This patch has been inspired from Open Embedded meta-qt5.

You should also SoB your patches.

[--SNIP--]
> diff --git a/package/qt5cinex/qt5cinex.hash b/package/qt5cinex/qt5cinex.hash
> new file mode 100644
> index 0000000..e84c31d
> --- /dev/null
> +++ b/package/qt5cinex/qt5cinex.hash
> @@ -0,0 +1,8 @@
> +# No upstream hashes for this file.
> +sha256 0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b Qt5_CinematicExperience_rpi_1.0.tgz
> +sha1   a68d7c5f133d380f9a8b85cfd617deb6b8cc99e2                         Qt5_CinematicExperience_rpi_1.0.tgz
> +md5    935a5db0a6b2a72c67236e72f52be7d1                                 Qt5_CinematicExperience_rpi_1.0.tgz
> +
> +sha256 0e547e0259667915a24e84ade5efdcd0c553f81786734452c2c8dbce19a19f44 Qt5_CinematicExperience_1.0.tgz
> +sha1   8c746a64c458b5c9ff3c6d01f284875d3aa11dcb                         Qt5_CinematicExperience_1.0.tgz
> +md5    1c4f9bf5411c985fc5d3dbfc5d826a29                                 Qt5_CinematicExperience_1.0.tgz

So, does the comment "No upstream hashes for this file." applies to both
editions, or just the RPi one? The fact that the lines are spearated
seem to imply it's only for the RPi, but upstream really has no hash for
either that I could find. Can you reword this so it is obvious the
comment applies to both, please?

> diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
> new file mode 100644
> index 0000000..3bedf9c
> --- /dev/null
> +++ b/package/qt5cinex/qt5cinex.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# qt5cinex
> +#
> +################################################################################
> +
> +QT5CINEX_VERSION = 1.0
> +QT5CINEX_RPI = ""

No need to initialise to empty, that's the default.

> +QT5CINEX_SITE = http://quitcoding.com/download/
> +
> +ifeq ($(BR2_PACKAGE_QT5CINEX_RPI),y)
> +	QT5CINEX_RPI = "rpi_"

No indentation.

> +endif
> +
> +QT5CINEX_SOURCE = Qt5_CinematicExperience_$(QT5CINEX_RPI)$(QT5CINEX_VERSION).tgz
> +QT5CINEX_DEPENDENCIES = qt5base qt5declarative
> +
> +QT5CINEX_LICENSE = CC-BY-3.0
> +QT5CINEX_LICENSE_FILE = README
> +
> +define QT5CINEX_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)

No need for putting the command between parenthesis.
Note: indentation here is OK.)

> +endef
> +
> +define QT5CINEX_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5CINEX_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/Qt5_CinematicExperience \
> +	  $(TARGET_DIR)/opt/Qt5_CinematicExperience/Qt5_CinematicExperience

We install nothing in /opt. Just install executables in /usr/bin.

> +	$(INSTALL) -D -m 0664 $(@D)/Qt5_CinematicExperience.qml \
> +	  $(TARGET_DIR)/opt/Qt5_CinematicExperience/Qt5_CinematicExperience.qml
> +	cp -dpfr $(@D)/content $(TARGET_DIR)/opt/Qt5_CinematicExperience/content

Well, I'm no Qt guy, but from the above I guess the content/ dir and
the qml file have to be in the same place as the excutable, right?

If so, I would suggest you install all them (content, qml and
executable) somewhere in /usr/share/Qt5/Qt5Cinex  (use your imagination
to find a better name if you can think of one ;-) ), and add a small
script in /usr/bin/qt5cinex-demo (ditto for the name) whith just his:

    #!/bin/sh
    exec /usr/share/Qt5/Qt5Cinex/Qt5_CinematicExperience "$@"

(and chnod it 755. of course.)

But hold on before doing it, I'd like another Qt guy some feedback on
this. Thomas?

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
