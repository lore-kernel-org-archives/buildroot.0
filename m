From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Oct 2012 19:34:53 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <507CF328.5090505@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014193849.019347dd@skate> <507CF328.5090505@mind.be>
Message-ID: <201210161934.53711.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On Tuesday 16 October 2012 Arnout Vandecappelle wrote:
> On 14/10/12 19:38, Thomas Petazzoni wrote:
> > In other words: we can assume the user knows about big subsystems
> > (X.org, Python, Perl, etc.), but we don't want him to know the fine
> > details of the dependencies on sub-options.
> 
>   Someone (I don't remember who) proposed to stop doing that, because it adds
> little value.  Indeed, it's not as if 9 extra entries in the Scripting
> Languages menu will suddenly make it more difficult to navigate.  Maybe X.org
> is an exception, but even there most packages are collected in the x11r7 menus
> (and those could still be kept in a conditional).
> 
>   Originally I was in favour of having the BR2_PACKAGE_PYTHON conditionals,
> but it _would_ probably make life simpler if we only had dependencies on
> toolchain options...
> 
>   Yann, what do you think, would it make suboption handling simpler if there
> was no 'depends on BR2_PACKAGE_PYTHON'?

In fact, I think python modules _should_ depends on BR2_PACKAGE_PYTHON, and
that should be more easily handled when _AVAILABLE is, well, available.

The problem with python modules is that they are hidden behind a
    if BR2_PACKAGE_PYTHON
    source [python-modules]
    endif
*in* *addition* *of*, for each package:
    depends on BR2_PACKAGE_PYTHON

I think the "if BR2_PACKAGE_PYTHON" should be removed, and we should keep
only the per-package depends on. If/when we add _AVAILABLE, it will be
easier to manage.

Yes, that will add more entries in the menuconfig. But that's not as it were
not already a bit crowded... ;-) And it can go in a sub-menu, anyway, like:

    Interpreters  --->
        Python support  --->
           [ ] Python
           External python modules  --->
               [ ] Foo

When you select python:

    Interpreters  --->
        Python support  --->
           [*] Python
           python module format (.pyc only)
           Core python modules  --->
               [ ] Bar
           External python modules  --->
               [ ] Foo

And when you select Foo:

    Interpreters  --->
        Python support  --->
           -*- Python
           python module format (.pyc only)
           Core python modules  --->
               [ ] Bar
           External python modules  --->
               [*] Foo


The most problematic issue I've encountered is with X11r7. The top-level
config option is BR2_PACKAGE_XORG7, but it is *not* a package.

What I would suggest is something like (just out of my tired brain):

    choice
        prompt "X Window System server type"

    config BR2_PACKAGE_XSERVER_none
        bool "None"
    
    config BR2_PACKAGE_XSERVER_xorg  # <-- Note how it currently is lower-case
        bool "Modular X.org"         #     'xorg' in the repository...
        depends on BR2_PACKAGE_XSERVER_xorg_AVAILABLE
        select BR2_HAS_XORG7
    
    comment 'X.org requires largefile and C++ support'
        depends on !BR2_PACKAGE_XSERVER_xorg_AVAILABLE
    
    config BR2_PACKAGE_XSERVER_tinyx  # <-- Ditto lower-case 'tinyx'...
        bool "TinyX"
        depends on BR2_PACKAGE_XSERVER_tinyx_AVAILABLE
        select BR2_HAS_XORG7
    
    comment 'TinyX depends on BLABLA'
        depends on !BR2_PACKAGE_XSERVER_xorg_AVAILABLE
    
    endchoice

    config BR2_HAS_XORG7
        bool

    menu "Xorg7 libs and apps"
    source "package/Xfoo/Config.in"
    # source other packages, too
    endmenu

And then in package Xfoo:

    config BR2_PACKAGE_XFOO_AVAILABLE
        def_bool y
        depends on BR2_HAS_XORG7
        depends on BR2_PACKAGE_BAR_AVAILABLE

    comment "Package Xfoo requires an Xserver"
        depends on !BR2_PACKAGE_XFOO_AVAILABLE

    config BR2_PACKAGE_XFOO
        bool "Xfoo"
        depends on BR2_PACKAGE_XFOO_AVAILABLE
        select BR2_PACKAGE_BAR

And so on...

Of course, it goes against the mantra:
    I know I want package 'Xfoo', just select whatever
    I need to get it, for ${DEITY_NAME}'s sake!

It should probably be possible to keep that semantic, yet with a bit more
involvement.

Comments?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
