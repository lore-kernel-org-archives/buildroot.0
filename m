From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jun 2018 19:21:00 +0200
Subject: [Buildroot] [PATCH v3 4/4] linux: config.in: add comment for
 Arm Cortex-M
In-Reply-To: <20180601153942.GA3841@scaer>
References: <1527772887-31616-1-git-send-email-christophe.priouzeau@st.com>
 <1527772887-31616-4-git-send-email-christophe.priouzeau@st.com>
 <20180601153942.GA3841@scaer>
Message-ID: <20180601172100.GA9702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe, All,

On 2018-06-01 17:39 +0200, Yann E. MORIN spake thusly:
> On 2018-05-31 13:21 +0000, Christophe PRIOUZEAU spake thusly:
> > When binutils > 2.28 are selected on Arm Cortex-M cpu,
> > linux kernel does not boot due to a new implementation
> > of 'adr pseudo instruction' on binutils.
> > 
> > Bugzilla thread: https://bugs.busybox.net/show_bug.cgi?id=11051
[--SNIP--]
> > diff --git a/linux/Config.in b/linux/Config.in
> > index 73a3299..b5957b6 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -8,6 +8,10 @@ config BR2_LINUX_KERNEL
> >  
> >  if BR2_LINUX_KERNEL
> >  
> > +comment "Linux kernel will not boot with binutils >= 2.29"
> > +	depends on BR2_ARM_CPU_ARMV7M
> 
> So, my understanding was that the build in Thuimb mode was what was
> causing the issue, rather than the actual architecture.
> 
> So, if one has (say) a Cortex-A9, and decides to build in Thumb mode, as
> well as build its kernel in Thumb mode, wouldn't that also trigger the
> issue as well?

So, with Peter, we've attemped various tests, all based of our
qemu_arm_vexpress_defconfig, with the followingf results:

  - defconfig with no change, ie.e arm mode with binutils 2.29: OK

  - defconfig with just Thumb mode and kernel in Thumb2, still with
    binutils 2.29: KO

  - defconfig with Thumb mode, kernel in Thumb2, and binutils 2.28: OK

So, it really is thumb mode and binutils 2.29 that is at fault, not just
armv7m.

I'm cooking the patch right now, theres a good smell around; baking is
on good tracks... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
