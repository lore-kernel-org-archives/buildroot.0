From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 28 Oct 2011 13:06:33 +0200
Subject: [Buildroot] fix for mplayer with armv7 / neon
In-Reply-To: <CANVadiHajYSQyOY9VAVX9mL=ZW+3vgsra5SW76LjKZtPJneNcg@mail.gmail.com>
References: <CANVadiHajYSQyOY9VAVX9mL=ZW+3vgsra5SW76LjKZtPJneNcg@mail.gmail.com>
Message-ID: <CAAXf6LX1JfKGScyO9v269rLEdbk8wf9UTiw_SHdQ=5XqKuJdDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Oct 28, 2011 at 12:08 PM, Bruno Niklaus <niklaus.bruno@gmail.com> wrote:
> hi @all
> sorry i don't know how to make a patch file or how to send it / git it or
> how ever to
> the buildroot source :)
> i tried to build mplayer for a omap4430 / pandaboard, it always failed with
> error:
> arm/mpegvideo_arm.c:33: error: size of array 'x_H263_AIC' is negative
> after a bit of google search i found this email
> http://comments.gmane.org/gmane.comp.video.mplayer.user/64844
> and edited the file
> libavcodec/arm/asm-offsets.h
> like this
> Line 38:
> --??#define H263_AIC ?0x2670
> ++ #define H263_AIC 0x2678.
> after that i built without erros!
> can you make a patch for this?


This issue was also reported previously:
https://bugs.busybox.net/show_bug.cgi?id=3535
The bug report refers to patches from chromium, but the following
thread indicates that they may not be valid anymore:
http://thread.gmane.org/gmane.comp.video.ffmpeg.trac/677/focus=2097


I'm not sure whether your proposed solution is really the best one.
The following irc log mentions that it may compile well, but crash
during usage. Did you try running the resulting build?

To be honest, I can't help with finding out whether this patch is the right one.

Anyway, I think it would be great if you learned to use git or another
version control system like mercurial. This will help in generating
patches more easily.
But even without version control system, it's easy to create a patch:
* unpack the unmodified sources to some directory, e.g. /tmp/mplayer-1.2.3
* copy the directory to /tmp/mplayer-1.2.3.orig
* make your changes in /tmp/mplayer-1.2.3
* then at /tmp, type the following command:
diff -upNr mplayer-1.2.3.orig mplayer-1.2.3 > patchfile

The file 'patchfile' should now contain all the changes that you made.
If you put that patch in package/multimedia/mplayer/ with the right
name (mplayer-VERSION-DESCRIPTION.patch), then it should get applied
after mplayer is extracted by buildroot.

Best regards,
Thomas

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
