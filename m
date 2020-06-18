From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:55:18 +0200
Subject: [Buildroot] [PATCH] package/iperf3: bump to version 3.8.1
In-Reply-To: <d3ba56c5fb5b641d8817ff90b19e575288fb5333.1591939941.git.baruch@tkos.co.il>
References: <d3ba56c5fb5b641d8817ff90b19e575288fb5333.1591939941.git.baruch@tkos.co.il>
Message-ID: <20200618215518.62d2ed38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Jun 2020 08:32:21 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Don't pass --disable-profiling, profiling is now disabled by default.
> For some reason adding --disable-profiling makes it enabled.

That's because they don't use AC_ARG_ENABLE correctly:

# Check if enable profiling
AC_ARG_ENABLE([profiling],
    AS_HELP_STRING([--enable-profiling], [Enable iperf3 profiling binary]),
    [enable_profiling=yes],
    [:])
AM_CONDITIONAL([ENABLE_PROFILING], [test x$enable_profiling = xyes])

The [enable_profiling=yes] should be [enable_profiling=$enableval]

This is a common mistake. Many people think AC_ARG_ENABLE arguments are:

 - option name
 - option help
 - what gets executed if option is enabled
 - what gets executed if option is disabled

But in fact, the arguments of AC_ARG_ENABLE are:

 - option name
 - option help
 - what gets executed if option is passed, regardless of whether it is
   enabled or disabled. The value is in $enableval
 - what gets executed if no value is passed at all (i.e neither
   --enable nor --disable are passed)

So, I've slightly reworked the commit log and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
