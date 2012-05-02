From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 May 2012 09:34:37 +0200
Subject: [Buildroot] gnupg patch
In-Reply-To: <4FA04473.4070308@essensium.com>
References: <4FA04473.4070308@essensium.com>
Message-ID: <20120502093437.0194efcb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stijn,

Le Tue, 01 May 2012 22:15:47 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> I've attached a patch that adds packages for gnupg and some related 
> libraries. I thought this might be useful for other people. Feel free to 
> merge it or send me feedback.

Thanks, this looks generally quite good, though I have a number of
comments about your patch:

 *) It should be split in several patches, one patch per package you're
    adding.

 *) The patches should be sent inline and not as attachment, in order
    to ease the review process. See
    http://elinux.org/Buildroot_how_to_contribute for a few details on
    a suggested workflow to send Buildroot patches.

Now the comments themselves:

 *) In package/gnupg/Config.in, why do you need to depend on a GLIBC
 external toolchain? The indentation of this depends line is wrong, it
 should be one tab. The indentation of the help text is wrong, it
 should be one tab + two spaces, and there should be one empty line
 between the help text and the upstream URL.

 *) In package/gnupg/gnupg.mk, you should prefer '=' over ':='. The
 HOST_GNUPG_DEPENDENCIES line is useless, because the host dependencies
 are automatically derived from target dependencies (if they are
 equivalent, of course, which apparently is the case here). But in the
 first place, why do you need to build gnupg for the host here? What is
 the use case? In the same file, there is a small indentation problem
 in GNUPG_CONF_OPT (spaces instead of tabs on the first two lines)

 *) package/libassuan/Config.in lacks an upstream URL.

 *) package/libassuan/libassuan.mk. Copy/paste error in the comment at
 the beginning of the file. Same comment as gnupg for host dependencies
 derived automatically from target dependencies.

 *) libgcrypt/libgpg-error: you need to add the host variant for
 host-gnupg, but why do you need host-gnupg?

 *) package/libksba/COnfig.in: missing upstream URL

 *) package/libksba/libksba.mk: copy/paste error in comment. Same
 comment as before: do we really need the host variant?

 *) package/libpth/Config.in: the help text is missing.

 *) The second patch of package/libpth needs a bit more explanations.
 "Changed Makefile" is not an useful commit log :)

 *) In libpth.mk, same copy/paste error, and same question about the
 host variant.

Otherwise, looks like a really good starting point.

Apparently, you have only tested this against glibc (per your
dependency). In order to get these patches merged, you should also
build them against uClibc, which also to check whether locale support
is needed, or largefile support, or some other toolchain option that
Buildroot makes optional when building an uClibc toolchain.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
