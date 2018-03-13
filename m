From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Tue, 13 Mar 2018 23:43:12 +0000
Subject: [Buildroot] [RFC] how to deal with a dependency on configure in
 a "Makefile"
In-Reply-To: <20180313210150.lcwrmxkro7r4er6s@tarshish>
References: <5376F4DC-C206-4034-B246-3D77B47B5B81@storagecraft.com>,
 <20180313210150.lcwrmxkro7r4er6s@tarshish>
Message-ID: <MWHPR11MB1582B5873048E10045E084F5FAD20@MWHPR11MB1582.namprd11.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I went more by the build output show the make invocation of configure during "build" stage in the log.


./configure $$LOCAL_CONFIGURE_OPTIONS


Unfortunately, this was a transient build on a VM and I didn't stat the files. In the meantime, we are going to try this for a bit and see if anything changes.


commit d25e2a8f163c8c77055c3c7c8e89d65ec09e0f8e (HEAD -> master)

Author: Charles Hardin <charles.hardin@storagecraft.com>

Date:   Tue Mar 13 16:39:23 2018 -0700


    xfsprogs: force touch the order of the configuration files



    The Makefile can cause a rerun of the autoconf which could

    occur and use the host tools which is very annoying, so touch

    the files in the order expected so that the configure scripts

    hopefully run in the order intended and prevent any trips

    thru autoconf.



    Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>


diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk

index aa5c37ed8d..39fa3821ff 100644

--- a/package/xfsprogs/xfsprogs.mk

+++ b/package/xfsprogs/xfsprogs.mk

@@ -22,4 +22,13 @@ XFSPROGS_CONF_OPTS = \



 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install



+define XFSPROGS_AVOID_AUTORECONF_HOOK

+       find $(@D) -name aclocal.m4 -exec touch '{}' \;

+       find $(@D) -name config-h.in -exec touch '{}' \;

+       find $(@D) -name configure.ac -exec touch '{}' \;

+       find $(@D) -name configure -exec touch '{}' \;

+       find $(@D) -name Makefile.in -exec touch '{}' \;

+endef

+XFSPROGS_PRE_CONFIGURE_HOOKS += XFSPROGS_AVOID_AUTORECONF_HOOK

+

 $(eval $(autotools-package))

________________________________
From: Baruch Siach <baruch@tkos.co.il>
Sent: Tuesday, March 13, 2018 2:01:50 PM
To: Charles Hardin
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [RFC] how to deal with a dependency on configure in a "Makefile"

Hi Charles,

On Tue, Mar 13, 2018 at 07:27:30PM +0000, Charles Hardin wrote:
> So, we hit this problem that took me a while to figure out - but, it seems
> to be that
> xfsprogs has this bit in the Makefile when it extracts:
>
> configure: configure.ac
>         $(LIBTOOLIZE_BIN) -c $(LIBTOOLIZE_INSTALL) -f
>         cp include/install-sh .
>         aclocal -I m4
>         autoconf
>
> include/builddefs: configure
>         ./configure $$LOCAL_CONFIGURE_OPTIONS
>
>
> And the timestamps on the tar extraction end up in a race so that this gets invoked
> during the ?build? - so, I tried looking at other packages to deal with this and I can
> just touch configure on a PRE_CONFIGURE hook to get it to bounce forward or
> I could set AUTORECONF on xfsprogs. But, is there a preferred method to deal
> with this?

Which version of xfsprogs do you use?

Here is what I get for the current master branch xfsprogs tarball
(xfsprogs-4.15.1.tar.xz):

$ stat -c '%n: %y' configure configure.ac
configure: 2018-02-27 04:05:49.000000000 +0200
configure.ac: 2018-02-27 04:04:50.000000000 +0200

'configure' is newer than 'configure.ac', so the 'configure' generation rule
should not trigger.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180313/d1a50760/attachment.html>
