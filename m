From: Christian Stewart <christian@paral.in>
Date: Sat, 6 Jun 2020 16:10:12 -0700
Subject: [Buildroot] [PATCH v2 2/7] board/guest: documentation and
 sample files
In-Reply-To: <20200530124735.1384078-3-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-3-francois.perrad@gadz.org>
Message-ID: <CA+h8R2rsySGqqVQfVeJ91c1bJZ_whoU3wnjHOyGkVayOgVJHEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Sat, May 30, 2020 at 5:49 AM Francois Perrad <fperrad@gmail.com> wrote:
> +++ b/board/guest/Dockerfile
> @@ -0,0 +1,3 @@
> +FROM scratch
> +ADD rootfs.tar /
> +CMD ["/bin/ash"]

There is a typo here, you put the command as "ash"

Also, this isn't a sufficient Dockerfile. From your other patches I
guess you intend to run systemd in the container.

For reference, see how I do this in Skiff:

https://github.com/paralin/SkiffOS/tree/master/configs/virt/docker

For the Dockerfile:

FROM scratch

ENV container docker
ENV init /lib/systemd/systemd
ENV LC_ALL C

ADD rootfs.tar /

USER root
RUN systemctl set-default multi-user.target && \
    systemctl mask tmp.mount && \
    find /etc/systemd/system \
         /lib/systemd/system \
         \( -path '*.wants/*' \
         -name '*swapon*' \
         -or -name '*ntpd*' \
         -or -name '*resolved*' \
         -or -name '*remount-fs*' \
         -or -name '*getty*' \
         -or -name '*systemd-sysctl*' \
         -or -name '*.mount' \
         -or -name '*remote-fs*' \) \
         -exec echo \{} \; \
         -exec rm \{} \;

COPY fstab /etc/fstab
VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/usr/lib/systemd/systemd"]

For running the image you want to have something like this:

docker run -d --name=skiff \
  --privileged \
  --cap-add=NET_ADMIN \
  --security-opt seccomp=unconfined \
  --stop-signal=SIGRTMIN+3 \
  --tmpfs /run \
  --tmpfs /run/lock \
  -t \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  paralin/skiffos

This works with systemd.

> +
> +How to with Docker
> +==================
> +
> +A Docker image could created with a Dockerfile and few commands are needed:
> +
> +    # dockerd &
> +
> +    $ cat Dockerfile
> +    FROM scratch
> +    ADD rootfs.tar /
> +    CMD ["/bin/ash"]

Typo again with "ash" ?

Best regards,
Christian Stewart
