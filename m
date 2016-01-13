From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Jan 2016 09:16:45 +0100
Subject: [Buildroot] Persistent dropbear keys
In-Reply-To: <8737u4bg4h.fsf@dell.be.48ers.dk>
References: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
 <87mvsgdkxy.fsf@dell.be.48ers.dk>
 <CAAXf6LUt+aNoD+JWABzdjnQ5DAP3UO9DYFHXKjqkj49jo+d0Jw@mail.gmail.com>
 <8737u4bg4h.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWOC6O3eCX_AH=0hRrGqP0hcnsaJEMDnOV4Tu-5vP-aJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 11, 2016 at 10:49 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>>> Why don't you just make /etc/dropbear a symlink to your persistent
>  >> medium?
>
>  > While I had not thought of that when designing my current solution,
>  > doing that without additional checking can be a problem: if the key on
>  > the persistent storage gets corrupted somehow, new connections would
>  > no longer be possible. I.e. make a small change in the existing key in
>  > /etc/dropbear, restart dropbear, and connection attempts fail with
>  > following syslog entry:
>
>  > Jan  3 06:41:58 hostname authpriv.info dropbear[14789]: Exit before
>  > auth: Couldn't read or generate hostkey
>  > /etc/dropbear/dropbear_rsa_host_key
>
> Yeah :/
>
>  > Just like with my current solution that actually copies the keys
>  > (rather than symlinking) I think you need to verify the keys
>  > before/after reboot, using dropbearkey. However, the symlink solution
>  > has the disadvantage in this case that an unexpected reboot (without
>  > the additional key check) potentially results in a corrupted key in
>  > /etc/dropbear, while the copy solution will only copy validated keys
>  > (during controlled reboot).
>
> First of all, it is important to understand why these files might get
> corrupted, E.G. what kind of issue you try to work around. Dropbear used
> to have problems, but afaik does the correct fsync / rename dance to
> safely create these files since 2015.67:
>
> https://github.com/mkj/dropbear/commit/4ba830fc31c056aaada774ce29bb7d4e136b5dcd
>
> But that naturally still relies on a working fs / block device. Is this
> your concern or something else?
>
> With the fix in 2015.67 I haven't seen corrupted host keys any more in
> the projects I work on, and for the use cases we have that is good
> enough (E.G. ssh is not a feature accessible to end users, and our
> factory reset button throws away the /etc overlay, so this could be used
> to fix corrupted host keys if needed).

While we haven't seen corrupted host keys in real life (but apparently
you did already), I think it is a good safety precaution to take it
into account. The fix in dropbear you refer to is very recent, so up
until now there was anyway a good reason to not use a direct symlink
/etc/dropbear -> /persistent/something.

But even with this fix, how much guarantee can you give that there is
not another bug in dropbear or the filesystem, or a script of our own
for that matter, that would inadvertently change the file or cause
some kind of corruption in it?

In our case, these boxes are 'out there' (and this can be in the
middle of a city or the middle of the desert). In case of trouble, SSH
access is the sole practical connection available and as such it needs
to be reliable. The alternative is having a technician driving to the
box, either attaching a serial connection or simply replacing the box
and sending the 'bad' one to skilled people. In either case, this is a
very expensive operation that should be avoided as much as possible.

For reference, if it can be useful to someone, I'm pasting the script
we're using (S49dropbear_keys):

#!/bin/sh
# Store/restore SSH host keys to/from persistent storage

PERSISTENT=/persistent/dropbear
VOLATILE=/etc/dropbear

# All created files should be forbidden by non-root users
umask 077

keys="dropbear_rsa_host_key dropbear_dss_host_key dropbear_ecdsa_host_key"

check_key() # (key)
{
     dropbearkey -y -f "$1" > /dev/null
}

case "$1" in
    start)
        # restore
        #
        # since buildroot 2015.11.1, /etc/dropbear (potentially read-only)
        # is created in the rootfs as a link to /var/run/dropbear (definitely
        # writable because /run is a tmpfs). In S50dropbear, it is checked
        # whether /etc/dropbear is writable in which case the link is replaced
        # by a real empty dir.
        # This mechanism does not work for this script (nor is it needed)
        # so first replace the link with an actual directory.
        if [ -L $VOLATILE ]; then
            rm -f $VOLATILE
        fi
        mkdir -p $VOLATILE
        for key in $keys; do
            if [ -f $PERSISTENT/$key ]; then
                if check_key $PERSISTENT/$key; then
                    cp $PERSISTENT/$key $VOLATILE/
                else
                    # corrupt key
                    rm -f $PERSISTENT/$key
                fi
            fi
        done
        ;;
    stop)
        # store
        mkdir -p $PERSISTENT
        for key in $keys; do
            if [ -f $VOLATILE/$key ]; then
                if check_key $VOLATILE/$key; then
                    cp $VOLATILE/$key $PERSISTENT/
                else
                    # corrupt key
                    rm -f $VOLATILE/$key
                fi
            fi
        done
        sync
        ;;
    *)
        echo "Usage: $0 {start|stop}" >&2
        exit 1
        ;;
esac



/Thomas
