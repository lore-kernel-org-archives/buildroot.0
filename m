From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:35:53 +0200
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
 skeleton
In-Reply-To: <55A81F61.3050307@zacarias.com.ar>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150716230722.304e5f9a@free-electrons.com>
 <55A81F61.3050307@zacarias.com.ar>
Message-ID: <20150716233553.4d46b3d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jul 2015 18:17:21 -0300, Gustavo Zacarias wrote:

> Actually i reported the bug to Maxime, he just forgot to add the 
> Reported-By.

Ok, thanks for the info.

> The problem with this is that it's a change in behaviour, this didn't 
> happen in the previous releases.

Well, all the commits I cited in my previous reply definitely changed
the behavior in a similar way, just for different files.

> My usage scenario is customized initscripts that rely on a very minimal 
> inittab (rcS, rcK and getty, nothing more).
> All of the basic startup is handled in initscripts, which i think we 
> should do for BR as well - there's no reason to stick a lot of stuff in 
> inittab IMO.

Possibly yes, though it's a different question. Even if the default
inittab is more minimal, there are still lots of reasons for which you
might need a custom version of it. So making the default version more
minimal is kinda unrelated to whether we keep or overwrite the inittab
of a custom skeleton.

> But even if we do that i'm still concerned about the behaviour change 
> that can lead to non-working systems when upgrading buildroot.
> Another option is to just get rid of the custom skeleton altogether, if 
> it's being stepped on right and left what's the purpose?

My personal preference would be to ultimately get rid of the custom
skeleton thing. We have been encouraging rootfs overlay and post-build
scripts since quite a while in the Buildroot manual, see
http://buildroot.org/downloads/manual/manual.html#rootfs-custom:

"""
The two recommended methods, which can co-exist, are root filesystem
overlay(s) and post build script(s).

Root filesystem overlays (BR2_ROOTFS_OVERLAY)

Post-build scripts (BR2_ROOTFS_POST_BUILD_SCRIPT)

[...]

Below two more methods of customizing the target filesystem are
described, but they are not recommended.

Direct modification of the target filesystem

Custom target skeleton (BR2_ROOTFS_SKELETON_CUSTOM)

[...]

This method is not recommended because it duplicates the entire
skeleton, which prevents taking advantage of the fixes or improvements
brought to the default skeleton in later Buildroot releases.
"""

If were to not overwrite the inittab, we should also revert all of the
commits I mentioned, and guarantee that the files in the custom
skeleton would not be overwritten.

I agree with you that this is a change in behavior, but I would say
it's a change for good: making people realize that using a custom
skeleton very often doesn't work as they intend it to work.

Any opinions from others?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
