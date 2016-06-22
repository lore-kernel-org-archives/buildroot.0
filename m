From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 23:49:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/quagga: Add systemd.service
 file and helper script
In-Reply-To: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
References: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
Message-ID: <d21ee679-976a-1642-61d1-5311f1134bf4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nathaniel,

On 18-06-16 19:02, Nathaniel Roach wrote:
> We use a template service file as all of the daemons use almost
> identical arguments and generally appear the same to the init
> system.
> 
> We "Wants=" zebra as that's the daemon for interfacing to the
> kernel, and it's not required for the other daemons to work
> but it's probably going to be used in nearly all setups.

 ... and it can be overridden by fs-overlay.

> 
> We need the helper script as systemd doesn't like having the
> instance (%i) in the path to the executable.

 That last paragraph should IMHO be included as a comment in either the shim
itself or in the service file.

> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/quagga/quagga-shim     | 51 ++++++++++++++++++++++++++++++++++++++++++
>  package/quagga/quagga.mk       |  6 +++++
>  package/quagga/quagga at .service | 19 ++++++++++++++++
>  3 files changed, 76 insertions(+)
>  create mode 100644 package/quagga/quagga-shim
>  create mode 100644 package/quagga/quagga at .service
> 
> diff --git a/package/quagga/quagga-shim b/package/quagga/quagga-shim
> new file mode 100644
> index 0000000..1687e7c
> --- /dev/null
> +++ b/package/quagga/quagga-shim
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +#Shim for systemd's quagga at .service

# Shim ...

> +
> +export QUAGGA_PATH="/usr/sbin"

 Why export?

> +
> +# Check if $1 is a valid quagga binary
> +case $1 in
> +  zebra)
> +    export BINARY="zebra"

 Why export?

 I think this check is really redundant. So what if someone calls
"quagga-shim tcpdump -i eth0" and it actually works? Is that a problem? It's not
as if this is setuid or anything.

 So I'd skip the entire case, and instead go straight to ...

[snip]
> +# Check the binary exists
> +if [ -e "$QUAGGA_PATH/$BINARY" ]; then

 And this check is redundant as well. Just call it, it will error out
automaticaly if the binary doesn't exist.

> +  shift # Remove the first argument (binary name)
> +  "$QUAGGA_PATH/$BINARY" "$@" # Run the daemon with the remaining arguments

 Is there any reason to keep the shim around? I.e., why not exec? Also, the
comment is quite redundant.


 In other words, I'd reduce the script to 5 lines:

#! /bin/sh
# Shim for systemd's quagga at .service
BINARY="$1"
shift
exec /usr/sbin/"$BINARY" "$@"



> +else
> +  echo "Binary \"$BINARY\" not found in $QUAGGA_PATH"
> +  exit 1
> +fi
> +
> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 22e90ad..5d9c292 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -75,6 +75,12 @@ endif
>  define QUAGGA_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
>  		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
> +
> +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service

 In the commit log you mention zebra, here it's bandwidthd. /me is confused.

> +
> +	$(INSTALL) -D -m 755 package/quagga/quagga-shim \
> +		$(TARGET_DIR)/usr/sbin/quagga-shim
>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
> new file mode 100644
> index 0000000..3e98318
> --- /dev/null
> +++ b/package/quagga/quagga at .service
> @@ -0,0 +1,19 @@
> +[Unit]
> +Description=Quagga %i routing daemon
> +PartOf=quagga.service
> +ReloadPropagatedFrom=quagga.service
> +Wants=quagga at zebra.service
> +
> +[Service]
> +PrivateTmp=true
> +KillMode=mixed
> +Type=forking
> +EnvironmentFile=/etc/default/quagga-%i
> +ExecStart=/usr/sbin/quagga-shim %i --daemon $OPTS -f /etc/quagga/%i.conf -i /var/run/quagga/%i.pid

 systemd prefers non-forking daemons because then it has better control over it.
Since you give a --daemon option here, I assume that they are perfectly capable
of running as a simple service. Can you give that a try?


 Regards,
 Arnout

> +PIDFile=/var/run/quagga/%i.pid
> +KillSignal=SIGINT
> +Restart=on-failure
> +RestartSec=1
> +
> +[Install]
> +WantedBy=multi-user.target
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
