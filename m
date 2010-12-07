From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 15:54:57 -0500
Subject: [Buildroot] [PATCH v2] rsh-redone: new package for rsh/rlogin
	clients
In-Reply-To: <87r5dtu9ht.fsf@macbook.be.48ers.dk>
References: <1290122441-7320-1-git-send-email-vapier@gentoo.org>
	<1290145224-21076-1-git-send-email-vapier@gentoo.org>
	<87r5dtu9ht.fsf@macbook.be.48ers.dk>
Message-ID: <201012071554.58601.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 07, 2010 06:07:26 Peter Korsgaard wrote:
>  Mike> +# requires PAM
>  Mike> +#config BR2_PACKAGE_RSH_REDONE_RSHD
>  Mike> +#	bool "rshd"
>  Mike> +#	depends on BR2_PACKAGE_RSH_REDONE
> 
> How useful is this without the server part?

i use rshd from inetutils.  ive never tested rshd from this since it requires 
pam (as already documented).  someone else can if they care.

>  Mike> +
>  Mike> +define RSH_REDONE_INSTALL_TARGET_CMDS
>  Mike> +	if [ -n "$(rsh-redone-bin-y)$(rsh-redone-sbin-y)" ] ; then \
>  Mike> +		$(RSH_REDONE_BUILD_CMDS) DESTDIR=$(TARGET_DIR) \
>  Mike> +			$(if $(rsh-redone-bin-y),install-bin) \
>  Mike> +			$(if $(rsh-redone-sbin-y),install-sbin); \
>  Mike> +	fi
>  Mike> +endef
> 
> Does this do anything else than just copying the binaries? If not, it
> might be simpler to just do a
> 
> for i in $(rsh-redone-bin-y); do $(INSTALL) -m 755 -D $$i
> $(TARGET_DIR)/usr/bin/$$i; done for i in $(rsh-redone-sbin-y); do
> $(INSTALL) -m 755 -D $$i $(TARGET_DIR)/usr/sbin/$$i; done

i prefer to let the package build system do these simple steps to avoid 
worrying about changes in between version bumps.  this proposal for examples 
misses set*id on the binaries, and i'm not entirely sure it is more simple.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/032f0e7e/attachment.pgp>
