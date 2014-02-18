From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 12:40:57 +0100
Subject: [Buildroot] [PATCH 4 of 4] alsa-utils: fix build on no-mmu
	targets
In-Reply-To: <fba13b278df3df6a3fc7.1392224144@argentina> (Thomas De
 Schampheleire's message of "Wed, 12 Feb 2014 17:55:44 +0100")
References: <patchbomb.1392224140@argentina>
 <fba13b278df3df6a3fc7.1392224144@argentina>
Message-ID: <8761ocwsvq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > alsa-utils uses fork, which doesn't work on targets without mmu, such as
 > Blackfin. Apply a patch by the Blackfin developers to fix this.

 > Fixes
 > http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

What is the upstream status of this?

 > ---
 >  package/alsa-utils/alsa-utils-0001-no-mmu.patch |  61 ++++++++++++++++++++
 >  package/alsa-utils/alsa-utils.mk                |   1 +
 >  2 files changed, 62 insertions(+), 0 deletions(-)

 > diff --git a/package/alsa-utils/alsa-utils-0001-no-mmu.patch b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
 > new file mode 100644
 > --- /dev/null
 > +++ b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
 > @@ -0,0 +1,61 @@
 > +Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
 > +
 > +Add no-mmu support for alsa-utils mainly for Blackfin
 > +---
 > + alsactl/init_utils_run.c |    4 ++++
 > + alsaloop/alsaloop.c      |    8 ++++++++
 > + configure.in             |    1 +
 > + 3 files changed, 13 insertions(+)
 > +
 > +diff --git a/alsactl/init_utils_run.c b/alsactl/init_utils_run.c
 > +--- a/alsactl/init_utils_run.c
 > ++++ b/alsactl/init_utils_run.c
 > +@@ -89,7 +89,11 @@ int run_program0(struct space *space,
 > + 		argv[0] = program;
 > + 	}
 > + 
 > ++	#ifdef HAVE_FORK
 > + 	pid = fork();
 > ++	#else
 > ++	pid = vfork();
 > ++	#endif

I would be a lot happier with a patch simply doing s/fork/vfork/. If
vfork is safe to use, we might as well use it everywhere - And if not,
we shouldn't do it on nommu either.


 > + 	switch(pid) {
 > + 	case 0:
 > + 		/* child closes parent ends of pipes */

I'm far from a vfork expert, but as parent and child shares stack, how
does it work with both calling close() on the pipes?

-- 
Bye, Peter Korsgaard
