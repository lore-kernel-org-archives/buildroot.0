From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 18 Mar 2019 21:43:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
In-Reply-To: <20190318190315.GJ14237@scaer>
References: <20190318163010.8056-1-norbert.lange@andritz.com>
 <20190318174436.GI14237@scaer>
 <CADYdroMoAzR6=nniTiBZvvs2fkwJJ7hGM-rd2OixxA6FpjRj7A@mail.gmail.com>
 <20190318190315.GJ14237@scaer>
Message-ID: <CADYdroPQYoDW=T7ZOdDNucb4O3wu4poD-ZVuLY1PApB4i_dMrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 18. M?rz 2019 um 20:03 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2019-03-18 19:11 +0100, Norbert Lange spake thusly:
> > Am Mo., 18. M?rz 2019 um 18:44 Uhr schrieb Yann E. MORIN
> > <yann.morin.1998@free.fr>:
> > > On 2019-03-18 17:30 +0100, Norbert Lange spake thusly:
> > > > For read-only root file systems, the kernel-modules
> > > > will be mounted over this directory.
> > >
> > > This does not mean anything.
> > >
> > > Either you build your kernel with Buildroot, and the kernel does the
> > > installation of modules in /lib/modules, and thus you do not need to
> > > create it, or you build your kernel outside of Buildroot and you install
> > > the modules at build time in there.
> > >
> > > So, having a read-only filesystem is of no consequence here.
> > >
> > > Also, I don;t see how "the kernel-modules will be mounted over this
> > > directory", which imply this is done at runtime. If your system uses
> > > special means to store the kernel modules, then it's your duty to
> > > provide it on your own, like as an overlay (or a specific package) that
> > > install those files/direcoties.
> >
> > If you prepare a kernel with an builtin initramfs containing
> > the modules and an initscript to mount those over /lib/modules,
> > then you wont have to touch the root fs.
> > (can be replaced independently of each other).
>
> *That* is the real reason, and that's what you should have explained in
> your commit log.
>
> (Incidentally, I knew where this was coming from; I just wanted it to be
> explained by you, not I.)

I did not want to be too specific, but the basic idea is to separate
the lowlevel
stuff (kernel, -modules and initramfs) from a read-only OS-image.
My usecase is the above, primary because I have to stick the lowlevel stuff
into onboard storage, then load the rootfs.

Doing some small maintainance scripts in intramfs is preferable than
having to mess
with the rootfs all time.

Next thing would be "UsrMerge" and OS-as-usr-subdirectory. the kernel modules
in /lib/modules (/usr/lib/modules) is in the way there too.

> > > > This directory should always exist for this reason,
> > > This is wrong: one can have a no-module kernel, in which case
> > > /lib/modules is useless.
> > One could also have nothing to use with  /mnt, /media and /opt.
> >
> > > > just as /mnt and /opt are in the skeleton.
> > > Those are madanted by the FHS [0].
> > Ok, if I red that right, then /boot and /srv would be required/mandated aswell?
>
> "red"? But who am I for pointing at others typoes? Hehe! ;-)

yeah, by making me explain things thoroughly, your evil scheme for
more tiptoes worked ;)

>
> And sorry, I wrote "mandated" (with typoes, at that), when I should have
> written "documented". So, I was just pointing out that /mnt and /opt do
> have some standard backing them, while /lib/modules does not, and thus
> /lib/modules does not have to "always exist like /mnt/ or /opt" as you
> wrote.

err.. look at FHS Section 3.9.3.

> Additionally, if one is building a filesystem (possibly readonly) to run
> in a container, they'd probably have no use for /lib/modules either. So,
> again, /lib/modules does not *have* to always exist.

nope, there's just the question of how-much-it-helps vs how-much-it-hurts.
building everything static would make /lib empty and unused as well,
the cost of having it around always is reasonably low.

> > I guess I wont get the change up-streamed, and thats fine (minor annoyance
> > that I cant use verbatim buildroot's with such kernels).
>
> As I said, you need not do that in skeleton. You can do it in an
> overlay, or as a custom package, or even as a custom skeleton. And if
> you do not want to "pollute" your Buildroot tree with your custom stuff,
> you can host it in a br2-external tree, for example. My professional
> alter-ego gave a talk about that some time ago:
>     https://elinux.org/images/8/8e/2017-10-24_-_ELCE-Buildroot.pdf
>
> And Arnout wrote a nice summary of the presentation:
>     https://mindlinux.wordpress.com/2017/10/24/buildroot-making-embedded-linux-easy-a-real-life-example-yann-morin-orange/

sure, getting it upstream is still the best bet.

> > But this seems
> > to be pretty arbitrary given that buildroot seems rather lenient
> > otherwise (for good reasons).
>
> Given the proper explanations for a change, we'd consider it, yes. But I
> just pointed out that your explanations were not correct/accurate, as
> the conditions you *described* did not *require* that change. The
> explanations above is the real reason, and that is what you have said in
> your commit log instead, and that would have given it a better chance to
> get applied.
>
> And yes, drawing the boundary line is arbitrary at times.

No problem with that.
Should I re-roll the patch next, or can we continue this discussion
until you decide on whether you will include the change.

Norbert
