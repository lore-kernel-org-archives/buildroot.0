From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Mar 2015 15:59:02 +0100
Subject: [Buildroot] [PATCH 0/7] [RFC] Introduce services as a
 (long-term) replacement for _INSTALL_INIT_(SYSV|SYSTEMD) (branch
 yem/services)
In-Reply-To: <cover.1426112628.git.yann.morin.1998@free.fr>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
Message-ID: <20150312155902.2ff7e30d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 11 Mar 2015 23:30:18 +0100, Yann E. MORIN wrote:

> Following up on Gustavo's proposal [0] on a clean up on our init
> scripts (and eventually our systemd unit files), here is an *RFC*
> series that tries to implement Gustavo's idea.

I am personally not in favor of an approach where kconfig options are
used to enable/disable services, because it's a slippery slope. I very
much prefer Gustavo's proposal of /etc/{default,config}/ files, that
users can override in their rootfs overlays or post-build script.

Why do I have this opinion?

Simply because your proposal is limited to just enabling/disabling
services. But then people will want kconfig options to set the TFTP
server root directory, to set the lighttpd server options foo or bar,
to configure the NTP configuration options, and so on. This is clearly
not a direction we want to take I believe as it will simply require
more and more and more kconfig options.

Instead, let's have some /etc/default/<service> files, which allow to
both define whether <service> is enabled or not, but also allow to set
various other service-specific configuration options.

I think Buildroot is a toolbox to generate your system, but you *must*
do some additional customization to have a system tailored to your
needs. What I believe is great in Buildroot is that is basically just
builds the upstream source code, and installs it. It doesn't try to be
a distro that imposes its own Web interface, its own organization of
the filesystems, etc. We just build and install everything, and provide
minimal sane defaults, and let users customize everything else.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
