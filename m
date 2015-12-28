From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 16:17:04 -0300
Subject: [Buildroot] [PATCH v2 1/1] toolchain-external: CodeSourcery
 PowerPC: Revert the removal of CS PowerPC 2011.03
In-Reply-To: <20151226220445.GD4083@free.fr>
References: <1451164306-30008-1-git-send-email-romain.naour@gmail.com>
 <20151226220445.GD4083@free.fr>
Message-ID: <56818AB0.8090505@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/12/15 19:04, Yann E. MORIN wrote:

> Or we just ditch 2012.03 altogether, and just keep 2011.03.
>
> The difference being:
>
>    - back to a gcc-4.5 instead of gcc-46.6; we loose 5 packages:
>          apitrace, dawgdig, mpd, upmpdcli and zmqpp
>
>    - back to kernel headers 2.6.38 instead of 3.2; we loose 31 packages:
>          bluez5_utils cdrkit dhcpcd dvb-apps dvdrw-tools fastd
>          gst1-plugins-good ifupdown iproute2 libcap libnftnl libseccomp
>          libv4l lxc mjpg-streamer mmc-utils network-manager nftables
>          openswan racehound smack squid stress-ng tvheadend util-linux
>          v4l2grab vlc w_scan weston zbar
>
> Thomas, Gustavo: your opinion?

Hi all.
In general i dislike the CS powerpc toolchains, they're finicky and 
outdated, so i tend to roll my own via ct-ng or internal.
That being said and going back to Romain's original mail, you can't have 
SPE and altivec at the same time, they're mutually exclusive.
That's because SPE is basically a FPU bolted into CPU GP registers: for 
v1 it just implements single precision, for v2 it implements double (by 
extending the GP registers to 64 bits).
Altivec requires a "classic" FPU with dedicated registers.
Getting that out of the way the altivec woes come from gcc changing the 
semantics for enabling them: in the old wild west that was -faltivec, 
the standard/modern way is -maltivec. The problem lies with Apple if i'm 
not wrong, since they ditched powerpc a while ago back then they used an 
old gcc, hence -faltivec, and in many cases the tested condition is 
based on that assumption (powerpc = apple). Care must be taken since the 
calling convention for the asm-optimized code might be OSX rather than 
linux as well, hence just switching the knob to the new/standard way may 
do no good.
Now back to SPE, since ABI can't be maintained between e500v1 and v2 for 
obvious reasons it was kind of decided to drop hard float from glibc, 
hence newer (eglibc >= 2.18 IIRC) versions can't be built targetting an 
e500v? without softfloat, so basically it's a dead path anyway (except 
uclibc*, it still has the hard float implementation in place, and screw 
the ABI).
Regards.
