From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 8 Sep 2014 21:05:19 +0000
Subject: [Buildroot] Question about openssh.mk
In-Reply-To: <20140908225258.7fd77c81@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD7B2@ex-mb3.corp.adtran.com>
 <20140908214016.51926cb9@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C68C8AD897@ex-mb3.corp.adtran.com>
 <20140908225258.7fd77c81@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AD8FA@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Okay, then it should probably be LDFAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)".
> 
> No, because $(TARGET_LDFLAGS) may contain flags that are not valid for
> $(TARGET_CC).

Hmmm.  I see TARGET_LDFLAGS only as --static on my system.  I do know that I
desire this flag to be sent down to the build, which, as it stands right now,
it doesn't (since the TARGET_LDFLAGS is not getting passed to LDFLAGS as a part
of configure).

So, what about something like this:

OPENSSH_LDFLAGS_FOR_CONF = $(TARGET_CFLAGS)

ifeq ($(BR2_PREFER_STATIC_LIB),y)
OPENSSH_LDFLAGS_FOR_CONF += --static
endif

OPENSSH_CONFIGURE_ENV += LDFLAGS="$(OPENSSH_LDFLAGS_FOR_CONF)"

???

Assuming that what I wrote down below [I modified this section after
typing the below -- you cannot read my e-mails straight through as I'm
a bit scatter-brained] does holds true for several rebuilds.

> 
> > For some reason, it breaks on every third or so build.  I dunno why.
> > Working on it.  I don't even have enough info to tell you where it is
> > breaking (at the moment).  I'll keep you advised.
> >
> > It probably has something to do with the fact that I use
> > BR2_PREFER_STATIC_LIB=y
> > Though, I have built with this several times today and I only got the
> > error once out of three times.  It is complaining that it cannot build
> > a shared object with openssl.a as it is statically linked.
> >
> > Like I said, I don't really have enough info to tell you what is broken.
> 
> Weird. If it happens once in a while, it might look like a parallel
> build issue.

Right, but the top-level is .NOTPARALLEL:, so it would stand that this would
not be possible to ever make happen.  Given that openssh has a HARD dependency
on openssl.

I dunno.  I'm still working on it.  I did just try to pass in TARGET_LDFLAGS
to LDFLAGS as part of the CONFIGURE_ENV and that seemed to have worked.

I'll have to run it again a few times before I'm comfortable with that.

I'm perplexed.

Andy
