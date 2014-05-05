From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 5 May 2014 11:41:14 +0300
Subject: [Buildroot] [PATCH] czmq: needs MMU
In-Reply-To: <20140505033309.1dfc5aa8@core2quad.morethan.org>
References: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
 <20140505033309.1dfc5aa8@core2quad.morethan.org>
Message-ID: <20140505084114.GE3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Mon, May 05, 2014 at 03:33:09AM -0500, Mike Zick wrote:
> On Mon,  5 May 2014 06:58:03 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> >  config BR2_PACKAGE_CZMQ
> >  	bool "czmq"
> >  	select BR2_PACKAGE_ZEROMQ
> > +	depends on BR2_USE_MMU # fork()
> 
>   ^ ^ ^ ^
> >  	depends on BR2_INSTALL_LIBSTDCPP # zeromq
> >  	depends on BR2_INET_IPV6 # zeromq
> >  	depends on BR2_LARGEFILE # util-linux
> >  	depends on BR2_USE_WCHAR # util-linux
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > -	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
> > -	# support
> > -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> > && \
> > -		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
> >  	help
> >  	  High-level C Binding for 0MQ
> >  
> >  	  http://czmq.zeromq.org/
> >  
> >  comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar,
> > threads"
> > -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> > && \
> > -		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
> > +	depends on BR2_USE_MMU
> 
>   ^ ^ ^ ^
> >  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
> > BR2_LARGEFILE \ && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> >
> 
> Shouldn't the option and the comment have opposite conditions?
> I.E: Either display the option or the comment?

MMU is usually an attribute of the CPU architecture, and not a software 
configuration issue. In this case we don't show the software dependencies 
comment since the user can't do much about the CPU architecture of choice in 
the context of Buildroot. See 
http://buildroot.net/downloads/manual/manual.html#_literal_config_in_literal_file, 
under "Dependencies on target and toolchain options".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
