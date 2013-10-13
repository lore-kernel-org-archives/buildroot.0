From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 10:25:26 +0200
Subject: [Buildroot] [PATCH] ruby: fix 'pcrel too far' build problem on
 SuperH architectures
In-Reply-To: <CAAXf6LXA-UK2EcGnmRvhfA8cT_+-GsZTQ1o2ubjbFGnGAL4k2w@mail.gmail.com>
References: <873298952161de3ed5aa.1381650276@argentina>
 <20131013095140.7a9e70e5@skate>
 <CAAXf6LXA-UK2EcGnmRvhfA8cT_+-GsZTQ1o2ubjbFGnGAL4k2w@mail.gmail.com>
Message-ID: <20131013102526.56152a76@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 13 Oct 2013 09:58:05 +0200, Thomas De Schampheleire wrote:

> > I don't think it's the right way of fixing the problem. This is going to
> > affect the CFLAGS of *all* packages. You shouldn't change
> > TARGET_CFLAGS, but instead do:
> >
> > RUBY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
> 
> Ah yes, you're right. The above was what I proposed initially, but I
> tried to be too smart.
> I was looking for a way to avoid duplicating TARGET_CFLAGS, because if
> someone needs to add a new cflag for ruby specifically, they now need
> to explicitly take the superh case into account.
> 
> I'll send a new version.

The way we usually do this is:

RUBY_CFLAGS = $(TARGET_CFLAGS)

ifeq ($(BR2_sh)$(BR2_sh64),y)
RUBY_CFLAGS += -O2
endif

RUBY_CONF_ENV += CFLAGS="$(RUBY_CFLAGS)"

This way, someone else can easily add another RUBY_CFLAGS +=, and not
worry about the SuperH thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
