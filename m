From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 22:02:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: don't use --{en,
 dis}able-iptables
In-Reply-To: <20200714165800.995534-1-fontaine.fabrice@gmail.com>
References: <20200714165800.995534-1-fontaine.fabrice@gmail.com>
Message-ID: <20200815220213.55cc0ccd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 14 Jul 2020 18:58:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5fcee496df262fcc304ad22738441df35a960a67 wrongly replaced
> --{en,dis}able-libiptc by --{en,dis}able-iptables.
> 
> Indeed, this will raise the following build failure if
> --disable-iptables and --disable-ipset are both set:
> 
> configure: error: disable-libipset requires vrrp and iptables
> 
> The issue is that when iptables flag is set, it will first check for
> libiptc and then for ipset so setting --disable-iptables will disable
> libiptc and ipset (which is not what we wants)
> 
> As iptables flag is enabled by default, just drop
> --{en,dis}able-iptables to keep it simple
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a1712b2cc3ad878e6876325ec7d4c434d0d9d11b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was not very convinced by this explanation, so I dug deeper into this
issue. The configure.ac is far from being crystal clear, but I think I
got to the bottom of this, and submitted what I consider a better patch:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200815195851.282863-1-thomas.petazzoni at bootlin.com/

The commit log contains an extensive description of how I came up with
the alternate solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
