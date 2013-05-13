From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 May 2013 20:20:47 +0200
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
 CFLAGS
In-Reply-To: <51912140.8030901@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <20130513191016.15f0a3f4@skate> <51912140.8030901@zacarias.com.ar>
Message-ID: <20130513202047.6bd6da1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 13 May 2013 14:22:08 -0300, Gustavo Zacarias wrote:

> > After your patch, the -D_LARGEFILE_BLABLA stuff is no longer passed
> > when building this package.
> > 
> > Another example, the feh package. Another one, input-tools. And I'm
> > sure there are more.
> > 
> > So, I agree with the change, but I think it needs a much thorough
> > investigation of which packages are using $(TARGET_CFLAGS) without
> > passing $(TARGET_CPPFLAGS).
> 
> On the build-side of things there aren't any unexpected build failures
> (allyespackageconfig that lead to my latest fixes because of other issues).

Build failures no, but packages not having large file support because
-D_LARGEFILE_BLA is not passed, cerainly.

> This is meant as a first try and i'm sure there will be packages that'll
> need to be modified, but we'd rather do this sooner rather than later,
> specially if we want to push new autotools where -D* isn't acceptable in
> CFLAGS (be it via auto* bump + autoreconf or just plain shipped
> configure in packages based on newer autotools).

Agreed.

> We could also filter out for "strict" (new auto* packages) too, but
> that's a sloppy way downhill.

Yes, we probably don't want to do that.

> I just want to keep this patchset apart from the package-fixing one,
> since it's likely this won't change much and i'm not a fan of 1/N with N
> being a huge number just to add a few patchfixes here/there (with the
> fix patches maybe even getting commited before this patchset - it
> shouldn't hurt).

I believe there should be first an audit of where TARGET_CFLAGS is
used. Then, wherever needed, fixes to ensure both TARGET_CFLAGS and
TARGET_CPPFLAGS are used (or, if possible, usage of
TARGET_CONFIGURE_OPTS). Once those fixes are made, your patch that
separates TARGET_CPPFLAGS from TARGET_CFLAGS can go in.

A quick "grep TARGET_CFLAGS" in package/ gives 110 packages using it.
In most cases, it's probably $(TARGET_CONFIGURE_OPTS) being passed +
CFLAGS="$(TARGET_CFLAGS) -bleh", which is already correct seems
CPPFLAGS is passed. But of course there might be packages that use a
custom Makefile that obeys to CFLAGS but not CPPFLAGS. Not sure what we
can do about these except slowly figuring out that they need fixing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
