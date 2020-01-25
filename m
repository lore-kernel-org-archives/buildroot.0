From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jan 2020 12:01:16 +0100
Subject: [Buildroot] [PATCH] package/linux: fix LINUX_PKGDIR with
 br2-external linux-extensions
In-Reply-To: <20200124213855.23215-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 24 Jan 2020 22:38:55 +0100")
References: <20200124213855.23215-1-yann.morin.1998@free.fr>
Message-ID: <87wo9fu7er.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When 'make' includes a new Makefile, it appends its path to the MAKEFILE_LIST
 > variable. From that variable, we construct a few set of derivative
 > variables:
 >     pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
 >     pkgname = $(lastword $(subst /, ,$(pkgdir)))

 > Essentially, pkgdir is the full directory where the package is located
 > (either relative to Buildroot's top directory for in-tree packages, or
 > absolute for packages in br2-external trees), while pkgname is the last
 > component of that directory.

 > pkgdir is in turn used to seed FOO_PKGDIR.

 > This all happens when we eventually call the package-generic infra,
 > later down in the file.

 > When they are parsed, the Makefiles for each linux-extensions are
 > appended to MAKEFILE_LIST, after the linux.mk one. But since they are
 > located in the same directory as the main linux.mk, the last component
 > of MaKEFILE_LIST, which is no longer the main linux.mk, will still yield
 > the correct values for the linux package.

 > This is a tough assumption we made there and then.

 > When we added the support for br2-external linux extensions, we where
 > very cautious to explicitly scan them from a directory named 'linux', so
 > that this would yield the correct package name.

 > And that worked well so far, until someone needed to build an older
 > kernel, for which our conditional patch is needed, and which just
 > failed:

 >     /bin/bash: [...]/buildroot-external-linux-test/linux//0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional: No such file or directory

 > When we scan linux extensions from a br2-external tree, the last
 > component of MAKEFILE_LIST is no longer in the same directory as the
 > main linux.mk, and thus the assumption above falls to pieces...

 > Again, when we added support for linux extensions from br2-external,
 > although we cared about the package name (pkgname), we completely missed
 > out on the package directory, and the LINUX_PKGDIR variable.

 > We do not have a very clean way out of this mess, but we have a nice
 > dirty trick scan the linux extensions from a br2-external tree before we
 > scan the in-tree ones. That way, the last component of MAKEFILE_LIST is
 > back to one that is in the same directory as the main linux.mk, and
 > we're back on tracks.

 > This is still very fragile, though, but short of a complete overhaul on
 > how packages are parsed and evaluated, this is the best we can come in
 > short order.

 > Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Heiko Thiery <heiko.thiery@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Quite a mess, but a very nice commit message.

Committed, thanks.

-- 
Bye, Peter Korsgaard
