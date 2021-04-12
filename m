From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 12 Apr 2021 08:40:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: Bump version to 5.11.0
In-Reply-To: <YHHRkLbCks87iJ13@pevik>
References: <20210323181004.25172-1-petr.vorel@gmail.com>
 <20210404155259.196253ae@windsurf.home> <YGoG2Tqk6SVPHNpJ@pevik>
 <CAEyMn7bO9DFK6RRVXYDEFQNKXX-W5G_ZuwkFhLxcwWcpRoXHmA@mail.gmail.com>
 <YHHRkLbCks87iJ13@pevik>
Message-ID: <CAEyMn7b+1iyog74uTEJQaE8y6umW=evxtt4bJ4=BGhL_Byj7jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Am Sa., 10. Apr. 2021 um 18:25 Uhr schrieb Petr Vorel <petr.vorel@gmail.com>:
>
> Hi Heiko,
>
> > Hi Petr, Hi Thomas,
>
> > Am So., 4. Apr. 2021 um 20:35 Uhr schrieb Petr Vorel <petr.vorel@gmail.com>:
>
> > > Hi Thomas,
> > > > Hello Petr,
>
> > > > On Tue, 23 Mar 2021 19:10:04 +0100
> > > > Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > > > > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > > > > ---
> > > > > Hi,
>
> > > > > NOTE: this should not be applied until uclibc based toolchains are
> > > > > regenerated. But posted for people who don't use uclibc and would like
> > > > > to have iproute2 sync with kernel version.
>
> > > > I think they have all been updated now. However, your patch doesn't
> > > > apply: it assumes that Buildroot master has iproute2 5.8.0, but we have
> > > > 5.7.0. And the patch we have in package/iproute2/ doesn't apply to
> > > > 5.11.0. Could you have a look and respin?
>
> > > Sure, I'll send fixed version, sorry for error.
>
> > > But I tried to build on updated package and it looks like error still exists.
> > > What do I do wrong?
>
> > I just tried to test the version bump of iproute2 to v5.11 and I see
> > the same/similar error on utils/pkg-test for
> > bootlin-armv5-uclibcbootlin-armv5-uclibc.
>
> >   109 |  char fh_buf[sizeof(struct file_handle) + sizeof(__u64)] = { 0 };
> >       |                     ^~~~~~
> > fs.c:124:5: error: dereferencing pointer to incomplete type ?struct file_handle?
> >   124 |  fhp->handle_bytes = sizeof(__u64);
> >       |     ^~
> > fs.c:125:6: warning: implicit declaration of function
> > ?name_to_handle_at? [-Wimplicit-function-declaration]
> >   125 |  if (name_to_handle_at(AT_FDCWD, path, fhp, &mnt_id, 0) < 0) {
> >       |      ^~~~~~~~~~~~~~~~~
> > fs.c:109:7: warning: unused variable ?fh_buf? [-Wunused-variable]
> >   109 |  char fh_buf[sizeof(struct file_handle) + sizeof(__u64)] = { 0 };
> >       |       ^~~~~~
> > fs.c: In function ?get_cgroup2_path?:
> > fs.c:172:21: error: invalid application of ?sizeof? to incomplete type
> > ?struct file_handle?
> >   172 |  char fh_buf[sizeof(struct file_handle) + sizeof(__u64)] = { 0 };
> >       |                     ^~~~~~
> > fs.c:200:5: error: dereferencing pointer to incomplete type ?struct file_handle?
> >   200 |  fhp->handle_bytes = sizeof(__u64);
> >       |     ^~
> > fs.c:204:7: warning: implicit declaration of function
> > ?open_by_handle_at? [-Wimplicit-function-declaration]
> >   204 |  fd = open_by_handle_at(mnt_fd, fhp, 0);
> >       |       ^~~~~~~~~~~~~~~~~
> > fs.c:172:7: warning: unused variable ?fh_buf? [-Wunused-variable]
> >   172 |  char fh_buf[sizeof(struct file_handle) + sizeof(__u64)] = { 0 };
>
> > Looks like your patch in uclibc [1] is not in the used version of the
> > bootlin toolchain [2]. As far as I can see the toolchain uses uclibc
> > v1.0.34.
>
> > [1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=8bc41f131b8d70c84c300f14cd64abd448126b43
> > [2] https://toolchains.bootlin.com/releases_armv5-eabi.html
>
> > I think we have to wait until the toolchains will be updated to
> > include uclibc version 1.0.36 or greater.
> Yes.
>
> We could just wrote patch, which check for name_to_handle_at() in configure and
> use raw syscall for these old uClibc toolchains, send it to upstream (not sure
> if it'd be accepted) and use it in Buildroot. But I've been busy with other
> things, so I hope this won't be necessary.

Ok thank you for your answer. For me it is not necessary. I just
wanted to look at the patch and understand why it does not work. I'll
see if I can do something.

-- 
Heiko
