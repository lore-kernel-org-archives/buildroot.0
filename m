From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Nov 2016 17:54:33 +0100
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when
 building for MIPS
In-Reply-To: <1d433e42-c4e9-ca80-0fd3-8c6223e0d13b@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
 <20161123143914.3969-4-Vincent.Riera@imgtec.com>
 <20161123215657.5ac2436d@free-electrons.com>
 <179a55e6-44e2-f242-b803-03517419df25@imgtec.com>
 <20161124162121.7e15799e@free-electrons.com>
 <1d433e42-c4e9-ca80-0fd3-8c6223e0d13b@imgtec.com>
Message-ID: <20161124175433.70488d2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 16:23:46 +0000, Vicente Olivert Riera wrote:

> no, there is no patch enabling or disabling MoarVM for MIPS. You won't
> be able to build MoarVM for MIPS until libatomic_ops has support for
> MIPS as well, because MoarVM depends on libatomic_ops.
> 
> So, if we enable libatomic_ops, then we will be able to build MoarVM,
> and that will fail. What I did in my patch series is to add the code for
> fixing the MIPS problem in MoarVM even before we can actually build it
> for MIPS.

Ah, yes, moarvm has a "depends on
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS", so indeed moarvm can't be
selected for MIPS until MIPS support in libatomic_ops is enabled. So
bisectability-wise we are OK.

However, from a logical point of view, it is very, very strange to
enable the dependencies of moarvm *after* moarvm itself. It would be
much more logical to take care of libatomic_ops first (which can be
used for other things than moarvm), and then handle moarvm.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
