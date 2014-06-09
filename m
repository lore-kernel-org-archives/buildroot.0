From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 9 Jun 2014 23:10:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140609063010.9CF93101624@stock.ovh.net>
References: <20140609063010.9CF93101624@stock.ovh.net>
Message-ID: <20140609211036.GA10459@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Mon, Jun 09, 2014 at 08:30:10AM +0200, Thomas Petazzoni wrote:

>        arm |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/1524d346fa17749e2ae62e063b9cfdd0de95c76a/
>

D'Oh! AM_PATH_LIBGCRYPT comes haunting us again!

This problem spawned a discussion in the past [1], and was temporarily solved,
as the call to autoreconf was removed [2].

Let's see:

- systemd upstream says gcrypt is a dependency, but will remove the m4 macro if gcrypt
  moves to pkg-config [3].
- gcrypt upstream does not like pkg-config [4].
- Some other embedded distros have patched gcrypt to provide support for
  pkg-config [5] [6].
- OpenEmbedded added gcrypt as dependency [7].
- We are stuck with autoreconf, as it is needed to solve the `ln --relative`
  issue via a patch, which will not be accepted by upstream [8].

Adding libgcrypt as a dependency is a no-go, as the end user gets some
unneedded stuff in its target rootfs. So we're left with the solution of
adding libgcrypt.m4 to m4 directory of systemd. Though this solution was
considered "temporary", can it now be accepted as "definitive"? [9]

Best regards,
ELB

[1] http://lists.busybox.net/pipermail/buildroot/2013-September/077768.html
[2] http://git.buildroot.net/buildroot/commit/?id=34291708d077e5626453378df133a683c9606bef
[3] http://lists.freedesktop.org/archives/systemd-bugs/2012-September/000161.html
[4] http://lists.gnupg.org/pipermail/gcrypt-devel/2007-February/001109.html
[5] http://git.yoctoproject.org/cgit/cgit.cgi/poky/plain/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
[6] http://git.overlays.gentoo.org/gitweb/?p=proj/embedded-cross.git;a=blob;f=dev-libs/libgcrypt/files/libgcrypt-pkgconfig-support.patch
[7] http://git.yoctoproject.org/cgit/cgit.cgi/poky/plain/meta/recipes-core/systemd/systemd_213.bb
[8] https://www.mail-archive.com/systemd-devel at lists.freedesktop.org/msg18966.html
[9] http://lists.busybox.net/pipermail/buildroot/2013-September/078232.html
