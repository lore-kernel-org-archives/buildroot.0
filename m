From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 08:37:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: fix build with uClibc-ng
In-Reply-To: <1454191379-2800-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454191379-2800-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131083749.534f5dd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 30 Jan 2016 23:02:59 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/fde/fdefe50f4a1ff0888105feedbabab186ab6294cb/
> http://autobuild.buildroot.net/results/f49/f49dc42d81a3abf5515ef68940037e34caee6a1e/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/boost/0006-uclibc-no-fenv.patch | 39 +++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/boost/0006-uclibc-no-fenv.patch

Thanks a lot for looking into the boost issue. I have some question
below.

> +diff -uNr boost_1_60_0.org/boost/test/execution_monitor.hpp boost_1_60_0/boost/test/execution_monitor.hpp
> +--- boost_1_60_0.org/boost/test/execution_monitor.hpp	2015-12-06 09:50:28.000000000 +0100
> ++++ boost_1_60_0/boost/test/execution_monitor.hpp	2016-01-30 22:55:36.000000000 +0100
> +@@ -484,7 +484,7 @@
> +     BOOST_FPE_UNDERFLOW = EM_UNDERFLOW|EM_DENORMAL,
> + 
> +     BOOST_FPE_ALL       = MCW_EM,
> +-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
> ++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) || defined(__UCLIBC__)

Boost already checks for the availability of fenv functionality, and
should set BOOST_NO_FENV_H if fenv functionality is not there.

Do you have any idea why the check doesn't work ? We shouldn't have to
add this defined(__UCLIBC__) thing, since Boost should have detected
that uClibc doesn't provide a complete fenv implementation, and define
BOOST_NO_FENV_H.

I've tried to go through the Boost mechanism that does this test, but
it is really not conventional, so I couldn't so far figure out how it
was all working.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
