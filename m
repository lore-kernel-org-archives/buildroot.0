From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 21:51:16 +0200
Subject: [Buildroot] [PATCH] package/gr-osmosdr: fix build with boost
 1.7.3
In-Reply-To: <20200629141128.853220-1-gwenj@trabucayre.com>
References: <20200629141128.853220-1-gwenj@trabucayre.com>
Message-ID: <20200629195116.GJ20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-06-29 16:11 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> boost/detail/endian.hpp has been marked as deprecated since boost 1.69.0.
> This file and boost/predef/detail/endian_compat.h are no more available.
> 
> This patch suppress this header in some file, where not needed and move
> to correct header and new constants. It's retrocompatible for at least all boost release > 1.69.0
> 
> [Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-June/002080.html]

It looks like the upstream mailing is not very active... :-/

> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-fix-build-with-boost-1.7.3.patch     | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch
> 
> diff --git a/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch b/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch
> new file mode 100644
> index 0000000000..fb10914531
> --- /dev/null
> +++ b/package/gr-osmosdr/0001-fix-build-with-boost-1.7.3.patch
> @@ -0,0 +1,86 @@
> +From 9d5a21f2900e3ffb07c1f163b6ba4e036f6c16a8 Mon Sep 17 00:00:00 2001
> +From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +Date: Thu, 25 Jun 2020 16:46:34 +0200
> +Subject: [PATCH] gr-osmosdr: fix build with boost > 1.73.0
> +
> +boost/detail/endian.hpp has been marked as deprecated since boost 1.69.0.
> +This file and boost/predef/detail/endian_compat.h are no more available.
> +
> +This patch suppress this header in some file, where not needed and move
> +to correct header and new constants. It's retrocompatible for at least all boost release > 1.69.0
> +
> +[Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-June/002080.html]
> +
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +---
> + lib/airspy/airspy_source_c.cc     | 1 -
> + lib/airspyhf/airspyhf_source_c.cc | 1 -
> + lib/hackrf/hackrf_source_c.cc     | 6 +++---
> + lib/rtl/rtl_source_c.cc           | 1 -
> + 4 files changed, 3 insertions(+), 6 deletions(-)
> +
> +diff --git a/lib/airspy/airspy_source_c.cc b/lib/airspy/airspy_source_c.cc
> +index 50150e5..f833588 100644
> +--- a/lib/airspy/airspy_source_c.cc
> ++++ b/lib/airspy/airspy_source_c.cc
> +@@ -33,7 +33,6 @@
> + 
> + #include <boost/assign.hpp>
> + #include <boost/format.hpp>
> +-#include <boost/detail/endian.hpp>
> + #include <boost/algorithm/string.hpp>
> + #include <boost/thread/thread.hpp>
> + 
> +diff --git a/lib/airspyhf/airspyhf_source_c.cc b/lib/airspyhf/airspyhf_source_c.cc
> +index 327fe19..b7494a8 100644
> +--- a/lib/airspyhf/airspyhf_source_c.cc
> ++++ b/lib/airspyhf/airspyhf_source_c.cc
> +@@ -33,7 +33,6 @@
> + 
> + #include <boost/assign.hpp>
> + #include <boost/format.hpp>
> +-#include <boost/detail/endian.hpp>
> + #include <boost/algorithm/string.hpp>
> + #include <boost/thread/thread.hpp>
> + 
> +diff --git a/lib/hackrf/hackrf_source_c.cc b/lib/hackrf/hackrf_source_c.cc
> +index eea5caa..fc48171 100644
> +--- a/lib/hackrf/hackrf_source_c.cc
> ++++ b/lib/hackrf/hackrf_source_c.cc
> +@@ -31,7 +31,7 @@
> + #include <stdexcept>
> + #include <iostream>
> + 
> +-#include <boost/detail/endian.hpp>
> ++#include <boost/predef/other/endian.h>
> + 
> + #include <gnuradio/io_signature.h>
> + 
> +@@ -90,10 +90,10 @@ hackrf_source_c::hackrf_source_c (const std::string &args)
> + 
> +   // create a lookup table for gr_complex values
> +   for (unsigned int i = 0; i <= 0xffff; i++) {
> +-#ifdef BOOST_LITTLE_ENDIAN
> ++#ifdef BOOST_ENDIAN_LITTLE_BYTE
> +     _lut.push_back( gr_complex( (float(int8_t(i & 0xff))) * (1.0f/128.0f),
> +                                 (float(int8_t(i >> 8))) * (1.0f/128.0f) ) );
> +-#else // BOOST_BIG_ENDIAN
> ++#else // BOOST_ENDIAN_BIG_BYTE
> +     _lut.push_back( gr_complex( (float(int8_t(i >> 8))) * (1.0f/128.0f),
> +                                 (float(int8_t(i & 0xff))) * (1.0f/128.0f) ) );
> + #endif
> +diff --git a/lib/rtl/rtl_source_c.cc b/lib/rtl/rtl_source_c.cc
> +index a371464..7f2e648 100644
> +--- a/lib/rtl/rtl_source_c.cc
> ++++ b/lib/rtl/rtl_source_c.cc
> +@@ -32,7 +32,6 @@
> + 
> + #include <boost/assign.hpp>
> + #include <boost/format.hpp>
> +-#include <boost/detail/endian.hpp>
> + #include <boost/algorithm/string.hpp>
> + 
> + #include <stdexcept>
> +-- 
> +2.27.0
> +
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
