From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 22 May 2018 17:40:20 +0000
Subject: [Buildroot] Tesla is using Buildroot
In-Reply-To: <50a817f0-5c04-3560-5bf5-e532513ba715@andin.de>
References: <20180511172314.28ba9f80@windsurf.home>
 <20180511215508.GA28572@jaya>
 <BLUPR0601MB705720B009168FB33EC2CA5FB9E0@BLUPR0601MB705.namprd06.prod.outlook.com>
 <704976570.261553.1526089365924.JavaMail.zimbra@datacom.com.br>
 <20180512142738.GB3674@momiji.home>
 <CAMWSM7gzGhpgRB-xXqNreQtvwR27d+UQuGUZ35_5uwhNY6gonA@mail.gmail.com>
 <CAOesGMimW+-9zEaSoJk0-Xjwg7O6-NJ3fXMYDdkzGRDUSaKB9A@mail.gmail.com>
 <1526320807.30073.31.camel@impinj.com>
 <79815658-f349-2b3a-ab08-3035bb08b170@mind.be>
 <CA+TH9VmeeTym-u-fyAWhOJ8=J9erOE=FmC1dHJLoHjhqgOWGHw@mail.gmail.com>
 <50a817f0-5c04-3560-5bf5-e532513ba715@andin.de>
Message-ID: <1527010819.31570.100.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-05-22 at 09:51 +0200, Andreas Naumann wrote:
> Am 19.05.2018 um 13:08 schrieb Angelo Compagnucci:
> > 
> > > > 
> > > > The top level makefile uses a pattern rule to provide a target for
> > > > every defconfig that exists in br2-external/configs directory.  It'll
> > > > call buildroot's build with BR2_EXTERNAL and O set build that defconfig
> > > > into an output directory.  Or just do a buildroot *_defconfig call but
> > > > not actually build.
> > > > 
> > > > buildroot sets itself up so that once you go to the output directory,
> > > > there is a Makefile that will execute any buildroot target (menuconfig,
> > > > pkg-rebuild, all, etc.) with BR2_EXTERNAL configured.
> > > 
> > >   That's *exactly* the setup I've developed for one of my projects. I've been
> > > meaning to export this to a buildroot-external superproject that people could
> > > reuse...
> 
> I use a similar setup, but use the android repo-tool to checkout 
> buildroot itself, additional BR2_EXTERNAL repos and 
> <PACKAGE>_OVERRIDE_SRCDIR repos which are under development (e.g. main 
> application).

I've used OVERRIDE_SRCDIR for the packages under development, which
were themselves git repositories that were submodules of the master
project.  Sounds like you've got the same thing but with repo-tool
instead of submodules.  There were a couple things that weren't that
good.

After a updating the source, by working on it or via git, buildroot
doesn't detect a change and rebuild it.  It is necessary to <pkg>-
rebuild it manually.  Tracking down which packages to rebuild was a
real pain for developers to do after every pull.  It seems like
buildroot could check srcdir timestamp vs build dir rsync stamp file
and do this automatically.

Another problem that the rsync of srcdir into the build dir will not
delete files that have been removed from srcdir.  If someone used a
wildcard in the makefile, e.g SRSCS := $(wildcard *.c), and then
renamed a source, the build fails because the build dir will have the
old and new source file and try to compile both of them.  This could be
avoided if buildroot didn't need to rsync the srcdir into the build
dir, but instead used the package's (assuming it has one) out-of-tree
build feature to compile directly from srcdir with output to the build
dir.
