From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 08:57:54 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: use pcap-config to
 fix	static linking with libpcap
References: <20170527225119.26015-1-romain.naour@gmail.com>
Message-ID: <i09qvdxdnt.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 28 May 2017 00:51:19 +0200 schrieb Romain Naour:

> When linking demo_mn_console statically with pcap, the CMake build
> system forget to link with other libraries linked with libpcap
> (-lnl-genl-3 -lnl-3 -ldbus-1 -pthread).
> 
> [100%] Linking C executable demo_mn_console
> lib64/libpcap.a(pcap-linux.o): In function nl80211_init':
> pcap-linux.c:(.text+0x41e): undefined reference tonl_socket_alloc'
> 
> To fix this, the build system could use pcap-config:
> pcap-config --libs --static -L/path/to/sysroot/usr/lib -lpcap
> -L/path/to/sysroot/usr/lib/.libs -lnl-genl-3 -lnl-3
> -L/path/to/sysroot/usr/lib -ldbus-1 -pthread
> 
> Also don't use getopt() from contrib directory to avoid a clash with
> libc definition.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f43/
f437d09ac6c689c911e1885b95da33b692f2cb3c
> http://autobuild.buildroot.net/
results/385/3859dc0f4de7e3284a96d5841f040f69f71842df
> https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/
issues/187
> 
> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using http://autobuild.buildroot.net/results/f43/
f437d09ac6c689c911e1885b95da33b692f2cb3c/ )
