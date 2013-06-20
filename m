From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 17:59:30 +0200
Subject: [Buildroot] [PATCH 1/4] TCL: change BR2_PACKAGE_TCL_SHLIB_ONLY
 option
In-Reply-To: <1371743610-17810-2-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371743610-17810-2-git-send-email-richard.genoud@gmail.com>
Message-ID: <20130620175930.21f6ef3f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Thu, 20 Jun 2013 17:53:27 +0200, Richard Genoud wrote:

> @@ -26,7 +26,7 @@ define TCL_POST_INSTALL_CLEANUP
>  	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
>  	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
>  	fi
> -	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
> +	-if [ "$(BR2_PACKAGE_TCL_TCLSH)" != "y" ]; then \
>  	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
>  	fi
>  endef

Whenever possible, I think we prefer to use make conditional rather
than shell conditions. So something like:

ifeq ($(BR2_PACKAGE_TCL_DEL_ENCODINGS),y)
define TCL_REMOVE_ENCODINGS
	rm -rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
endef

TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_ENCODINGS
endif

ifeq ($(BR2_PACKAGE_TCL_TCLSH),y)
define TCL_SYMLINK_TCLSH
	ln -s tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
endef

TCL_POST_INSTALL_TARGET_HOOKS += TCL_SYMLINK_TCLSH
else
define TCL_REMOVE_TCLSH
	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
endef

TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
endif

And while you're at it, you could also remove the useless (and
incorrect) :

        -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
 
Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
