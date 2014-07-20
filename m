From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 16:10:33 +0200
Subject: [Buildroot] [PATCH 2/4] perl-gd: new package
In-Reply-To: <CAB0FRstWykAbTZmuyocyYgaSB8q5RtyNYsVy9E2OOqPw=nLzAw@mail.gmail.com>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-2-git-send-email-francois.perrad@gadz.org>
 <20140719195816.GK3593@free.fr> <20140719231604.GP3593@free.fr>
 <CAB0FRstWykAbTZmuyocyYgaSB8q5RtyNYsVy9E2OOqPw=nLzAw@mail.gmail.com>
Message-ID: <20140720141033.GB501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-20 08:00 +0200, Fran?ois Perrad spake thusly:
> 2014-07-20 1:16 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
[--SNIP--]
> >> It looks like there are still issues with search paths, which include
> >> path to the host system libraries:
> >>     http://autobuild.buildroot.org/results/336/33633a683227ebce620cb4b4561cfe7d7cbf4ba8/build-end.log
[--SNIP--]
> > I was not able to reproduce this buildfailure. The only occurences are
> > on Peter's machine, so maybe there is a peculirity with his setup.
[--SNIP--]
> here, my analysis
> 
> perl-gd.mk contains :
>     PERL_GD_CONF_OPT = \
>     -options=FT,PNG \
>     -lib_gd_path=$(STAGING_DIR)/usr \
>     -lib_ft_path=$(STAGING_DIR)/usr \
>     -lib_png_path=$(STAGING_DIR)/usr \
>     -lib_zlib_path=$(STAGING_DIR)/usr \
>     -ignore_missing_gd
> 
> when all these options are honored, the output of the configure step
> looks like :
> 
>     Included Features:          FT,PNG
>     GD library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     FreeType library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     PNG library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     Zlib library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
> 
> here, we have
> 
>     Included Features:          GD_XPM GD_JPEG GD_FONTCONFIG
> GD_FREETYPE GD_PNG GD_GIF GD_GIFANIM GD_OPENPOLYGON GD_UNCLOSEDPOLY
> GD_ANIMGIF GD_FTCIRCLE VERSION_33
>     GD library used from:       /usr
>     FreeType library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     PNG library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
>     Zlib library used from:
> /scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
> 
> so, at link time, we have problem with native libraries for GD, Gif,
> Jpeg and Xpm.

Yes, I did notice the differences between my build (which is like
yours), and the log from Peter's build. I even tried in a Squeeze-32
chroot, which has perl-5.10.1, but it still behaves as expected.

I was hoping you might have an idea on why it was behaving differently
in Peter's case. We will see this failure again and again on Peter's
autobuilder. We even have a new occurence of it:
    http://autobuild.buildroot.net/results/a5f/a5fa377288df604aaa49df0878d7dc4293648255/

So, it would be nice to at least understand what's going on.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
