From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 3 Feb 2019 14:55:53 -0600
Subject: [Buildroot] [PATCH v5] package/ntp: sntp time sync script
In-Reply-To: <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
References: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
 <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
Message-ID: <CANQCQpao8HkkQWiZ+_v1B7=PwGeA83pVRkJJk3NdkPCMbGYQ1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Feb 3, 2019 at 2:00 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
>  I've finally applied to master since it really is a useful feature and it
> works. However, I have a few additional remarks. Also one for Carlos, the init
> script dude :-)

:-)

>
> On 12/12/2018 04:45, Matt Weber wrote:

[snip]

>
>
> > +# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
> > +# It will try each until they either all timeout or time has been set. Thus
> > +# default to only providing one NTP pool host.
> > +SNTP_SERVERS="pool.ntp.org"
>
>  I think this was discussed before, but why isn't this
>
> if [ -e /etc/ntpd.conf ]; then
>         SNTP_SERVERS="$(sed -n
> '/^[[:space:]]*server[[:space:]]\+\([^[:space:]]\+\).*$/s//\1/p' /etc/ntpd.conf
> | head -1)"
> else
>         SNTP_SERVERS="pool.ntp.org"
> fi
>
> so the ntpd.conf gets reused by default?

Definitely could do that.  The one thing you have to be careful of is
the number of servers you put in that variable as that increases the
timeouts for the script to continue (timeout = num servers * num of
IPs resolved for each server hostname * timeout per IP).  As per the
comment above, having one host as default bounds that value.

I just sent a note to the ntp pool guys to check on our status of a
buildroot pool.  No luck/response so far after I submitted that in Nov
2018.

>
> [snip]
> > diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
> > old mode 100755
> > new mode 100644
>
>  I applied it now, but isn't this an accident?

Accident but correct, right?  (guessing I wildcarded 644 the folder as
part of cleanup) Then the install step correctly places the file and
permissions.

>
> > diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> > index af3c1aa..aad1cdd 100644
> > --- a/package/ntp/ntp.mk
> > +++ b/package/ntp/ntp.mk
> > @@ -93,9 +93,18 @@ define NTP_INSTALL_TARGET_CMDS
> >       $(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
> >  endef
> >
> > +# This script will step the time if there is a large difference
> > +# before ntpd takes over the necessary slew adjustments
> > +ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
> > +define NTP_INSTALL_INIT_SYSV_SNTP
> > +     $(INSTALL) -D -m 755 package/ntp/S48sntp $(TARGET_DIR)/etc/init.d/S48sntp
> > +endef
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
> >  define NTP_INSTALL_INIT_SYSV
> >       $(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
> > +     $(NTP_INSTALL_INIT_SYSV_SNTP)
>
>  So, the sntp script only gets installed if ntpd is installed. Is that
> intentional? Doesn't sound ideal...

Oh didn't catch that.  Yeah, we ideally should make the ntpd script
install a seperate define and then keep the NTP_INSTALL_INIT_SYSV
clean and just calling the respective  NTP_INSTALL_INIT_SYSV_SNTP and
NTP_INSTALL_INIT_SYSV_NTPD.  I'll send a patch for this.

Thanks for the feedback.  Matt
