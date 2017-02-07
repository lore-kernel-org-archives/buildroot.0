From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2017 17:55:23 +0100
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
 files
In-Reply-To: <o7araj$clq$1@blaine.gmane.org>
References: <o7araj$clq$1@blaine.gmane.org>
Message-ID: <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-02-17 22:54, Grant Edwards wrote:
> I've been chasing a bug in a package for a couple days, and have been
> baffled because the executable failed with segfault when it was built
> from a local package.tar.gz file located in thepackage directory
> (where the package.mk file is).  However, if I unpack package.tar.gz
> and then set the SITE_METHOD to LOCAL, the executable works fine.
> 
> After comparing build trees that worked with build trees that failed,
> I finallythat setting SITE_METHOD = LOCAL prevents the application of
> the .patch files present in the package directory. 

 It does. The technical reason for that is that SITE_METHOD = local is
implemented using _OVERRIDE_SRCDIR, and for that we don't want to apply patches
because the typical use case is to build some different version to which the
patches wouldn't apply anyway.

 Also, when you set SITE_METHOD = local, there should be no reason to apply
patches because you can just as well apply them in your custom tarball.

> I don't find this behavior documented anywhere.  The description of
> SITE_METHOD only says it affects how the sources are fetched.  It
> doesn't say anything about it controlling whether or not patches are
> applied.  Is it interaction intentional, or is it a bug?

 Indeed, it should be documented. Care to send a patch?

 Regards,
 Arnout

> 
> [FWIW, the package in question is the most recent version of the ipkg
> package, and the 0001-fix-musl-build.patch is what breaks it.  Since
> that package has already been removed, I won't bother to file a bug
> report.]
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
