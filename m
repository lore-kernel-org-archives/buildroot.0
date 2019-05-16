From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 11:06:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-14
In-Reply-To: <20190516115248.GB25918@momiji>
References: <20190515060039.F045C22920@silver.osuosl.org>
 <20190515221703.GC32757@momiji> <20190516083353.5cd7ae04@windsurf>
 <20190516115248.GB25918@momiji>
Message-ID: <20190516110616.329beae6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Samuel Martin in the discussion.

On Thu, 16 May 2019 11:52:48 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> > This build has BR2_ENABLE_DEBUG=y, and when BR2_ENABLE_DEBUG=y, the
> > CMake package infrastructure passes -DCMAKE_BUILD_TYPE=Debug. I assume
> > that's under this condition that assertions become enabled.  
> 
> On a related note: for debug builds done by packagers we usually recommend
> building with ?-DCMAKE_BUILD_TYPE=RelWithDebInfo? because using the ?Debug?
> produces excruciatingly slow WebKit binaries. To give you an idea: loading
> some simple static HTML page over the network can take a couple of minutes.
> Typically full ?Debug? builds are only ever used by WebKit developers.

I know there was so back and forth between Debug and RelWithDebInfo,
see the commit log of commit 104bb29e0490bfb487e2e665448dd3ca07fcc2b5:

commit 104bb29e0490bfb487e2e665448dd3ca07fcc2b5
Author: Samuel Martin <s.martin49@gmail.com>
Date:   Sun Oct 16 13:12:37 2016 +0200

    Revert "package/cmake: with BR2_ENABLE_DEBUG use RelWithDebInfo"
    
    This reverts commit 4b0120183404913f7f7788ef4f0f6b51498ef363.
    
    Before reverting this patch, CMake packages are built with the following
    options:
      * if BR2_ENABLE_DEBUG is set:
        The CMake build type is set to RelWithDebInfo, which means:
        - Optimization level is forced to: -O2;
        - no log nor assert due to -DNDEBUG;
        - BR2_DEBUG_{1..3} effect is unchanged;
      * otherwise:
        The CMake build type is set to Release, which means:
        - Optimization level is forced to: -O3;
        - no log nor assert due to -DNDEBUG (as expected).
      In any case, the optimization WRT the binary size is always ignored
      and forced.
    
    Reverting to the previous situation, so Buildroot now chooses between
    the 'Debug' and 'Release' config types, which are semantically closer
    to what Buildroot does everywhere else:
      * if BR2_ENABLE_DEBUG is set:
        The CMake build type is set to Debug, which means:
        - only -g option is passed by CMake;
        - optimization is not forced, nor debug level, so they are kept
          as-is;
      * otherwise:
        The CMake build type is set to Release, so no change in this case:
        - Optimization level is forced to: -O3;
        - no log nor assert due to -DNDEBUG (as expected);
        - size optimization is ignored.
    
    Follow-up patches will fix the CMake flag variables that are appended by
    CMake.
    
    Cc: Charles Hardin <ckhardin@exablox.com>
    Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
    Signed-off-by: Samuel Martin <s.martin49@gmail.com>
    Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

So apparently, the issue with RelWithDebInfo is that it forces the
optimization level.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
