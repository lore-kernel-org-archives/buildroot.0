From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Oct 2018 08:10:37 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-26
In-Reply-To: <20181027152824.2160f61d@windsurf>
References: <20181027060023.5E5D720A06@mail.bootlin.com>
 <CANQCQpbXOhEgYe_kCqKfEnQMLGrsRh7knZARrxdn3P9qdjf_1w@mail.gmail.com>
 <20181027152824.2160f61d@windsurf>
Message-ID: <CANQCQpYjcRtT=dms0ECdYunNn7_v9wTG8XpmG+vMEyXYioYc6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Oct 27, 2018 at 8:29 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 27 Oct 2018 07:26:23 -0500, Matthew Weber wrote:
>
> > This was a sandboxed failure.  The sandbox was setup by using
> > bubblewrap with the options below.  It stages an OS environment where
> > the "--dir" items are new empty write-able directories and the
> > ro-binds are readonly bind mounts of that file or location to the new
> > location inside the sandbox.  The user/group is also stripped to just
> > the minimal root, calling user and 65534. Right now the whole
> > autobuilder-run script is being executed inside a single sandbox and
> > there is no checking for new files in the write-able empty folders.
> >       --ro-bind /bin /bin \
> >       --ro-bind /etc/resolv.conf /etc/resolv.conf \
> >       --ro-bind /etc/profile /etc/profile \
> >       --ro-bind /etc/environment /etc/environment \
> >       --ro-bind /etc/alternatives /etc/alternatives \
> >       --ro-bind /etc/ld.so.conf /etc/ld.so.conf \
> >       --ro-bind /etc/ld.so.cache /etc/ld.so.cache \
> >       --ro-bind /etc/ld.so.conf.d /etc/ld.so.conf.d \
> >       --ro-bind /etc/xml /etc/xml \
> >       --ro-bind /etc/sgml /etc/sgml \
> >       --ro-bind /lib /lib \
> >       --ro-bind /lib32 /lib32 \
> >       --ro-bind /libx32 /libx32 \
> >       --ro-bind /lib64 /lib64 \
> >       --ro-bind /sbin /sbin \
> >       --ro-bind /usr /usr \
> >       --dir /home \
> >       --dir /home/bruser \
> >       --bind /home/bruser/buildroot-test /home/bruser/buildroot-test \
> >       --dir /tmp \
> >       --dir /var \
> >       --dir /run \
> >       --symlink ../tmp var/tmp \
> >       --symlink ../run var/run \
> >       --proc /proc \
> >       --dev /dev \
> >       --chdir / \
> >       --unshare-all \
> >       --share-net \
> >       --die-with-parent \
> >       --dir /run/user/$(id -u) \
> >       --setenv XDG_RUNTIME_DIR "/run/user/`id -u`" \
> >       --setenv PS1 "bwrap-demo$ " \
> >       --file 11 /etc/passwd \
> >       --file 12 /etc/group \
> >       /bin/bash) \
> >     11< <(getent passwd 0 $UID 65534) \
> >     12< <(getent group 0 $(id -g) 65534) \
>
> Thanks. Should we add support for this directly in autobuild-run ?

Easiest way I found to do this was to wrapper either the calling of
the autobuild-run script or make.  I didn't dig to deep into wrapping
"make" as then there is a challenge associating build output from
inside the wrapper to the build reporting steps in the script.  I'm
also not sure of the cross platform viability of the wrapping
approach.  I believe it should work on Debian based systems at this
point (maybe that's Ok if not all builders do it?).

On item which I haven't done yet is checking if something wrote to the
users home directory.  I'm thinking this would be a new option added
to the autobuild-run script which uses pyinotify to watch the home
folder while the build occurs.  The wrapper could possibly enable this
option by default when calling the script, as we can assume a clean
home directory since the wrapper staged it separately from the actual
users home directory (in practice the option wouldn't be a good idea
on a shared server as other processes may touch that folder).

Matt
