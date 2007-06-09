From: Benjamin Tietz <benjamin@micronet24.de>
Date: Sat, 9 Jun 2007 15:32:00 +0200
Subject: [Buildroot] Easier adding of new packages / Distribution
In-Reply-To: <20070609121225.GA4171@firebird.dresden.micronet24.de>
References: <20070608174728.GB4273@firebird.dresden.micronet24.de>
	<016c01c7aa73$e6a6f1d0$0302a8c0@atmel.com>
	<20070609121225.GA4171@firebird.dresden.micronet24.de>
Message-ID: <20070609133200.GB4171@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 09, 2007 at 02:12:25PM +0200, Benjamin Tietz wrote:
> On Sat, Jun 09, 2007 at 09:53:01AM +0200, Ulf Samuelsson wrote:
> > 
> > 
> > >> 2) Handling of distributions.    I.E. ability to specify which package version you 
> > >>     want to build in a way which is separated from the package build script.
> > > To 2) This is a more difficult problem since you have to give the user a
> > > chance to specify all supported versions. If you want to integrate it
> > > into the current configuration-process you would have to specify a field
> > > or list for every single package - Leaving the user alone with the
> > > decision of hundred of different versions.
> > 
> > As I envision the mechanism, you should be able to generate a file containing
> > all the current versions using a simple command.
> > 
> > I.E:     make distrib
> > 
> > Each package makefile fragment would contain.
> > 
> > <package>-distrib:
> >             echo <package>_VER    >> .distrib
> > ---------------
> > 
> > The Config.in should have a configuration string which, if not empty,
> > the file, with the filename in the string should be included by Makefile
> > in the beginning.
> > 
> > ---------------
> > The makefile fragment in each package should test if
> > <package>_VER is defined, and if not, it should define it.
> > 
> 
> That would be possible... But remember, that for such an distributional
> package you only should save the versions of the software _in use_.
> Maybe in some days I could send a real solution
> 
> > 
> > Alternatively, you always have a configuration file containing the version info
> > and you either use this or you use your own,
> > 
> > I see the use of this functionality as a help for newbies, where people with more
> > experience select the package versions and create a distribution which are then used
> > by people less experience.,
Just to have a point to start with... the following patch

There is now a Configuration option for an distributional file (which
silently will overwrite possibly different settings from the
.config-file)

To create such an file, just "make distribution"

up to now there are some caveats: Not all packages have an variable
PACKAGE_VERSION, on the other hand there are some packages - especially
the toolchain - which aren't enabled by BR2_PACKAGE_PACKAGE. But these
are the assumptions made by the standard rule. So all these packages
need a special ...-distrib rule or should be modified to fit.

best regards

Benjamin

-------------- next part --------------
A non-text attachment was scrubbed...
Name: distrib.patch
Type: text/x-diff
Size: 3111 bytes
Desc: distrib.patch
Url : http://busybox.net/lists/buildroot/attachments/20070609/24d85bf2/attachment.bin 
