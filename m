From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 10 Jun 2019 17:12:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags
 to GO_HOST_ENV
In-Reply-To: <0eb1cbd8-c143-432d-ebd3-7d25fb719ccc@mind.be>
References: <20190603092101.8658-1-mirza.krak@northern.tech>
 <7ccf0442-d03f-05f8-c9c5-338f975b5d3b@mind.be>
 <CADHdJwD4BkLGeaEmC4q8L+0R0RWeHmaH2CMyhn1RNHtpm7c8eQ@mail.gmail.com>
 <0eb1cbd8-c143-432d-ebd3-7d25fb719ccc@mind.be>
Message-ID: <CADHdJwCLHm2fvahK=uEo2fH-rJyHzCo9m4=-d1auXy-GdC8KFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 10, 2019 at 4:55 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/06/2019 14:10, Mirza Krak wrote:
> > On Mon, Jun 10, 2019 at 1:53 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 03/06/2019 11:21, Mirza Krak wrote:
> >>> If a go host package is built using cgo, it needs access
> >>> to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
> >>> might depend on.
> >>>
> >>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> >>
> >>  I apparently forgot to mention that I applied this to master, thanks. However...
> >>
> >>> ---
> >>>
> >>> This fixes current build errors of mender-artifact-3.0.0:
> >>>
> >>> http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14/build-end.log
> >>
> >>  Still failing:
> >>
> >> http://autobuild.buildroot.net/results/f9b/f9ba64ab4c8d7fa6cb301fab37ee4141ba442f61/build-end.log
> >>
> >>  I think the problem is that it is being linked statically, but host-xz only
> >> builds the shared library...
> >
> > I do not believe that it would try to link statically, at least that
> > was not the intention.
>
>  Doesn't Go always link statically?

From my understanding, this is not the case when using CGO unless you
explicitly state so.

> > However I am not able to reproduce this
> > locally.
>
>  Maybe you have liblzma.a installed on your host system?
>
> >
> > Will compare defconfigs but I suspect it is related to,
> >
> >       BR2_STATIC_LIBS=y
> >
> > being set in the erroneous build.
>
>  It may be related, but it shouldn't be: the build of host packages should not
> depend on the setting of BR2_STATIC_LIBS on the target.
>
> > This not something that I use
> > locally.
>
>  You can try to reproduce locally using the config from the autobuilder.

Thanks for the pointers, I will investigate further.


-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
