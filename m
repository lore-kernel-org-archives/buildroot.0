From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 26 Oct 2009 23:00:02 +0100
Subject: [Buildroot] [PATCH] netkitftp: added package with
 Makefile.autotools.in support
In-Reply-To: <8763a1dfgm.fsf@paranoid.sweethome>
References: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
	<1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<874opmf2pe.fsf@macbook.be.48ers.dk>
	<8763a1dfgm.fsf@paranoid.sweethome>
Message-ID: <1256594402.8809.251.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 26 octobre 2009 ? 22:15 +0100, Hugues a ?crit :
> Hello,

> >  Hugues> diff --git a/package/netkitftp/netkitftp-configure.patch b/package/netkitftp/netkitftp-configure.patch
> >
> > That one as well.
> 
> Well... This one was already packaged with the package I've got, I don't
> have any idea why it is needed. I'll check this and then verify if it is
> really needed (hope it is not :-) )

It prevents the launch of cross compiled binaries which would make exit
the configure script.

> 
> >  Hugues> +++ b/package/netkitftp/netkitftp.mk
> >  Hugues> @@ -0,0 +1,23 @@
> >  Hugues> +#############################################################
> >  Hugues> +#
> >  Hugues> +# netkitftp
> >  Hugues> +#
> >  Hugues> +#############################################################
> >  Hugues> +NETKITFTP_VERSION:=0.17
> >  Hugues> +NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
> >  Hugues> +NETKITFTP_PATCH:=netkit-ftp_0.17-16.diff.gz
> >  Hugues> +NETKITFTP_SITE:=ftp://ftp.debian.org/debian/pool/main/n/netkit-ftp/
> >
> > Is that a stable URL? Would something on snapshot.debian.net be better?
> > We have BR2_DEBIAN_MIRROR, which should be used.
> 
> Oh, that's right !
> I'll correct this.
> 
> >  Hugues> +
> >  Hugues> +NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
> >
> > Something regarding TARGET_DIR at configure time? Doesn't that leak
> > paths on the build host to the installed binaries?
> 
> Well, I didn't investigated further,  maybe is this not needed. I'll try
> without and throw then this out, if not.
> Or comment it, if needed :o)
> 

That package's makefile/configure is definitely strange...
I just gave it a look and it seems INSTALL_PREFIX is not handled
anywhere in the package.
So you can probably drop it from the NETKITFTP_INSTALL_TARGET_OPT
variable.

> > Also don't forget to touch $@ so the target isn't always considered out
> > of date.
> 
> Ok. I didn't thought it was  necessary at this state, but if you suggest
> it.. ;-)
> 
> > A comment to why the above is needed in the first place would also be
> > good.
> 
> Ok
> 
> >  Hugues> +
> >  Hugues> +$(NETKITFTP_HOOK_POST_INSTALL):
> >  Hugues> +	rm -vfr $(TARGET_DIR)/usr/man
> >
> > Why verbose?
> 
> Mhmm.. because with the "fr", it makes "vfr", which is a motorbike.. ;o)
> I'll throw it ;)
> 
> > That uninstall would also remove all other man pages, so
> > don't do that.
> 
> Mhmm... I'm not sure I understood this.. Why do you talk about uninstall ?
> The  netkitftp's 'install'  rule  does installs  the  manpages with  the
> binary, without ability  to call just the install  of the binary without
> the manpages.
> So I did like I see in other packages : just delete the 
> $(TARGET_DIR)/usr/man folder... Is this a bad idea ?
> What do you suggest at this stage ? 
> Doing nothing, this will be cleaned later ?
> 

Yeah, I think what Peter wanted to tell is that man pages cleaning as
well as locales cleaning is handled globaly by buildroot that the end of
the generation process and depending on your config file.

See top Makefile :

ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
TARGETS+=target-purgelocales
endif

We probably have to make a pass on all unmaintained/old packages to fix
that.

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
