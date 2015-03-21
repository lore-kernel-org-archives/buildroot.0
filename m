From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 10:28:58 +0100
Subject: [Buildroot] The C++11 issue
Message-ID: <20150321102858.5e13ec41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A number of packages start to depend on C++11 features, which are not
available in all toolchains: toolchains using old compiler versions
(such as the Blackfin one), but also some older Crosstool-NG generated
toolchains.

This is causing a number of build failures these days, such as:

        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/7fac9e4b3aa0746c860fd032a4b7b8663fb46fc8/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/20b3f33e61286891a7804352c25326ea9faccfbb/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/e482ba1d06c7fe2736ab3e79796297db8fbea187/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/1bf20d204042810bedad58dd2466bde9ae7b3fd6/

(std::snprintf is a C++11 feature)

So, it looks like we need to add a BR2_TOOLCHAIN_HAS_CXX11 option, with
the usual handling.

However, it is not very clear-cut what is a C++11 supporting toolchain,
and what is not: C++11 was added progressively in gcc, and there are
still a few things missing apparently. According to
https://gcc.gnu.org/projects/cxx0x.html, most of the compiler related
features have been merged by gcc 4.8. But in terms of libstdc++
support, the page
https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html#status.iso.200x
is a lot less clear, as it only indicates the mainline gcc status, and
not the gcc releases.

So how do we decide whether a particular toolchain has C++11 support ?
Do we simply decide that gcc >= 4.8 have sufficient C++11 support for
now, and we'll adjust things later if needed ?

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
