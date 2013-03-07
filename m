From: John Stile <john@stilen.com>
Date: Thu, 07 Mar 2013 06:53:10 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <CAKcgs2zvC-vxm78cqQYN4=kahsWkoNQ+yTToUGsz3SmbSA1rTQ@mail.gmail.com>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
 <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
 <1362620699.20183.193.camel@genx>
 <CAKcgs2yMcJMbJ+aM3XSpV7TdFdrAgTzZx0v6DL6qHv0gWv2SKg@mail.gmail.com>
 <1362641501.11556.12.camel@genx>
 <CAKcgs2zvC-vxm78cqQYN4=kahsWkoNQ+yTToUGsz3SmbSA1rTQ@mail.gmail.com>
Message-ID: <1362667990.30287.6.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gilles Talis,
On Thu, 2013-03-07 at 00:53 -0800, Gilles Talis wrote:
> Hi John,
> 
> 2013/3/6 John Stile <john@stilen.com>:
> > That did get me quite a bit farther.
> >
> > ... now it fails to find a few more symbols:
> > bpf.c:32:21: error: net/bpf.h: No such file or directory
> > In file included from bpf.c:49:
> > bpf-filter.h:33: error: array type has incomplete element type
> > bpf-filter.h:36: error: 'BPF_LD' undeclared here (not in a function)
> > bpf-filter.h:36: error: 'BPF_H' undeclared here (not in a function)
> > bpf-filter.h:36: error: 'BPF_ABS' undeclared here (not in a function)
> > bpf-filter.h:37: error: 'BPF_JMP' undeclared here (not in a function)
> > bpf-filter.h:37: error: 'BPF_JEQ' undeclared here (not in a function)
> > bpf-filter.h:37: error: 'BPF_K' undeclared here (not in a function)
> > bpf-filter.h:46: error: 'BPF_RET' undeclared here (not in a function)
> > bpf-filter.h:78: error: array type has incomplete element type
> > bpf-filter.h:85: error: 'BPF_B' undeclared here (not in a function)
> > bpf-filter.h:89: error: 'BPF_JSET' undeclared here (not in a function)
> > bpf-filter.h:91: error: 'BPF_LDX' undeclared here (not in a function)
> > bpf-filter.h:91: error: 'BPF_MSH' undeclared here (not in a function)
> > bpf-filter.h:93: error: 'BPF_IND' undeclared here (not in a function)
> >
> > I can see output/build/dhcpcd-5.6.7/bpf.c
> > has: #include "bpf-filter.h"
> >
> > I can see the symbols are defined in several files.
> > ./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/linux/filter.h
> > ./output/toolchain/linux/include/linux/filter.h
> > ./output/toolchain/uClibc_dev/usr/include/linux/filter.h
> > ./output/toolchain/linux-2.6.38.8/include/linux/filter.h
> Which OS are you trying to build this on? bpf.c is compiled only on
> non-linux based-platforms (e.g. BSD).
> I have tried myself on my ubuntu machine and dhcpcd builds fine.
> 
> Thanks
> Gilles.
I am building on: uname -a
Linux genx 3.3.8-gentoo #2 SMP Tue Oct 9 10:31:27 PDT 2012 x86_64 Intel(R) Core(TM) i5-2540M CPU @ 2.60GHz GenuineIntel GNU/Linux
Maybe my generated confing.mk is wrong (from the configure step)
What is in your config.mk?
My config.mk contains:
# 
SYSCONFDIR=	/etc
SBINDIR=	/sbin
LIBEXECDIR=	/libexec
DBDIR=		/var/db
RUNDIR=		/var/run
LIBDIR=		/lib
MANDIR=		/usr/share/man
CC=		gcc
SRCS+=		bpf.c if-bsd.c platform-bsd.c
COMPAT_SRCS+=	compat/arc4random.c
COMPAT_SRCS+=	compat/closefrom.c
COMPAT_SRCS+=	compat/strlcpy.c
SERVICEEXISTS=	/sbin/rc-service -e $$1
SERVICECMD=	/sbin/rc-service $$1 -- -D $$2
SERVICESTATUS=	service_command $$1 status >/dev/null 2>\&1
HOOKSCRIPTS=	50-ntp.conf

Additionally, are the toolchain/uClibc/uClibc-0.9.32.config variables
available inside my dhcpcd.mk, so I can add the dependency on
UCLIBC_SUPPORT_AI_ADDRCONFIG?
