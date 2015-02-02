From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 2 Feb 2015 17:18:46 +0200
Subject: [Buildroot] [PATCH 03/16] package/dbus: fix machine-id when
	using systemd
In-Reply-To: <CAHXCMM+AKUj8ppQZLegOBvsgYNX+ntM5MtP2nxwC_rywh0c+Bw@mail.gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-4-git-send-email-maxtram95@gmail.com>
 <CAHXCMM+AKUj8ppQZLegOBvsgYNX+ntM5MtP2nxwC_rywh0c+Bw@mail.gmail.com>
Message-ID: <CAKErNvousuWMk87pVBftdettSfrjYvqfqNPJ+Ojiun5zt36EJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, resending my last message, I've answered off-the-list. My fault :(


Hi Samuel,

2015-02-02 16:50 GMT+02:00 Samuel Martin <s.martin49@gmail.com>:
> Hi Maxim,
>
> On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>> When systemd is used, /var/lib/dbus becomes dangling symlink, because
>> nobody does mkdir /tmp/dbus, so /var/lib/dbus/machine-id could not be
>> written. On SysVinit systems there is init script that creates
>> /tmp/dbus.
>
> Maybe we should add /tmp/dbus to a tmpfiles config file (see [1]).
>
>>
>> This patch preserves old behavior for SysVinit systems, and introduces
>> new one for systemd-booted systems: /var/lib/dbus is a persistent
>> directory, it holds symlink /var/lib/dbus/machine-id -> /etc/machine-id
>> as machine-id(5) suggests, and /etc/machine-id is managed by systemd.
>
> This assumes that /etc is witable... which is not necessary the case :-/

No, this doesn't assume that /etc is writable. Let me explain.

When systemd is installed, it creates empty /etc/machine-id file (look
at SYSTEMD_INSTALL_MACHINEID_HOOK in package/systemd/systemd.mk). If
/etc is writable, /etc/machine-id is populated at first boot, and
/var/lib/dbus/machine-id symlink just points at this file, as
machine-id(5) man page suggests. If /etc is read-only, systemd does
bind mount /run/machine-id to /etc/machine-id and populates temporary
file. /var/lib/dbus/machine-id also just points at this file. So no
problem with read-only /etc.
I'm afraid it is wrong solution. At first, we can't just add
/etc/machine-id -> /var/lib/dbus/machine-id symlink, because
package/systemd/systemd.mk creates empty file /etc/machine-id ;)

At second, if /etc/machine-id will always point to temporary location,
it will be regenerated at every boot even if /etc is writable. It
leads to wrong behavior of systemd-journald: it will create new 16 MiB
journal file at every boot because of changing machine-id.

> Then the last thing to check is that systemd-machine-id-setup
> correctly generates the machine-id file even if /etc/machine-id is a
> symlink pointing to a non-existing file.
>
> [1] http://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
>
> Regards,
>
> --
> Samuel

/etc/machine-id is such file that should be invariant from boot to
boot, so placing it to temporary location is wrong (at least it causes
problems with systemd-journald). But if /etc is read-only (and
/etc/machine-id is not populated in post-build scripts), systemd will
also handle this and bind mount temporary /run/machine-id to
/etc/machine-id. /var/lib/dbus/machine-id just points to
/etc/machine-id that is always populated on systemd systems.

What about keeping similar filesystem layout on SysVinit and systemd
systems, it would be nice if there was some simple way to support
/etc/machine-id on SysVinit systems. But it is easier to preserve old
behavior, because it works and causes no troubles on SysVinit systems.

Cheers,
Maxim
