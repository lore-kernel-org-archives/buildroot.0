From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:09:08 +0200
Subject: [Buildroot] [git commit] skeleton: fix permissions on
	/dev/pts/ptmx
In-Reply-To: <20170318142631.73AA58254B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 18 Mar 2017 15:24:56 +0100")
References: <20170318142631.73AA58254B@busybox.osuosl.org>
Message-ID: <87k2762z97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8196b299ba12bd6741bf7f4462cad180dab77fb0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Without this patch, it is not possible to allocate PTYs when a generated
 > rootfs image with a recent glibc and systemd is launched as a container  on
 > an RHEL7 system via machinectl/systemd-nspawn. The container boots, but
 > `machinectl login mycontainer` fails. The culprit is /dev/pts/ptmx with
 > 0000 perms.

 > On a typical system, there are two `ptmx` devices. One is provided by the
 > devpts at /dev/pts/ptmx and it is typically not directly accessed from
 > userspace. The other one which actually *is* opened by processes is
 > /dev/ptmx. Kernel's documentation says these days that /dev/ptmx should be
 > either a symlink, or a bind mount of the /dev/pts/ptmx from devpts.

 > When a container is launched via machinectl/machined/systemd-nspawn, the
 > container manager prepares a root filesystem so that the container can live
 > in an appropriate namespace (this is similar to what initramfs is doing on
 > x86 desktops). During these preparations, systemd-nspawn mounts a devpts
 > instance using a correct ptmxmode=0666 within the container-to-be's
 > /dev/pts, and it adds a compatibility symlink at /dev/ptmx. However, once
 > systemd takes over as an init in the container,
 > /lib/systemd/systemd-remount-fs applies mount options from /etc/fstab to
 > all fileystems. Because the buildroot's template used to not include the
 > ptmxmode=... option, a default value of 0000 was taking an effect which in
 > turn led to not being able to allocate any pseudo-terminals.

 > The relevant kernel option was introduced upstream in commit 1f8f1e29 back
 > in 2009. The oldest linux-headers referenced from buildroot's config is
 > 3.0, and that version definitely has that commit. Mount options that are
 > not understood by the system are anyway ignored, so backward
 > compatibility is preserved.

 > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > [Thomas: fix commit title, adjust commit log.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
