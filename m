From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2020 23:45:12 +0200
Subject: [Buildroot] [PATCH 2/6] boot/uboot: support building U-Boot
 with Python 3.x
In-Reply-To: <20200503151215.5d39140e@windsurf.home>
References: <20200502212812.51219-1-thomas.petazzoni@bootlin.com>
 <20200502212812.51219-3-thomas.petazzoni@bootlin.com>
 <20200503080231.GV15673@scaer>
 <20200503151215.5d39140e@windsurf.home>
Message-ID: <20200509214512.GU12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-05-03 15:12 +0200, Thomas Petazzoni spake thusly:
> On Sun, 3 May 2020 10:02:31 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > +if BR2_TARGET_UBOOT_NEEDS_PYTHON
> > > +
> > > +choice
> > > +	prompt "Python version"
> > > +	default BR2_TARGET_UBOOT_NEEDS_PYTHON2
> > > +
> > > +config BR2_TARGET_UBOOT_NEEDS_PYTHON2
> > > +	bool "python 2.x"
> > > +	help
> > > +	  Select this option if U-Boot needs a host Python 2.x
> > > +	  interpreter. This is the case for some U-Boot
> > > +	  configurations, prior to U-Boot 2020.01.
> > > +
> > > +config BR2_TARGET_UBOOT_NEEDS_PYTHON3
> > > +	bool "python 3.x"
> > > +	help
> > > +	  Select this option if U-Boot needs a host Python 3.x
> > > +	  interpreter. This is the case for some U-Boot
> > > +	  configurations, after U-Boot 2020.01.
> > > +
> > > +endchoice  
> > 
> > I don't like it much that construct, where a boolean hides a choice.
> > Instead, we can siumply use a choice (options names abbreviated as I'm
> > lazy to type them full):
[--SNIP--]
> If I use depends on like you suggest, we break backward compatibility.
> Indeed, an existing configuration with

Right, so I like backward compatibility, but I also do not like the
bool-hides-a-choice construct, so here's my counter-counter proposal:

    config BR2_TARGET_UBOOT_NEEDS_HOST_PYTHON
        bool

    choice
        bool "U-Boot needs host python"

    config BR2_TARGET_UBOOT_NEEDS_PY_NONE
        bool "none"
        depends on !BR2_TARGET_UBOOT_NEEDS_HOST_PYTHON

    config BR2_TARGET_UBOOT_NEEDS_PY2
        bool "python2"

    config BR2_TARGET_UBOOT_NEEDS_PY3
        bool "python3"

    endchoice

    config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
        bool "U-Boot needs pylibfdt"
        select BR2_TARGET_UBOOT_NEEDS_HOST_PYTHON

    config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
        bool "U-Boot needs pyelftools"
        select BR2_TARGET_UBOOT_NEEDS_HOST_PYTHON

Yes, this is a tiny-weeny-little-bit more verbose, because there's still
the BR2_TARGET_UBOOT_NEEDS_HOST_PYTHON boolean, but it has no prompt, so
it is not user-visible, and it no longer hides the choice, just one
entry of it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
