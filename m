From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Oct 2017 11:14:25 +0200
Subject: [Buildroot] [PATCH v1] evemu: fix PATH_MAX related compile
 failure
In-Reply-To: <94687a02-6072-03f0-7438-b0ce37852160@mind.be>
References: <20171001180414.12072-1-ps.report@gmx.net>
 <94687a02-6072-03f0-7438-b0ce37852160@mind.be>
Message-ID: <20171011111425.0b687cbb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, 6 Oct 2017 20:56:18 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Peter,
> 
> On 01-10-17 20:04, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   find_event_devices.c: In function 'find_event_devices':
> > find_event_devices.c:60:14: error: 'PATH_MAX' undeclared (first use in this function)
> >    char fname[PATH_MAX];
> >               ^~~~~~~~
> > 
> > [1] http://autobuild.buildroot.net/results/607/607bb29231f80a138e1b5423bc01c89e36efe78c/
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...0001-Fix-PATH_MAX-related-compile-failure.patch | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 package/evemu/0001-Fix-PATH_MAX-related-compile-failure.patch
> > 
> > diff --git a/package/evemu/0001-Fix-PATH_MAX-related-compile-failure.patch b/package/evemu/0001-Fix-PATH_MAX-related-compile-failure.patch
> > new file mode 100644
> > index 0000000000..4f4f795e07
> > --- /dev/null
> > +++ b/package/evemu/0001-Fix-PATH_MAX-related-compile-failure.patch
> > @@ -0,0 +1,35 @@
> > +From 8164f4e7707012fcfce0cd178cc326e8af8ce8bc Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Sun, 1 Oct 2017 19:54:53 +0200
> > +Subject: [PATCH] Fix PATH_MAX related compile failure.  
> 
>  A better commit message would be "Include limits.h for PATH_MAX"

O.k, fixed...

> 
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Fixes:
> > +
> > +  find_event_devices.c: In function ?find_event_devices?:
> > +  find_event_devices.c:60:14: error: ?PATH_MAX? undeclared (first use in this function)
> > +     char fname[PATH_MAX];
> > +                ^~~~~~~~  
> 
>  And also add:
> 
> when building with musl.

O.k, done...

> 
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + tools/find_event_devices.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/tools/find_event_devices.c b/tools/find_event_devices.c
> > +index 2a43d54..e5dbcd2 100644
> > +--- a/tools/find_event_devices.c
> > ++++ b/tools/find_event_devices.c
> > +@@ -24,6 +24,7 @@
> > + 
> > + #define _GNU_SOURCE
> > + #include <linux/input.h>
> > ++#include <linux/limits.h>  
> 
>  The proper place (according to POSIX) is limits.h, not linux/limits.h.

O.k, changed...updated patch will follow...
> 
>  Also, did you send the patch upstream?

Not yet, but will do...

Regards,
Peter

> 
>  Regards,
>  Arnout
> 
> > + #include <dirent.h>
> > + #include <string.h>
> > + #include <stdio.h>
> > +-- 
> > +2.14.1
> > +
> >   
> 
