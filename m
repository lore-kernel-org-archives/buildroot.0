From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 23:33:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <20140120212701.GC3421@free.fr>
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr>
Message-ID: <20140122223320.GD3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-01-20 22:27 +0100, Yann E. MORIN spake thusly:
> On 2014-01-20 20:05 +0100, Bernd Kuhls spake thusly:
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> > news:d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.199
> > 8 at free.fr: 
> > 
> > > We package ffmpeg2 as a separate package from ffmpeg, instead of
> > > bumping the latter, since gstreamer-0.10's gst-ffmpeg still use an
> > > older version of ffmpeg.
> > 
> > Hi,
> > 
> > this is not true anymore:
> > 
> > gst-ffmpeg: Use internal libav instead of external ffmpeg: 
> > http://git.buildroot.net/buildroot/commit/?id=
> > 6ea49a23df3fa950e253bf704188e87a583a8ba4
> > 
> > ffmpeg: Bump version to 1.2.5: http://git.buildroot.net/buildroot/commit/?id=
> > 4b959fcb67675b9e0594dc6b12742e119c82c96e
> 
> Ah, yes. This ffmpeg2 patch of mine I did some three months ago. I just
> refreshed it yesterday, and forgot to re-check the compatibilty issue.
> 
> I'll double check what needs to be done, rework the commit log, and
> resubmit later.

The sets of files installed by each version has a non-null intersection,
especially the header files, and the .pc files.

The libraries have different versions, indeed, but we still can't
install both, as the .so links will point to the latest being installed,
which is not predictible.

Say for example:
  - package 'zzz' depends on ffmpeg (and is incompatible with ffmpeg2)
  - the Makefile builds the package in alphabetical order, so we'd build:
    ffmpeg -> ffmpeg2 -> zzz
  - zzz will see header and .pc files, and .so symlinks from ffmpeg2,
    not ffmpeg.

So, I still think we should consider ffmpeg2 to be clashing with ffmpeg1.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
