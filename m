From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:06:02 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171031223659.6831-2-code@mmayer.net>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
Message-ID: <20171102230602.3c61e8d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 15:36:58 -0700, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> Add System V start-up script for dhcpcd that is run after the network
> has been brought up.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

I've applied, just two comments.

> +DAEMON=/sbin/dhcpcd
> +CONFIG=/etc/dhcpcd.conf
> +PIDFILE=/var/run/dhcpcd.pid
> +
> +[ -x $DAEMON ] || exit 0
> +[ -f $CONFIG ] || exit 0

We have these in a lot of init scripts, so I kept them. But I find
those tests pretty silly in fact:

 - The daemon should definitely be there, as it's installed by the same
   package. And if it turns out not to be there, I'd prefer a loud
   failure than an init script that silently ignores the problem.

 - Same for the configuration file: I prefer a loud error than an init
   script that ignores the problem.

Yann, Peter, Arnout, can we agree that such tests should be removed
entirely, and we let the init script fail if the daemon does not exist,
and the daemon fail if its configuration file does not exist ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
