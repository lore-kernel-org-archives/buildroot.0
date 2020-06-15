From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 12:38:37 +0200
Subject: [Buildroot] [PATCH v2 02/14] package/systemd: remove unused
 user accounts
In-Reply-To: <20200615094240.GU2346@scaer>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-3-nolange79@gmail.com>
 <20200615094240.GU2346@scaer>
Message-ID: <CADYdroPh=YK2rMGXpAHz1opFCoXeygUorsd534p48tSAAjaXig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 15. Juni 2020 um 11:42 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> > Since V235 the "gateway" and "upload" services use DynamicUsers,
> > requiring no entries in /etc/passwd.
> > This functionality requires nss-systemd, which is always
> > enabled in buildroot.
> >
> > The "bus-proxy" user was removed in V230.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>

Hi,

unfortunately this depends on nss-systemd being available and
configured (Patch #1).
I dont know if removing those users made the current status worse for
these services,
but any service with DynamicUser=yes might not work correctly without
a configured nss-systemd.

Tests this:

# save this as /run/systemd/system/test.service
# systemctl daemon-reload
# systemct start test
----------------------------------------------------------
[Unit]
Description=Test DynamicUser

[Service]
ExecStart=id -n -u
DynamicUser=yes
----------------------------------------------------------

This should give you as name "test", not a number and not an error

Norbert
