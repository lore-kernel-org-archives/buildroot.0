From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 23:22:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: fix build failure due to
 gcc bug 93847
In-Reply-To: <20200220154004.126384-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 20 Feb 2020 16:40:04 +0100")
References: <20200220154004.126384-1-giulio.benetti@benettiengineering.com>
 <20200220154004.126384-2-giulio.benetti@benettiengineering.com>
Message-ID: <871rqh56r3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > The git package exhibits gcc bug 93847 when built for the Nios2
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93847=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/e22/e225e62ea2d48660df4110790664f0c3306c1ea9/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/git/git.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/git/git.mk b/package/git/git.mk
 > index a5c8669fc9..f32a2f8eb9 100644
 > --- a/package/git/git.mk
 > +++ b/package/git/git.mk
 > @@ -67,7 +67,7 @@ endif
 
 >  GIT_CFLAGS = $(TARGET_CFLAGS)
 
 > -ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)

This fails for a (hypothetical) toolchain affected by both issues,
perhaps something like this would be better?

ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)

-- 
Bye, Peter Korsgaard
