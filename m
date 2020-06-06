From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 00:57:23 +0200
Subject: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
In-Reply-To: <20200606224227.60a26aeb@windsurf>
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200605224858.12870-2-nolange79@gmail.com>
 <20200606224227.60a26aeb@windsurf>
Message-ID: <CADYdroO8PNfE=Cmd96rE-Kfd_nTq_7+h-JLdH-uUPGP3GmsBqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 6. Juni 2020 um 22:42 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Sat,  6 Jun 2020 00:48:57 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > Scripts in the fakeroot environment could call
> > tools preparing the early environment, leaving
> > traces in /run or /tmp.
> >
> > mkusers might create home directories in /run for
> > example.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> Looping Yann on this. I agree that we definitely want /tmp and /run to
> be empty, as we are anyway going to mount a tmpfs over them, so
> whatever they contains is not visible on the target system, but takes
> up some space on the filesystem.
>
> However, I'm not sure if removing all what they contain is the right
> approach. Shouldn't we avoid creating things in /tmp and /run in the
> first place ?

Yeah we should avoid creating stuff there, but it's sometimes hard to do.
One example is defining a user with home dir in /run, mkusers will
then create a dir there
(pretty late to clear it up otherwise)

More important would be tools that lazily create stuff on the first boot,
and either buildroot or a custom fakeroot stage script would run this
on the host instead (worstcase in some sort of container/chroot).


>
> Yann, any feedback on this ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Norbert
