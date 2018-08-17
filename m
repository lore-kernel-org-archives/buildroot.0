From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 19:19:41 +0200
Subject: [Buildroot] [PATCH 1/1] eigen: Fix pkg-config file prefix error
In-Reply-To: <20180816221620.30881-1-flatmax@flatmax.com> (Matt Flax's message
 of "Fri, 17 Aug 2018 08:16:20 +1000")
References: <20180816221620.30881-1-flatmax@flatmax.com>
Message-ID: <87in48oqqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Flax <flatmax@flatmax.com> writes:

 > From: Matt Flax <flatmax@flatmax.org>
 > eigen generates	a pkg-config file which	has a broken prefix. This broken
 > prefix causes an incorrect path	when other packages call
 > pkg-config --cflags eigen

It wasn't clear from the description what this broken prefix was, so I
had a look:

grep '^prefix=' build/eigen-3.3.4/eigen3.pc.in
prefix=@CMAKE_INSTALL_PREFIX@

Which is indeed no good.

 > This patch fixes the prefix in the generated eigen pc file and prjects
 > which depend on	this pc	file can now path correctly to the eigen include
 > directory at build time.

 > Signed-off-by: Matt Flax <flatmax@flatmax.org>
 > ---
 >  package/eigen/eigen.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
 > index 89f54fb..84e6f3a 100644
 > --- a/package/eigen/eigen.mk
 > +++ b/package/eigen/eigen.mk
 > @@ -23,7 +23,8 @@ endif
 >  # Generate the .pc file at build time
 >  define EIGEN_BUILD_CMDS
 >  	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
 > -		-e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
 > +		-e 's,^Cflags: .*,Cflags: -I$$\{prefix\}\/include\/eigen3,' \
 > +		-e 's,^prefix.*,prefix=\/usr,' \

Why are you escaping these '/' characters? The sed invocation uses , as
seperator, so / isn't special.

Committed with these backslashes dropped and the commit message tweaked,
thanks.

-- 
Bye, Peter Korsgaard
