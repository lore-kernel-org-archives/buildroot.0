From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Nov 2017 10:14:10 +0000
Subject: [Buildroot] [arc-buildroot] Re: Conditional setup of TARGET_ABI
In-Reply-To: <098ECE41A0A6114BB2A07F1EC238DE89667B8B16@de02wembxa.internal.synopsys.com>
References: <1510906984.31683.79.camel@synopsys.com>
 <20171117104822.38277917@windsurf.lan>
 <098ECE41A0A6114BB2A07F1EC238DE89667B8B16@de02wembxa.internal.synopsys.com>
Message-ID: <1510913649.31683.90.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Claus,

On Fri, 2017-11-17 at 10:07 +0000, Claudiu Zissulescu wrote:
> Hello,
> 
> > 
> > > 
> > > 2. Qt5WebKit [as well as all other libs and apps] uses functions from libgcc.
> > > ? ?In that case it's our __do_global_dtors_aux() which in its turn uses
> > another
> > > 
> > > ? ?function called __st_r13_to_r15(). And from (1) we know that distance
> > > ? ?between them should be less than 16MiB. Now given libQt5WebKit is
> > much larger
> > > 
> > > ? ?that means if the functions in question end-up placed closer to opposite
> > ends
> > > 
> > > ? ?of libQtxxx they won't be reachable to each other... and that's what we
> > see here.
> > 
> > What isn't clear to me is where are those two functions? One is in
> > crtbeginS.o, so it ends up linked into the program .text section, while
> > the other one is in libgcc, correct?
> 
> Those functions are some helpers made to replace a normal context save/restore with a call to them. The main purpose is to get a better size figure.
> This technique is used when one builds a binary using -Os compiler option, otherwise, this technique will not be used but only on request.
> 
> > 
> > > 
> > > Any thoughts?
> 
> In my opinion the millicode option should be only used for bare metal applications. For Linux like systems where the size of a binary can be quite
> large, having this technique on, may lead to all kind of complications like the one in question. Thus, my suggestion is to fully disable this option
> for all our architectures in the toolchain. This also means you need to take no action at your side ;)

So your suggestion is to pass "-mno-millicode" option to our GCC for building everything, right?
That will effectively inline millicode stuff right in each and every function compiled by GCC, correct?

-Alexey
