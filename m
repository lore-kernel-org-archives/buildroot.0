From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jun 2011 06:32:41 +0300
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <BANLkTi=hr=U5eMmPbsUB-WH_QYjamGR5qA@mail.gmail.com>
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
 <20110626032236.GA17733@tarshish>
 <87mxh47v71.fsf@macbook.be.48ers.dk>
 <BANLkTi=hr=U5eMmPbsUB-WH_QYjamGR5qA@mail.gmail.com>
Message-ID: <20110627033240.GA3046@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Sun, Jun 26, 2011 at 10:51:19AM -0700, Charles Krinke wrote:
> I would appreciate understanding more the two concepts of a) overriding
> target/generic/device_table. txt so I can understand how the mounted jffs2
> became different then the contents of output/target/dev

This is the general behaviour of mount on Unix like operating systems.  
Whenever you mount a filesystem on a directory, the previous content of this 
directory in no longer directly visible until umount. Instead, the content of 
the mounted filesystem takes over.

> and the b) How we
> get from what appears to be the default /etc/fstab mounting tmpfs to one
> where we mount /dev/shm instead in our application space.
> 
> Is there a busybox config setup for /dev/shm? I went through the busybox
> menuconfig this morning and I don't see one.

There is nothing related to Busybox here. All you need to do is to create the 
/dev/shm directory, and then mount tmpfs on it.

baruch

> Charles
> On Jun 26, 2011 3:17 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
> >>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> >
> > Hi,
> >
> > >> 1. I can see the generic device_table.txt and it includes a /dev/shm
> > >> node. I can also see the /dev structure in output/target and it
> > >> matches the generic device_table.txt. But, ... when I build the jffs2
> > >> and load it on my MPC8323 target, what I see in /dev does not include
> > >> /dev/shm. In fact it is significantly different. So, my first question
> > >> is:
> > >>
> > >> "What besides generic/device_table.txt can determine the contents of
> > >> /dev on an MPC8323 target?"
> >
> > Baruch> Do you have devtmpfs mounted on /dev? If so, devtmpfs takes
> > Baruch> over the content of /dev, and hides the device nodes and
> > Baruch> directories from your device table.
> >
> > If so, it would be better to use the 'Dynamic using devmtpfs only'
> > device table option to not waste jffs2 space on device nodes you are not
> > going to use anyway.
> >
> > We might need to add a mkdir -p /dev/shm in inittab like we already do
> > for /dev/pts, as those are not device nodes and hence do not get created
> > by devtmpfs.

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
