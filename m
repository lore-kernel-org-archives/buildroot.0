From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 7 Jan 2016 21:40:24 +0100
Subject: [Buildroot] [PATCH v3 09/13] package/dhcp: SysV init scripts:
 remove PID files after stop
In-Reply-To: <20151224152632.7af2c1a1@free-electrons.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-9-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <20151224152632.7af2c1a1@free-electrons.com>
Message-ID: <CA+sos78p79o2oNcsRgc=L=pnt3YkxMqtVM9U6yLaOQ4F01=POw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Dec 24, 2015 at 3:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 25 Oct 2015 02:59:35 +0200, Beno?t Th?baudeau wrote:
>> From: Beno?t Th?baudeau <benoit@wsystem.com>
>>
>> These daemons do not remove their PID files, so do it manually in the
>> scripts.
>>
>> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
>
> I think this is not the right way of handling this and the IPv6
> problem.
>
> What I would suggest is that the S80dhcp-server script should start two
> DHCP servers: one with -4 and one with -6. To avoid IPv6 failures, you
> can test if /proc/net/if_inet6 exists.

OK, I'll do that.

> Then, I was hoping you could use the --remove-pidfile option of
> start-stop-daemon, but it unfortunately doesn't exist in the Busybox
> implementation of start-stop-daemon.

Indeed. I also went that way first. So what are you eventually
suggesting to change for 09/13 since there is apparently no other
solution for SysV? Even with two daemons started, the PID files will
have to be removed with rm for SysV, so 09/13 would only have to be
split. This is already handled for systemd.

> That being said, I still believe starting two daemons is the best
> solution. I don't think a Config.in option should be added for that.
> Just always start both, with as I propose an exception to not start the
> IPv6 daemon if /proc/net/if_inet6 does not exist.
>
> Could you rework your patches 9 to 13 with this goal in mind ?
>
> Thanks a lot!

Will do.

Beno?t
