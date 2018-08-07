From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Aug 2018 08:59:17 -0500
Subject: [Buildroot] How to retain intentional absolute RPATH for target
 application?
In-Reply-To: <20180807133607.GI13619@australia.be.alcatel-lucent.com>
References: <20180801141713.GT21354@australia>
 <20180807133607.GI13619@australia.be.alcatel-lucent.com>
Message-ID: <CANQCQpYJaDdKQm6N1kc=mi62zKr4SauCcoJjfeeKymPkr==QCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Tue, Aug 7, 2018 at 8:35 AM Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com> wrote:
>
> On Wed, Aug 01, 2018 at 04:17:13PM +0200, Thomas De Schampheleire wrote:
> > Hi,
> >
> > I have an application that has an RPATH containing (among some automatically
> > present values) an absolute path which is present on target but not a standard
> > search path, say /opt/foobar/lib , and also as first entry $ORIGIN/../lib.
> > The application is stored in /opt/foobar/bin.
> >
> > Testing on target in a case where fix-rpath is not used (old buildroot version)
> > shows that the first entry in RPATH is used, i.e. $ORIGIN/../lib, resolving to
> > /opt/foobar/bin/../lib.
> >
> > When going to current buildroot including fix-rpath, this application cannot be
> > loaded because the libraries are not found. Analysis shows that only standard
> > search paths are considered.
> >
> > Manually checking the patchelf step shows that the RPATH is completely cleared.
> > I found a patch by Bryce Ferguson regarding endianness problems on PPC (this is
> > indeed a PPC target), but although it is applied and fixes the display of the
> > RPATH field in readelf after running fix-rpath, the actual issue remains:
> > RPATH is empty after running fix-rpath.
> >
> > My question is now: how to allow preserving such an intentional RPATH, or at
> > least make sure that the libraries in /opt/foobar/lib are found?
>

My first approach would be to expose the "TARGET_EXCLUDEPATHS"
variable in fix-rpath to be something you can kconfig set additional
values for so that the support/scripts/fix-rpath could be called with
more exclusions of folders/files.

Matt
