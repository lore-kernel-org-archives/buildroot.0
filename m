From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jun 2019 23:01:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/netsurf: change how
 CFLAGS/LDFLAGS are passed
In-Reply-To: <20190509202808.6741-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 9 May 2019 22:28:07 +0200")
References: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
 <20190509202808.6741-2-thomas.petazzoni@bootlin.com>
Message-ID: <87ftonycez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 6da049f8ae61b956d135526722ce58fc2f67626a ("package/netsurf:
 > fix build"), the CC variable passed to netsurf's build system was
 > extended to pass some special -I and -L options needed for netsurf to
 > find its own headers/libraries.

 > Unfortunately, on some systems (including mine), it breaks the build,
 > due to:

 >   toolpath_ := $(shell /bin/which $(CC__))

 > when $(CC__) contains some -I/-L options, they are considered to be
 > options "to which", which causes the funny:

 > /usr/bin/make install --directory=libnslog HOST=arm-buildroot-linux-uclibcgnueabi PREFIX=/home/thomas/projets/outputs/shared-netsurf/build/netsurf-3.8/tmpusr Q=@ WARNFLAGS='-Wall -W -Wno-error' DESTDIR=
 > make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
 > /bin/which: invalid option -- 'I'
 > /bin/which: invalid option -- '/'
 > /bin/which: invalid option -- 'h'
 > /bin/which: invalid option -- 'o'
 > /bin/which: invalid option -- 'm'
 > /bin/which: invalid option -- 'e'
 > /bin/which: invalid option -- '/'
 > /bin/which: invalid option -- 't'
 > /bin/which: invalid option -- 'h'
 > /bin/which: invalid option -- 'o'
 > /bin/which: invalid option -- 'm'
 > /bin/which: invalid option -- 's'
 > /bin/which: invalid option -- '/'
 > [...]
 > /bin/which: invalid option -- 'l'
 > /bin/which: invalid option -- 'b'
 > /bin/which: --read-alias, -i: Warning: stdin is a tty.

 > and the build simply hangs.

 > We cannot pass CFLAGS/LDFLAGS as make options, as they would override
 > the CFLAGS definitions in netsurf Makefiles. However, those Makefiles
 > use the construct:

 > CFLAGS := $(CFLAGS) -more-flags

 > so by passing CFLAGS and LDFLAGS through the make environment, which
 > can achieve our goal.

 > It is worth mentioning that it remains very fragile, because
 > CFLAGS/LDFLAGS are used both for building target objects but also some
 > host tools. The netsurf build system is really not good.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
