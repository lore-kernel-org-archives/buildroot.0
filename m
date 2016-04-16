From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sat, 16 Apr 2016 02:07:08 +0200
Subject: [Buildroot] [PATCH v4 3/3] dpdk: new package
In-Reply-To: <20160415235203.3f9ed61e@free-electrons.com>
References: <1459042284-6684-1-git-send-email-viktorin@rehivetech.com>
 <1459042284-6684-4-git-send-email-viktorin@rehivetech.com>
 <20160415235203.3f9ed61e@free-electrons.com>
Message-ID: <20160416020708.03ce1bf3@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Apr 2016 23:52:03 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,

Dear Thomas,

thanks a lot for your help! I've fixed those...

> > 
> > * it may require to enable PCI, MSIX, UIO in the Linux Kernel
> >   (some defconfigs does not include as default and it is platform
> >   dependent as ARMv7 almost does not use PCI)  
> 
> I have enabled PCI_MSI=y and UIO=y in my kernel configuration, and
> still, I don't have any .ko file installed in my target. Is this
> expected?

Of course, you are right. They are built but not installed. Fixed.

> 
[...]
> > +
> > +define DPDK_BUILD_CMDS
> > +	$(MAKE) -C $(@D) RTE_KERNELDIR=$(LINUX_DIR) CROSS=$(TARGET_CROSS)  
> 
> When the architecture is ARMv7, please pass:
> 
> 	CPU_FLAGS=
> 
> Otherwise, the dpdk build system passes -mfloat-abi=softfp, which makes
> the build fail when the selected ABI is EABIhf. And please report the
> bug upstream: the dpdk build system should not make assumptions on the
> selected ARM ABI.

Well, this leads to some hardcoded check of architecture into the
dpdk.mk. I don't like such approach. Would you instead accept the
following (temporary) patch into Buildroot as a solution for this?

http://dpdk.org/ml/archives/dev/2016-April/037577.html

I will remove it with the next DPDK release (when it's in the
mainline). I've tested and it builds successfully for both ABI and
EABIhf.

> 
[...]
> 
> Can you fix those issues and resend?

Sure, I will resend after I solve the ARM ABI issue.

> 
> Thanks!
> 
> Thomas

Regards
Jan

-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
