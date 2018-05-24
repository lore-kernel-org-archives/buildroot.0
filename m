From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 May 2018 13:30:29 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: filter microblaze GCC
 < 8 bug
In-Reply-To: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180524133029.1a7a22e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Wed, 23 May 2018 16:53:46 -0500, Matt Weber wrote:
> Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> which is an issue where the Microblaze archtecture had code that
> caused a infinite recursion while optimizing in versions of GCC
> less then 8.x.  More BR discussion can be found on this thread.
> http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html
> 
> CC: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I don't see why we would do autobuilder exceptions for this rather than
a usual BR2_TOOLCHAIN_GCC_HAS_BUG_xyz.

If I understand correctly, we have two issues:

 - gcc bug #85862, which didn't exist in gcc 6.3 and is a regression in
   gcc 6.4, but doesn't exist in gcc 7.x

   This bug affects the build of libnss, and was handled by commit
   bd03966d4ebeb284ac3afb5f3b8cba13da2b9983, through the addition of
   BR2_TOOLCHAIN_HAS_GCC_BUG_85862.

 - gcc bug #85180, which affects gcc 6.x and gcc 7.x, but is fixed in
   gcc 8.x. It affects packages such as flare-engine, boost and
   gst-ffmpeg.

   So, for this one, rather than autobuilder exception, I would like to
   see something like this:

config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
	bool
	default y if BR2_microblaze

and we'll adjust this with a "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8"
when gcc 8.x support is added in Buildroot.

flare-engine is not selected by any package (flare-game depends on
flare-engine). 

gst-ffmpeg is not selected by any package.

boost has lots of reverse dependencies however. But perhaps we can nail
down the specific boost sub-option(s) that exhibit the problem, and
only add the gcc bug dependency on those suboptions?

Any reason for not using this solution ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
