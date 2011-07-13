From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 20:42:05 +0200
Subject: [Buildroot] [PATCH 2/2] source: print messages when all sources
	downloaded
In-Reply-To: <201107132011.51230.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Wed, 13 Jul 2011 20:11:50 +0200")
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1310512066-11450-3-git-send-email-yann.morin.1998@anciens.enib.fr>
 <87r55ufzyx.fsf@macbook.be.48ers.dk>
 <201107132011.51230.yann.morin.1998@anciens.enib.fr>
Message-ID: <87fwmadnuq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

Hi,

 Yann> Indeed. We could print the message only if DL_MODE==DOWNLOAD. Would that
 Yann> be OK with you?

We could, but I'm not really sure if we should. We don't do anything
like that for any of the other make targets.

 Yann> Incidentally, external-deps and source-check will not be really complete
 Yann> when crostool-NG is the backend, as there is no way to ask such a thing
 Yann> to crosstool-NG.

Ok, also not by playing games with a replacement wget/curl/whatever that
just prints basename $1 or similar?

 Yann> Note that source-check is currently borked due to some unconfigured
 Yann> defconfig files for bootloaders and kernel. Eg. for barebox:
 Yann>   $ make -C ../br.upstream O=$(pwd) source-check
 Yann>   [--SNIP-]
 Yann>   make O=/home/ymorin/dev/buildroot/O _source-check
 Yann>   make[1]: Entering directory `/home/ymorin/dev/buildroot/br.upstream'
 Yann>   boot/barebox/barebox.mk:60: *** No Barebox defconfig file. Check your
 Yann>   BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting.  Stop.
 Yann>   make[1]: Leaving directory `/home/ymorin/dev/buildroot/br.upstream'
 Yann>   make: *** [source-check] Error 2
 Yann>   make: Leaving directory `/home/ymorin/dev/buildroot/br.upstream'

Yes, we currently require a buildable .config for make
source/source-check/external-deps, which I don't really think is big
issue for normal use cases. I do hit it when I update the
sources.buildroot.net mirror using make allyesconfig && make source, so
we could try to get rid of that restriction if it doesn't make the
linux/barebox/uboot Makefiles too ugly.

-- 
Bye, Peter Korsgaard
