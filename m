From: Guillermo A. Amaral <g@maral.me>
Date: Wed, 10 Jul 2013 23:00:08 -0700
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <20130711053359.GC4338@tarshish>
References: <1373519841-6138-1-git-send-email-g@maral.me>
 <1373519960-6212-1-git-send-email-g@maral.me>
 <20130711053359.GC4338@tarshish>
Message-ID: <20130711060008.GA5570@enterprise.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 11, 2013 at 08:33:59AM +0300, Baruch Siach wrote:
> Hi Guillermo,
> 
> On Wed, Jul 10, 2013 at 10:19:20PM -0700, Guillermo A. Amaral wrote:
> > From: "Guillermo A. Amaral" <g@maral.me>
> > 
> > 
> > Signed-off-by: Guillermo A. Amaral <g@maral.me>
> > ---
> 
> [...]
> 
> > diff --git a/package/wiringpi/wiringpi-CLOEXEC-undefined.patch 
> > b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
> > new file mode 100644
> > index 0000000..ca0ed99
> > --- /dev/null
> > +++ b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
> > @@ -0,0 +1,29 @@
> > +From 728b2634cbf661e5303b1e8cb791b909ad4e907c Mon Sep 17 00:00:00 2001
> > +From: "Guillermo A. Amaral" <g@maral.me>
> > +Date: Wed, 10 Jul 2013 22:05:12 -0700
> > +Subject: [PATCH] Declare O_CLOEXEC on systems with an older kernel and/or
> > + glibc.
> > +
> > +Signed-off-by: Guillermo A. Amaral <g@maral.me>
> > +---
> > + wiringPi/wiringPi.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
> > +index ba61d9f..2ee23b9 100644
> > +--- a/wiringPi/wiringPi.c
> > ++++ b/wiringPi/wiringPi.c
> > +@@ -77,6 +77,10 @@
> > + #define	FALSE	(1==2)
> > + #endif
> > + 
> > ++#ifndef O_CLOEXEC
> > ++#define O_CLOEXEC 0
> 
> Are you sure? I see
> 
> #define O_CLOEXEC      02000000
> 
> in include/uapi/asm-generic/fcntl.h.
> 

Hi baruch,

Usage of O_CLOEXEC in wiringPi was added very recently, it started failing
after that. I hear it still works if you're using glibc though (I haven't
tested it).

Here's the output if you remove the patch:

	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c: In function ?wiringPiSetup?:
	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c:1544:49: error: ?O_CLOEXEC? undeclared (first use in this function)
	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c:1544:49: note: each undeclared identifier is reported only once for each function it appears in
	make[2]: *** [wiringPi/CMakeFiles/wiringPi.dir/wiringPi.c.o] Error 1
	make[1]: *** [wiringPi/CMakeFiles/wiringPi.dir/all] Error 2
	make: *** [all] Error 2

Cheers,
G

-- 
gamaral http://about.me/gamaral
