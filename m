From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 23:54:39 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package/eudev: introduce a host
 variant
In-Reply-To: <97ce5bca66396034f8d4523e01c40ae4286f40be.1572386855.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 29 Oct 2019 23:07:53 +0100")
References: <cover.1572386855.git.yann.morin.1998@free.fr>
 <97ce5bca66396034f8d4523e01c40ae4286f40be.1572386855.git.yann.morin.1998@free.fr>
Message-ID: <87v9rwbopc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > eudev and systemd provide a hardware database (hwdb) as a set of
 > multiple files. Various other utilities may also use that database.

 > Those files have to be "compiled" into a binary to be useful; libudev
 > (and thus all utilities based on it) only use the compiled hwdb.

 > Compiling the hwdb is done with udevadm, using the hwdb sub-command:
 >     udevadm hwdb --update

 > Provide a simple host-variant of eudev, so that we can call udevadm at
 > build time.

 > When it is configured, eudev will shoehorn its --prefix path as the base
 > location where the .hwdb file will be searched from, as well as where
 > the hwdb.bin will be generated in. This means that with the usual
 > --prefix=$(HOST_DIR), it would look into there.

 > udevadm also accepts a --root=/path option at runtime, which prepends
 > /path to all the paths it uses to find and generate files.

 > Obviously, combining --root=$(TARGET_DIR) and --prefix=$(HOST_DIR) would
 > not do what we want: all files would be searched for, and generated, in
 > $(HOST_DIR)$(TARGET_DIR)/ . Avoiding use of --root would not help much
 > either, as files would still searched in $(HOST_DIR) (we could use a
 > trick to copy files there, generate and then move the hwdb.bin, but
 > that's not nice).

 > However, since we only need udevadm, and since udevadm has no internal
 > and no external dependency, we can use a less dirty trick, an configure
 > host-eudev with --prefix=/usr (and similar for the other paths), manually
 > copy udevadm to HOST_DIR, and then use --root when calling it.

 > Then, we get a udevadm that can read files from, and generate files into
 > $(TARGET_DIR). We register a target-finalize hook to generate the
 > hwdb.bin, so that any pakage may install its .hwdb files (currently only
 > eudev and systemd do, but other packages might (e.g. sane is known to do
 > so on standard desktop distros))

 > The *.hwdb source files consume a lot of space, roughly the same as the
 > generated database, i.e. ~8MiB as of today, and they are totally useless
 > on the target; only the generated hwdb.bin is useful. So we want to get
 > rid of them.

 > However, we also want to be able to complete a build (e.g. make
 > foo-reinstall to reinstall more hwdb files), so we don't want to
 > irremediably lose them. As such, we register a pre-rootfs-cmd hook, that
 > removes them just before assembling the filesystems, when we're only
 > using a copy of the target directory.

 > Note that this is the first host package to register a target-finalize
 > hook, and also the first to register a pre-rootfs-cmd hook. This avoids
 > duplicating these hooks logic in both eudev and systemd.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Carlos Santos <unixmania@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - tweak and trick the configure and install  (Carlos)
 >   - include the hooks to avoid duplication  (Peter)
 >   - expand the commit log accordingly

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
