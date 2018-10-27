From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Oct 2018 15:28:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-26
In-Reply-To: <CANQCQpbXOhEgYe_kCqKfEnQMLGrsRh7knZARrxdn3P9qdjf_1w@mail.gmail.com>
References: <20181027060023.5E5D720A06@mail.bootlin.com>
 <CANQCQpbXOhEgYe_kCqKfEnQMLGrsRh7knZARrxdn3P9qdjf_1w@mail.gmail.com>
Message-ID: <20181027152824.2160f61d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Oct 2018 07:26:23 -0500, Matthew Weber wrote:

> This was a sandboxed failure.  The sandbox was setup by using
> bubblewrap with the options below.  It stages an OS environment where
> the "--dir" items are new empty write-able directories and the
> ro-binds are readonly bind mounts of that file or location to the new
> location inside the sandbox.  The user/group is also stripped to just
> the minimal root, calling user and 65534. Right now the whole
> autobuilder-run script is being executed inside a single sandbox and
> there is no checking for new files in the write-able empty folders.
>       --ro-bind /bin /bin \
>       --ro-bind /etc/resolv.conf /etc/resolv.conf \
>       --ro-bind /etc/profile /etc/profile \
>       --ro-bind /etc/environment /etc/environment \
>       --ro-bind /etc/alternatives /etc/alternatives \
>       --ro-bind /etc/ld.so.conf /etc/ld.so.conf \
>       --ro-bind /etc/ld.so.cache /etc/ld.so.cache \
>       --ro-bind /etc/ld.so.conf.d /etc/ld.so.conf.d \
>       --ro-bind /etc/xml /etc/xml \
>       --ro-bind /etc/sgml /etc/sgml \
>       --ro-bind /lib /lib \
>       --ro-bind /lib32 /lib32 \
>       --ro-bind /libx32 /libx32 \
>       --ro-bind /lib64 /lib64 \
>       --ro-bind /sbin /sbin \
>       --ro-bind /usr /usr \
>       --dir /home \
>       --dir /home/bruser \
>       --bind /home/bruser/buildroot-test /home/bruser/buildroot-test \
>       --dir /tmp \
>       --dir /var \
>       --dir /run \
>       --symlink ../tmp var/tmp \
>       --symlink ../run var/run \
>       --proc /proc \
>       --dev /dev \
>       --chdir / \
>       --unshare-all \
>       --share-net \
>       --die-with-parent \
>       --dir /run/user/$(id -u) \
>       --setenv XDG_RUNTIME_DIR "/run/user/`id -u`" \
>       --setenv PS1 "bwrap-demo$ " \
>       --file 11 /etc/passwd \
>       --file 12 /etc/group \
>       /bin/bash) \
>     11< <(getent passwd 0 $UID 65534) \
>     12< <(getent group 0 $(id -g) 65534) \

Thanks. Should we add support for this directly in autobuild-run ?

> For this failure, it uncovered Xmlto validation was using the host
> OS's docbook dtd's.  I've mapped the /etc/xml and /etc/sgml into the
> sandbox to resolve this failure.  I assume for something like this an
> update to have it use a Buildroot host tool isn't necessary as the
> xmlto they are using isn't built as a dependency?

This has been resolved by commit
https://git.buildroot.org/buildroot/commit/?id=220f25e9407a17804719d5355196f50b2d5e1f55

> >                      gpsd-3.18 | 5  
> 
> Same failure as giflib.
> 
> >                openswan-2.6.50 | 1  
> 
> 
> Same failure as giflib.

Those two need investigation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
