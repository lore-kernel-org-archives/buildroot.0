From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 16:31:29 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <20121014160547.09c493d7@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014160547.09c493d7@skate>
Message-ID: <201210141631.29399.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 14 October 2012 Thomas Petazzoni wrote:
> On Mon, 10 Sep 2012 01:40:45 +0200, Yann E. MORIN wrote:
> 
> > To be noted, the changes in patch 4 to 6 are purely mechanical, and will need
> > more review and manual tweaks before that series can be applied. Most notably,
> > having the gettext rework series [0] applied first would eliminate a large
> > class of corner-cases (eg. cases like: "select PKG_FOO if BLA"). Also, some
> > packages have 'select' on other package's options, and that needs to be
> > manually reviewed, as it's not easy to distinguish a package's option symbol
> > from a package symbol (eg. BR2_PACKAGE_UTIL_LINUX_MOUNT: is it a package named
> > 'util-linux-mount', or is it the option 'mount' of a package named
> > 'util-linux'?)
> 
> Ok, I noted three "problems", that I think will have to fixed manually.
> 
> Problem 1: recursive dependencies introduced
> ============================================
> 
> Running 'make menuconfig', I get:
> 
> package/python/Config.in:6:error: recursive dependency detected!
> package/python/Config.in:6:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_PYTHON_DPKT
> package/python-dpkt/Config.in:5:	symbol BR2_PACKAGE_PYTHON_DPKT depends on BR2_PACKAGE_PYTHON
[--SNIP lots of recursive deps--]

> Looking at the first one, it seems to be caused by the fact that all
> Python external packages are enclosed inside a "if BR2_PACKAGE_PYTHON"
> in package/Config.in, so this Python dependency is already available.

Strange. I do not recall all those recursive deps issues. I'll check here.

My gut feeling is that the "if BR2_PACKAGE_PYTHON" should go, now that
we have _AVAILABLE.

> I think this problem can only be solved with manual intervention.

Yep.

> Problem 2: incorrect addition of dependencies on package sub-options
> ====================================================================
> 
> In package/python-dpkt/Config.in, your script generates:
> 
>  config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
>         def_bool y
>         depends on BR2_PACKAGE_PYTHON_AVAILABLE
>         depends on BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
> 
> But the last line shouldn't be there. BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
> doesn't exist: BR2_PACKAGE_PYTHON_ZLIB is a sub-option of the python
> package.
> 
> On the other hand, the sub-option are lacking the addition of "depends
> on ..._AVAILABLE", for example in package/python/Config.in:
> 
>  config BR2_PACKAGE_PYTHON_ZLIB
>         bool "zlib module"
>         select BR2_PACKAGE_ZLIB
>         help
>           zlib support in Python
> 
> this should become:
> 
>  config BR2_PACKAGE_PYTHON_ZLIB
>         bool "zlib module"
>         select BR2_PACKAGE_ZLIB
> +       depends on BR2_PACKAGE_ZLIB_AVAILABLE
>         help
>           zlib support in Python
> 
> But then in that case, we should also have a
> BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE symbol, so that python-dpkt can
> depend on it instead of forcefully selecting BR2_PACKAGE_PYTHON_ZLIB,
> without knowing if zlib is available or not.
> 
> This problem however is going to be present in many many places, so I
> don't know if manual intervention is reasonable for it. But on the
> other hand, I am not sure it is possible to write an automated script
> to solve this problem.

As much as I remember, there were not so much cases like that. But, except
for manual intervention, I do not see how we could differentiate that case.

The problem is (form my script's point of view): 
  Is BR2_PACKAGE_PYTHON_ZLIB representing:
    - the package "python-zlib", or
    - the option "zlib" of the package "python"?

Except for intrumenting the option symbol (eg.: BR2_PACKAGE_PYTHON_OPT_ZLIB)
which I doubt we want to, there is no easy way for the script to detect
this situation.

And then, do we want to push the _AVAILABLE semantic dow to sub-option?
I doubt we do.

So, depending on sub-options should be as:

config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
    def_bool y
    depends on BR2_PACKAGE_PYTHON_AVAILABLE
    depends on BR2_PACKAGE_PYTHON_ZLIB # Sub-option


> Problem 3: removing legacy
> ==========================
> 
> Due to the absence of such a _AVAILABLE mechanism, we have added a lot
> of "depends on" in many packages that would now become useless. Take
> for example libgtk2:
> 
> config BR2_PACKAGE_LIBGTK2_AVAILABLE
>         def_bool y
>         depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
>         depends on BR2_USE_WCHAR # glib2
>         depends on BR2_INSTALL_LIBSTDCPP # pango
> 	[...]
> 
> Those last two "depends on" are now useless, because those dependencies
> are automatically provided by the depends on CAIRO_AVAILABLE and
> LIBGLIB2_AVAILABLE.
> 
> So those legacy dependencies should be removed.
> 
> Here, I don't think an automated process is possible, a human
> intervention will be needed to find out if those legacy dependencies
> can be removed or not, on a case by case basis.

Yep, manual intervention, one of the corener-cases I wrote about in my
intro mail.

> So all in all, the problem I'm most worried about is problem (2). Have
> you thought about it already?

Yep, I've thought about it. Answer: manual review.
( Don't worry, *I* will have to do it before I submit a final series! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
