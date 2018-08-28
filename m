From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:47:26 +0200
Subject: [Buildroot] [PATCH next v3] atop: fix minor() major() build
 failure
In-Reply-To: <20180828133131.32838-1-giulio.benetti@micronovasrl.com>
References: <20180828133131.32838-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180828224726.5f433b65@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 15:31:31 +0200, Giulio Benetti wrote:
> On arm / cortex-a8 Arch/Subarch sys/types.h doesn't include

This has nothing to do with ARM/Cortex-A8, and it is the same on all
architectures. The key thing is that this happens with glibc 2.28,
where sys/types.h no longer includes sys/sysmacros.h.

So I've reworded the commit log as follows:

    atop: fix minor()/major() build failure due to glibc 2.28
    
    glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
    and therefore <sys/sysmacros.h> must be included explicitly when
    major()/minor() are used. See glibc upstream commit:
    
      https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=e16deca62e16f645213dffd4ecd1153c37765f17
    
    This commit adds a patch to directly include <sys/sysmacros.h> into
    photosyst.c where minor() and major() macros are used.
    
    Patch has been taken from atop upstream pull request:
    
      https://github.com/Atoptool/atop/pull/35
    
    Fixes:
    
      http://autobuild.buildroot.net/results/3fc0f18ed94697c404e7ff3751781789170c4fe5/
    
    Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
    [Thomas: improve commit log.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

But it's not really all your fault, because even the upstream commit
log is wrong: it's talking about "old gcc" vs. "new gcc", while this
problem has nothing to do with gcc, but is related to a glibc change.

Applied to next with the updated commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
