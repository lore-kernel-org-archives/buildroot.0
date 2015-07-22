From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 22 Jul 2015 15:06:01 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150722094349.424e7a3e@free-electrons.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
Message-ID: <1437577561.3396.13.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-07-22 at 09:43 +0200, Thomas Petazzoni wrote:
> 
> >          arc |                alsa-lib-1.0.29 | NOK | 
> > http://autobuild.buildroot.net/results/b704016acfa38e7998739a2c70bcf6020c59bda8/
> 
> Static linking issue with uClibc. Alexey is working on it.


Looks like this is because a missing commit in uClibc - 
Remember that discussion - http://lists.busybox.net/pipermail/uclibc/2014-September/048597.html?
That was applied to uClibc-ng but not to uClibc which we closely following.
Will ping Bernard once again because patch still applies perfectly fine.

Sent a not to Bernard asking to apply it to uClibc master.

> 
> .tbss issue, Alexey is working on it.
> 
> >          arc |                       atf-0.21 | NOK | 
> > http://autobuild.buildroot.net/results/bc2dc2752caadfe85f02c9d708ba44a152f2127e/
> 
> Same.
> 
> >          arc |                audiofile-0.3.6 | NOK | 
> > http://autobuild.buildroot.net/results/5360fdeb211a46dada1aac2bd242834fb615879f/
> >          arc |                audiofile-0.3.6 | NOK | 
> > http://autobuild.buildroot.net/results/d74589bc1f582c7304c86b3435b613419ee9966d/
> 
> Same.

Looks like we identified a root cause. Now it's time to fix it properly. 

> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/f08644d1ff3e769a86c4f8a3b60e40abb5f0a64e/
> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/4848ead8ccf4fb7b0ff582c0fac94ce9b00fd341/
> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/196b28f2ecf12a03390c806b5f4e9f34577998b7/
> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/71ee8b5b2dce1d9f096c3667cd59eaf4a3b9af2b/
> 
> /tmp/ccY5Q1ef.s: Assembler messages:
> /tmp/ccY5Q1ef.s:475: Error: internal error: fixup not contained within frag
> Makefile:138: recipe for target 'setrans_client.lo' failed
> 
> Alexey ?

I bet this is a pre-built toolchain back from arc-2015.06-rc1 days.
Please update it to something more up to date. At least I cannot reproduce this with
newer toolchain.

> >          arc |                   zeromq-4.0.5 | NOK | 
> > http://autobuild.buildroot.net/results/9ba4de85136e9ac4a68dcb7ee4285e03168d4a15/
> 
> Toolchain problem:
> 
>   CXX      libzmq_la-sub.lo
> socket_base.cpp: In member function 'void zmq::socket_base_t::event_connected(std::string&, int)':
> socket_base.cpp:1157:1: error: Internal consistency failure: cfi row mismatch [-Werror]
>  }
>  ^

This is a known thing in arc-2015.06 release.
So please consider prebuilt toolchain update.

-Alexey
