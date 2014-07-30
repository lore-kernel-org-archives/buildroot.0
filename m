From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 08:55:56 +0200
Subject: [Buildroot] [PATCH 1/1] flex: delete broken flex++ symlink from
 target
In-Reply-To: <CANxTyt7d2DiggQEqP08T6co=mO_F1neS0Tb2qFpas+h1Fap6fA@mail.gmail.com>
References: <1406597734-1902-1-git-send-email-danomimanchego123@gmail.com>
 <20140729235736.1c91a388@free-electrons.com>
 <CANxTyt7d2DiggQEqP08T6co=mO_F1neS0Tb2qFpas+h1Fap6fA@mail.gmail.com>
Message-ID: <20140730085556.13cdfc4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Tue, 29 Jul 2014 18:20:59 -0400, Danomi Manchego wrote:

> Actually, I don't know *anything* about flex.  The only reason I ran
> into this is that linux-pam now pulls in flex as a dependency, and the
> flex++ came up as a difference in my before-2014.05/after-2014.05
> upgrade comparison check.

Nice catch then, it was a good idea to do this comparison!

> But I am somewhat knowledgeable about
> makefiles, so if this amounts to sending patches to some sourceforge
> mailing list, then I can try.

Yes, I don't think you need to know much about flex, it's mostly about
autotools that you need to know a few things.

> We just want an option to officially not install the bin and the
> flex++ symlink, and add in the "AR" definition?

Yes, except for AR: our patch actually *removes* the AR definition, so
that it can be passed from the environment. But I see that this might
have been fixed in 2.5.39 (yes it does).

For the rest, a --enable-program / --disable-program autoconf option
would be good to enable/disable the compilation/installation of the
program.

> What's was the reason for dropping the tool - is it too large, or is
> the m4 dependency objectionable?

The dependency on host-m4 is always there. No, the main reason is 1/
space and 2/ the library builds on noMMU platforms, but not the
program, because it uses fork().

> Additionally, I see that the last change to buildroot's flex package
> was to revert the bump to 2.5.39, because it broke a couple packages -
> back in April 2014.  If the mods got in, would we be able to upgrade?

No, additional changes would be needed. As pointed out in the commit
log of 1be95896dde41c668e1c884db704b0da2ea360c9, bumping flex broke at
least two packages. It would be good to see if those packages have been
fixed since then, and investigate if we can bump flex.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
