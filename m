From: Christian Stewart <christian@paral.in>
Date: Mon, 27 Jul 2020 13:49:02 -0700
Subject: [Buildroot] [PATCH v3 2/7] board/guest: documentation and
 sample files
In-Reply-To: <87sgdduw79.fsf@dell.be.48ers.dk>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-3-francois.perrad@gadz.org>
 <87sgdduw79.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2oH-4ug9pwD4r1ozRKfN7BX9RRFAAbJygJ-2_cC-Arhrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Jul 27, 2020 at 2:46 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>  > +    $ docker build --tag br:guest .
>  > +    $ docker images
>  > +    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
>  > +    br                  guest               0c54c85a3452        42 seconds ago      1.75MB
>
> NIT: Why not just use docker import rootfs.tar br:test?

This works too, but I tend to add some adjustments to the image in the
Dockerfile. Of course, these could be added in the build process, and
probably would be better suited there.

Dockerfile:

FROM scratch

ENV container docker
ENV init /lib/systemd/systemd
ENV LC_ALL C

ADD rootfs.tar /

USER root
RUN find /etc/systemd/system \
         /usr/lib/systemd/system \
         \( -path '*.wants/*' \
         -name '*swapon*' \
         -or -name '*ntpd*' \
         -or -name '*resolved*' \
         -or -name '*udev*' \
         -or -name '*rdisc*' \
         -or -name '*freedesktop*' \
         -or -name '*persist-resize*' \
         -or -name '*NetworkManager*' \
         -or -name '*remount-fs*' \
         -or -name '*getty*' \
         -or -name '*.mount' \
         -or -name '*remote-fs*' \) \
         -exec echo \{} \; \
         -exec rm \{} \;

RUN systemctl set-default multi-user.target && \
    systemctl mask tmp.mount && \
    touch /etc/skip-skiff-mounts && \
    touch /etc/skip-skiff-journal-mounts
COPY fstab /etc/fstab

VOLUME [ "/sys/fs/cgroup", "/mnt/persist", "/mnt/rootfs" ]
ENTRYPOINT ["/usr/lib/systemd/systemd"]

Best,
Christian Stewart
