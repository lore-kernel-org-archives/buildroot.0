From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 4 Jan 2010 20:11:23 +0000 (UTC)
Subject: [Buildroot] at91sam9g20dfc_defconfig doesn't build
References: <hhtfiv$rdm$1@ger.gmane.org>
Message-ID: <hhti1b$5hm$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-04, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> Building from git HEAD fails using at91sam9g20dfc_defconfig. It
> looks like libgcc is using hardware floating point when it
> should be using soft floating point.

Fixed that (I think) by setting BR2_SOFT_FLOAT=y.

Now it gets a further before it fails:

   [...]
   make[1]: Entering directory `/home/nextgen/buildroot/buildroot/output/build/at-3.1.10'
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc -Os -pipe -O2  -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -I/home/nextgen/buildroot/buildroot/output/staging/include --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -isysroot /home/nextgen/buildroot/buildroot/output/staging -mabi=apcs-gnu -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -O2 -g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\" -DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\" -DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall at.c
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc -Os -pipe -O2  -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -I/home/nextgen/buildroot/buildroot/output/staging/include --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -isysroot /home/nextgen/buildroot/buildroot/output/staging -mabi=apcs-gnu -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -O2 -g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\" -DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\" -DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall panic.c
   panic.c:49: warning: 'svnid' defined but not used
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc -Os -pipe -O2  -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -I/home/nextgen/buildroot/buildroot/output/staging/include --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -isysroot /home/nextgen/buildroot/buildroot/output/staging -mabi=apcs-gnu -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -O2 -g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\" -DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\" -DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall perm.c
   perm.c:59: warning: 'svnid' defined but not used
   bison -y -d parsetime.y
   at.c: In function 'parsetimespec':
   at.c:717: warning: passing argument 1 of 'localtime' makes pointer from integer without a cast
   at.c: At top level:
   at.c:111: warning: 'svnid' defined but not used
   at.c:711: warning: 'parsetimespec' defined but not used
   bison -y -d parsetime.y
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc -Os -pipe -O2  -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -I/home/nextgen/buildroot/buildroot/output/staging/include --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -isysroot /home/nextgen/buildroot/buildroot/output/staging -mabi=apcs-gnu -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -O2 -g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\" -DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\" -DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall atd.c
   /home/nextgen/buildroot/buildroot/output/staging/usr/bin/arm-linux-uclibc-gcc -Os -pipe -O2  -I/home/nextgen/buildroot/buildroot/output/staging/usr/include -I/home/nextgen/buildroot/buildroot/output/staging/include --sysroot=/home/nextgen/buildroot/buildroot/output/staging/ -isysroot /home/nextgen/buildroot/buildroot/output/staging -mabi=apcs-gnu -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -O2 -g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\" -DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"at\" -DDAEMON_GROUPNAME=\"at\" -DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall daemon.c
   atd.c:498:2: error: #error "No mail command specified."
   make[1]: *** [atd.o] Error 1
   make[1]: *** Waiting for unfinished jobs....
   daemon.c:51: warning: 'svnid' defined but not used
   make[1]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/at-3.1.10'
   make: *** [/home/nextgen/buildroot/buildroot/output/build/at-3.1.10/at] Error 2

I'll probably just de-select the "at" package and try again.

Are there periodically checks to make sure the default configs
for the "supported" targets build successfully?

I wouldn't think it would take more than a dozen or two lines
of bash code to do so...

-- 
Grant Edwards                   grante             Yow! I'm imagining a surfer
                                  at               van filled with soy sauce!
                               visi.com            
