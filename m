From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 24 Sep 2013 10:46:52 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <20130924074704.12a4ef4c@skate>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF92E620E9.2D6A14D7-ON86257BEF.0070A92F-86257BEF.007178BD@rockwellcollins.com>
 <CAHXCMM+GdD3A1RGMawhct3QZViQ+qnSuh66e4p1txZSJ5J8Zvw@mail.gmail.com>
 <OFCF97B6AC.08C8B010-ON86257BEF.007B61FF-86257BEF.007B99C0@rockwellcollins.com>
 <20130924074704.12a4ef4c@skate>
Message-ID: <CAHXCMM+EjrNqgL58PdGLMeof+0giQRR1m2aHx58gWbTWUujbnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Thomas,


2013/9/24 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Ryan Barnett,
>
> It's a problem I had already fixed in earlier versions, where I was
> passing the proper BR2_EXTERNAL value, but Arnout disagreed in that
> external packages should not be listed in the manual (which is
> certainly correct), so I removed the variable. But indeed, there needs
> to be a value, or the Kconfig logic is broken. The solution (below)
> from Samuel is correct.
>
> On Mon, 23 Sep 2013 17:30:02 -0500, Ryan Barnett wrote:
>
> > Could you send this in an email? I can't get to any pastebin type
> > website from behind my work's firewall.
>
> commit f160920f50898ee7fd8d96a4613af2e7a893db13
> Author: Samuel Martin <s.martin49@gmail.com>
> Date:   Tue Sep 24 00:07:09 2013 +0200
>
>     manual: fix BR2_EXTERNAL support when building the manual
>
>     Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 157d13c..8cd732a 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,7 @@
>  manual-update-lists: manual-check-dependencies-lists
>         $(Q)$(call MESSAGE,"Updating the manual lists...")
>         $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> +               BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>                 $(TOPDIR)/support/scripts/gen-manual-lists.py
>
>  manual-check-dependencies:
>

This patch fixes the undefined symbol error triggered by kconfiglib
package, but not the wrong symbol expansion.
Renaming BR2_EXTERNAL to BR_EXTERNAL is enough to solve the later issue.
This sounds like a kconfiglib bug... :(
Anyway, it does not explain why this was not triggered before...

Next step: understand and fix the expansion problem in kconfiglib

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/84a91c54/attachment.html>
