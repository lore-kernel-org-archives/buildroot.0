From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 27 Oct 2018 07:26:23 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-26
In-Reply-To: <20181027060023.5E5D720A06@mail.bootlin.com>
References: <20181027060023.5E5D720A06@mail.bootlin.com>
Message-ID: <CANQCQpbXOhEgYe_kCqKfEnQMLGrsRh7knZARrxdn3P9qdjf_1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sat, Oct 27, 2018 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-10-26
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  21 |   3 |   0 |  24 |
>    2018.08.x |  24 |   5 |   0 |  29 |
>       master | 239 |  46 |   0 | 285 |
>
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                    attr-2.4.48 | 1
>          libcpprestsdk-v2.10.1 | 1
>               wireshark-2.2.17 | 1
>
>
> Detail of failures
> ------------------
>
>         bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/5629ee8b2709e5654ba64ace7539624c1e9f4946 |
>      powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/095ee556035f37b05bb279f5ab82fd36d6a11915 |
>          sh4 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/5ccbda3a3e43ef99696c316866ac834c85f038d0 | ORPH
>
> Results for branch '2018.08.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                 p11-kit-0.23.2 | 2
>                   giflib-5.1.4 | 1
>                  lcdproc-0.5.9 | 1
>                openswan-2.6.50 | 1
>
>
> Detail of failures
> ------------------
>
>       x86_64 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/cbd84ad5df0b0cf9f70719f77a800336964e6f41 |

This was a sandboxed failure.  The sandbox was setup by using
bubblewrap with the options below.  It stages an OS environment where
the "--dir" items are new empty write-able directories and the
ro-binds are readonly bind mounts of that file or location to the new
location inside the sandbox.  The user/group is also stripped to just
the minimal root, calling user and 65534. Right now the whole
autobuilder-run script is being executed inside a single sandbox and
there is no checking for new files in the write-able empty folders.
      --ro-bind /bin /bin \
      --ro-bind /etc/resolv.conf /etc/resolv.conf \
      --ro-bind /etc/profile /etc/profile \
      --ro-bind /etc/environment /etc/environment \
      --ro-bind /etc/alternatives /etc/alternatives \
      --ro-bind /etc/ld.so.conf /etc/ld.so.conf \
      --ro-bind /etc/ld.so.cache /etc/ld.so.cache \
      --ro-bind /etc/ld.so.conf.d /etc/ld.so.conf.d \
      --ro-bind /etc/xml /etc/xml \
      --ro-bind /etc/sgml /etc/sgml \
      --ro-bind /lib /lib \
      --ro-bind /lib32 /lib32 \
      --ro-bind /libx32 /libx32 \
      --ro-bind /lib64 /lib64 \
      --ro-bind /sbin /sbin \
      --ro-bind /usr /usr \
      --dir /home \
      --dir /home/bruser \
      --bind /home/bruser/buildroot-test /home/bruser/buildroot-test \
      --dir /tmp \
      --dir /var \
      --dir /run \
      --symlink ../tmp var/tmp \
      --symlink ../run var/run \
      --proc /proc \
      --dev /dev \
      --chdir / \
      --unshare-all \
      --share-net \
      --die-with-parent \
      --dir /run/user/$(id -u) \
      --setenv XDG_RUNTIME_DIR "/run/user/`id -u`" \
      --setenv PS1 "bwrap-demo$ " \
      --file 11 /etc/passwd \
      --file 12 /etc/group \
      /bin/bash) \
    11< <(getent passwd 0 $UID 65534) \
    12< <(getent group 0 $(id -g) 65534) \

For this failure, it uncovered Xmlto validation was using the host
OS's docbook dtd's.  I've mapped the /etc/xml and /etc/sgml into the
sandbox to resolve this failure.  I assume for something like this an
update to have it use a Buildroot host tool isn't necessary as the
xmlto they are using isn't built as a dependency?

>                      gpsd-3.18 | 5

Same failure as giflib.

>                openswan-2.6.50 | 1


Same failure as giflib.



Matt
