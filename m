From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:37:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: Fix build with
	BR2_ENABLE_DEBUG=yes
References: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019173111.07415809@free-electrons.com>
Message-ID: <XnsA3CBBD724C3D2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141019173111.07415809 at free-
electrons.com:

> I don't quite understand what's going on here. You need both a patch
> *and* passing --disable-expert-mode to get --enable-debug to work? What
> is the relation between the two?

http://beecrypt.cvs.sourceforge.net/viewvc/beecrypt/beecrypt/configure.ac?
revision=1.85&view=markup

The source of the problem is in line 25:
configure fails when both expert-mode and debug are enabled.

When the test in line 16 is positive, that means $CFLAGS is not empty, 
expert mode is enabled, regardless of the options passed to configure.

So I needed a patch to have real control over expert mode and a configure 
option to disable it, which is a bad idea anyway...

> In our case, I would expect to always use --enable-expert-mode, since
> we do want beecrypt to use Buildroot CFLAGS, not its own CFLAGS.

Correct. I should have ported over all the Gentoo patches in the first 
place;)

Beecrypt has its own CFLAGS defined in acinclude.m4, Gentoo removes all of 
them:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-
libs/beecrypt/files/beecrypt-4.2.1-build-system.patch?revision=1.2
&view=markup

and builds the package with expert mode disabled. line 56:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-
libs/beecrypt/beecrypt-4.2.1-r1.ebuild?revision=1.2&view=markup

They also fixed the gcc-4.7 problem with a source code patch:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-
libs/beecrypt/files/beecrypt-4.2.1-gcc-4.7.patch?revision=1.1&view=markup

instead of adding a gcc option to CXXFLAGS like we do:
http://git.buildroot.net/buildroot/commit/package/beecrypt/beecrypt.mk?id=
74da2cca30852cc12c5f6e83be39e301aff74d62

Currently I am running a test compile with the complete backport from 
Gentoo, stay tuned ;)

Regards, Bernd
