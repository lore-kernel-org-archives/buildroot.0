From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 12 Apr 2013 11:58:10 +0200 (CEST)
Subject: [Buildroot] Extending buildroot functionality for creating
 board support packages (BSP) out of buildroot tree
In-Reply-To: <5167D90B.3020601@gmx.de>
Message-ID: <1463068659.1518019.1365760690328.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello

I had a similar problem, but more generic. the simplest way is to use
the OVERRIDE_SRCDIR feature

* create a file called local.mk at the $(TOPDIR) of your buildroot install
* add a single line inside

LINUX_OVERRIDE_SRCDIR=<path to the linux kernel tree>

and you should be good.

Note that this command will rsync the tree into the buildroot tree,
(which should be fine, rsync is very fast once the initial sync is done)


    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> Dear all,
> we are using buildroot for porting an existing embedded PowerPC board
> to
> linux. For this purpose we have to make modifications to the kernel
> (adding and changing files to support custom hardware). This can
> easily
> be done by enabling custom patches in the menuconfig.
> This is a wonderful solution when the development of the kernel
> modifications is done and the patches are existing but during
> development this could be time consuming. The reason is that we can
> not
> do the kernel modifcations in the kernel tree itself but in a
> completely
> separated directory structure. This is caused by our existing version
> control system and by project development requirements.
> 
> Imagine that you made a small modification to one of the custom files
> (e.g. changing a printk() statement) and you want to re-build the
> kernel. You have to develop a script which takes a virgin kernel,
> extracts the gz file, makes a copy of the tree, modifies the files in
> the copy and then creates the patch and copies this patch to the
> buildroot tree. Even on a fast hardware this takes some time and you
> have to do it for every change.
> 
> I spent some time this morning to evaluate if there could be a more
> elegant solution. Here is what I've done:
> 1) In linux/Config.in: Add a new entry to the kernel menuconfig which
> allows to enter a script name or a directory name (similar to the
> custom
> patch option)
> 2) In linux/linux.mk: After unpacking the kernel and applying the
> patches (if any) the given script or all scripts in the given
> directory
> are executed.
> 
> This allows me to make modification to the unpacked kernel tree
> without
> the need to create patch files but also opens up flexibility for
> other
> functionality which may arise in the future.
> 
> Let me know what you think about this. If you are interested in
> incorporating these changes into the official buildroot suite, l can
> provide the changes I made.
> 
> Regards,
> Andreas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
