From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 24 Oct 2019 00:07:20 -0300
Subject: [Buildroot] [PATCH] package/initscripts: refactor S20urandom
In-Reply-To: <CANQCQpb74xdWJoD0-0CwmzFpxRdjD2wKxhdFZiF35OXGqfhRuA@mail.gmail.com>
References: <20191023164605.16447-1-unixmania@gmail.com>
 <CANQCQpb74xdWJoD0-0CwmzFpxRdjD2wKxhdFZiF35OXGqfhRuA@mail.gmail.com>
Message-ID: <CAJ4jsaenBpuKF-5joTd4MQkYdiA5yECeyAeTqEFOV3xQbjXNBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 23, 2019 at 7:33 PM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Carlos,
>
> On Wed, Oct 23, 2019 at 11:47 AM <unixmania@gmail.com> wrote:
> >
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Adapt the format to the current template, used in other init scripts.
> >
> > Read /proc/sys/kernel/random/poolsize to calculate the pool size, as
> > suggestred by the urandom manual page.
> >
> > Save the seed at /var/lib/ as other non-systemd distributions do (e.g.
> > RHEL6), since /etc can be in a red-only filesystem and the Filesystem
> > Hierarchy Standard defines that /var/lib holds persistent data modified
> > by programs as they run.
> >
> > Users willing to use a different path just need to redefine URANDOM_SEED
> > in /etc/default/urandom instead of rewriting the init script.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> >  package/initscripts/init.d/S20urandom | 105 ++++++++++++++++----------
> >  1 file changed, 64 insertions(+), 41 deletions(-)
> >
> > diff --git a/package/initscripts/init.d/S20urandom b/package/initscripts/init.d/S20urandom
> > index cababe1023..94e46cff10 100644
> > --- a/package/initscripts/init.d/S20urandom
> > +++ b/package/initscripts/init.d/S20urandom
> > @@ -1,51 +1,74 @@
> >  #! /bin/sh
> >  #
> > -# urandom      This script saves the random seed between reboots.
> > -#              It is called from the boot, halt and reboot scripts.
> > -#
> > -# Version:     @(#)urandom  1.33  22-Jun-1998  miquels at cistron.nl
> > +# Save the random seed between reboots. See urandom(4).
> >  #
> >
> > +# Quietly do nothing if /dev/urandom does not exist
> >  [ -c /dev/urandom ] || exit 0
> > -#. /etc/default/rcS
> >
> > -case "$1" in
> > -       start|"")
> > -               # check for read only file system
> > -               if ! touch /etc/random-seed 2>/dev/null
> > -               then
> > -                       echo "read-only file system detected...done"
> > -                       exit
> > -               fi
> > -               if [ "$VERBOSE" != no ]
> > -               then
> > -                       printf "Initializing random number generator... "
> > -               fi
> > -               # Load and then save 512 bytes,
> > -               # which is the size of the entropy pool
> > -               cat /etc/random-seed >/dev/urandom
> > -               rm -f /etc/random-seed
> > -               umask 077
> > -               dd if=/dev/urandom of=/etc/random-seed count=1 \
> > -                       >/dev/null 2>&1 || echo "urandom start: failed."
> > -               umask 022
> > -               [ "$VERBOSE" != no ] && echo "done."
> > -               ;;
> > -       stop)
> > -               if ! touch /etc/random-seed 2>/dev/null
> > -               then
> > -                       exit
> > +URANDOM_SEED="/var/lib/random-seed"
> > +
> > +# shellcheck source=/dev/null
> > +[ -r "/etc/default/urandom" ] && . "/etc/default/urandom"
> > +
> > +pool_size_file="/proc/sys/kernel/random/poolsize"
> > +
> > +start() {
> > +       # Carry a random seed from start-up to start-up
> > +       # Load and then save the whole entropy pool
> > +       printf 'Initializing random number generator: '
> > +       if [ -f "$URANDOM_SEED" ]; then
> > +               dd if="$URANDOM_SEED" of=/dev/urandom status=none
> > +               status=$?
> > +               if [ "$status" -ne 0 ]; then
> > +                       echo "FAIL (can't dump $URANDOM_SEED to /dev/urandom)"
> > +                       return "$status"
> >                 fi
> > -               # Carry a random seed from shut-down to start-up;
> > -               # see documentation in linux/drivers/char/random.c
> > -               [ "$VERBOSE" != no ] && printf "Saving random seed... "
> > -               umask 077
> > -               dd if=/dev/urandom of=/etc/random-seed count=1 \
> > -                       >/dev/null 2>&1 || echo "urandom stop: failed."
> > -               [ "$VERBOSE" != no ] && echo "done."
> > -               ;;
> > +       fi
> > +       if bits=$(cat "$pool_size_file" 2> /dev/null); then
> > +               bytes=$((bits/8))
> > +       else
> > +               bytes=512
> > +       fi
> > +       umask 077
> > +       dd if=/dev/urandom of="$URANDOM_SEED" bs="$bytes" count=1 status=none
>
> Original script tested with a touch to see if the seed location was writable

I think it's better to report an erroneous condition instead of fail
graciously. Attempting to guess the user intention is dangerous.

> > +       status=$?
> > +       umask 022
> > +       if [ "$status" -eq 0 ]; then
> > +               echo "OK"
> > +       else
> > +               echo "FAIL"
> > +       fi
> > +       return "$status"
> > +}
> > +
> > +stop() {
> > +       # Carry a random seed from shut-down to start-up
> > +       # Save the whole entropy pool
> > +       printf "Saving random seed: "
> > +       if bits=$(cat "$pool_size_file" 2> /dev/null); then
> > +               bytes=$((bits/8))
> > +       else
> > +               bytes=512
> > +       fi
> > +       umask 077
> > +       dd if=/dev/urandom of="$URANDOM_SEED" bs="$bytes" count=1 status=none
>
> Do we need to conditionally write this file for the case of a
> read-only rootfs?  Looks like the previous script tested with a touch.

It was the same attempt to fail gracefully. Anyone willing to use a
read-only rootfs must either put an "exit" in /etc/default/urandom or
remove $TARGET_DIR/ets/init.d/S20urandom in a post-build script.

> I've tested this in a basic busybox target (start/stop/restart and
> with/without readonly rootfs)
>
> Regards,
> Matt

-- 
Carlos Santos <unixmania@gmail.com>
