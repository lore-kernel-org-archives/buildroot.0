From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:24:02 +0100
Subject: [Buildroot] [PATCH v2 23/25] avahi: systemd cleanups
In-Reply-To: <CANPyyuPHqnwtSFKBcf=Qk2os+Oz6DYtPc12e2Ak6c_GbJgHqtw@mail.gmail.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-24-git-send-email-mike@mikebwilliams.com>
 <20150320204150.4169961f@free-electrons.com>
 <CANPyyuPHqnwtSFKBcf=Qk2os+Oz6DYtPc12e2Ak6c_GbJgHqtw@mail.gmail.com>
Message-ID: <20150320212402.11565fcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 16:10:16 -0400, Mike Williams wrote:

> > Seriously, do you test the patches you send? I really value the
> > contributions you're making around systemd support: it's great to have
> > someone finally picking up this topic and doing some
> > cleanup/refactoring. But please, test your patches at least minimally.
> 
> Yes, I built, booted it, and verified that systemd started it without
> error. I mistakenly assumed that meant it the patch was working
> correctly; I don't use avahi for anything and have no experience with
> it.

Right, I also assumed you tested the systemd case. But here it's the
non-systemd case that can be problematic.

> > The <pkg>_CFLAGS variable does not exist and has no effect.
> 
> I see that now. I fgrep'd for _CFLAGS initially to find out how other
> packages were doing it, and didn't realize this common convention
> wasn't part of buildroot.

Right, the <pkg>_CFLAGS variable doesn't mean anything for the
Buildroot package infrastructure. You have to do something like:

<pkg>_CFLAGS = $(TARGET_CFLAGS)
...
<pkg>_CFLAGS += -something
...
<pkg>_CONF_ENV += CFLAGS="$(<pkg>_CFLAGS)"

The default value of CFLAGS being $(TARGET_CFLAGS), this allows to add
some more flags in a correct fashion.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
