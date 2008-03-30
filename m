From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 15:01:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: scripts
	target/device/Atmel/atngw100 tar etc...
In-Reply-To: <20080329140922.927033C45E@busybox.net> (ulf@uclibc.org's message
	of "Sat\, 29 Mar 2008 07\:09\:22 -0700 \(PDT\)")
References: <20080329140922.927033C45E@busybox.net>
Message-ID: <871w5s4b8k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-03-29 07:09:22 -0700 (Sat, 29 Mar 2008)
 ulf> New Revision: 21554

 ulf> Log:
 ulf> Add some robustness to linux configuration

 ulf> Added:
 ulf>    trunk/buildroot/scripts/get_linux_config.sh

 ulf> Modified:
 ulf>    trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
 ulf>    trunk/buildroot/target/linux/Makefile.in.advanced

<snip>

 ulf> -$(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 ulf> +$(LINUX26_DIR)/.config:	$(LINUX26_DIR)/.patched
 ulf>  ifeq ($(BR2_PACKAGE_LINUX_USE_DEFCONFIG),y)
 ulf>  	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig 
 ulf>  endif
 ulf> @@ -294,8 +284,33 @@
 ulf>  	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig 
 ulf>  endif
 ulf>  ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 ulf> -	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 ulf> +	# Try user defined config
 ulf> +	if [ -f "$(LINUX26_KCONFIG)" ] ; then \
 ulf> +		cp -dpf $(LINUX26_KCONFIG) $@ ; \
 ulf> +	fi
 ulf> +	# Try to get a config for this linux version in the board directory
 ulf> +	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
 ulf> +	    if [ -f "$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config" ] ; then \
 ulf> +		cp -dpf $(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config $@ ; \
 ulf> +	    fi ; \
 ulf> +	fi
 ulf> +	# Try to get a config for latest linux version in the board directory
 ulf> +	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
 ulf> +		scripts/get_linux_config.sh $(BOARD_PATH) $(LINUX26_DIR) ; \
 ulf> +	fi
 ulf> +	# Use a board config defined in the linux source.
 ulf> +	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
 ulf> +		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig || \
 ulf> +			echo "$(BOARD_NAME)_defconfig failed..." ; \
 ulf> +	fi
 ulf> +	# let the user create his/her own config
 ulf> +	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
 ulf> +		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig ; \

Please use menuconfig instead of xconfig as the user might not have
X/QT installed and we already use menuconfig for buildroot.

-- 
Bye, Peter Korsgaard
