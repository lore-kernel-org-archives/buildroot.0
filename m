From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 23:54:05 +0100
Subject: [Buildroot] [PATCH 1/1] rt-tests: disable on unsupported
	architectures
In-Reply-To: <1393108369-11880-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Sat, 22 Feb 2014 23:32:49 +0100")
References: <1393108369-11880-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87fvnarc6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > rt-tests is not supported by a uclibc toolchain that does not implement
 > _pid in struct sigevent. Currently this is all MIPS architectures
 > in uclibc.

 > Fixes:
 >   http://autobuild.buildroot.net/results/074/074265602bec4aba6c82d1aee389045e8ad33d4b

 > Also rt-tests depends on NPTL which is not available on the bfin
 > architecture.

That should preferably be a seperate patch.

 > Fixes:
 >   http://autobuild.buildroot.net/results/ac9/ac95f73b2351d46d9a8c48caae7f6c3ea124e8bc

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > ---
 >  package/rt-tests/Config.in | 11 +++++++++--
 >  1 file changed, 9 insertions(+), 2 deletions(-)

 > diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
 > index 58a88a8..e40ce46 100644
 > --- a/package/rt-tests/Config.in
 > +++ b/package/rt-tests/Config.in
 > @@ -4,7 +4,10 @@ config BR2_PACKAGE_RT_TESTS
 >  	# priority-inheritance mutex needs NPTL
 >  	depends on !BR2_PTHREADS && !BR2_PTHREADS_OLD
 >  	# no NPTL for these archs
 > -	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc
 > +	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
 > +	# no _tid field in 'struct sigevent'
 > +	depends on !BR2_TOOLCHAIN_USES_UCLIBC && \
 > +		!(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)

I don't think this does what you want. You should be able to select
rt-tests with uClibc on !mips architectures.

I think you need something like:

    depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
                                          BR2_mips64 || BR2_mips64el)

-- 
Bye, Peter Korsgaard
