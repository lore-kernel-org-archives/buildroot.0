From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jul 2009 09:20:28 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <20090720210306.GH19257@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 20 Jul 2009 23\:03\:06 +0200")
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<1244029145-11832-2-git-send-email-daniel@caiaq.de>
	<878wikg3sp.fsf@macbook.be.48ers.dk>
	<20090720112525.GV13236@buzzloop.caiaq.de>
	<87ljmjdrdt.fsf@macbook.be.48ers.dk>
	<20090720210306.GH19257@buzzloop.caiaq.de>
Message-ID: <878wiiec3n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> On Mon, Jul 20, 2009 at 10:35:42PM +0200, Peter Korsgaard wrote:
 Daniel> Erm, yes. Sorry. I removed them locally but forgot to add that to the
 Daniel> patch. They're not needed anymore. Could you do that when commiting?
 >> 
 >> Sure - Both patches?

 Daniel> Yes.

OK, thanks. It still doesn't build here.

The first problem is that common.mk unconditionally sets
FILE_OFFSET_BITS=64, which causes the uclibc headers to error out if
you compiled without largefile support (the default). The second is:

/tmp/br/mipsel/build_mipsel/staging_dir/usr/bin/mipsel-linux-uclibcgnueabi-gcc -I../include -I../ubi-utils/include -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o /tmp/br/mipsel/build_mipsel/mtd-utils-e783e75e09b4a0a519665afd7bdeaf2985e7a09c/mkfs.ubifs/lpt.o lpt.c -g -Wp,-MD,/tmp/br/mipsel/build_mipsel/mtd-utils-e783e75e09b4a0a519665afd7bdeaf2985e7a09c/mkfs.ubifs/.lpt.c.dep
In file included from lpt.c:23:
mkfs.ubifs.h:48:23: error: uuid/uuid.h: No such file or directory

Seems like it needs libuuid from e2fsprogs. We should probably make
that available without the rest of e2fs, and make the ubifs stuff
select it.

-- 
Bye, Peter Korsgaard
