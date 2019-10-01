From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Oct 2019 22:15:06 +0200
Subject: [Buildroot] [PATCH v2 1/2] Strip binaries in the rootfs
 creation instead of in target-finalize
In-Reply-To: <20191001085256.6118de95@windsurf.home>
References: <20191001013654.22298-1-unixmania@gmail.com>
 <20191001013654.22298-2-unixmania@gmail.com>
 <20191001085256.6118de95@windsurf.home>
Message-ID: <20191001201506.GH10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Carlos, Arnout, All,

On 2019-10-01 08:52 +0200, Thomas Petazzoni spake thusly:
> On Mon, 30 Sep 2019 22:36:53 -0300
> unixmania at gmail.com wrote:
> 
> > From: Carlos Santos <unixmania@gmail.com>
> > 
> > Since commit 118534fe54 the root filesystem image is generated from a
> > temporary copy of TARGET_DIR, so we can strip the binaries in the copy,
> > only.
> > 
> > This allows us to easily find the non-stripped executables to debug with
> > gdbserver, as they are at the same relative path in TARGET_DIR as in the
> > target device, rather than searching inside the build directory.
> > 
> > Fixes: https://bugs.busybox.net/show_bug.cgi?id=10386
> > 
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> I see Arnout reviewed-by this, and while I understand the goal, I am
> not sure this is the real direction/solution we want for this problem.
> I believe the real solution we have been talking about for a long time
> is to install everything in STAGING_DIR (not just libraries). This way,
> unstripped binaries with debugging symbols with all be in STAGING_DIR.

I agree with Thomas here.

The dichotomy between staging/ and target/ has no raison-d'?tre nowadays.

The idea would be to ensure that all packages install in staging/,
always. Then, identify packages that have different commands for target/
and staging/ and make them identical. Finally, remove the target install
commands, and genreate it as a copy of staging at the beginning of the
target-finalize step.

Yes, the real patches will be a bit more gory than the ideal view above.
But except for some special snowflakes (qt5, I'm looking at you), it
should be fairly straghtforward...

> To me, the change being proposed here makes TARGET_DIR really different
> from what ends up in the final rootfs image. While we admittely already
> have a few differences, I personally like to keep the idea of
> TARGET_DIR being really what's on the target root filesystem, with as
> few differences as possible.

I beg to slightly disagree here, and with a much more controversial view
on the topic: we should just get rid of target/ altogether. The only
valid artefacts we generates are the images in images/

But that one is definitely not on the table. ;-)

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
