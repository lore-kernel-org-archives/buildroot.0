From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 May 2020 15:12:15 +0200
Subject: [Buildroot] [PATCH 2/6] boot/uboot: support building U-Boot
 with Python 3.x
In-Reply-To: <20200503080231.GV15673@scaer>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
 <20200502212812.51219-3-thomas.petazzoni@bootlin.com>
 <20200503080231.GV15673@scaer>
Message-ID: <20200503151215.5d39140e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sun, 3 May 2020 10:02:31 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +if BR2_TARGET_UBOOT_NEEDS_PYTHON
> > +
> > +choice
> > +	prompt "Python version"
> > +	default BR2_TARGET_UBOOT_NEEDS_PYTHON2
> > +
> > +config BR2_TARGET_UBOOT_NEEDS_PYTHON2
> > +	bool "python 2.x"
> > +	help
> > +	  Select this option if U-Boot needs a host Python 2.x
> > +	  interpreter. This is the case for some U-Boot
> > +	  configurations, prior to U-Boot 2020.01.
> > +
> > +config BR2_TARGET_UBOOT_NEEDS_PYTHON3
> > +	bool "python 3.x"
> > +	help
> > +	  Select this option if U-Boot needs a host Python 3.x
> > +	  interpreter. This is the case for some U-Boot
> > +	  configurations, after U-Boot 2020.01.
> > +
> > +endchoice  
> 
> I don't like it much that construct, where a boolean hides a choice.
> Instead, we can siumply use a choice (options names abbreviated as I'm
> lazy to type them full):
> 
>     choice
>         "Python support needed"
> 
>     config UBOOT_PY_NONE
>         "none"
> 
>     config UBOOT_PY2
>         "python2"
> 
>     config UBOOT_PY3
>         "python3"
> 
>     endchoice
> 
> > +endif
> > +
> >  config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> >  	bool "U-Boot needs pylibfdt"
> > +	select BR2_TARGET_UBOOT_NEEDS_PYTHON
> >  	help
> >  	  Select this option if your U-Boot board configuration
> >  	  requires the Python libfdt library to be available.
> >  
> >  config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
> >  	bool "U-Boot needs pyelftools"
> > +	select BR2_TARGET_UBOOT_NEEDS_PYTHON  
> 
> Of course here (both pylibfdt and pyelftools), you'd have to switch to a
> depends-on, but that does not change much afterall.

If I use depends on like you suggest, we break backward compatibility.
Indeed, an existing configuration with
BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y or
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y will not have UBOOT_PY2 enabled, and
therefore host-python will no longer be built.

My proposal was carefully designed to make sure existing configurations
do not break.

A possible solution would be something like the below, but I believe it
might cause some circular dependency:

choice
	prompt "Python support needed"
	default UBOOT_PY2 if BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
	default UBOOT_PY2 if BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS

config UBOOT_PY_NONE
	...
config UBOOT_PY2
	...
config UBOOT_PY3
	...
endchoice

config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
	bool "U-Boot needs pylibfdt"
	depends on !UBOOT_PY_NONE

config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
	bool "U-Boot needs pyelftools"
	depends on !UBOOT_PY_NONE

Of course, if you don't care about backward compatibility, then your
proposal works. Let me know how you want to proceed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
