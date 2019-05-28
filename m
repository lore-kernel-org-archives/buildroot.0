From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 28 May 2019 21:14:23 +0200
Subject: [Buildroot] [PATCH v2] mfgtools: bump version to 1.2.91
In-Reply-To: <20190526171021.GA20322@t450s.lan>
References: <20190525141800.3991-1-bisson.gary@gmail.com>
 <20190526144628.1f0a246a@windsurf> <20190526171021.GA20322@t450s.lan>
Message-ID: <50480e682caca0ad40949ed4de23e4eb6c36ae67.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Sun, 2019-05-26 at 19:10 +0200, Gary Bisson wrote:
> Hi Thomas,
> 
> On Sun, May 26, 2019 at 02:46:28PM +0200, Thomas Petazzoni wrote:
> > Hello Gary,
> > 
> > On Sat, 25 May 2019 16:18:00 +0200
> > Gary Bisson <bisson.gary@gmail.com> wrote:
> > 
> > > NXP deprecated the old mfgtools code, also called mfgtools v2 although
> > > the releases were named v0.xx.
> > > 
> > > It has been replaced by the Universal Update Utility (uuu), also called
> > > mfgtools v3 although the releases are named v1.x.yy.
> > > 
> > > This new tool actually resides in the same repository in the master
> > > branch whereas the old one is now in a 'linux' branch.
> > > 
> > > Since the old tool has issues building lately, let's switch to the new
> > > one. Note that uuu seems to be cleaner, supports much more features
> > > (i.MX8/8M/8QXP boot, fastboot etc..) and has a better documentation:
> > > https://github.com/NXPmicro/mfgtools/wiki
> > > 
> > > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > 
> > Thanks for this patch. Unfortunately, it fails to build on my system,
> > with:
> > 
> > [100%] Linking CXX executable uuu
> > /usr/bin/ld: cannot find -lstdc++
> > collect2: error: ld returned 1 exit status
> > 
> > This is because it is passing -static-libstdc++ at link time, for some
> > odd reason.
> > 
> > Do you know why they are doing:
> > 
> > set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libstdc++ -static-libgcc")
> > 
> > in uuu/CMakeLists.txt. This seems pretty bogus for something that
> > should be just a regular user-space program.
> > 
> > Could you have a look into this ?
> 
> My understanding, looking at the git history and other comments, is that
> this tool is meant to be build for Windows/Linux/Mac OSes. And
> apparently Windows only supports to build statically.
> 
> You can see that someone removed that line for the 'APPLE' build, so
> I've offered a pull-request to NXP to only do so for WIN32 instead [1].
> 
> However, while writing that PR, I linked to this thread archive and
> realized Joerg is already offering a patch for mfgtools [2].
> 
> Adding Joerg to this thread then, I'll let you guys know if the PR is
> accepted. @Joerg, let me know if you want to do the next patch version,
> no need to do the same work twice ;)

I'm fine if you take over and integrate the overwrite gen_ver.sh hook
as it solves a runtime issue.

> BTW, I saw that you made a change for the git commit version, I'd
> suggest sending a PR for that too instead of patching it in Buildroot.

This change is not upstreamable. There has been a discussion upstream
about missing gitversion.h in source tarballs: 
https://github.com/NXPmicro/mfgtools/issues/77

The conclusion was, that upstream does not support building uuu from a
tarball. Therefore, the hook to overwrite the git version logic.

> Regards,
> Gary
> 
> [1] https://github.com/NXPmicro/mfgtools/pull/105
> [2] http://lists.busybox.net/pipermail/buildroot/2019-May/249362.html

Best regards
J?rg Krause
