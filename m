From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 20:51:47 +0100
Subject: [Buildroot] [PATCH 06/19] infra/pkg-generic: only list files
 installed by the current package
In-Reply-To: <CAAXf6LUN2D=s56CdBJcyAr7q6DMtdDiSwO8z7Yfoh30qyZOEBA@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
 <CAAXf6LUN2D=s56CdBJcyAr7q6DMtdDiSwO8z7Yfoh30qyZOEBA@mail.gmail.com>
Message-ID: <20190108195147.GC4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 16:56 +0100, Thomas De Schampheleire spake thusly:
> El mar., 8 ene. 2019 a las 14:07, Thomas De Schampheleire
> (<patrickdepinguin@gmail.com>) escribi?:
[--SNIP--]
> > > -               -newer $($(PKG)_DIR)/.stamp_built \
> > > +               -newer $@_before \
> > While it is probably not important, just noting here that if package A
> > installs a file with a modification time in the future, then package B
> > installed after A would still get that future file in its list. In
> > fact, every package built after pkg A would then get that file into
> > 'its' list.
> Possibly more realistically, a package installing a file with a fixed
> timestamp in the past, perhaps a timestamp of the build time preserved
> via 'cp -a'.

Actually, we already have this very issue with our skeleton: its files
are copied and their timestamps are kept as-is, so the files are almost
certainly older than the built timestamp, and thus are not accounted for
againt the skeleton.

I already identified this problem a few days ago while working on this
series, and I had considered fixing it later, or the series would get
even bigger...

And yes, the problem already happens with the current situation.

If we wanted to be exhaustive, we'd also list files that are not already
in the list (and warn loudly). And since we introduce a new format, we
could more easily add a "metadata" field that specifies why the entry
was added (mtime, new-but-old, etc...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
