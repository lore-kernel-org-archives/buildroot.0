From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2016 00:07:39 +0100
Subject: [Buildroot] [RFC 1/1] rpm: omit additional advanced tools
In-Reply-To: <20161208002852.14260-1-james.knight@rockwellcollins.com>
References: <20161208002852.14260-1-james.knight@rockwellcollins.com>
Message-ID: <20161209000739.4adb70e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Dec 2016 19:28:52 -0500, James Knight wrote:
> Adjusts RPM's configuration to explicitly disable DWARF library
> support. This indirectly disables the attempt to build any additional
> advanced tools (debugedit, elfdeps, sepdebugcrcfix). The use of these
> tools, specifically sepdebugcrcfix, require the use of binutils.
> Requiring binutils would restrict this package from building on AArch64
> and Nios II. Opting to remove the optional utilities.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Thanks a lot for the investigation, it definitely helped a lot!

However, I cooked and pushed what I believe is a better fix: adjust
configure.ac to actually check for bfd.h, and build the tool that uses
it only when bfd.h is available.

Also, there was a second issue behind that: when bfd.h is there, the
build also fails due to some weird issue. So I've fixed that as well.

And added binutils+elfutils as optional dependencies of rpm.

See:

  https://git.buildroot.org/buildroot/commit/?id=0018d7d6ba436a59875328fb3f372aff1888bff8
  https://git.buildroot.org/buildroot/commit/?id=9b9fcd7062a5d39603fffb61b3e8e2c0b1932321

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
