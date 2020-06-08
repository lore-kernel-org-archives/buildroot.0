From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 8 Jun 2020 07:28:06 +0200
Subject: [Buildroot] [PATCH v2 2/7] board/guest: documentation and
 sample files
In-Reply-To: <CA+h8R2rsySGqqVQfVeJ91c1bJZ_whoU3wnjHOyGkVayOgVJHEg@mail.gmail.com>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-3-francois.perrad@gadz.org>
 <CA+h8R2rsySGqqVQfVeJ91c1bJZ_whoU3wnjHOyGkVayOgVJHEg@mail.gmail.com>
Message-ID: <CAB0FRstFhwdYwKw+cBRKA=DpUCmg52dGvkBfvfaB138BaZGmKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 7 juin 2020 ? 01:10, Christian Stewart <christian@paral.in> a
?crit :

> Hi Francois,
>
> On Sat, May 30, 2020 at 5:49 AM Francois Perrad <fperrad@gmail.com> wrote:
> > +++ b/board/guest/Dockerfile
> > @@ -0,0 +1,3 @@
> > +FROM scratch
> > +ADD rootfs.tar /
> > +CMD ["/bin/ash"]
>
> There is a typo here, you put the command as "ash"
>

`ash` is the default shell of Busybox.


>
> Also, this isn't a sufficient Dockerfile. From your other patches I
> guess you intend to run systemd in the container.
>
>
This Dockerfile is minimal, but that allows to run in mode interactive as
described.
I agree that looks like a toy.
I will add another section which refers your project SkiffOS, and allows to
have a running systemd in the container.

Fran?ois


> For reference, see how I do this in Skiff:
>
> https://github.com/paralin/SkiffOS/tree/master/configs/virt/docker
>
> For the Dockerfile:
>
> FROM scratch
>
> ENV container docker
> ENV init /lib/systemd/systemd
> ENV LC_ALL C
>
> ADD rootfs.tar /
>
> USER root
> RUN systemctl set-default multi-user.target && \
>     systemctl mask tmp.mount && \
>     find /etc/systemd/system \
>          /lib/systemd/system \
>          \( -path '*.wants/*' \
>          -name '*swapon*' \
>          -or -name '*ntpd*' \
>          -or -name '*resolved*' \
>          -or -name '*remount-fs*' \
>          -or -name '*getty*' \
>          -or -name '*systemd-sysctl*' \
>          -or -name '*.mount' \
>          -or -name '*remote-fs*' \) \
>          -exec echo \{} \; \
>          -exec rm \{} \;
>
> COPY fstab /etc/fstab
> VOLUME [ "/sys/fs/cgroup" ]
> ENTRYPOINT ["/usr/lib/systemd/systemd"]
>
> For running the image you want to have something like this:
>
> docker run -d --name=skiff \
>   --privileged \
>   --cap-add=NET_ADMIN \
>   --security-opt seccomp=unconfined \
>   --stop-signal=SIGRTMIN+3 \
>   --tmpfs /run \
>   --tmpfs /run/lock \
>   -t \
>   -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
>   paralin/skiffos
>
> This works with systemd.
>
> > +
> > +How to with Docker
> > +==================
> > +
> > +A Docker image could created with a Dockerfile and few commands are
> needed:
> > +
> > +    # dockerd &
> > +
> > +    $ cat Dockerfile
> > +    FROM scratch
> > +    ADD rootfs.tar /
> > +    CMD ["/bin/ash"]
>
> Typo again with "ash" ?
>
> Best regards,
> Christian Stewart
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200608/9fd6ce23/attachment.html>
