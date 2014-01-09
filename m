From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Jan 2014 15:08:45 +0200
Subject: [Buildroot] [PATCH] rt-tests: disable for architectures not
	supporting NPTL
In-Reply-To: <87ppo1e3hg.fsf@dell.be.48ers.dk>
References: <2a175498f9ed0528e619f3a0124836eb72729bc3.1389256828.git.baruch@tkos.co.il>
 <87ppo1e3hg.fsf@dell.be.48ers.dk>
Message-ID: <20140109130845.GV4659@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Jan 09, 2014 at 01:36:43PM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixes
>  > http://autobuild.buildroot.net/results/8aa/8aaa4b56a53241b7342fede568fbc72a7656cc38/.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/rt-tests/Config.in | 7 +++----
>  >  1 file changed, 3 insertions(+), 4 deletions(-)
> 
>  > diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
>  > index 36c111b..f467ee2 100644
>  > --- a/package/rt-tests/Config.in
>  > +++ b/package/rt-tests/Config.in
>  > @@ -1,9 +1,8 @@
>  >  config BR2_PACKAGE_RT_TESTS
>  >  	bool "rt-tests"
>  >  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  > -	# Too old uClibc, does not provide priority-inheritance
>  > -	# mutexes
>  > -	depends on !BR2_avr32
>  > +	# uClibc does not provide priority-inheritance mutex (NPTL)
>  > +	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
> 
> So shouldn't we depend on !BR2_PTHREADS && !BR2_PTHREADS_OLD instead? What
> happens if you configure uClibc on E.G. ARM to use pthreads-old?

We could, but this doesn't solve the problem for external toolchains. This 
issue of packages that require NPTL keeps coming up, but no solution has been 
implemented yet.

This patch takes the minimal approach of disabling rt-tests for arches that 
are known not to have NPTL support at all.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
