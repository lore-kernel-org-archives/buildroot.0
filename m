From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 15:02:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/iptraf-ng: Needs
 -D_GNU_SOURCE to fix musl build
In-Reply-To: <1464023206-9875-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464023206-9875-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160524150211.4079a5ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 19:06:46 +0200, Bernd Kuhls wrote:
> Compiling iptraf-ng using musl is broken:
> 
> src/ipfrag.c:193:52: error: 'struct tcphdr' has no member named 'source'
>     ftmp->s_port = ntohs(((struct tcphdr *) tpacket)->source);
> 
> Musl guards these fields in the netinet/tcp.h header file with
> _GNU_SOURCE, for details see https://dev.openwrt.org/ticket/19889
> 
> Patch ported from
> http://git.alpinelinux.org/cgit/aports/tree/main/iptraf-ng/APKBUILD#n28
> 
> Fixes
> http://autobuild.buildroot.net/results/4ce/4cedd4dbaafca76e839f45cc0a4bb8c2c181920d/
> http://autobuild.buildroot.net/results/72b/72b019ce5bb52b8b87d92cce675708f7b9f8a96e/
> http://autobuild.buildroot.net/results/f67/f67f1c2a627a6d535dd5c00e2ee131b5c5a99a0a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Tested-by: J?rg Krause <joerg.krause@embedded.rocks>

Thanks for the better commit log.

>  IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-lpanel -lncurses"
> +IPTRAF_NG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

These two assignments should have been grouped into just one, so I've
changed that and applied to master. Thanks!

Can you report the problem upstream, and get it fixed there? There has
been some commits 6 weeks ago upstream, so it seems to be active. See
https://git.fedorahosted.org/cgit/iptraf-ng.git/log/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
