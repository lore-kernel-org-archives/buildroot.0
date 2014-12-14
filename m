From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 20:42:32 +0100
Subject: [Buildroot] [PATCH v2 2/3] iprutils: Don't include host headers
In-Reply-To: <1418427034-13080-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 13 Dec 2014 00:30:33 +0100")
References: <1418427034-13080-1-git-send-email-romain.naour@openwide.fr>
 <1418427034-13080-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <878uianhlj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Use ncurses5-config to find ncurses headers.
 > Fixes:
 > ERROR: unsafe header/library path used in cross-compilation: '/usr/include/ncurses'

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > v2: use ncurses5-config to find ncurses headers
 >     instead of overwriting INCLUDEDIR

 >  ...n-t-include-host-headers-when-cross-compi.patch | 26 ++++++++++++++++++++++
 >  1 file changed, 26 insertions(+)
 >  create mode 100644 package/iprutils/0004-Don-t-include-host-headers-when-cross-compi.patch

 > diff --git a/package/iprutils/0004-Don-t-include-host-headers-when-cross-compi.patch b/package/iprutils/0004-Don-t-include-host-headers-when-cross-compi.patch
 > new file mode 100644
 > index 0000000..bca5ec0
 > --- /dev/null
 > +++ b/package/iprutils/0004-Don-t-include-host-headers-when-cross-compi.patch
 > @@ -0,0 +1,26 @@
 > +From 0c42685f45b9f01944a64e36cc6aee8192b622c2 Mon Sep 17 00:00:00 2001
 > +From: Romain Naour <romain.naour@openwide.fr>
 > +Date: Sat, 13 Dec 2014 00:14:19 +0100
 > +Subject: [PATCH 1/1] iprutils: Don't include host headers when cross-compiling
 > +
 > +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > +---
 > + Makefile | 2 +-
 > + 1 file changed, 1 insertion(+), 1 deletion(-)
 > +
 > +diff --git a/Makefile b/Makefile
 > +index 18cea94..a4e702a 100644
 > +--- a/Makefile
 > ++++ b/Makefile
 > +@@ -4,7 +4,7 @@
 > + # materials are made available under the terms of the
 > + # Common Public License v1.0 which accompanies this distribution.
 > + 
 > +-INCLUDEDIR = -I. -I/usr/include/ncurses
 > ++INCLUDEDIR = -I. `ncurses5-config --cflags`

Thanks, but this doesn't work in the context of Buildroot. We want to
use $(STAGING_DIR)/usr/bin/ncurses5-config, but that isn't in the PATH
(and shouldn't be as it may contain binaries for the target).

I know Thomas wanted you to do this as an upstreamable patch, but it
would require either introducing a way of overriding what ncurses-config
script to run or the output of the command.

In the mean time I've checked in something like your v1, E.G. simply
override INCLUDEDIR on the make cmdline.

-- 
Bye, Peter Korsgaard
