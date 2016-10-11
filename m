From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Oct 2016 21:32:14 +0200
Subject: [Buildroot] [PATCH v2] package/upmpdcli: add patch to fix error
	not detecting jsoncpp
In-Reply-To: <20160925141152.13952-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 25 Sep 2016 16:11:52 +0200")
References: <20160925141152.13952-1-joerg.krause@embedded.rocks>
Message-ID: <8760oysmv5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/205463c9ea8651911972c2835e28ded1912c811a
 > http://autobuild.buildroot.net/results/5e9279ee60c11a3dacacf6d78f87f8d1b92968f5
 > http://autobuild.buildroot.net/results/97043f8defd5a59ae39b4c7f095a10d15c7fe632
 > http://autobuild.buildroot.net/results/e775126d5939093289b1a833dd6323ac293322ed
 > .. and many more.

 > libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
 > pkg-config for detecting the libraries and for providing the necessary
 > details for compiling and linking.

 > The current build system of upmpdcli does not use PKG_CHECK_MODULES, but
 > AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version from
 > 1.7.2 to 1.7.5 the detection fails, because the test program does not
 > compile anymore:

 > """
 > In file included from
 > /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/autolink.h:9:0,
 >                  from
 > /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:9,
 >                  from test.c:1:
 > /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:155:9:
 > error: 'int64_t' does not name a type
 >  typedef int64_t Int64;

While changing to pkg-config is perfectly fine (if upstream accepts it),
this problem is really about jsoncpp's config.h using int64_t without
including <stdint.h>

-- 
Bye, Peter Korsgaard
