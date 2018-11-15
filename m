From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Nov 2018 15:30:51 -0600
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <874lcki4rw.fsf@paral.in>
References: <20181108032458.1028-1-christian@paral.in>
 <CANQCQpa0SGdEHVFxn_wmKnktat18iAJ2YLXYQd+4Uqzq5GzG4A@mail.gmail.com>
 <874lcki4rw.fsf@paral.in>
Message-ID: <CANQCQpaK4m3iqadyDAzuypV2Ze3LdhedHhn50AxF41buOMrTDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Tue, Nov 13, 2018 at 11:53 PM Christian Stewart <christian@paral.in> wrote:
>
> Matthew,
>
> Matthew Weber <matthew.weber@rockwellcollins.com> writes:
> > I've started to test this series and wondered what the most minimal BR
> > config would look like for the host /parent build?  Just systemd and
> > docker-engine? Or are there dependencies on full core-utils /
> > util-linux items?  I did look at your SkiffOS project and when I merge
> > a config together their were a good amount of packages and a ~150MB
> > rootfs.  Just curious what a minimal build might look like.
>
> This is an interesting question. I had a quick scan of a defconfig Skiff
> produces, and took some quick notes on what might be immediately
> removable without consequence:
>
>  - util-linux: fallocate, kill, line, login, more, newgrp, rfkill, setpriv, su
>  - editors: nano and vim (can be removed)
>  - wpa-supplicant: cli, hotspot, wps support likely can be removed
>  - other utils: file, ssh server (dropbear could be used), mosh, compression tools
>  - libv4l: unsure if necessary
>
> The majority of these can be disabled from the base config fragments
> here:
>
> https://github.com/paralin/SkiffOS/tree/master/configs/skiff/standard/buildroot
>
> They were originally included due to operational requirements / ease of
> use in the early days of the project, but are probably not necessary in
> a "production" image. They can certainly be removed from the base Skiff
> packages, and left to developers to enable in other packages if needed.
>
> I'll begin doing some tests of minimal images this week.
>

I did find that the dockercli just hangs when I call it, however I
check and the daemon is running.  I'll see if I can get more debug
(strace, etc).

> Something else to note: it's likely unnecessary to include Docker at
> all, and these days Docker brings a lot of binary bloat with it. It
> contains a full cluster management system (swarm) and a kubernetes
> client, for example.
>
> Some alternatives:
>
>  - http://cri-o.io/ - container runtime interface, will add to BR
>  - runc - can be used independently of Docker
>  - docker-containerd - separate daemon for managing container basics
>  - rkt - coreos container manager
>  - libpod/podman: https://github.com/containers/libpod
>
> I hope to add at least cri-o, rkt, and podman support to Buildroot in
> the near future.

Are any of those OCI compliant and not written in GO? :-)

>
> >> +sha256 47eda354afc199693aa338f5b2bb87e4511354c02561ddc6520a06d169921bdf        docker-cli-v18.06.1-ce.tar.gz
> >
> > Please add license file hashes for both packages.
>
> Will include in the next revision of the series:
>
> # docker-cli.hash
> sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> # docker-engine.hash
> sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
>

Thanks for the response and details!
Matt
