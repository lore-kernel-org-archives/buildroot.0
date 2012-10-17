From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Oct 2012 21:47:15 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <20121017213040.01b61869@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <507CF328.5090505@mind.be> <20121017213040.01b61869@skate>
Message-ID: <201210172147.15828.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Wednesday 17 October 2012 Thomas Petazzoni wrote:
> On Tue, 16 Oct 2012 07:39:52 +0200, Arnout Vandecappelle wrote:
> >   Originally I was in favour of having the BR2_PACKAGE_PYTHON
> > conditionals, but it _would_ probably make life simpler if we only
> > had dependencies on toolchain options...
> > 
> >   Yann, what do you think, would it make suboption handling simpler
> > if there was no 'depends on BR2_PACKAGE_PYTHON'?
> 
> The real problem with _AVAILABLE is not caused by Python/X.org packages
> being under a big "if" condition. The big problem we hadn't really seen
> is that we don't only need to add _AVAILABLE options for each package,
> but also for each package sub-options that does a select on another
> package. This means that the number of _AVAILABLE kconfig options to
> add is a lot bigger than we expected, at a point that probably makes
> the _AVAILABLE solution relatively impractical.

Maybe the solution would be that we do not add _AVAILABLE to sub-options,
but we can still use it from sub-options. Eg. (condensed):

    config PKG_FOO_AVAIL
        def_bool y
        depends on blabla

    config PKG_FOO
        bool "package foo"
        depends on PKG_FOO_AVAIL
        select blabla

    config PKG_BAR_AVAIL
        def_bool y
        depends on booboo

    config PKG_BAR
        bool "package bar"
        depends on PKG_BAR_AVAIL
        select booboo

    if PKG_BAR

    config PKG_BAR_OPTION
        bool "bar's option"
        depends on PKG_FOO_AVAIL
        select PKG_FOO

    comment "bar's option needs package foo"
        depends on !PKG_FOO_AVAIL

    endif # PKG_BAR

Isn't that sufficient?

For python's external modules, we should treat them as normal packages that
"depends on BR2_PACKAGE_PYTHON_AVAILABLE" and "select BR2_PACKAGE_PYTHON".

Dito for the Xorg's packages, except it's a bit different because the
BR2_PACKAGE_XORG7 symbol does *not* represent a package (see my previous
mail for a proposed change).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
