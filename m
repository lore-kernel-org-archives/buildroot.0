From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 21:27:01 +0200
Subject: [Buildroot] rpath and runpath
In-Reply-To: <952e1471-12e9-7935-16c2-af56ad4fead7@ou.edu>
References: <952e1471-12e9-7935-16c2-af56ad4fead7@ou.edu>
Message-ID: <20170519212701.6824e4e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 07:55:24 -0600, Steve Kenton wrote:

> The chrpath command can display and/or modify the (pre LD_LIBRARY_PATH) 
> rpath and (post LD_LIBRARY_PATH) runpath settings in the ELF executable. 
> As an example looking at the host and target /usr/sbin directory gives 
> the 95 lines of output below.
> 
> I can see the reason for having the host executables use an RPATH to the 
> build directory, although I think a relative path using "$ORIGIN" at 
> link time which would allow the tree to be relocated would be even better.

The problem with $ORIGIN is that it contains a $, and this means it
easily gets expanded as a shell variable within Buildroot or inside the
package build system. So our attempts to use $ORIGIN directly during
the build have failed so far.

Therefore, the approach we are moving towards is keeping the absolute
rpath during the build, and at the very end of the build, do a
post-processing step that replaces the absolute rpath with relative
rpath using $ORIGIN.

> However, some of the target target executables also have RPATH to the 
> build directory which makes no real sense to me and other have no RPATH 
> or RUNPATH at all.

The plan is to get rid of them as well.

> What is the purpose of this arrangement, or is it just a historical 
> accident?

See the patch series from Wolfgang Grandegger at
http://lists.busybox.net/pipermail/buildroot/2017-March/185714.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
