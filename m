From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2011 23:44:43 +0200
Subject: [Buildroot] Antw:Re: Antw: Antw:Re: libgcc build fails on
 Fedora15
In-Reply-To: <7290fd86f3ac9.4e80ae6d@home.nl>
References: <7290fd86f3ac9.4e80ae6d@home.nl>
Message-ID: <20110927234443.433e13a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcel,

Le Mon, 26 Sep 2011 16:55:09 +0200,
"MARCEL JANSSEN" <korgull@home.nl> a ?crit :

> Thanks for your comment. I indeed still use OABI, but I have no
> reason to stay with that. So, to make things easier I will switch to
> EABI and see what will happen. It compiles well, I just need to check
> it on a real device, which probably is not issue as well. That
> doesn't mean that I'm not interested in a reply to my initial
> question regarding the invalid ABI and why fedora 15 triggers this
> error and fedora 14 does not. I guess some people will be looking for
> the same answer on the net, so if anyone knows what's the real cause
> it is still interesting to mention it I think.

I have no idea why OABI breaks on Fedora 15 and I'm personally not
really interested in fixing this, as support for OABI really isn't a
priority. Of course, interested parties are welcome to investigate the
problem and provide the corresponding fixes.

> Maybe its' nice to add "deprecated" to OABI ?
> Or perhaps, not even allow it any more if there's no real reason to
> chose it.

It might be needed for people having legacy binaries.

> I also decided to switch to the new buildroot immediately. It's so
> much better than the old one I was using and really appreciate all
> the efforts of the team. The time to port from my old buildroot to
> the new one took about 1 day and so far things seem to be ok. So far
> I'm very impressed by the new buildroot and I'm sure I will use it a
> lot ( and contribute as well when I can).

Thanks! Buildroot has indeed improved quite a lot during the last 2/3
years.

> I just have one question which probably belongs in the faq (I may
> have missed something as well). I can't yet figure out how to build
> the output for different devices without recompiling the whole
> toolchain. I have several different images which are just a little
> different in the sense that they all have the same kernel but some
> different packages. It would be great if I could just switch between
> configs and don't have to recompile the whole toolchain again or even
> shared packages between those configs.

Buildroot is very simple: one configuration, one build. No way to share
things across different builds. Adding the ability of sharing build
results across various builds complicates things a lot, and Buildroot
would lose one of its core advantage: simplicity.

Since the toolchain build typically accounts for a large part of the
overall build time, what we generally recommend in this kind of
situation is to make use of the external toolchain mechanism. The
principle is :

 1/ Generate a toolchain with Crosstool-NG, Buildroot or use a
    pre-compiled toolchain such as CodeSourcery ones.

 2/ Tell Buildroot to use this toolchain as an external toolchain.
    Buildroot will "import" this toolchain in just a few seconds, will
    skip the toolchain building process and start right away with the
    build process of the packages.

That's the mechanism I use for all my Buildroot-based projects. I
almost never use the internal Buildroot mechanism to build a toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
