From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 10 Jun 2016 07:45:32 +0000
Subject: [Buildroot] Numerous ARC related toolchain issues
In-Reply-To: <20160610093722.714b0240@free-electrons.com>
References: <20160609175017.0d9fae13@free-electrons.com>
 <1465543337.2942.15.camel@synopsys.com>
 <20160610093722.714b0240@free-electrons.com>
Message-ID: <1465544685.2942.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-06-10 at 09:37 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 10 Jun 2016 07:23:04 +0000, Alexey Brodkin wrote:
> 
> > 
> > > 
> > > http://autobuild.buildroot.net/results/d73/d732127d136bacc6bc17b742028691437df7f5f9/build-end.log
> > > BFD (GNU Binutils) 2.26.51.20160308 assertion fail elf32-arc.c:1566??
> > This is yet another manifestation of PIE invocation on ARC.
> > We'll need to disable usage of PIE in linuxpam.
>
> Ah, OK. Shouldn't gcc be modified on ARC to either ignore the pie flag,
> or alternatively bail out immediately with a clear error? At least it
> would be much more easy to analyze the error than a weird assertion
> failure down the road in the linker.

See PIE is a real requirement for U-Boot (because it relocates itself on early boot)
and for some reason U-Boot gets built with -PIE flag perfectly fine.

So we cannot just disable PIE support at least until U-Boot for ARC gets
auto-relocated. But for user-space apps indeed we don't support PIE still and
so existing code in toolchain fails here and there.

Funny enough that's better to see a failure during compilation compared to
silent segfault on attempt to run already built app. BTW now I can recall that exactly
this hit me with older toolchain - I needed wireshark so I built it flawlessly but
on execution dumpcap was segfaulting right on start. But being lazy enough I never
sent a patch to disable PIE in Wireshark :(

-Alexey
