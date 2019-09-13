From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 13 Sep 2019 12:51:14 -0500
Subject: [Buildroot] [PATCH] package/fakeroot: use TCP for msg passing
In-Reply-To: <20190714203329.GJ29941@scaer>
References: <20190711193654.2039-1-matthew.weber@rockwellcollins.com>
 <20190714203329.GJ29941@scaer>
Message-ID: <CANQCQpbzuO13Y=wQjOYwQLBz6zDC0cryviDBF7Q0pQW7zpXM8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Sun, Jul 14, 2019 at 3:33 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matt, All,
>
> On 2019-07-11 14:36 -0500, Matt Weber spake thusly:
> > fakeroot can be built to either use SYSV IPC or TCP for message passing.
> >
> > Cases for which the SYSV IPC version fails or causes problems but for
> > which fakeroot-tcp has been observed to work well include the items
> > listed below.
> >
> >   * Multithreaded applications (using pthread)
>
> I know you used the commit log from upstream, but that was written 12
> year ago now. 12 years ago NPTL was still new-ish, and LinuxThreads were
> still alive. Is it still true that fakeroot misbehaves when using
> pthreads at all nowadays?

Unsure.  Maybe better to just refer to the project readme instead of
stating it in the commit?

>
> >   * Running under realtime-preempt kernel
> >   * Microsoft Windows 10 Services for Linux
> >
> > Link to readme capturing original upstream bug report #
> > https://salsa.debian.org/clint/fakeroot/commit/113c6320244c4261f7f7a9ce07cf7b5465573dfe
> >
> > Fixes
> > https://bugs.busybox.net/show_bug.cgi?id=11366
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> > I can't find a good reason to not make this the new default in the
> > Buildroot host build of fakeroot.  vs auto detecting which to build
> > depending on what the host env can support.
>
> I have two questions:
>
>   - can we run two unrelated fakeroot concurrently? E.g. if we have two
>     buildsin parallel, which happen to each call their fakeroot at about
>     the same time that the two fakeroot will run in parallel, won;t that
>     clash? I think it boils down to how fakeroot chooses the port to
>     listen on;

Oh good point, I looked and it seems they are letting the system pick
the port on the server side and then publishing it to the client.  So
we should be good with concurrent builds/fs assembly.

>
>   - is there a performance issue? I wonder how it behaves for very big
>     rootfs content, when compared to the sysv ipc.

I'm guessing there are definitely more context switches as the data
would hit the IP stack.  This really feels like something that should
be only enabled when the host build system doesn't support SYSV IPC.

Regards,
Matt
