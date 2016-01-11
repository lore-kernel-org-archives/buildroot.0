From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Jan 2016 09:56:00 +0100
Subject: [Buildroot] Persistent dropbear keys
In-Reply-To: <87mvsgdkxy.fsf@dell.be.48ers.dk>
References: <CAAXf6LULMusN+KRUf6D32GNx77bbB0vSayJqk03T7ouNCArhHA@mail.gmail.com>
 <87mvsgdkxy.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUt+aNoD+JWABzdjnQ5DAP3UO9DYFHXKjqkj49jo+d0Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 8, 2016 at 6:45 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > Hello,
>  > Commit e7d04dd2df8bb935c61f7c814ee88eba7e75b5e4 (package/dropbear: fix
>  > generating keys on RO file systems) (+ some subsequent commits)
>  > changed the handling of the /etc/dropbear directory. Previously
>  > /etc/dropbear was a real directory in the rootfs, now it initially is
>  > a link to /var/run/dropbear. During S50dropboar, the link is replaced
>  > with a real (empty) directory (if rootfs is writable) or a warning is
>  > given.
>
>  > I understand all this. However, what I do not understand is how you
>  > are then creating persistent dropbear keys. From how I understand the
>  > code, the keys are persistent across reboots, but not between upgrades
>  > of the rootfs, because after an upgrade a new empty /etc/dropbear is
>  > created.
>
> If your upgrade overwrites /etc/dropbear, then yes.
>
> E.G. I use a persistent writable unionfs on /etc, so changes to /etc are
> not lost after an upgrade.
>
>
>  > In my case, the rootfs is an initramfs, but mounted rw at boot time.
>
>  > The solution I have been using is with an S49dropbear_keys script that:
>  > - at 'stop', verifies the correctness of the keys in /etc/dropbear
>  > (with dropbearkey) and if ok copies them to a real persistent medium,
>  > - at 'start', verifies if there are any keys on the persistent medium,
>  > verify their correctness, and if ok copies them to /etc/dropbear.
>
> Why don't you just make /etc/dropbear a symlink to your persistent
> medium?

While I had not thought of that when designing my current solution,
doing that without additional checking can be a problem: if the key on
the persistent storage gets corrupted somehow, new connections would
no longer be possible. I.e. make a small change in the existing key in
/etc/dropbear, restart dropbear, and connection attempts fail with
following syslog entry:

Jan  3 06:41:58 hostname authpriv.info dropbear[14789]: Exit before
auth: Couldn't read or generate hostkey
/etc/dropbear/dropbear_rsa_host_key

Just like with my current solution that actually copies the keys
(rather than symlinking) I think you need to verify the keys
before/after reboot, using dropbearkey. However, the symlink solution
has the disadvantage in this case that an unexpected reboot (without
the additional key check) potentially results in a corrupted key in
/etc/dropbear, while the copy solution will only copy validated keys
(during controlled reboot).

So, I don't think my current solution is so bad after all. How do you see this?

/Thomas
