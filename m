From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Feb 2018 23:13:47 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180228213104.GA16465@scaer>
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180228213104.GA16465@scaer>
Message-ID: <20180228231347.1e2896a2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Feb 2018 22:31:04 +0100, Yann E. MORIN wrote:

> OK, so I do not have en_USUTF-8 on my machine. I have en_GB.UTF-8 (which
> I am using). So I'm left out in the cold with this patch.
> 
> However, C.UTF-8 is virtually available everywhere. And I was able to
> build systemd with C.UTF-8 without any problem.
> 
> So, I would  prefer, if we have to force anything, that we force the
> use of C.UTF-8.
> 
> But then that also means that we override the users' environments, users
> that may prefer to see localised messages.
> 
> So, as a stop-gap measure, I'm OK with this patch as long as it is
> switched to using C.UTF-8. Also, rename the variable, something like:
> 
>     BR2_NEEDS_HOST_UTF8_LOCALE_CURRENT
> 
> Note: this is different from the existing BR2_NEEDS_HOST_UTF8_LOCALE: it
> onlhy requires that a UTF-8 locale be present on the system, while we
> now require that it be the current locale.

Now, we don't require it to be the current locale:


> > +SYSTEMD_ENV = $(TARGET_MAKE_ENV) LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

The systemd package ensures to pass LANG/LC_ALL pointing to an UTF-8
locale.

So even if your current locale is something else, as long as
en_US.UTF-8 is *available*, things are going to work.

That being said, I also dislike this solution, and think the sytemd
build system should be fixed instead.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
