From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Dec 2010 12:07:26 +0100
Subject: [Buildroot] [PATCH v2] rsh-redone: new package for rsh/rlogin
	clients
In-Reply-To: <1290145224-21076-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Fri, 19 Nov 2010 00:40:24 -0500")
References: <1290122441-7320-1-git-send-email-vapier@gentoo.org>
	<1290145224-21076-1-git-send-email-vapier@gentoo.org>
Message-ID: <87r5dtu9ht.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike> v2
 Mike> 	- the install target didn't work quite right in the empty case

 Mike> +# this is incomplete in the source
 Mike> +#config BR2_PACKAGE_RSH_REDONE_RCP
 Mike> +#	bool "rcp"
 Mike> +#	depends on BR2_PACKAGE_RSH_REDONE
 Mike> +
 Mike> +config BR2_PACKAGE_RSH_REDONE_RLOGIN
 Mike> +	bool "rlogin"
 Mike> +	depends on BR2_PACKAGE_RSH_REDONE
 Mike> +
 Mike> +# requires PAM
 Mike> +#config BR2_PACKAGE_RSH_REDONE_RLOGIND
 Mike> +#	bool "rlogind"
 Mike> +#	depends on BR2_PACKAGE_RSH_REDONE
 Mike> +
 Mike> +config BR2_PACKAGE_RSH_REDONE_RSH
 Mike> +	bool "rsh"
 Mike> +	depends on BR2_PACKAGE_RSH_REDONE
 Mike> +
 Mike> +# requires PAM
 Mike> +#config BR2_PACKAGE_RSH_REDONE_RSHD
 Mike> +#	bool "rshd"
 Mike> +#	depends on BR2_PACKAGE_RSH_REDONE

How useful is this without the server part?

 Mike> +define RSH_REDONE_BUILD_CMDS
 Mike> +	$(MAKE) CC="$(TARGET_CC)" -C $(@D) BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
 Mike> +endef

You seem to be missing TARGET_CFLAGS / TARGET_LDFLAGS?


 Mike> +
 Mike> +define RSH_REDONE_INSTALL_TARGET_CMDS
 Mike> +	if [ -n "$(rsh-redone-bin-y)$(rsh-redone-sbin-y)" ] ; then \
 Mike> +		$(RSH_REDONE_BUILD_CMDS) DESTDIR=$(TARGET_DIR) \
 Mike> +			$(if $(rsh-redone-bin-y),install-bin) \
 Mike> +			$(if $(rsh-redone-sbin-y),install-sbin); \
 Mike> +	fi
 Mike> +endef

Does this do anything else than just copying the binaries? If not, it
might be simpler to just do a

for i in $(rsh-redone-bin-y); do $(INSTALL) -m 755 -D $$i $(TARGET_DIR)/usr/bin/$$i; done
for i in $(rsh-redone-sbin-y); do $(INSTALL) -m 755 -D $$i $(TARGET_DIR)/usr/sbin/$$i; done

 Mike> +
 Mike> +define RSH_REDONE_UNINSTALL_TARGET_CMDS
 Mike> +	rm -f $(patsubst %,$(TARGET_DIR)/usr/bin/%,$(rsh-redone-bin-y))
 Mike> +	rm -f $(patsubst %,$(TARGET_DIR)/usr/sbin/%,$(rsh-redone-sbin-y))

We normally use addprefix rather than patsubst.

-- 
Bye, Peter Korsgaard
