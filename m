From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 18 Mar 2016 09:59:21 +0100
Subject: [Buildroot] [PATCH 2/2] cdebootstrap: new package
In-Reply-To: <20160317213043.76ad9bb5@free-electrons.com>
References: <1458227200-19903-1-git-send-email-benoit.allard@greenbone.net>
 <1458227200-19903-2-git-send-email-benoit.allard@greenbone.net>
 <20160317213043.76ad9bb5@free-electrons.com>
Message-ID: <20160318095921.1e14ea06@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Mar 2016 21:30:43 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Beno?t,
> 
> On Thu, 17 Mar 2016 16:06:40 +0100, Beno?t Allard wrote:
> > cdebootstrap is used to create a Debian base system from scratch.
> > 
> > Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> 
> Could you give some details about the use case for such a package?
> 
> It seems somewhat weird, in the context of Buildroot, to use
> cdebootstrap on the target.

Sure, looks like it's time for me to explain a bit our use-case of
buildroot.

Greenbone is selling Debian-based Network appliances. Those
appliances have a flash (recovery) partition next to their main
hard-disk(s). The goal of this partition is to recover the
appliance in case of troubles, and one of the options we offer there
is to perform a 'Factory-Reset' during which the whole system will be
wiped, formatted and installed from scratch again. To do that, we need
(among others) 'cdebootstrap'. We like the system on that flash
partition to be as small and dedicated as possible. Previously, we did
that with some kind of stripped-down statically-linked homegrown
gentoo/arch and **a lots** of magic. I believe you can understand our
relief when we discovered the buildroot project. Kudos to you all
there !

This same partition, we also burn it on CD, and copy it on USB stick to
perform the initial install of our system, hence all the questions
around iso9660 and syslinux as well.

I'll address the remarks to the patch in a new version of it.

> 
> > diff --git a/package/cdebootstrap/Config.in
> > b/package/cdebootstrap/Config.in new file mode 100644
> > index 0000000..0ed9bfe
> > --- /dev/null
> > +++ b/package/cdebootstrap/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_CDEBOOTSTRAP
> > +	bool "cdebootstrap"
> > +	select BR2_PACKAGE_LIBCURL
> > +	select BR2_PACKAGE_LIBDEBIAN_INSTALLER
> > +	select BR2_PACKAGE_ZLIB
> > +	select BR2_PACKAGE_BZIP2
> > +	select BR2_PACKAGE_XZ
> 
> Whenever possible, alphabetic ordering is preferred (though I agree it
> is not a rule we comply with everywhere in Buildroot).
> 
> > +	help
> > +	  cdebootstrap generates systems from scratch for Debian
> > and\
> > +	  derivates.
> 
> The trailing \ is not good.
> 
> > diff --git a/package/cdebootstrap/cdebootstrap.hash
> > b/package/cdebootstrap/cdebootstrap.hash new file mode 100644
> > index 0000000..eb0783e
> > --- /dev/null
> > +++ b/package/cdebootstrap/cdebootstrap.hash
> > @@ -0,0 +1,3 @@
> > +#Locally computed
> > +sha256
> > e33fe2c245894ab40dc4db764f31a0bf59cc80c34d9ebf2e71b715e49631bb34
> > cdebootstrap_0.6.4.tar.gz +
> 
> Useless empty line here.
> 
> > diff --git a/package/cdebootstrap/cdebootstrap.mk
> > b/package/cdebootstrap/cdebootstrap.mk new file mode 100644
> > index 0000000..172b83f
> > --- /dev/null
> > +++ b/package/cdebootstrap/cdebootstrap.mk
> > @@ -0,0 +1,17 @@
> > +################################################################################
> > +#
> > +# cdebootstrap
> > +#
> > +################################################################################
> > +
> > +CDEBOOTSTRAP_VERSION = 0.6.4
> > +CDEBOOTSTRAP_SOURCE = cdebootstrap_$(CDEBOOTSTRAP_VERSION).tar.gz
> > +CDEBOOTSTRAP_SITE =
> > http://http.debian.net/debian/pool/main/c/cdebootstrap
> 
> Those URLs are not stable, you should use snapshot.debian.org instead.
> Grep for snapshot.debian.org in Buildroot.
> 
> > +CDEBOOTSTRAP_LICENSE = GPLv2
> > +CDEBOOTSTRAP_LICENSE_FILES = debian/copyright
> > +CDEBOOTSTRAP_INSTALL_STAGING = NO
> > +CDEBOOTSTRAP_INSTALL_TARGET = YES
> 
> Those two lines are not needed, since it's the default value.
> 
> > +CDEBOOTSTRAP_CONF_OPTS = 
> 
> Not needed.
> 
> > +CDEBOOTSTRAP_DEPENDENCIES = libcurl libdebian-installer zlib bzip2
> > host-pkgconf xz
> 
> Thanks!
> 
> Thomas

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160318/500202cf/attachment.asc>
