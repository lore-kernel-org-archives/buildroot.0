From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Wed, 25 Sep 2019 10:13:21 +0200
Subject: [Buildroot] [PATCH 0/5 v3] openrc: further itegration (branch
 yem/openrc)
In-Reply-To: <20190925091826.5ac104f8@windsurf>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
 <20190923231240.3690e2c4@windsurf>
 <20190924082158.tbxjx6pxvfjpuctm@c-ml-p3510.redembedded.pl>
 <20190924215056.fzhyg7mqswfdadct@c-ml-p3510.redembedded.pl>
 <20190925091826.5ac104f8@windsurf>
Message-ID: <20190925081321.mb5eut2ys7z7x7fd@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 2019-09-25 09:18:26, Thomas Petazzoni wrote:
> Hello Michal,
> 
> On Tue, 24 Sep 2019 23:50:56 +0200
> michal.lyszczek at bofc.pl wrote:
> 
> > It looks like openrc is starting `keymaps' service, which means
> > BR2_TARGET_GENERIC_TERM_KEYMAP is enabled, but this config depends on
> > BR2_INIT_OPENRC && BR2_PACKAGE_KBD, (related snipet):
> 
> I'm not sure which version of Buildroot you're looking at, but there is
> no option named BR2_TARGET_GENERIC_TERM_KEYMAP in current Buildroot
> master.
> 
> > keymaps service is disabled in package/openrc/openrc.mk
> 
> And there's no such code in openrc.mk in Buildroot master.
> 
> Perhaps you're looking at some local branch you have, with some patches
> that are not in upstream Buildroot at this point ?

Right, so it would seem you are missing these 2 patches

https://patchwork.ozlabs.org/patch/1098589/
https://patchwork.ozlabs.org/patch/1098588/

I remember Yann saying it would be nice to have this in every init system,
not only openrc. This is probably the reason why these 2 were not merged.
But honestly I don't really know what changes to make to make these patches
generic to all init systems. The only common parts are:


> config BR2_TARGET_GENERIC_TERM_KEYMAP
> 	string "Set terminal keymap"
> 	default "us"
> 	depends on BR2_INIT_OPENRC && BR2_PACKAGE_KBD
> 	help
> 	  Configures all virtual terminals (on /dev/tty[1-12]) to use
> 	  specified keymap. List of keymaps are installed in /usr/share/keymaps.
> 	  Set to empty, to keep default keymap.

and

> choice
> 	prompt "Terminal encoding"
> 	default BR2_TARGET_GENERIC_TERMENCODING_KEEP
> 	depends on BR2_INIT_OPENRC
> 	help
> 	  Set terminal encoding. This makes sense only when you are going to
> 	  use virtual terminals with external monitor (or qemu) that uses
> 	  /dev/tty[1-12].
> 
> config BR2_TARGET_GENERIC_TERMENCODING_KEEP
> 	bool "keep default"
> config BR2_TARGET_GENERIC_TERMENCODING_ASCII
> 	bool "ascii"
> config BR2_TARGET_GENERIC_TERMENCODING_UTF8
> 	bool "utf-8"
> endchoice


Which for me look generic enough to be used in other init systems, we just
have to remove `depends on BR2_INIT_OPENRC' (or add deps on another init)
once it is implemented in others inits. Other changes regarding these
features are done in package/openrc/openrc.mk.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190925/d99fe2c6/attachment.asc>
