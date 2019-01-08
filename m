From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 17:08:20 +0100
Subject: [Buildroot] [PATCH 06/19] infra/pkg-generic: only list files
 installed by the current package
In-Reply-To: <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
Message-ID: <20190108160820.GI19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

Thanks for the review! :-)

On 2019-01-08 14:07 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
snip
> > We fix that by limiting the search for files that have been actually
> > touched during the install step, now that we have the proper timestamp
> > for it.
[--SNIP--]
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 3de8a99675..42aebeb49d 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -67,7 +67,7 @@ define step_pkg_size_inner
> >         $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> >         cd $(2); \
> >         find . \( -type f -o -type l \) \
> > -               -newer $($(PKG)_DIR)/.stamp_built \
> > +               -newer $@_before \
> While it is probably not important, just noting here that if package A
> installs a file with a modification time in the future, then package B
> installed after A would still get that future file in its list. In
> fact, every package built after pkg A would then get that file into
> 'its' list.

How is this different from the current situation?

Maybe in that case, it would make sense that we touch all files after a
package installation (limited to that package's files, of course)?

My position is that, if a package voluntarily install stuff in the
future, it is borked. I.e. either it uses an absolute time, in which
case that time will be in the past some time in the future, or it uses
a delta, in which case it is not reproducible.

Furthermore when we do an actual reproducible build, we actually touch
all files at the end of the build, so a package that relies on file's
timestamp is not reproducible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
