From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 28 Jun 2018 18:46:15 +0000
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <20180628032558.b4bgdv2qdpzssean@tarshish>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
 <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
 <CAPi7W82zbZLPORsXG989MfnFVitVEFELC1FU1GDGk_0n19oMDA@mail.gmail.com>
 <20180628032558.b4bgdv2qdpzssean@tarshish>
Message-ID: <1530211574.2283.39.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-06-28 at 06:25 +0300, Baruch Siach wrote:
> Hi Fabrice,
> 
> On Wed, Jun 27, 2018 at 06:24:34PM +0200, Fabrice Fontaine wrote:
> > 2018-06-27 7:35 GMT+02:00 Fabrice Fontaine <fontaine.fabrice@gmail.
> > com>:
> > > 2018-06-27 5:36 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> > > > On Tue, Jun 26, 2018 at 11:43:26PM +0200, Fabrice Fontaine
> > > > wrote:
> > > > > gnuradio needs host-python2 however there is no way to
> > > > > enforce this so
> > > > > add a dependency on !BR2_PACKAGE_PYTHON3.
> > > > > Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot
> > > > > will only
> > > > > build host-python3.
> > > > 
> > > > Why not just add host-python to _DEPENDENCIES?
> > > > 
> > > 
> > > Indeed, I will update my patch. Thanks for your help.
> > 
> > After testing this option, this does not work. host-python2 is
> > indeed built
> > but host-python3 is also built.
> > As a result, host-python-mako and host-python-six are built only
> > for
> > host-python3 and not for host-python2. I don't know if this the
> > expected
> > behavior,perhaps buildroot should always build the python2 and
> > python3 host
> > packages?
> 
> Not sure what the right solution here is.
> 
> Yegor, do you have an idea?

I sent a patch series out some time ago that allows selecting the host
python version to be used for creating python packages.

It would allow selecting python2 to be used for host python packages,
and still get the host-python3 *interpreter* built if something needs
that too.

However, it does not allow:
Building host python packages for multiple python versions.
Building host python packages for a different python version than is
used on the target, if the target has python.

So if we start with the requirement that we must have host-python-mako
for python2, then from that follows that host-python-six and host-
python-etcetc must be for python2 as well.  And if the target has
python, it must also be python2.

Fixing this is hard to to do in buildroot.  It ends up with the need to
build a package twice, once for python2 and again for python3. 
Buildroot doesn't like two builds of the same package.

Maybe turn host python packages into two packages?  host-python2-mako
and host-python3-mako.  eval host-python-package creates one or both
packages.  Maybe that could fit in.

Or maybe that's too complex.  You get to pick one python version and
all python packages are that version.  If you want a python2 only
package and a python3 only package, too bad.  Port one of them to the
other python version.  As python3 support grows, this will be less and
less of a problem.
