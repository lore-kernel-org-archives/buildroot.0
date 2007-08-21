From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 20:57:17 +0200
Subject: [Buildroot] improved per-project dependencies
In-Reply-To: <20070821174604.GA19089@aon.at>
References: <20070821175648.CE549A610A@busybox.net>
	<20070821174604.GA19089@aon.at>
Message-ID: <1187722638.6145.19.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-21 klockan 19:46 +0200 skrev Bernhard Fischer:
> On Tue, Aug 21, 2007 at 10:56:48AM -0700, aldot at uclibc.org wrote:
> >Author: aldot
> >Date: 2007-08-21 10:56:47 -0700 (Tue, 21 Aug 2007)
> >New Revision: 19624
> >
> >Log:
> >- our dependencies are project specific. First (untested) attempt to take this fact into account.
> >  Will need to try to copy eventual pre-existing project-specific deps back
> >  to package/config in order not to mess up the corresponding timestamps (to avoid superfluous rebuilds)..
> 
> I hope that this didn't break too much, if so please holler.
> This will need some further massage. Help (patches) welcome

I have been thinking about this.
The idea of the BSP patch is to share a common toolchain
and to share the build of packages


If you have two different toolchains, then you effectively lose the
purpose of the toolchain, and could as well build the project in a 
different directory.

A possible approach would be to separate the configs of the 
packages from that of the toolchain

"make toolconfig" would create the .config'uration of the toolchain
"make menuconfig" would create the .config'uration for the rest.

Then you can add a dependency on the toolconfig ".config" file
which deletes 
* build_<ARCH>
* binaries
* toolchain_build_<ARCH>
* project_build_<ARCH>
because they are really not valid.

A more difficult approach is to have the old .config available and
compare that against the new ".config".  Only changes affecting the
builds of package should call for the battle-axe.
Cosmetic changes should not be dramatic.

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards,
Ulf Samuelsson
