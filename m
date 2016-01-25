From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:38:32 +0100
Subject: [Buildroot] [PATCH v2] package/iptables: nfsynproxy not
 available on musl
In-Reply-To: <1453644605-3705-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453644605-3705-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125233832.2df72e7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 15:10:05 +0100, Bernd Kuhls wrote:
> utils/nfsynproxy.c needs several TCP_* constants which are not yet
> provided by musl, they were added Jan 17, 2016 to musl:
> http://git.musl-libc.org/cgit/musl/commit/?id=53f41fb568ae43034c9876cc9bd3961fd6d13671
> 
> Until we support a musl version containing the constants we disable
> the option for building nfsynproxy on musl.
> 
> Fixes
> http://autobuild.buildroot.net/results/8ee/8ee299d8697bf488ba94f60785e81f274b2128fd/
> http://autobuild.buildroot.net/results/f1a/f1ab3fe59d0dd7dd7b9a7bc6bc10a0019f0fa567/
> http://autobuild.buildroot.net/results/4f9/4f904a2913984201ad0bffb63664019c73e0eb77/
> http://autobuild.buildroot.net/results/65c/65c7d47fdc0f55fb8deb77e34063320e2af337ee/
> http://autobuild.buildroot.net/results/aaa/aaaa1fc92b6a885d223681f40c5df7a962ee1fce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added commit about future toolchain requirements (Baruch)

We could have also added a patch for iptables doing

#ifndef TCPOPT_EOL
#define TCPOPT_EOL 0
#endif

etc.

But since nothing depends on nfsynproxy, we don't have to propagate
this dependency to any reverse dependency, so it's simpler to disable
this for musl.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
