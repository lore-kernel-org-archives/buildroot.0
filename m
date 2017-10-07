From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:31:43 +0200
Subject: [Buildroot] [PATCH v2]] radvd: improve startup script
In-Reply-To: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
References: <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
 <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20171007233143.12b8bdd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 23:16:09 -0300, Carlos Santos wrote:
> Print an error message if /usr/sbin/radvd is missing.
> 
> Print an error message if the kernel does not support IPv6 forwarding,
> which is required by radvd.
> 
> Ignore any start/stop/restart option if /etc/radvd.conf does not exist.
> The previous script printed an error message in this case but is valid
> to install radvd without a configuration file. The daemon may be started
> later by another service with a configuration created at run-time.
> 
> This is a copy/paste/edit/fix of package/dnsmasq/S80dnsmasq.

Not quite true: since v1, you changed things and you're no longer doing
like S80dnsmasq anymore.

> +[ -x /usr/sbin/radvd ] || {
> +	echo "Error: /usr/sbin/radvd is missing."
>  	exit 1
> -fi
> +}

I think this test is useless. Why not let start-stop-daemon fail
is /usr/sbin/radvd is missing? It's unlikely to happen because
Buildroot installs both radvd and its init script as part of the same
package. But if it ever happens for some reason, the error message from
start-stop-daemon should be pretty clear.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
