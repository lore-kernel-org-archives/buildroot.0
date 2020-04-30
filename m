From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:39:02 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/libid3tag: needs host-gperf
In-Reply-To: <20200415203631.11960-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 15 Apr 2020 22:36:31 +0200")
References: <20200415203631.11960-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv115es9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since switch to debian in commit
 > 210ccaef5784011bc035d0ae13611cb4e76f389f, host-gperf is needed to
 > generate frametype.c because debian/patches/add-m4-directory.patch
 > patches Makefile.am. As a side effect, libid3tag tries to generate
 > frametype.c from frametype.gperf due to following rule:

 > $(srcdir)/frametype.c: $(srcdir)/frametype.gperf Makefile.am
 >         cd $(srcdir) &&  \
 >         gperf -tCcTonD -K id -N id3_frametype_lookup -s -3 -k '*'  \
 >                 frametype.gperf |  \
 >         sed -e 's/\(struct id3_frametype\);/\1/' |  \
 >         sed -e '/\$$''Id: /s/\$$//g' >frametype.c

 > If host-gperf is not available, frametype.c will be empty and build with
 > madplay will fail on:

 > configure:17243: checking for snd_pcm_open in -lasound
 > configure:17268: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/powerpc64-linux-gcc -o conftest -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=1  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lasound  -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib -lasound  -L/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib -lid3tag  >&5
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/8.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib/libid3tag.so: undefined reference to `id3_frametype_lookup'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/15a8c7f6e34b26446179c04383719ea71495403e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Fix commit message

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
