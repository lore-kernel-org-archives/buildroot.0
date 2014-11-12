From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Wed, 12 Nov 2014 15:09:12 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20141111234919.3178e9d3@free-electrons.com>
References: <20141111073014.AA83D101626@stock.ovh.net>
 <20141111234919.3178e9d3@free-electrons.com>
Message-ID: <1415801352.20520.8.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2014-11-11 at 23:49 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Yann, Gustavo, Bernd, Nathaniel, Maxime, Samuel, Peter, please read on,
> there is some stuff for you below :-)

> >         bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/f08787c7965c5594d9560db0aa2adb7b07a65a45/
> 
> libshairplay_la-http_parser.o
> dnssd.c:74:21: error: dns_sd.h: No such file or directory
> dnssd.c:78: error: expected declaration specifiers or '...' before '*' token
> dnssd.c:80: error: expected ')' before '*' token
> dnssd.c:93: error: expected ')' before 'sdRef'
> dnssd.c:96: error: expected ')' before '*' token

libshairplay needs a mDNS library. If dynamic linkage is present through
libdl, the library is linked at runtime. If libdl is not present, like
in this case of a Blackfin target with FLAT binary format, a mDNS
library has to be statically linked.

Since the only mDNS library in Buildroot - avahi - needs dynamic
linkage, libshairplay cannot be built with static linkage in Buildroot
for now.
