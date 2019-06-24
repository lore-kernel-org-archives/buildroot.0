From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:52:48 +0200
Subject: [Buildroot] [PATCH] host-localedef: Compile against glibc-2.29
In-Reply-To: <20190619134812.4bd672e7@windsurf> (Thomas Petazzoni's message of
 "Wed, 19 Jun 2019 13:48:12 +0200")
References: <20190619020707.3798-1-sam@mendozajonas.com>
 <20190619134812.4bd672e7@windsurf>
Message-ID: <87k1dan7cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed, 19 Jun 2019 12:07:07 +1000
 > Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:

 >> In glibc 2.27 the following change occurred:
 >> "Statically compiled applications attempting to load locales compiled
 >> for the GNU C Library version 2.27 will fail and fall back to the
 >> builtin C/POSIX locale."
 >> 
 >> This impacts us since upstream buildroot uses a localdef built against
 >> an older eglibc release [0].
 >> 
 >> This is a combination of my patch to move to glibc and Peter Seiderer's
 >> patch to avoid building all of glibc just for localedef.
 >> 
 >> [0] https://bugs.busybox.net/show_bug.cgi?id=11096
 >> 
 >> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
 >> [localedef build & fixups:]
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> This is an update to a previous very similar patch, but updated for
 >> glibc 2.29 now that Buildroot has moved to it.

 > So, since it's been a problem pending for way too long, I applied your
 > patch to master. I however did a change: make sure we re-use the glibc
 > tarball if possible. To do this:

 >  - I defined LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz and
 >    HOST_LOCALEDEF_DL_SUBDIR = glibc

 >  - I changed the hash file because the tarball is now named
 >    glibc-<version>.tar.gz

 > I also wondered about making localedef.hash a symlink to glibc.hash,
 > but that would require updating the symlink everything the glibc
 > version is updated, because glibc.hash is in a version-specific folder.

 > Overall, I am wondering if we shouldn't give up on this host-localedef
 > package and in fact move this to a host-glibc package. Indeed that's
 > really what we're doing here: build a host-glibc package.

 > The only issue with doing this is the "HACK" patch. Indeed, how to make
 > sure this patch will apply to all glibc versions we support ?

 > But since the locale problem has been around for a long time, I
 > preferred to apply your approach now, we can always improve things
 > later if we think it's useful.

Committed to 2019.05.x, thanks.

2019.02.x is using glibc-2.28. Is using this 2.29-based localedef the
right solution for 2019.02.x, or should we be using something 2.28
based?

-- 
Bye, Peter Korsgaard
