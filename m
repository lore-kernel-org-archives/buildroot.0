From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 May 2012 00:36:18 +0200
Subject: [Buildroot] [PATCH] Added the empty package
In-Reply-To: <1334049334-9276-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 10 Apr 2012 10:15:34 +0100")
References: <1334049334-9276-1-git-send-email-spdawson@gmail.com>
Message-ID: <878vh6b6hp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

I was about to commit this, but noticed a few errors. Care to fix and
resubmit?

 spdawson> new file mode 100644
 spdawson> index 0000000..d15a18f
 spdawson> --- /dev/null
 spdawson> +++ b/package/empty/empty.mk
 spdawson> @@ -0,1 +1,18 @@

I don't know where this first 0,1 comes from, but git am andn patch very
much dislikes it. I had to change it to to 0,0 to get the patch to
apply.


 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# empty
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +EMPTY_VERSION = 0.6.18b
 spdawson> +EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 spdawson> +EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 spdawson> +
 spdawson> +define EMPTY_BUILD_CMDS
 spdawson> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all

variables passed in the environment do not override settings in the
Makefile (unless ?= is used), so it ends up using my host compiler:

make[1]: Entering directory `/home/peko/source/buildroot/output/build/empty-0.6.18b'
gcc  -pipe -Os  -Wall -lutil -o empty empty.c
empty.c: In function ?pidbyppid?:
empty.c:689:9: warning: array subscript is above array bounds [-Warray-bounds]
make[1]: Leaving directory `/home/peko/source/buildroot/output/build/empty-0.6.18b'

I suggest you add TARGET_CONFIGURE_OPTS as a make argument instead.

 spdawson> +endef
 spdawson> +
 spdawson> +define EMPTY_INSTALL_TARGET_CMDS
 spdawson> +	$(INSTALL) -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty

We normally add explicit -m 0755 for installation of binaries.

-- 
Bye, Peter Korsgaard
