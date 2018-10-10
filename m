From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Oct 2018 16:25:41 -0500
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010211419.22632881@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
 <CAPi7W80_9pcSwfX53xDC8TzgmGLuJ+rwK_T0MyKCOaunMUQNJw@mail.gmail.com>
 <20181010211419.22632881@windsurf>
Message-ID: <CANQCQpbvQX1JcX0823ZFhrhN=XoPb5opPNbGBRZDko1BzviDFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Wed, Oct 10, 2018 at 2:14 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Fabrice,
>
> On Wed, 10 Oct 2018 19:57:58 +0200, Fabrice Fontaine wrote:
>
> > > > libboost_chrono shouldn't have been installed: missing select in
> > > boost/Config.in
> > >
> > Can be fixed by https://patchwork.ozlabs.org/patch/960723.
>
> OK.
>
> > > > >          arm |                   boost-1.68.0 | NOK |
> > > http://autobuild.buildroot.net/results/41054f876975214741dccd08eda999a425281b7f
> > > |
> > > >
> > > > libboost_atomic shouldn't have been installed: missing select in
> > > boost/Config.in
> > >
> > Can be fixed by https://patchwork.ozlabs.org/patch/966309.
> > It should be noted that this patch has been merged upstream:
> > https://github.com/boostorg/thread/commit/f7581a366294c6f5381e0371c242af327c6da655
>
> OK, I was still not entirely convinced by this one, but if it has been
> merged upstream, so be it :-)
>
>
> > > > checking for SELINUX... no
> > > > configure: error: SELinux selected but libselinux not found or too old
> > > >
> > > > We've been having this one for a while. Could some SELinux person
> > > > (Matt ? Adam ?) debug this ?
> > >
> > > I can take a look.
> >
> > I worked on this one without finding how to fix it.
> > Here is my finding so I hope it could help you.
> > It seems that the issue is that libselinux is really not built before
> > util-linux. Indeed, we can see in
> > http://autobuild.buildroot.net/results/7b79a5fa265e2387cab421e42b3c946562e4781b/build-time.log,
> > that only libsepol is built.
>
> Aah, thanks for this hint. Then it becomes clear what the problem is:
> we're facing the util-linux -> python3 -> util-linux circular
> dependency. If you look at all the failures at
> http://autobuild.buildroot.net/?reason=util-linux-2.32.1, all of them
> have BR2_PACKAGE_PYTHON3_UUID=y, and this creates a python3 ->
> util-linux dependency. When there is a circular dependency, make
> automatically drops a dependency to avoid the circular loop.
>
> We need to resolve this util-linux -> python3 -> util-linux circular
> dependency. Arnout suggested that python3 can provide uuid
> functionality without libuuid, and I did some tests about this, which I
> reported on the mailing list at
> http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html.
> See the whole thread that starts at
> http://lists.busybox.net/pipermail/buildroot/2018-September/229746.html.
>

Adam, did you have something in the works for this one?  I seem to
remember some discussion on the one "whole" thread above related to
breaking the dependency.  I'd make the change but I don't have a valid
test case.

Matt
