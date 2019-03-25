From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Mar 2019 10:47:06 +0100
Subject: [Buildroot] [PATCH-for-master 1/2] package/meson: don't install
 cross-compilation.conf during target-finalize
In-Reply-To: <20190317162304.3410801f@windsurf>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-2-patrickdepinguin@gmail.com>
 <20190317162304.3410801f@windsurf>
Message-ID: <CAAXf6LUiANZ0kgj=Va=rVECV6m1uRniio1H6qQsGr37o=Vez4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 17 mar. 2019 a las 16:23, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> On Mon, 25 Feb 2019 22:11:46 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> > Both files have a similar concept, they describe some flags/paths needed for
> > compilation using respective build systems. One difference is that the meson
> > file is added for external compilation, from the SDK, while the cmake file
> > is used internally in Buildroot.
> >
> > The 'problem' of using TARGET_FINALIZE_HOOKS for the meson file, is that it
> > installs a 'host' file from target-finalize, which is conceptually incorrect
> > and breaks the invariant that only TARGET_DIR is changed on a subsequent
> > 'make' when everything was already built (i.e. only target-finalize is run).
>
> In fact, I don't quite get what this commit is fixing. I don't really
> understand what you call the "invariant that only TARGET_DIR is changed
> on a subsequent make when everything was already built".
>
> The current situation is not ideal because we create a file in
> $(HOST_DIR) from target-finalize, but the proposed situation is also
> not ideal because we create a file in $(HOST_DIR) from the staging
> installation of a package. So I'd need to understand why the second
> option has some advantages over the first, and that is currently
> unclear.

When Buildroot 'make' has completed successfully, and you run 'make'
without changes a second time, the only thing currently happening
again is target-finalize. As the name suggests, it should only touch
the TARGET_DIR. This is a principle I think we should keep.

The generation of the toolchain file for meson violated this, by
touching a host file from target-finalize, and thus also causing
changes to something else than the TARGET_DIR after a 'make' without
changes. In fact, there is totally no need to regenerate this 'static'
file more than once.

The solution I proposed fixes the described problem, but indeed uses
another apparent violation (present before in other places): touching
a host file from a staging step. Strictly speaking STAGING_DIR is
inside  HOST_DIR, but conceptually they are different indeed.
This is actually caused by the fact that the toolchain step does not
actually have a 'host' installation step, currently (because it is not
a 'host' package. Therefore, here and in other places, the 'staging'
step is used instead.


>
> Is it just for consistency for how the corresponding cmake file is
> created ?

I used the cmake thing as an example because it is very similar. It
makes sense to align, but alignment itself is not the goal.

Thanks,
Thomas
