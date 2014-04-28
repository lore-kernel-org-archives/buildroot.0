From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 28 Apr 2014 12:57:34 +0000
Subject: [Buildroot] [PATCH v2] uboot-tools: bump to version 2014.04
In-Reply-To: <535E4CED.6000806@mind.be>
References: <1398684231-8957-1-git-send-email-abrodkin@synopsys.com>
 <535E4CED.6000806@mind.be>
Message-ID: <1398689853.3429.57.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, 2014-04-28 at 14:43 +0200, Arnout Vandecappelle wrote:
> On 28/04/14 13:23, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
>  v1 had a much better commit message.

Right, because it was simple considering changes were done in commit.
But after pretty significant rework I'll need to comment on much more
things - this new U-Boot version introduced a lot of changes especially
in build infrastructure.

If you prefer to have a verbose description of changes I've done I'll
add more comments happily.

> > 
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> > Changes compared to v1:
> > 
> >  * Fixed building of U-Boot tools for the target
> >  * Properly set compiler and linker flags in case of cross-compilation
> > 
> >  .../uboot-tools-01-drop-configh-from-tools.patch   | 32 +++++-----------------
> >  .../uboot-tools-02-hostcflags-override-fix.patch   | 29 --------------------
> >  package/uboot-tools/uboot-tools.mk                 | 19 ++++++++-----
> >  3 files changed, 19 insertions(+), 61 deletions(-)
> >  delete mode 100644 package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
> > 
> > diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> > index 21995ec..6466287 100644
> > --- a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> > +++ b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
> > @@ -1,14 +1,9 @@
> > -We need to build u-boot tools without a board configuration for the target.
> > -fw_env just uses config.h to define the default environment of the created
> > -image, so it really isn't mandatory.
> > -
> > -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
>  No need to drop this commit log...

Makes sense. Will add it back.

>  I also don't really like this patch to begin with, because sometimes I
> _do_ need fw_setenv to be able to generate a default environment. But
> that, of course, would be a separate patch.

Then you need to configure U-Boot before building. Do something like
"make yourboard_config" and only then build tools.

In other words we'll need to provide correct board name in Buildroot
configuration for U-Boot tools. Which I think is a bit of overhead. IMHO
it's good to generate generic tools. At least it's the simplest way.

Maybe we need to consider building of U-Boot tools for target as a part
of U-Boot bootloader. In this case board name will be there already and
configuration of sources will be done by previous build.

> > -
> > -diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_env.h
> > ---- u-boot-2013.01.orig/tools/env/fw_env.h	2013-01-19 07:50:53.879241660 -0300
> > -+++ u-boot-2013.01/tools/env/fw_env.h	2013-01-19 07:58:11.897903403 -0300
> > -@@ -21,15 +21,6 @@
> > -  * MA 02111-1307 USA
> > +diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
> > +index aff471b..dfe7439 100644
> > +--- a/tools/env/fw_env.h
> > ++++ b/tools/env/fw_env.h
> > +@@ -5,14 +5,6 @@
> > +  * SPDX-License-Identifier:	GPL-2.0+
> >    */
> >   
> >  -/* Pull in the current config to define the default environment */
> > @@ -19,19 +14,6 @@ diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_en
> >  -#else
> >  -#include <config.h>
> >  -#endif
> > --
> > + 
> 
>  Useless change.

Well it is required just because of changes in "fw_env.h" which prevent
original patch to apply. So I created a brand-new patch on top of
current sources.

Regards,
Alexey
