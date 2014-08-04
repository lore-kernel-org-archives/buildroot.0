From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon, 4 Aug 2014 22:08:34 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] dhcpdump: Fix strsep() feature test
In-Reply-To: <20140804213631.4f4b5d2a@free-electrons.com>
References: <1407176414-13376-1-git-send-email-benoit.thebaudeau@advansee.com>
 <20140804213631.4f4b5d2a@free-electrons.com>
Message-ID: <10403623.1676304.1407182914767.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, August 4, 2014 9:36:31 PM, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Mon,  4 Aug 2014 20:20:14 +0200, Beno?t Th?baudeau wrote:
> 
> > diff --git a/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch
> > b/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch
> > new file mode 100644
> > index 0000000..10b826c
> > --- /dev/null
> > +++ b/package/dhcpdump/dhcpdump-1.8-fix-strsep-feature-test.patch
> 
> All patches should have a description + Signed-off-by. Also, you should
> use the proper naming convention for patches:
> 
> 	<package>-<sequencenumber>-<description>.patch
> 
> I know there's already a patch for dhcpdump that doesn't follow this
> convention, but you're invited to rename it as well :-)

Will do.

> > @@ -0,0 +1,12 @@
> > +diff -Nrdup dhcpdump-1.8.orig/dhcpdump.c dhcpdump-1.8/dhcpdump.c
> > +--- dhcpdump-1.8.orig/dhcpdump.c	2008-06-24 05:26:52.000000000 +0200
> > ++++ dhcpdump-1.8/dhcpdump.c	2011-05-31 19:22:15.987388498 +0200
> > +@@ -26,7 +26,7 @@
> > + #include <regex.h>
> > + #include "dhcp_options.h"
> > +
> > +-#ifndef HAVE_STRSEP
> > ++#ifndef _BSD_SOURCE
> 
> Is _BSD_SOURCE really meant to be tested within source code? I thought
> it was more the application or library that would #define _BSD_SOURCE
> or #define _GNU_SOURCE to tell the C library which functions should be
> made visible. But well, if strsep() depends on _BSD_SOURCE being
> defined, I agree that testing _BSD_SOURCE is a way of knowing whether
> it's available or not.
> 
> Are there some other opinions about this?

Yes, _BSD_SOURCE is supposed to be #define-d before all #include-s in order to
select the set of features. But here, we do not want to enforce any set of
features, but only to detect if strsep() is supported by the default feature
set, so we have no other choice than testing _BSD_SOURCE, just like the libc
does.

Another way would be to define or not HAVE_STRSEP from dhcpdump.mk based on some
criterion (which one? just forced?), but this seems less reliable.

Best regards,
Beno?t
