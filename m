From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Jun 2016 07:23:04 +0000
Subject: [Buildroot] Numerous ARC related toolchain issues
In-Reply-To: <20160609175017.0d9fae13@free-electrons.com>
References: <20160609175017.0d9fae13@free-electrons.com>
Message-ID: <1465543337.2942.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for taking care and spending your time on this analysis.
We did see all these failures and already working hard to fix them.

Below some more details on particular failures.

On Thu, 2016-06-09 at 17:50 +0200, Thomas Petazzoni wrote:
> Hello Alexey,
> 
> It seems like since the latest update of the ARC tools, we're seeing
> quite a few build failures caused by the toolchain:
> 
> http://autobuild.buildroot.net/results/d73/d732127d136bacc6bc17b742028691437df7f5f9/build-end.log
> BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566

This is yet another manifestation of PIE invocation on ARC.
We'll need to disable usage of PIE in linuxpam.

> http://autobuild.buildroot.net/results/cb8/cb8bd3a01c7a6fadb20f18c1a3cbfabc52f3a6ff/build-end.log
> /tmp/ccKi33Rl.s: Assembler messages:
> /tmp/ccKi33Rl.s:578: Error: @dtpoff is not a complex relocation.
> /tmp/ccKi33Rl.s:578: Error: extra comma
> /tmp/ccKi33Rl.s:578: Error: syntax error
> /tmp/ccKi33Rl.s:588: Error: @dtpoff is not a complex relocation.
> /tmp/ccKi33Rl.s:588: Error: extra comma
> /tmp/ccKi33Rl.s:588: Error: syntax error

That one was reported to our toolchain guys and we're looking forward
to hearing back from them.

> http://autobuild.buildroot.net/results/37a/37a57f29c6632fcdb18670a18328679dee925240/build-end.log
> BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566

Given the same assertion that was triggered and that line in the log:
----------------------->8--------------------
checking whether /home/buildroot/build/instance-1/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc accepts -fPIE...
yes
----------------------->8--------------------
I would assume PIE is guilty here, so we will disable PIE in bluez-utils.

> http://autobuild.buildroot.net/results/1c1/1c14a7cbda1dce8867275ba2f2c70054fdbfbbbc/build-end.log
> (same, but on wireshark)

Looks like the same is applicable to wireshark.

> These are all with the internal toolchain backend, so we're building
> with the latest ARC toolchain components.
> 
> Are these problems already known? They seem to be new, I don't think
> they were appearing with the previous release of ARC tools.

As said above we know about all of these and trying to resolve them ASAP.
Be prepared for patches with fixes next week :)

Again thanks for all your efforts in making BR a better product!

-Alexey
