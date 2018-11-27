From: Matthew Weber <Matthew.Weber@collins.com>
Date: Mon, 26 Nov 2018 21:14:15 -0600
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <871s7liu5e.fsf@paral.in>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
 <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
 <871s7liu5e.fsf@paral.in>
Message-ID: <CANQCQpYM2E_+rMfDQ7svB05V4TfJKpgHCOpoPN49uLLqRZ30Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Thu, Nov 15, 2018 at 9:22 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi Matthew,
>
> Matthew Weber <matthew.weber@rockwellcollins.com> writes:
> > I did find that the dockercli just hangs when I call it, however I
> > check and the daemon is running.  I'll see if I can get more debug
> > (strace, etc).
>
> The CLI itself is fine, but the daemon sometimes hangs on startup. I
> have noticed this problem on my laptop as well (x86) so it's not
> specific to this build or environment, it seems.
>
> The daemon will be called, but will not log anything, and basically hang
> for sometimes minutes. I try restarting it a few times, but that doesn't
> seem to work. If I wait, it usually starts up eventually.
>
> Most of the time the daemon starts immediately, but something seems to
> trigger this hang.
>
> Once the daemon is running and logging messages, the CLI is responsive.
>
> It will probably require a strace to figure out why Docker is hanging on
> startup like this.

I haven't got back to doing more evaluation of docker, but when I
stopped working on things, I was able to narrow the hang down to be
related to the initialization of random.

>
> >> Some alternatives:
> >>
> >>  - http://cri-o.io/ - container runtime interface, will add to BR
> >>  - runc - can be used independently of Docker
> >>  - docker-containerd - separate daemon for managing container basics
> >>  - rkt - coreos container manager
> >>  - libpod/podman: https://github.com/containers/libpod
> >>
> >> I hope to add at least cri-o, rkt, and podman support to Buildroot in
> >> the near future.

Cool.

The one use case I have been thinking about for new projects is
building the most basic possible hosting environment to manage the
security footprint.  Maybe a LXC system container hosting environment
or a non-systemd dockerd.  Then inside of that run a systemd based
docker deployment which would be easier to swap out and do a true
shared filesystem approach vs a system container......

> >
> > Are any of those OCI compliant and not written in GO? :-)
>
> I haven't seen a OCI compliant runtime that is not Go, yet.
>
> Best,
> Christian
>

Matt
