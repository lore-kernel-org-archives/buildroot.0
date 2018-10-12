From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Oct 2018 09:16:05 -0500
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <CANQCQpYGujfVH426cGYixee6YedMscbuoi8z5b0_FOc7rKTAxw@mail.gmail.com>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
 <CAPi7W80_9pcSwfX53xDC8TzgmGLuJ+rwK_T0MyKCOaunMUQNJw@mail.gmail.com>
 <20181010211419.22632881@windsurf>
 <CANQCQpbvQX1JcX0823ZFhrhN=XoPb5opPNbGBRZDko1BzviDFw@mail.gmail.com>
 <20181011085017.7025cf45@windsurf>
 <CANQCQpYGujfVH426cGYixee6YedMscbuoi8z5b0_FOc7rKTAxw@mail.gmail.com>
Message-ID: <CANQCQpZSu-hqEA4bxYbM04TziFgEu65QmGihubP5vM8zzfiL3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Oct 11, 2018 at 10:57 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
>
> On Thu, Oct 11, 2018 at 1:50 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Wed, 10 Oct 2018 16:25:41 -0500, Matthew Weber wrote:
> >
> > > Adam, did you have something in the works for this one?  I seem to
> > > remember some discussion on the one "whole" thread above related to
> > > breaking the dependency.  I'd make the change but I don't have a valid
> > > test case.
> >
> > Well, Arnout statement was that the build dependency is not necessary
> > because python3 can dlopen() at runtime the libuuid.so library. Indeed
> > the code in Python3 is here to do that, but as I explained in
> > http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html,
> > it doesn't seem to work, at least in the Buildroot context.
> >
>
> I dug through this a bit more and found that the c library is
> providing the implementation for uuid.uuid1() when uuid_generate_time*
> is probed for in libraries using ctypes.  I believe that the
> util-linux libuuid would come into play if the extension module
> approach worked (all the configure tests currently fail which disable
> use of python3-3.7.0/Modules/_uuidmodule.c).
>
> I believe the right fix for now is cleaning up the current approach
> (removing the ability to enable/disable uuid and the util-linux
> dependency) as it looks like python can support uuid by default with
> the current glibc.  My guess is we'll see build failures with the
> other std libraries....
>

http://patchwork.ozlabs.org/patch/983070/
