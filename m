From: Bob Beckett <bbeckett@netvu.org.uk>
Date: Mon, 4 Jun 2018 17:54:30 +0100
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <20180604165210.GA23325@g751.home>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604154433.GA3700@scaer>
 <CAESO2EJ7pwkrsrmarwBkpS7SswumuepmCYo01x2j0xpMmhGUCg@mail.gmail.com>
 <20180604165210.GA23325@g751.home>
Message-ID: <CAESO2EKCoO3rZjLHnag3Ag-_WnMSgHcWbv8tnPW0z8GQ89azGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 4, 2018 at 5:52 PM, Gary Bisson <gary.bisson@boundarydevices.com
> wrote:

> Hi Bob
>
> On Mon, Jun 04, 2018 at 05:32:41PM +0100, Bob Beckett wrote:
> > Thanks for the more in depth explanation.
> >
> > I agree with all of the reasons outlined for the purpose of being purely
> a
> > reproducible build manager, which buildroot only ever aimed to be.
> >
> > However, people do use it during development, and with a reasonably large
> > number of custom packages all in development at the same time, using the
> > _OVERRIDE_SRCDIR method to test latest versions of multiple packages
> > becomes very unwieldy.
> > My solution so far has been to point the version at the branch that
> active
> > development is taking place on, and removing the build directories and
> > packages for the specific projects each time.
> > When I am not the one doing the development on each package's source, but
> > am developing the rootfs, this means I dont have to manually keep
> updating
> > my local git repositories for each project.
> > Once each package has hit their first release version, they do get tagged
> > and the release branch for the project's BR2_EXTERNAL directory gets
> > updated with those versions, and each version thereafter, but the
> > development branch for the external directory persistently stays on the
> > development branch head for each package.
> >
> > Regarding not knowing the sha before a checkout, would git ls-remote not
> > suffice for this? e.g.
> >
> > $ git ls-remote git at gitlab.com:adhlinux/buildroot/buildroot.git master
> > 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/heads/master
> > 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/remotes/upstream/master
>
> Yes 'ls-remote' is actually a good option. You could have the following
> package version during development:
> FOO_VERSION = $(shell git ls-remote URL branch | awk '{ print $$1 }')
>
> Then it would pick up any change automatically until you finish your dev
> and change the FOO_VERSION to a proper ID.
>
>
Thats actually a cracking idea. I like it (and I'm not sure why I didnt
think of it when suggesting it for detecting outdated named head versions
:) )


> > It would allow you to check for changes in sha without doing a new fetch.
> >
> > Oh well, not to worry. Ill keep it as a local patch, as I suspect I am
> > treading old ground of "buildroot is not a development platform" (Ive
> seen
> > this discussion come up multiple times before).
>
> Yes that will most likely not be included inside BR infrastructure but that
> should be a perfectly fine option for your custom package.
>
> Regards,
> Gary
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/9fb1398c/attachment.html>
