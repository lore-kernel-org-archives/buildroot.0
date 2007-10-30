From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 30 Oct 2007 11:10:45 +1100
Subject: [Buildroot] Several issues with building multiple
	"projects"	for same architecture
In-Reply-To: <1193698207.8485.4.camel@local.atmel.sweden>
References: <d83696340710290855s5e4e4f44y7b5777bfeacf4ec2@mail.gmail.com>
	<1193698207.8485.4.camel@local.atmel.sweden>
Message-ID: <20071030001045.GA5198@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2007 at 11:50:07PM +0100, Ulf Samuelsson wrote:
> m?n 2007-10-29 klockan 10:55 -0500 skrev Jonathan Nalley:
> > I am using the buildroot to build for several different boards, some
> > of them have the same CPU architecture (PPC405GP/EP).  I have noticed
> > some issues with the "project" concept in the buildroot.  Since the
> > builds are for the same architecture the toolchain is created under
> > "build_powerpc".  Everything works fine for the first board, but for
> > subsequent builds for different "project" names things are missing
> > under "project_build_powerpc/PROJECT_NAME/root".  Specifically: 
> > 
> > /root/lib/libgcc_s.so
> > /root/usr/lib/libstdc++.so
> > /root/usr/sbin/ethtool
> > 
> > This is because the make files that install those files check for:
> > 
> > $(GCC_BUILD_DIR2)/.libs_installed

There's another problem with this approach. If you are modifying the
target_skeleton contents you might want to nuke the generated root
directory and have it rebuilt, but then libgcc_s.so (etc) won't be
re-copied.

> Here is a first attempt to fix this,
> I have not tested it yet myself though.
> 
> The idea is to create a $(DEP_DIR) directory in $(PROJECT_BUILD_DIR)
> and then to generate a $(<package>).installed in this directory.

This doesn't solve the problem I note either, although I guess you could
also delete *.installed. Why not just depend on the actual target rather
than these stamp files?


thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
