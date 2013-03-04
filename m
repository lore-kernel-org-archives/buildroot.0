From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Mar 2013 20:37:29 +0200
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <5134E40D.6@petroprogram.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
 <5134E40D.6@petroprogram.com>
Message-ID: <20130304183729.GA4651@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Mon, Mar 04, 2013 at 08:12:29PM +0200, Stefan Fr?berg wrote:
> 4.3.2013 12:53, Lionel Orry kirjoitti:
> > Another note, Funtoo Linux (a gentoo derivative) team is experimenting
> > with usage of mdev as a complete udev replacement for the whole
> > distro. It seems to work and tries to prove the scalability of mdev
> > which sounds promising. Here are some files resulting from these
> > attempts:
> >
> > - mdev from busybox configured for funtoo (1 tiny patch and simple
> > configuration in the ebuild):
> > https://github.com/slashbeast/foo-overlay/tree/master/sys-fs/mdev-bb
> > - repository for notes and mdev config/init scripts (may be worth a
> > look at mdev.conf and mdev.init):
> > https://github.com/slashbeast/mdev-like-a-boss
> >
> > What I wanna say, is that it *may* sound reasonable to strongly
> > suggest people to stick with mdev as much as they can.
> 
> Yes, I for one can confirm that if you don't need anything else than to
> populate /dev with nodes and maybe few
> symlinks then mdev is perfectly fine.
> 
> I have run buildroot xorg with mdev without any problems.
> 
> *But* ... (and this is a big but) I have not tested how it reacts to
> kernel events after boot when you *plug/unplug* devices and if mdev
> is capable of *running programs/scripts when some event happens*.
> 
> If Funtoo can make it work and make it also work seamlessly with all the
> other crazy stuff (network-manager, and some other
> gnome stuff) then I will kick out udev from my system in a nanosecond :-)

Of course it does. Quoting docs/mdev.txt from Busybox source:

Here's a typical code snippet from the init script:
[0] mount -t proc proc /proc
[1] mount -t sysfs sysfs /sys
[2] echo /sbin/mdev > /proc/sys/kernel/hotplug
[3] mdev -s

End of quote.

The only trouble is that the hotplug interface is racy. Events are not 
guaranteed to be processed at the same order they were generated. udev listens 
to events over netlink which guarantees sequential processing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
