From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Mar 2012 19:46:39 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal
	compliance info
In-Reply-To: <4F5883B8.7050107@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <201203072241.00945.yann.morin.1998@free.fr>
 <4F5883B8.7050107@lucaceresoli.net>
Message-ID: <201203081946.39608.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On Thursday 08 March 2012 11:02:32 Luca Ceresoli wrote:
> Yann E. MORIN wrote:
> > I would expect a one-directory-pre-package layout (personal opinion):
> >    legal-info/busybox/LICENSE
> >    legal-info/busybox/busybox-1.19.4.tar.bz2
> >    legal-info/kmod/COPYING
> >    legal-info/kmod/kmod-5.tar.bz2
> >    ...
> 
> I thought about the usage I would make of this material. The tarballs must go
> into some CD or website or similar. The licenses may be sent to documentation
> writers so they can typeset them in a document (if for some reason they do not
> want to use the produced licenses.txt file).

Which is also a valid point of view. Besides, packages (most of them, at
least) do include their own license file (in COPYING or the likes).

Agreed.

> > [--SNIP--]
> >> ISSUE 2: Packages with multiple licenses
> >> ========================================
> >>
> >> Some packages (e.g. freetype, qt) allow to choose among different licenses.
> >> - Should we add an option in menuconfig for choosing the license? This would
> >>    allow to generate "customized" manifest and license files.
> >> - Or should we save all licenses and and define the package license as, for
> >>    instance:
> >>      QT_LICENSE = GPLv3 or LGPLv2.1 or COMMERCIAL?
> > It would probably be possible to do:
> >      QT_LICENSE = GPLv3
> >      ifeq ($(blabla),y)
> >      QT_LICENSE += LGPLv2.1
> >      endif
> >
> > and so on...
> 
> Well, Qt allows to choose the license you want. So you can use all of it under
> the GPLv3, or all of it under LGPLv2.1, or all of it purchasing a commercial
> license.
> 
> The same applies to FreeType: "FreeType comes with two licenses from which you
> can choose the one which fits your needs best."
> (http://freetype.org/license.html).
> 
> In such cases, for what concerns Buildroot, I think we should either that the
> package in Buildroot is always used with a given license (e.g. LGPLv2.1 for Qt)
> or allow the Buildroot user to choose via menuconfig.
> 
> Your code snippet is perfect for a package that has a GPLv3 part that's always
> compiled and an optional LGPLv2.1 part.

In the end, what you did with your Qt patch, plus my proposal above,
should cover all cases:

  - single license
  - multiple licenses
  - conditional licenses

After all, this is a 'make' variable, so you can set it the way you want.

> >> ISSUE 3: packages without a license file
[--SNIP--]
> >> Option 3 is to wait for a smarter idea coming from your reviews! :)
> >
> > Proposal:
> >    - FOO_LICENSE_FILES = list of license files
> >    - FOO_LICENSE_HOOK = macros to call to copy the license files
> 
> Meaning something like the current POST_{CONFIGURE|INSTALL_TARGET|...}_HOOKS?
> Good idea, concise and readable. But we should also provide a macro (or a
> script) to copy the license files, such as:
> 
>    $(call COPY_LICENSE_FILES,pkgname,pkgver,license_file(s))
> 
> that copies to $(O)/legal-info/pkgname-pkgver, cats into licenses.txt and
> fills manifest.csv.

It should be part of the generic package infrastructure. So, one only needs to
call any of :
    $(eval $(call GENTARGETS,package,libfoo))
    $(eval $(call AUTOTARGETS,package,libfoo))
    $(eval $(call CMAKETARGETS,package,libfoo))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
