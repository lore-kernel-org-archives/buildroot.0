From: Nathaniel Roach <nroach44@gmail.com>
Date: Fri, 13 May 2016 21:48:20 +0800
Subject: [Buildroot] package/quagga: Add systemd service
In-Reply-To: <1463141985-23802-1-git-send-email-nroach44@gmail.com>
References: <1463141985-23802-1-git-send-email-nroach44@gmail.com>
Message-ID: <5735DB24.6060009@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's two things wrong with this that I've spotted:

Firstly, do we want to run any binary under /sbin? Do we change the 
output folder of quagga's ./configure? Do we make a folder with symlinks?

Secondly, I'll change Requires=quagga at zebra.service to Wants= as we 
allow building quagga without zebra, and the other dameons can still 
talk on the network without it.

Thanks,

Nathaniel
On 13/05/16 20:19, Nathaniel Roach wrote:
> Create a template unit, as there are a few different daemons
> available, but all of them accept/use the same basic runtime arguments.
>
> Allow use of a /etc/default/ file to customise each daemon.
>
> (Some daemons, like the zebra backend, have custom flags that cause
> other daemons to exit when used)
>
> The zebra backend is required to modify routes on the host system,
> so we require it. Systemd handles this just fine, and a circular
> dependency is avoided
>
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>   package/quagga/quagga.service | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 package/quagga/quagga.service
>
> diff --git a/package/quagga/quagga.service b/package/quagga/quagga.service
> new file mode 100644
> index 0000000..e7ab584
> --- /dev/null
> +++ b/package/quagga/quagga.service
> @@ -0,0 +1,19 @@
> +[Unit]
> +Description=Quagga %i routing daemon
> +PartOf=quagga.service
> +ReloadPropagatedFrom=quagga.service
> +Requires=quagga at zebra.service
> +
> +[Service]
> +PrivateTmp=true
> +KillMode=mixed
> +Type=forking
> +EnvironmentFile=/etc/default/quagga-%i.conf
> +ExecStart=/sbin/%i --daemon $OPTS -f /etc/quagga/%i.conf -i /var/run/quagga/%i.pid
> +PIDFile=/var/run/quagga/%i.pid
> +KillSignal=SIGINT
> +Restart=on-failure
> +RestartSec=1
> +
> +[Install]
> +WantedBy=multi-user.target
