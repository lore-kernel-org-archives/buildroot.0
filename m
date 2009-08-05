From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Aug 2009 21:47:07 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <1248888083-11767-2-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Wed\, 29 Jul 2009 19\:21\:23 +0200")
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<1248888083-11767-2-git-send-email-daniel@caiaq.de>
Message-ID: <87tz0mm4as.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> - Update git version for mtd-utils.git.
 Daniel> - In this new version, a new tool named 'ubiformat' exists which is
 Daniel>   exported by this patch.
 Daniel> - The tool ubimirror does not exist anymore, remove support for it.
 Daniel> - remove two patches that do no longer apply
 Daniel> - add a patch that removes the unconditional setting of
 Daniel>   -D_FILE_OFFSET_BITS=64
 Daniel> - introduce EXTRA_CPPFLAGS that is set to -D_FILE_OFFSET_BITS=64 in case
 Daniel>   BR2_LARGEFILE is set
 Daniel> - select BR2_PACKAGE_LIBUUID for BR2_PACKAGE_MTD

Thanks, but it still doesn't build with a default (E.G. non-largefile)
config:

mkfs.ubifs.c: In function 'write_leb':
mkfs.ubifs.c:768: error: 'off64_t' undeclared (first use in this function)
mkfs.ubifs.c:768: error: (Each undeclared identifier is reported only once
mkfs.ubifs.c:768: error: for each function it appears in.)
mkfs.ubifs.c:768: error: expected ';' before 'pos'
mkfs.ubifs.c:776: warning: implicit declaration of function 'lseek64'
mkfs.ubifs.c:776: error: 'pos' undeclared (first use in this function)
mkfs.ubifs.c: In function 'add_file':
mkfs.ubifs.c:1264: error: 'O_LARGEFILE' undeclared (first use in this
function)

I expect that you just need to make mkfs.ubifs depend on largefile
support in the toolchain if it cannot easily be fixed in the sources.

-- 
Bye, Peter Korsgaard
