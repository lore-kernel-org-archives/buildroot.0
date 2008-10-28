From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 28 Oct 2008 09:22:53 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix use of pkg-config
In-Reply-To: <20081028081410.5395e6f0@surf>
References: <200810280251.36628.markus.heidelberg@web.de>
	<20081028081410.5395e6f0@surf>
Message-ID: <200810280922.53728.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni, 28.10.2008:
> Le Tue, 28 Oct 2008 02:51:36 +0100,
> Markus Heidelberg <markus.heidelberg@web.de> a ?crit :
> 
> > +		$(TARGET_CONFIGURE_OPTS) \
> > +		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
> 
> I don't get why PKG_CONFIG_SYSROOT should be set here. The correct
> variable is PKG_CONFIG_SYSROOT_DIR and it is already set in
> TARGET_CONFIGURE_OPTS. I probably missed something specific to Qt, but
> I didn't understand the sentence: ?PKG_CONFIG_SYSROOT is only used to
> avoid a warning from Qt's configure system?.

Damn, I wanted to keep the comment short without being unclear, which
apparently failed. This extract from the file Qt/configure should make the use
of -force-pkg-config and PKG_CONFIG_SYSROOT clear. Qt should query
PKG_CONFIG_SYSROOT_DIR instead of PKG_CONFIG_SYSROOT. I've already sent a bug
report.

if [ "$QT_CROSS_COMPILE" = "yes" ]; then
    if [ -n "$QT_FORCE_PKGCONFIG" ]; then
        echo >&2 ""
        echo >&2 "You have asked to use pkg-config and are cross-compiling."
        echo >&2 "Please make sure you have a correctly set-up pkg-config"
        echo >&2 "environment!"
        echo >&2 ""
        if [ -z "$PKG_CONFIG_PATH" ]; then
            echo >&2 ""
            echo >&2 "Warning: PKG_CONFIG_PATH has not been set.  This could mean"
            echo >&2 "the host compiler's .pc files will be used. This is probably"
            echo >&2 "not what you want."
            echo >&2 ""
        elif [ -z "$PKG_CONFIG_SYSROOT" ]; then
            echo >&2 ""
            echo >&2 "Warning: PKG_CONFIG_SYSROOT has not been set. This means"
            echo >&2 "your toolchain's .pc files must contain the paths to the"
            echo >&2 "toolchain's libraries & headers. If configure tests are"
            echo >&2 "failing, please check these files."
            echo >&2 ""
        fi
    else
        PKG_CONFIG=""
    fi
fi
