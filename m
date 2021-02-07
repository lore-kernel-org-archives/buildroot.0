From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 7 Feb 2021 23:56:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/netopeer2: set
 SYSREPO_SHM_PREFIX and cleanup shm files after installation
In-Reply-To: <CAEyMn7ZBZ6=tcY2zKVZw9pmgkEiadZVa_f=VKeWrph1XBQjv4Q@mail.gmail.com>
References: <20210206105736.29429-1-heiko.thiery@gmail.com>
 <20210207123946.14105766@gmx.net>
 <CAEyMn7ZBZ6=tcY2zKVZw9pmgkEiadZVa_f=VKeWrph1XBQjv4Q@mail.gmail.com>
Message-ID: <20210207235627.02c6bc87@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

On Sun, 7 Feb 2021 22:21:19 +0100, Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Am So., 7. Feb. 2021 um 12:39 Uhr schrieb Peter Seiderer <ps.report@gmx.net>:
> >
> > Hello Heiko, Yann,
> >
> > On Sat,  6 Feb 2021 11:57:35 +0100, Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > > On install step the host tool syrepoctl is used to install some YANG
> > > modules. Unfortunatly syrepoctl creates some files in /dev/shm folder and
> >
> > Really install? The make log shows:
> >
> >         -- Installing: .../target/usr/share/yang/modules/netopeer2/notifications at 2008-07-14.yang
> >
> > is installed already before the setup.sh/sysrepoctl step
>
> By saying install not only the install target that copies the yang
> files into /usr/share/yang/modules/netopeer2/* is meant. The setup.sh
> will use "sysrepoctl install" to activate and configure the yang
> modules in sysrepo. With this the runtime files in /dev/shm/sr_* and
> the startup files in <TARGET>/etc/sysrepo/data/* files are created.
> The runtime files will be again created on the target when
> sysrepo/netopeer2 is started. So the /dev/shm/sr_* files are only
> temporary.
>
> >
> > > does not cleanup afterwards. This files can be incompatible depending on
> > > the used sysrepo version. This causes autobuilder failures when updating
> > > the package [1].
> > >
> > > To make sure we can remove this leftovers of sysrepoctl we specify a
> > > build specific SYSREPO_SHM_PREFIX. With this the files can deleted safely
> > > after installation is completed. This also ensures that concurrent
> > > parallel builds will not affected mutualy.
> >
> > Still the question, are the shm files needed at runtime? If so they should
> > belong in the target directory (or created by a startup script), of not why
> > create them at first (why not skip the setup.sh/sysrepoctl step)? Are there
> > any other products/output of the setup.sh/sysrepoctl step?
> >
> > The setup.sh is called with the following environment variables:
> >
> >         NP2_MODULE_DIR /usr/share/yang/modules/netopeer2
> >         NP2_MODULE_PERMS 600
> >         NP2_MODULE_OWNER seiderer
> >         NP2_MODULE_GROUP users
> >
> > A (quick) strace check of setup.sh run shows no other output than the shm files...
>
> As far I can see there are files in <target>/etc/sysrepo that should
> be created by the setup.sh files. So I cannot understand why you do
> not see these files. Did you do a reinstall or a clean build?

Yes your are right, did not look close enough and missed this ones;-)

Thanks for clarifying!

Regards,
Peter

>
> Thank you
