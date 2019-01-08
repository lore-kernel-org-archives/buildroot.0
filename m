From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 21:02:35 +0100
Subject: [Buildroot] [PATCH 06/19] infra/pkg-generic: only list files
 installed by the current package
In-Reply-To: <CAAXf6LVrVZqrCH+bwYYbAGxhDeDnYXXE8MLfFKCH75EOdz3ZVA@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
 <20190108160820.GI19623@scaer>
 <CAAXf6LVrVZqrCH+bwYYbAGxhDeDnYXXE8MLfFKCH75EOdz3ZVA@mail.gmail.com>
Message-ID: <20190108200235.GD4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 17:55 +0100, Thomas De Schampheleire spake thusly:
> El mar., 8 ene. 2019 a las 17:08, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > On 2019-01-08 14:07 +0100, Thomas De Schampheleire spake thusly:
> > > El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> > > (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > > > -               -newer $($(PKG)_DIR)/.stamp_built \
> > > > +               -newer $@_before \
> > > While it is probably not important, just noting here that if package A
> > > installs a file with a modification time in the future, then package B
> > > installed after A would still get that future file in its list. In
> > > fact, every package built after pkg A would then get that file into
> > > 'its' list.
> > How is this different from the current situation?
> 
> Yes, it's the same as in the current situation, but not in 'my'
> current situation where I'm still relying on md5sum :-)
> Part of my interest in reviewing these changes is the hope that they
> could remove the need for my revert of the 'shave off' commit that
> switches to mtime instead of md5sum, and thus following upstream
> Buildroot in this respect.

Yes, and I thank you a lot for this thorough review! :-)

> > Maybe in that case, it would make sense that we touch all files after a
> > package installation (limited to that package's files, of course)?
> But it could be that the package has good reasons to expect a specific
> timestamp, or more probably a relative time order between certain
> files.
> I'm not sure if it is common, like I said I'd need to check in my own case.

The only case I'm aware of, is that systemd can detect the timestamp of
/usr and decide to run upgrade scripts if /usr is more recent than a
file in /etc, hence the reason we have:

    https://git.buildroot.org/buildroot/tree/Makefile#n786

But see below...

> > My position is that, if a package voluntarily install stuff in the
> > future, it is borked. I.e. either it uses an absolute time, in which
> > case that time will be in the past some time in the future, or it uses
> > a delta, in which case it is not reproducible.
> 
> A time delta expected between two files is not irreproducible if both
> files come from the same package.
> 
> >
> > Furthermore when we do an actual reproducible build, we actually touch
> > all files at the end of the build, so a package that relies on file's
> > timestamp is not reproducible.
> 
> I was not aware of this. That changes things, of course.
> Can you point me to the exact place in the code?

    https://git.buildroot.org/buildroot/tree/fs/common.mk#n39

And now I notice that the systemd stuff is borked in this case, because
/usr must really be the time of build, not the time of the commit date.

I now realise that there is a whole slew of incorrect assumptions we've
made about SOURCE_DATE_EPOCH in the context of Buildroot, but I shall
write about this in another thread.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
