From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 2 Jul 2014 19:49:00 +0200
Subject: [Buildroot] [Patch v3 1/1] systemd: rework network/tty units
 installation
In-Reply-To: <20140629105512.0670fc4e@free-electrons.com>
References: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140629105512.0670fc4e@free-electrons.com>
Message-ID: <20140702174859.GA755@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 29, 2014 at 10:55:12AM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 23 Jun 2014 11:52:06 +0200, Eric Le Bihan wrote:
> > The installation of the network.service and serial-getty.service unit
> > files are now performed via the <pkg>_INIT_SYSTEMD mechanism instead of
> > an installation hook.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/systemd/systemd.mk | 35 +++++++++++++++++------------------
> >  1 file changed, 17 insertions(+), 18 deletions(-)
>
> Applied, thanks!
>

Looking back, converting the fixup of getty service from an post installation
hook to a service installation was not a good idea, after all.

$(PKG)_INSTALL_INIT_SYSTEMD is performed before installing the package itself
in the target directory via $(PKG)_INSTALL_TARGET_CMDS. So the fixup will fail
trying to delete a file that has not been installed yet... (D'Oh! I should
have cleaned my build directory...).

I will send a patch reverting this part.

Best regards,
ELB
