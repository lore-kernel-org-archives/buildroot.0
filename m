From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jan 2016 18:31:17 +0100
Subject: [Buildroot] [v5,
 2/5] Makefile: add HOST_FIX_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <568D4C68.1000700@codethink.co.uk>
References: <1436824511-1601-2-git-send-email-s.martin49@gmail.com>
 <568D4C68.1000700@codethink.co.uk>
Message-ID: <20160106173117.GA3613@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2016-01-06 17:18 +0000, Sam Thursfield spake thusly:
> On 13/07/15 22:55, Samuel Martin wrote:
> >This patch adds host-patchelf as a target-finalize dependency, and
> >introduces the HOST_FIX_RPATH_HOOK hook fixing the ELF files' RPATH of
> >the HOST_DIR location (excluding the sysroot).
> >
> >After running this hook, the RPATH from any host ELF files is relative to
> >the binary location itself.
> >
> >Note that, we avoid to fix RPATH in the sysroot, and in the external
> >toolcahin installation location.
> >
> >As a first step toward a fully relocatable SDK, this change allows to get
> >the toolchain relocatable, but not yet the whole SDK.
> >
> >Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> >---
> >changes v4->v5:
> >- add verbose support
> >
> >changes v3->v4:
> >- add host-patchelf to PACKAGES instead of target-finalize (Baruch)
> >- add comment
> >
> >changes v2->v3:
> >- move hook in Makefile (Baruch)
> >---
> >  Makefile | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> >diff --git a/Makefile b/Makefile
> >index 546bcd3..4b88116 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -555,6 +555,22 @@ endef
> >  TARGET_FINALIZE_HOOKS += PURGE_LOCALES
> >  endif
> >
> >+# RPATH fixing
> >+# - The host hook sets RPATH in host ELF binaries, using relative paths to the
> >+#   library locations.
> >+PACKAGES += host-patchelf
> 
> This should be TARGETS, not PACKAGES.

Nope, PACKAGES is the correct variable. It has been renamed from TARGETS
to PACKAGES in April2015:

    commit 8a58e0238ef3099d31fdd01cbbcca6ae1421eea5
    Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Date:   Sun Apr 12 18:37:48 2015 +0200

        Makefile: rename TARGETS to PACKAGES

        For clarity, this commit renames the TARGETS variable to the more
        meaningful PACKAGES variable. Indeed, only packages (handled by one of
        the package infrastructures) should be listed in this variable, and
        not other random non-package targets.

        Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
        Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
