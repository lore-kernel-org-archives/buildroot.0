From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 23 Jun 2016 11:40:07 +0800
Subject: [Buildroot] [PATCH 1/1] package/quagga: Add systemd.service
 file and helper script
In-Reply-To: <61af7059-9ada-1f88-e03b-a6586d499d18@mind.be>
References: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
 <61af7059-9ada-1f88-e03b-a6586d499d18@mind.be>
Message-ID: <a8b926ed-8d9a-ea4e-c268-dd7255ff31f9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]
>  So I'd skip the entire case, and instead go straight to ...
>
> [snip]
> > +# Check the binary exists
> > +if [ -e "$QUAGGA_PATH/$BINARY" ]; then
>
>  And this check is redundant as well. Just call it, it will error out
> automaticaly if the binary doesn't exist.
>
> > +  shift # Remove the first argument (binary name)
> > +  "$QUAGGA_PATH/$BINARY" "$@" # Run the daemon with the remaining
> arguments
>
>  Is there any reason to keep the shim around? I.e., why not exec?
> Also, the comment is quite redundant.
>
How about in the .service file simply ExecStart=/bin/sh -c "/usr/sbin/%i
..."?
>
>  In other words, I'd reduce the script to 5 lines:
>
> #! /bin/sh
> # Shim for systemd's quagga at .service
> BINARY="$1"
> shift
> exec /usr/sbin/"$BINARY" "$@"
>
>
>
> > +else
> > +  echo "Binary \"$BINARY\" not found in $QUAGGA_PATH"
> > +  exit 1
> > +fi
> > +
> > diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> > index 22e90ad..5d9c292 100644
> > --- a/package/quagga/quagga.mk
> > +++ b/package/quagga/quagga.mk
> > @@ -75,6 +75,12 @@ endif
> >  define QUAGGA_INSTALL_INIT_SYSTEMD
> >  	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
> >  		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
> > +
> > +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
> > +		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
>
>  In the commit log you mention zebra, here it's bandwidthd. /me is
> confused.
That was simply my mistake in copying and pasting that section of code
from my bandwidthd stuff without properly editing.
>
> > +
> > +	$(INSTALL) -D -m 755 package/quagga/quagga-shim \
> > +		$(TARGET_DIR)/usr/sbin/quagga-shim
> >  endef
> >
> >  $(eval $(autotools-package))
> > diff --git a/package/quagga/quagga at .service
b/package/quagga/quagga at .service
> > new file mode 100644
> > index 0000000..3e98318
> > --- /dev/null
> > +++ b/package/quagga/quagga at .service
> > @@ -0,0 +1,19 @@
> > +[Unit]
> > +Description=Quagga %i routing daemon
> > +PartOf=quagga.service
> > +ReloadPropagatedFrom=quagga.service
> > +Wants=quagga at zebra.service
> > +
> > +[Service]
> > +PrivateTmp=true
> > +KillMode=mixed
> > +Type=forking
> > +EnvironmentFile=/etc/default/quagga-%i
> > +ExecStart=/usr/sbin/quagga-shim %i --daemon $OPTS -f
/etc/quagga/%i.conf -i /var/run/quagga/%i.pid
>
>  systemd prefers non-forking daemons because then it has better
control over it.
> Since you give a --daemon option here, I assume that they are
perfectly capable
> of running as a simple service. Can you give that a try?

Sure, but would systemd's preference still apply with sh/bash in between
them?

>  Two more things...
> 
> On 18-06-16 19:02, Nathaniel Roach wrote:
>> +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
>> +		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
> 
>  I believe it should actually be installed as quagga at .service, and then
> symlinked from /etc.
> 
>  I'm not so sure of this, but wouldn't it actually make sense to install all
> services that are selected in the config? Like
> 
> QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_ZEBRA) += zebra
> QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_BGPD) += bgpd
> ...
> 
> 	$(foreach service,$(QUAGGA_SERVICES_y),\
> 		ln -sf ../../../../usr/lib/systemd/system/quagga at .service \
> 		
> $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(service).service$(sep))
You're right on how the service is used, except that the symlink would
be quagga at zebra.service.
I deliberately did not "install" the service file. If we are to do that,
we'll also need to create environment files and empty configuration
files for all of the selected daemons.
> 
>  Regards,
>  Arnout
> 

Thanks,

Nathaniel
