From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Aug 2011 16:32:10 -0300
Subject: [Buildroot] [git commit] ipset: ensure target kernel headers
 are used
In-Reply-To: <87hb6au753.fsf@macbook.be.48ers.dk>
References: <20110722115833.2A3F08B422@busybox.osuosl.org>
 <20110725094903.35873b1a@skate> <87hb6au753.fsf@macbook.be.48ers.dk>
Message-ID: <c321390804ba25a18bc9bc298239fa2c@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jul 2011 09:55:04 +0200, Peter Korsgaard wrote:

>>>>>> "Thomas" == Thomas Petazzoni 
>>>>>> <thomas.petazzoni@free-electrons.com> writes:
>
>  Thomas> Le Fri, 22 Jul 2011 13:51:45 +0200,
>  Thomas> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :
>
>  >> diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
>  >> index 9d901fc..700d2bc 100644
>  >> --- a/package/ipset/ipset.mk
>  >> +++ b/package/ipset/ipset.mk
>  >> @@ -9,5 +9,6 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
>  >> IPSET_SITE = http://ipset.netfilter.org
>  >> IPSET_AUTORECONF = YES
>  >> IPSET_DEPENDENCIES = libmnl host-pkg-config
>  >> +IPSET_CONF_OPT = --with-ksource=$(LINUX_HEADERS_DIR)
>
>  Thomas> I am sorry, but LINUX_HEADERS_DIR is only defined when the 
> internal
>  Thomas> toolchain backend is used, so I guess this is broken for 
> external
>  Thomas> toolchain or ct-ng toolchain builds.
>
>  Thomas> bridge-utils, busybox and iptables are already using
> LINUX_HEADERS_DIR,
>  Thomas> but I guess this needs some work as well.
>
> Ah yes, what should we do for external toolchains then - point
> LINUX_HEADERS_DIR at $(STAGING_DIR)/usr/include/linux?

Just sent a patch that kills the kernel check, it's probably the 
simplest way to deal with this looking forward.
Most of the checks are to know if the package needs to build modules to 
support ipset for older (<2.6.39) kernels which we don't handle.
There are also checks for proper kernel config options but i don't 
think we want to go down that road since other packages depend on other 
kernel options as well (tun/tap for openvpn, netfilter for iptables and 
so on...)
Regards.
