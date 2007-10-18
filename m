From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 19 Oct 2007 01:47:46 +0200
Subject: [Buildroot] Ignored patches - WHY?
In-Reply-To: <4717EE0C.2090900@promwad.com>
References: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
	<4717DC5B.9000508@promwad.com> <4717DAC8.5050209@gmail.com>
	<4717EE0C.2090900@promwad.com>
Message-ID: <1192751266.5848.7.camel@c-f97ee255>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-10-19 klockan 02:36 +0300 skrev Ivan Kuten:
> Rex Luscus wrote:
> > Ok. This patch only change the dir of the bin of daemon.
> > 
> > Can you change this or you want that I make a new patch?
> > 
> > 
> > PD: ok, ok, my english is HORRIBLE, but I don't use this too often for write, 
> > only for read :-)
> > 
> > 
> > Ivan Kuten escribi?:
> >> Sushi Sensei wrote:
> >>   
> >>> I have send some patches ( 0001534, 0001533, 0001532) this week with
> >>> the Patch Tracking page, the week before I have send the same patches
> >>> without notices of this inclusion or error, some patch was send 2 or 3
> >>> week before and was ignored... There are some problem with this
> >>> patches??
> >>>     
> >>
> >> Hi Sushi,
> >>
> >> I'm sorry I can not apply this patch : br2-olsr.patch:
> >>
> >> Index: package/olsr/S50olsr
> >> ===================================================================
> >> --- package/olsr/S50olsr        (revisi?n: 20228)
> >> +++ package/olsr/S50olsr        (copia de trabajo)
> >> @@ -6,7 +6,7 @@
> >>  case "$1" in
> >>    start)
> >>         echo "Starting OLSRd daemon: "
> >> -       /usr/sbin/olsrd -d 0 -nofork &
> >> +       /usr/bin/olsrd -d 0 -nofork &
> >>         ;;
> >>    stop)
> >>         echo "Stopping OLSRd daemon: "
> >>
> >>   
> > 
> 
> >>Because an daemon should reside in /usr/sbin directory ,
> >>please check other buildroot packages such as dropbear, mdnsresponder, and so on - they are all in sbin dir.
> >>You should change OLSR_TARGET_BINARY:=usr/bin/olsrd instead.
> 
> Unfortunately I could not manage to build OLSR correctly:
> 
> /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip olsrd_dot_draw.so.0.3
> install -D -m 755 olsrd_dot_draw.so.0.3 /usr/lib/olsrd_dot_draw.so.0.3; /sbin/ldconfig -n /usr/lib
> install: cannot create regular file `/usr/lib/olsrd_dot_draw.so.0.3': Permission denied
> ...
> make[2]: Entering directory `/opt/buildroot/build_arm/olsrd-0.5.3/lib/dyn_gw'
> /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip olsrd_dyn_gw.so.0.4
> install -D -m 755 olsrd_dyn_gw.so.0.4 /usr/lib/olsrd_dyn_gw.so.0.4; /sbin/ldconfig -n /usr/lib
> install: cannot create regular file `/usr/lib/olsrd_dyn_gw.so.0.4': Permission denied
> make[2]: Leaving directory `/opt/buildroot/build_arm/olsrd-0.5.3/lib/dyn_gw'
> ...
>  make[2]: Entering directory `/opt/buildroot/build_arm/olsrd-0.5.3/lib/secure'
> /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip olsrd_secure.so.0.5
> install -D -m 755 olsrd_secure.so.0.5 /usr/lib/olsrd_secure.so.0.5; /sbin/ldconfig -n /usr/lib
> install: cannot create regular file `/usr/lib/olsrd_secure.so.0.5': Permission denied
> make[2]: Leaving directory `/opt/buildroot/build_arm/olsrd-0.5.3/lib/secure'
> 
> Could you provide a patch?
> 

OLSR will do an install in $(DESTDIR)/usr/lib
You need to add DESTDIR=$(STAGING_DIR) to the make.

I.E:

$(OLSR_DIR)/$(OLSR_BINARY): $(OLSR_DIR)/.unpacked
	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) -C$(OLSR_DIR)
olsrd $(OLSR_PLUGINS)



-- 
Best Regards,
Ulf Samuelsson
