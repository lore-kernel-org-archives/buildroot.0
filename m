From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 9 Mar 2015 11:19:58 -0400
Subject: [Buildroot] SysV init script revamp (proposal)
In-Reply-To: <20150307092737.GA28097@vostro>
References: <54FA0173.60504@zacarias.com.ar>
	<20150307092737.GA28097@vostro>
Message-ID: <CANPyyuMsQOQRaHZZvwMeXn_he+uu0Z_1cDDtpjyn2dyi-RSpRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

The general problem of buildroot packages enabling daemon startup on
boot also impacts systemd; many packages enable services by default
instead of just installing the service files. It seems like any
standardization of behavior should be across init systems. My
inclination is towards enabled packages installing init scripts and
service files by default, but never enabling them, e.g. service files
installed to /usr/lib/systemd/system/ but not symlinked to
/etc/systemd/system/ and chmod a-x on the init scripts by default.

For generating init scripts, many of the packages now have systemd
service files, perhaps this tool could help you build them more
quickly:
https://github.com/akhilvij/systemd-to-sysvinit-converter

I've never tried it myself, so I have no idea if it works.

Mike

On Sat, Mar 7, 2015 at 4:27 AM, Alex Suykov <alex.suykov@gmail.com> wrote:
> Fri, Mar 06, 2015 at 04:35:15PM -0300, Gustavo Zacarias wrote:
>
>> Before going all crazy sending patches and possibly wasting a lot of
>> time i'll write up my thoughts on how we could enhance/fix/clean the
>> current scenario regarding initscript:
>
> A word of support, it's a mess at present.
> And since I was doing something related I'll post it here too.
>
> My goal was to merge initscripts, systemd, scriptless sysv and my own init,
> with focus mostly on foreground daemons.
> The result, however, seems to be pretty close to your proposal,
> with uniform (generated, in fact) initscripts, and possibly also
> uniform pid file handling.
>
> https://github.com/arsv/br
> long(ish) description of ideas behind this:
> https://raw.githubusercontent.com/arsv/br/master/brinits
>
> Sysv-style configuration is missing atm, the plan was
> to pick any variables from .run files (see netsnmp/snmpd.run)
> and write them to relevant /etc/config.d/*.conf files.
>
> The limiting factor is that any non-trivial variable handling,
> basically any conditions, are not going to work well with systemd
> (example: package/tvheadend/S99tvheadend).
> And I feel better about residing to simple ARGS=... vs dropping
> systemd just because of this.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
