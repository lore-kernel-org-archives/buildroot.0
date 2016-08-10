From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:30:38 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <20160810193646.GV22524@waldemar-brodkorb.de>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <20160810193646.GV22524@waldemar-brodkorb.de>
Message-ID: <20160810223038.10db2434@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 21:36:47 +0200, Waldemar Brodkorb wrote:

> > >         bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/  
> > 
> > libpixman-1.so: undefined reference to `__emutls_get_address'
> > 
> > Waldemar, can you have a look?  
> 
> Unfortunately this fails for the same reason as any C++ application.
> __emutls_get_address is defined in libgcc_s.so.1 and is LOCAL
> instead of GLOBAL.
> When we fix the C++ problem, we have a solution for alsa-libs and
> cairo.

Argh, OK. So in fact, disabling C++ is not sufficient to get rid of all
issues :-/

> > >         m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f34ad4f0cf094fa31b7dc18522e9eedfc5c2c940/  
> > 
> > /tmp/cctGT3zI.s: Assembler messages:
> > /tmp/cctGT3zI.s:14834: Error: value -34500 out of range
> > /tmp/cctGT3zI.s:15075: Error: value -35250 out of range
> > /tmp/cctGT3zI.s:15528: Error: value -45542 out of range
> > /tmp/cctGT3zI.s:15529: Error: value -45566 out of range
> > /tmp/cctGT3zI.s:15539: Error: value -45886 out of range
> > 
> > Waldemar ?  
> 
> Didn't we disabled clapack for m86k coldfire in 
> 7b75d8c3fa7b234c948ff37c4f14467900083036 ?

Correct, but in this commit, you forgot to propagate to clapack's
reverse dependencies, namely the armadillo package, and therefore
clapack could still be selected (which was the case in this
configuration.

> > >       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b593d422f394f1ed6a91faaa5ff73c769d523abb/  
> > 
> > The NGREG issue. I worked on this yesterday, I have some improvements,
> > but it's not yet ready :-/  
> 
> May be you could add Max Filippov to Cc? He is always helpful with any
> Xtensa problems.

It's not really an Xtensa issue. The problem can be solved trivially by
adding another !defined(__xtensa__) condition, but I was trying to
implement a better solution in the Waf script.

> > >         m68k |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/8a4e26bb1c0c64759e3914eced0a36baa0967f0b/  
> > 
> > Waldemar, another "relocation truncated to fit: R_68K_GOT16O" for
> > you :-)  
> 
> Patch ready.

Thanks!

> > >         m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/791917c1343f53e12f27b06cfd5e1d2e88078014/
> > >         m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/349d4b49d65a652551c4de20233684bb4ffa5ae3/  
> > 
> > #error Target architecture was not detected as supported by Double-Conversion.
> > 
> > Probably we need to disable this package on m68k. Waldemar?  
> 
> I'll take a look now.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
