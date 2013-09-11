From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Sep 2013 19:27:09 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
Message-ID: <20130911172709.GB3410@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Thomas, All,

On 2013-09-11 10:55 -0500, Ryan Barnett spake thusly:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/11/2013 
> 02:17:00 AM:
> > On Tue, 10 Sep 2013 20:32:32 -0500, rjbarnet at rockwellcollins.com wrote:
> > > Thank you so much for this patchset as it address the biggest issue 
> that
> > > my company currently has with buildroot and will help us become a much 
> 
> > > bigger
> > > contributer to buildroot since we can move to a model that is 
> conducive to
> > > contributing changes back up to buildroot.
> > 
> > Glad to hear this!

Yes, indeed. It's good to read this would in the end allow people to
contribute more instead of /fighting the system/ ! :-)

> I'll give bit more detail on how patch could allow our company to be
> better contribute back to the buildroot project with this change. During 
> development of a project, we could use git to track mainline and any 
> third party package that we add support for, we would contribute them 
> back upstream. The hope would be that by the time we get to the point
> where we have to lock into a specific version of buildroot, our changes
> would have been incorporated into buildroot. If not, we could move the
> packages that were rejected into the BR2_EXTERNAL location but still
> be able to use an off-the-shelve version of buildroot.

That's funny, because I would have expected exactly the opposite: do
everything in BR2_EXTERNAL, and move them to Buildroot just before
upstreaming them.

But if you (and others) see BR2_EXTERNAL as a faillover for stuff that
could not be upstreamed before you settle on a version of Buildroot,
then I have to say that I'm really happy to read that. :-)

So many companies only upstream their work after-the-fact that it is
indeed a relief to find some that do actually want to push as much as
possible upstream first. Kuddos to you! :-)

> > Ok. Note that after I posted my patches, I had a discussion with Yann
> > Morin on IRC and he was skeptical about it, for two reasons:
> > 
> >  (1) Almost all of what BR2_EXTERNAL allows is possible today with the
> >      current Buildroot. For board level stuff, nothing forces you to
> >      store it in board/<foo>/ within the Buildroot tree: all of the
> >      configuration options in Buildroot can use
> >      $(TOPDIR)/../company/<foo>/ to reference a kernel configuration
> >      file, or a root filesystem overlay.
> > 
> >      For packages, the 'local.mk' file is already automatically
> >      included in Buildroot if it exists. So you can create such a file
> >      and put a "include $(TOPDIR)/../company/external.mk' line in it.
> >      This external.mk will include all the makefiles of the external
> >      packages. Since Config.in can't be integrated as easily, one
> >      solution would be to hardcode BR2_PACKAGE_FOOBAR=y directly within
> >      external.mk to have it always enabled.
> 
> That just becomes nasty and doesn't really easily allow for different 
> configurations where you don't always want all your propriety packages
> to build. Also it doesn't make your propriety packages visible within
> the buildroot menuconfig. The other nice feature is the is that company's
> configs are automatically pulled in a separate area.

The way *I* see this is that Buildroot is not the main /frontend/ of the
build system, but rather a backend. That's the way I use it: I have a
kind of /upper-layer/ build system that uses Buildroot as a kind of
/backend/. I've already introduced it briefly here some time ago, and
wanted to make it a bit more complete before a real annoucement, but
here it is if you want to have a look (it's been public all the time
sicne the beginning  anyway):
    http://ymorin.is-a-geek.org/git/buildroot.config/

(Note, this thread is not about the above, so I think we should not
discuss it further in this thread; let's start another thread if people
are interested).

> >      So, it's already possible today, but I believe the current
> >      situation is (a) not very easy to use, and (b) not visible enough.
> >      (b) could be solved by more documentation, but I believe
> >      BR2_EXTERNAL does not make Buildroot more complicated and solves
> >      (a) quite nicely.
> 
> I definitely agree

Although I do not like the idea on a philosophical point of view, I
agree there is such a need, even more so since you're not the first to
come up with, and try to address, this issue.

So I'm all for making people's lives^Wwork easier, and Thomas' patchset
looks pretty rad (I haven't tested it yet, but I think I could even use
it from my Buildroot.config project! ;-) )

> >  (2) Yann's feeling was that by giving a too easy solution to keep
> >      things out of tree would discourage BR users from contributing
> >      their new packages upstream, since they can keep it outside of the
> >      tree nicely. While I certainly admit it can be the case, your
> >      introduction to this e-mail interestingly points exactly the
> >      opposite :-)
> 
> While I do understand Yann's concerns, however, I do think that this goes
> against buildroot's philosophy - "Buildroot: make Embedded Linux easy". 
> Right now it isn't easy for one to make customization to buildroot without
> modifying buildroot's source.
> 
> Yann - I would welcome you input into this discussion on mailing list 
> here.

Yes, as I said above, I would have expected companies (well, people at
companies) be stressed by projects deadlines, and that they would work
in BR2_EXTERNAL, and only try to upstream later, when it would be too
late (for them!) to have proper reviews, since they would be internally
committed to their changes in BR2_EXTERNAL, and we would not be able to
take their changes.

But if people use BR2_EXTERNAL as a fallback for anything that did not
make it upstream (by lack of time, or of interest), or for purely
internal stuff, then I don't see a reason for concern. All the better! :-)

> I'm probably beating this issue to death but I guess I'm very excited 
> about
> the possibilities that this patchset opens up for my company.

Not speaking for the others, but I for one am very exited by this
patchset too, if it makes people very exited about what it will allow
them to submit back upstream! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
