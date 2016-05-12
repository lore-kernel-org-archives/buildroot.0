From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 15:27:14 +0200
Subject: [Buildroot] [v2] package/quagga: Fix directories and permissions
In-Reply-To: <1463037440-8933-1-git-send-email-nroach44@gmail.com>
References: <1463037440-8933-1-git-send-email-nroach44@gmail.com>
Message-ID: <20160512152714.1d08ee16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 15:17:19 +0800, Nathaniel Roach wrote:
> Quagga runs as the "quagga" user, but it also needs to modify files
> in /etc and /var - config files, pid files and vty sockets for vtysh.
> 
> Tell the configure script the right folders to use, create the
> user, fix the permissions, and then let systemd know (if needed).
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Thanks for this new iteration. However, there's one thing that I missed
in my review of the previous iteration.

> +define QUAGGA_PERMISSIONS
> +	/etc/quagga r 600 quagga quagga - - - - -
> +	/etc/quagga d 755 quagga quagga - - - - -
> +	/var/run/quagga d 755 quagga quagga - - - - -
> +endef

I think setting permissions on /var/run/quagga here is useless.
Indeed, /var/run is a symbolic link to /run, which is mounted at boot
time as a tmpfs filesystem. I.e, the permissions set in
<pkg>_PERMISSIONS (which affect the generated filesystem image) have no
affect to the contents of /run.

Thanks to your tmpfiles.d thing, you probably haven't seen this if
you're using systemd. But if you try to use the Busybox init, it won't
work. Only an init script can adjust the permissions in /run.

So I believe this line should be removed.

BTW, what about adding a systemd service file and an init script for
Quagga? Of course, I'm fine if it's done as part of a separate change,
submitted later.

> diff --git a/package/quagga/quagga_tmpfiles.conf b/package/quagga/quagga_tmpfiles.conf
> new file mode 100644
> index 0000000..ad82cc6
> --- /dev/null
> +++ b/package/quagga/quagga_tmpfiles.conf
> @@ -0,0 +1,2 @@
> +d /var/run/quagga/ 1755 quagga quagga -
> +

While you're at it, remove this extra empty line at the end of the
file, I don't think it is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
