From: Cam Hutchison <camh@xdna.net>
Date: Sun, 24 May 2015 01:21:58 -0000
Subject: [Buildroot] [PATCH 00/38] systemd support for various packages
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <7cec.556127b6.37b1a@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex Suykov <alex.suykov@gmail.com> writes:

>This set adds systemd support to packages that install sysv
>initscripts but not systemd services. The idea is that the
>choice between BR2_INIT_SYSV and BR2_INIT_SYSTEMD should affect
>the process list in the resulting system as little as possible.

>All services start foreground processes (Type=simple), and follow
>current initscripts otherwise whenever possible.

Type=simple is not necessarily the best way to do this. Handling errors
is done differently by systemd with Type=simple vs Type=forking.

A recent blog post by Lucas Nussbaum has more details:
http://www.lucas-nussbaum.net/blog/?p=877

With Type=simple, systemd considers the service started right after
executing it. It will not flag errors on startup if the process exits
soon after due to a config error, etc. With Type=forking, systemd will
only consider the service started after the parent exits. As many
daemons will check config files and command line args before forking,
these errors will be detected and propagated to systemd.
