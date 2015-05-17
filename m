From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2015 13:35:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-11
In-Reply-To: <CAHXCMMJfaXA3u75rBvG7C9_sZE_cQJf=DuxE55iKEcppt3ioLQ@mail.gmail.com>
References: <20150512063016.AD506100F8B@stock.ovh.net>
 <20150516231145.GA7903@free.fr>
 <CAHXCMMJfaXA3u75rBvG7C9_sZE_cQJf=DuxE55iKEcppt3ioLQ@mail.gmail.com>
Message-ID: <20150517113518.GA4230@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-05-17 06:35 +0200, Samuel Martin spake thusly:
> On Sun, May 17, 2015 at 1:11 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2015-05-12 08:30 +0200, Thomas Petazzoni spake thusly:
> >> Build statistics for 2015-05-11
> >>      powerpc |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/c70f793c7c3b380428d6e2e622a90805cffc4dd1/
> >
> > This failure is the same as the one I'm currently investigating:
> >     http://autobuild.buildroot.org/results/e03/e0392859a1943d1db2a5ee2f7fdf93764369d979/
> >
> > The root cause (I think) is opencv.pc, which contains:
> >
> >     Libs:  ${exec_prefix}/lib/libopencv_calib3d.so
> >         ${exec_prefix}/lib/libopencv_contrib.so
> >         [...]
> >         ${exec_prefix}/lib/libopencv_ts.a
> >         ${exec_prefix}/lib/libopencv_video.so
> >         -lrt -lpthread -lm -ldl
> >
> > (It's all on one line, but split here for readability, and lots of libs
> > stripped out).
> >
> > OK, so at link time, an opencv-using package (like gst2-plugins-bad)
> > will just try to link against ${exec_prefix}/lib/libopencv_ts.a , which
> > expands to /usr/lib/libopencv_ts.a and that is:
> >
> >  1- not caught ny our paranoid toolchain wrapper
> >  2- not prefix-expanded by pkg-conf
> >
> > I'll see what I can do with that, but tomorrow... ;-)
> >
> Yeah, I know opencv.pc generation is broken. A patch fixing it is
> available at [1], which is fortunatelly part of the 2.4.11 release
> (the latest stable release).
> And, as I write these lines, I'm running build tests on the opencv
> bump series [2] (rebased on next and which I intend to submit for the
> next release cycle).
> 
> [1] https://github.com/Itseez/opencv/commit/eceada586bbf18fc267e437522ec4f1f23ddc656
> [2] https://github.com/tSed/buildroot/commits/sma/opencv

OK, great! Looking forward to it (I'll try to get some time to review it
when you post it, Cc me, please).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
