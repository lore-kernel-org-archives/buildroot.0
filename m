From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Oct 2011 00:00:56 +0200
Subject: [Buildroot] [PATCH 1/9] external toolchain: slightly optimize
	the copy of the toolchain sysroot
In-Reply-To: <98f060c40fdcc7c9d5464838a21d2ee7bc44971a.1318182187.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Oct 2011 19:44:24 +0200")
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <98f060c40fdcc7c9d5464838a21d2ee7bc44971a.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ehylesfb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> @@ -89,7 +92,7 @@ copy_toolchain_sysroot = \
 Thomas>  	ARCH_SUBDIR="$(strip $3)"; \
 Thomas>  	for i in etc lib sbin usr ; do \
 Thomas>  		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 Thomas> -			cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 Thomas> +			rsync -au --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \

FYI, this breaks on readonly source directories unless you have the new
rsync 3.0.9, which most people don't. I haven't figured out a good fix
for older rsync versions yet.


-- 
Bye, Peter Korsgaard
