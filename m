From: Christian Stewart <christian@paral.in>
Date: Mon, 26 Nov 2018 19:30:15 -0800
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <CANQCQpYM2E_+rMfDQ7svB05V4TfJKpgHCOpoPN49uLLqRZ30Hw@mail.gmail.com>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
 <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
 <871s7liu5e.fsf@paral.in>
 <CANQCQpYM2E_+rMfDQ7svB05V4TfJKpgHCOpoPN49uLLqRZ30Hw@mail.gmail.com>
Message-ID: <87ftvnyz7c.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Matthew Weber <Matthew.Weber@collins.com> writes:
> I haven't got back to doing more evaluation of docker, but when I
> stopped working on things, I was able to narrow the hang down to be
> related to the initialization of random.

I have found the same. My laptop boot up would be blocked for minutes,
and it was quite annoying / concerning, but I found that when I pressed
some keys / moved the mouse the hang would go away. That would match
with a starvation of entropy in the kernel.

> The one use case I have been thinking about for new projects is
> building the most basic possible hosting environment to manage the
> security footprint.  Maybe a LXC system container hosting environment
> or a non-systemd dockerd.  Then inside of that run a systemd based
> docker deployment which would be easier to swap out and do a true
> shared filesystem approach vs a system container......

I think the most minimum environment would be base Buildroot with either
the docker-containerd / runc stack, or something like cri-o (a
Kubernetes minimal container runtime I am examining for use with
Buildroot). One thing to consider is that the Go dependencies could be
compiled together into a single binary, which would reduce binary
footprint quite a bit I think. Much of Docker / dockerd features are
unnecessary and can be removed as well / mapped to Buildroot options.

Docker 2018.09 has been released, and I'm testing it now / will update
the next docker-engine build series submission to target v18.09.0.

https://github.com/paralin/buildroot/commit/8ac79e55d9495627c891b50dadf8fbde8352c282

Best,
Christian
