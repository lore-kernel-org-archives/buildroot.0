From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 May 2015 17:17:23 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150515140633.GJ16123@waldemar-brodkorb.de>
References: <20150514063016.DE5B7100C9A@stock.ovh.net>
 <20150514231309.4e8158df@free-electrons.com>
 <20150515140633.GJ16123@waldemar-brodkorb.de>
Message-ID: <20150515171723.5fd9338c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 15 May 2015 16:06:33 +0200, Waldemar Brodkorb wrote:
> Hi,
> Thomas Petazzoni wrote,
> 
> > >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9faeba9f811bb3507861003d78eec245f8a93db9/
> > >        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/46f9d84e6db10ce7cbe48653f6da4450aceceb4c/
> > >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7852f40e6bae93f953a588bbd6902c2b1cee8a42/
> > >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
> > >        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/
> > 
> > The nios2 problems are due to a toolchain issue. We should simply
> > disable boost with this toolchain.
> > 
> > The PowerPC problems are due to a uClibc bug. I've done some tests, and
> > boost-1.57.0 builds fine on PowerPC/glibc, ARM/uClibc, but fails on
> > PowerPC/uClibc. It's the boost-log module that causes the problem.
> 
> Where do you see a uClibc problem?

Well, it simply works fine with PowerPC/glibc, and ARM/uClibc, but not
PowerPC/uClibc.

> Any short error message?

See the powerpc failures above, and search for 'error:'. The errors are:

./boost/spirit/home/support/detail/sign.hpp:60:36: error: no type named 'bits' in 'traits_type {aka struct boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         typename traits_type::bits a;
                                    ^
./boost/spirit/home/support/detail/sign.hpp:61:35: error: 'get_bits' is not a member of 'traits_type {aka boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         traits_type::get_bits(x, a);
                                   ^
./boost/spirit/home/support/detail/sign.hpp:60:36: error: no type named 'bits' in 'traits_type {aka struct boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         typename traits_type::bits a;
                                    ^
./boost/spirit/home/support/detail/sign.hpp:62:11: error: 'sign' is not a member of 'traits_type {aka boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         a ^= traits_type::sign;
           ^
./boost/spirit/home/support/detail/sign.hpp:60:36: error: no type named 'bits' in 'traits_type {aka struct boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         typename traits_type::bits a;
                                    ^
./boost/spirit/home/support/detail/sign.hpp:63:35: error: 'set_bits' is not a member of 'traits_type {aka boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         traits_type::set_bits(x, a);
                                   ^
./boost/spirit/home/support/detail/sign.hpp:60:36: error: no type named 'bits' in 'traits_type {aka struct boost::math::detail::fp_traits_non_native<long double, boost::math::detail::extended_double_precision>}'
         typename traits_type::bits a;
                                    ^
> I tried boost 1.57 with PPC and getting GCC ICE when using 4.9.2
> while compiling test.

Weird, it builds just fine here, as long as you disable the boost-log
component, which is the one causing the build error above.

> With GCC 5.1 the compile works fine.
> Both tested with uClibc-ng (ppc soft-float target)

Note that I don't think I have tested with uClibc-ng.

Here is a defconfig that fails:

BR2_powerpc=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_CONTEXT=y
BR2_PACKAGE_BOOST_EXCEPTION=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_BOOST_LOG=y
BR2_PACKAGE_BOOST_SYSTEM=y
BR2_PACKAGE_BOOST_WAVE=y

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
