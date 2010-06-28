From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jun 2010 13:09:07 +0200
Subject: [Buildroot] [PATCH 02/10] ext-toolchain: Fix ARCH_SYSROOT
	detection
In-Reply-To: <bf1bcc24c829475c10cf9304df7f3515f21d937f.1276516273.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 14 Jun 2010 13:54:13 +0200")
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<bf1bcc24c829475c10cf9304df7f3515f21d937f.1276516273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bpav2z3g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> For the detection of the ARCH_SYSROOT_DIR (which contains the C
 Thomas> library variant specific to the compiler flags), we used to
 Thomas> pass only the -march argument instead of the full
 Thomas> TARGET_CFLAGS. This was done because TARGET_CFLAGS contains
 Thomas> --sysroot, and we don't want to tell here the compiler which
 Thomas> sysroot to use, because we're specifically asking the compiler
 Thomas> where the *normal* arch sysroot directory is.

 Thomas> Unfortunately, there are some multilib variants that aren't
 Thomas> decided only based on -march, but also on -msoft-float or other
 Thomas> compiler flags. Therefore, we take the opposite approach: pass
 Thomas> the full TARGET_CFLAGS, from which we have stripped the
 Thomas> --sysroot option.

[snip]

 Thomas> +TARGET_CFLAGS_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CFLAGS))

Hmm, in package/Makefile.in I see:

else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
TARGET_CFLAGS+=--sysroot $(STAGING_DIR)/
TARGET_CXXFLAGS=$(TARGET_CFLAGS)

E.G. no = between --sysroot and the value.

-- 
Bye, Peter Korsgaard
