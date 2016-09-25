From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 25 Sep 2016 23:44:14 +0200
Subject: [Buildroot] [PATCH] systemd: let getty instead of serial-getty
 handle /dev/console
In-Reply-To: <46b6edf4-6e2e-7200-133c-0321299f5805@je-eigen-domein.nl>
References: <1473437418-27792-1-git-send-email-bos@je-eigen-domein.nl>
 <20160911210951.GP5740@free.fr> <87intpzqge.fsf@dell.be.48ers.dk>
 <20160921220545.238279e6@gmx.net>
 <68b49446-0228-174d-ad47-9209d23ae90a@je-eigen-domein.nl>
 <20160922205012.13722beb@gmx.net>
 <46b6edf4-6e2e-7200-133c-0321299f5805@je-eigen-domein.nl>
Message-ID: <20160925234414.232f7008@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Floris,

On Thu, 22 Sep 2016 21:25:59 +0200, Floris Bos <bos@je-eigen-domein.nl> wrote:

> On 09/22/2016 08:50 PM, Peter Seiderer wrote:
> > Hello Floris,
> >
> > On Wed, 21 Sep 2016 23:47:02 +0200, Floris Bos <bos@je-eigen-domein.nl> wrote:
> >
> >> On 09/21/2016 10:05 PM, Peter Seiderer wrote:
> >>> Hello *,
> >>>
> >>> On Wed, 21 Sep 2016 09:01:37 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>
> >>>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >>>>    > Floris, All,
> >>>>    > On 2016-09-09 18:10 +0200, Floris Bos spake thusly:
> >>>>    >> The serial-getty unit depends on dev-%i.device which does not
> >>>>    >> seem to be created for /dev/console
> >>>>    >> Workaround this by letting normal getty unit handle things
> >>>>    >> if BR2_TARGET_GENERIC_GETTY_PORT is set to 'console'
> >>>>    >>
> >>>>    >> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> >>>>
> >>>>    > I haven't tested that, but I think this is OK just on principle.
> >>>>
> >>>>    > I just wonder if that behaves correctly when console is a serial line or
> >>>>    > anything else (e.g. a VT on HDMI, or through a debug channel...)
> >>>>
> >>>> Yeah, me too. Does anybody know what the difference exactly is between
> >>>> getty/serial-getty, and when one should be used over the other?
> >>>>
> >>> Tested for the rpi3/glibc/systemd case and failed: I get a doubled
> >>> (and unusable) ' Welcome to Buildroot/buildroot login:' on serial and
> >>> no login on hdmi...
> >> Empty cmdline.txt will give hdmi.
> >>
> >> Recall you need "console=serial0,115200 console=tty1" with tty1 last in
> >> cmdline.txt if you want them simultaneous.
> > Changed cmdline.txt to:
> >
> > 	root=/dev/mmcblk0p2 rootwait console=ttyAMA0,115200 console=tty1
> >
> > Which gives me two (functional) logins on serial and hdmi.
> >
> > But I think changing package/rpi-firmware/cmdline.txt unconditional will
> > break the other Init systems, see commit log from last patch touching
> > cmdline.txt ([1):
> >
> >    ...change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts a
> >    getty on the last console= passed to the kernel, ttyAMA0...
> 
> Will withdraw my patch then, and wait for someone else to come up with a 
> better solution.
> 

Ups, sorry, did not want to discourage you...

> I think the one-size-fits all cmdline.txt that listens to both on HDMI 
> and serial console by default makes things too complicated anyway.
> 

Maybe its feasible to list all wanted login ports in BR2_TARGET_GENERIC_GETTY_PORT
and only add the specified named systemd service links (an no generator ones)?

Regards,
Peter

>
> Yours sincerely,
> 
> Floris Bos
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
