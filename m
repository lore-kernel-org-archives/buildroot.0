From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:47:40 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add hidden symbol for PIE
 support
In-Reply-To: <ad24a697-55f9-aa38-4c26-dd81f9345e97@gmail.com>
References: <20160711143513.GA6072@waldemar-brodkorb.de>
 <ad24a697-55f9-aa38-4c26-dd81f9345e97@gmail.com>
Message-ID: <20160724214740.10a2d059@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 17:06:17 +0200, Romain Naour wrote:

> >  config BR2_TOOLCHAIN_USES_UCLIBC
> >  	bool
> > +	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS  
> 
> It seems that we also need to black list ARM + uClibc + static linking config [1]

Isn't it blacklisted above? Waldemar's code will select
BR2_TOOLCHAIN_SUPPORTS_PIE only if we are not on ARC *and* we are not
on m68k *and* we are not static linking.

So if you're static linking, !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS
is false, and BR2_TOOLCHAIN_SUPPORTS_PIE is not selected.

> Also, what about a test in the toolchain helper to check PIE support is really
> available ?

Would be nice, but I'm not sure it's that easy: in practice a simple
executable will build with -fPIE on ARC, but more complicated piece of
code will not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
