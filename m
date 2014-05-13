From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 23:51:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-10
In-Reply-To: <20140511094535.GF4096@tarshish>
References: <20140511063009.DE62C100F87@stock.ovh.net>
 <20140511094535.GF4096@tarshish>
Message-ID: <20140513235126.212289d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 11 May 2014 12:45:35 +0300, Baruch Siach wrote:

> On Sun, May 11, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:
> >        arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/eefa8efbe6e6a6b203c02c2977d29be9c77846cb/
> 
> Build log says:
> 
> checking for backtrace in -lunwind... no
> configure: error: Couldn't find or use libunwind.
> 
> But I can't reproduce it here. Thomas, can you look into config.log?

To reproduce the problem, you needed to have: libatomic_ops, libunwind,
and ltrace selected, and an architecture like ARMv4 or ARMv5. The
problem is that on ARMv4 and ARMv5, libatomic_ops doesn't provide real
atomic operations. But libunwind did not use the libatomic_ops stuff
properly, and therefore libatomic_ops was not providing emulated atomic
operations for those architectures. Later on, when ltrace tried to link
against libunwind, there were unresolved symbols due to this problem.

I've sent a patch to the Buildroot mailing list to fix this. You're
Cc'ed on the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
