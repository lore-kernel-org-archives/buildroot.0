From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 13:15:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: use upstream-provided
 systemd files
In-Reply-To: <1413573042-6638-1-git-send-email-dywi@mailerd.de>
References: <1413573042-6638-1-git-send-email-dywi@mailerd.de>
Message-ID: <20141019131552.239fe12f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Fri, 17 Oct 2014 21:10:42 +0200, Andr? Erdmann wrote:
> When using the buildroot-provided avahi-daemon.service file, bootup never
> finishes, because multi-user.target is waiting for avahi-daemon to exit,
> which is caused by "Type=oneshot" (in avahi-daemon.service).
> 
> Upstream's systemd files get already installed to /lib/systemd.
> They're not an exact copy of S50avahi-daemon, but work flawlessly,
> so use these units:
> 
> * avahi-daemon.service, auto-enabled (ln -fs in AVAHI_INSTALL_INIT_SYSTEMD)
> * avahi-daemon.socket,
>   not auto-enabled, but a dependency of avahi-daemon.service
> * avahi-dnsconfd.service, auto-enabled
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>

Thanks, applied, after changing the symbolic links to use absolute
paths instead of relative paths.

Also, I pushed a number of followup commits:

3b4ec0c6a82fc853b00b2a720d0b945dcb2ea67e avahi: do not install S05avahi-setup.sh in systemd setup
6c947771424b139199fc56bb7fff47755a17c6a9 avahi: remove useless 'mkdir -p' in AVAHI_INSTALL_INIT_SYSTEMD
d2fd9ef86ee096784c9b326004ba928a16d035ae avahi: fix indentation in AVAHI_INSTALL_INIT_SYSTEMD

In the last commit (first in the list), I raise the following question:

    Note: in a systemd configuration, there is no provision to do what
    S05avahi-setup.sh is doing for sysv init configurations. Maybe this is
    something that our systemd people should have a look at.

Someone to look into this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
