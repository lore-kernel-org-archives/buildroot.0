From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 13:30:03 +0200
Subject: [Buildroot] [PATCH 1/1] external toolchain: slightly optimize
	the copy of the toolchain sysroot
In-Reply-To: <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2011 23:36:21 +0200")
References: <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
 <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87iporwgn8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The sysroot of an ARM CodeSourcery toolchain takes about 1.4 GB of
 Thomas> space, but 1.1+ GB of this space consists in locale-related
 Thomas> information which Buildroot doesn't use. By skipping the copy of those
 Thomas> unused files, we save quite a bit of time while importing the
 Thomas> toolchain sysroot.

Looks good, except:

 Thomas> -			cp -a $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \
 Thomas> +			rsync -au --exclude 'usr/lib/locale' $${ARCH_SYSROOT_DIR}/$$i $(STAGING_DIR)/ ; \

We don't currently check for rsync in dependencies.sh - Please add that
as well (same for the local package stuff).

-- 
Bye, Peter Korsgaard
