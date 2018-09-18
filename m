From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 18 Sep 2018 12:44:26 +0000
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <098ECE41A0A6114BB2A07F1EC238DE89667FD144@de02wembxa.internal.synopsys.com>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
 <aae1bc5da723d9dd98ddd4dcc7868e4dacb4b6f8.camel@synopsys.com>
 <20180918112657.7d1b9d28@windsurf>
 ,<99fcad6be0ba045a8d00274723ac511be2805aac.camel@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89667FD144@de02wembxa.internal.synopsys.com>
Message-ID: <24f81ffc5c8606c74c9d478a29b245d7646b90f6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Claus,

On Tue, 2018-09-18 at 14:12 +0200, Claudiu Zissulescu wrote:
> Hi,
> 
> Millicode is a special function call which doesn't behave like normal calls. So, once you use -fpic/dynamic and friends on the gcc driver, the
> latter assumes all the libs are ready to go via dynamic linker, but not miliicode which is using the regular non-plt relocations to resolve the
> millicode symbols. Hence they need to be explicitly linked.
> 
> Why the linker doesn't throw an error when detects such an odd situation? It goes to some historic reasons which are linked on how u-boot is
> compiled.

I'm not sure though what it has to do with U-Boot especially given U-Boot uses its own
[reduced] copy of libgcc.

> What it needs to be done to avoid this issue? Well, I would say don't use millicode which is more an optimization for bare-metal apps. If you really
> want to use it, then you need to link the libgcc explicitly.

Sure that's indeed an option. We'll just finally add "-mno-millicode" in TARGET_ABI for ARC and forget about that class of problems.
Also maybe it worth having "-mno-millicode" set by default for Linux toolchains so looking forward there will be no need to mess with millicode
manually.

-Alexey
