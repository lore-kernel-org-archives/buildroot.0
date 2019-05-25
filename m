From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 22:52:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: fix build
 without ssp
In-Reply-To: <20190524190243.31508-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 24 May 2019 21:02:43 +0200")
References: <20190524190243.31508-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftp2ntoh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Makefile tries to detect stack-protector which will result in build
 > failures if ssp is not available so disable stack protector is SSP is
 > not available through EXTRA_CFLAGS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/kvm-unit-tests/kvm-unit-tests.mk | 9 +++++++--
 >  1 file changed, 7 insertions(+), 2 deletions(-)

 > diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
 > index 92d67fb34b..ac1bb1f7aa 100644
 > --- a/package/kvm-unit-tests/kvm-unit-tests.mk
 > +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
 > @@ -39,16 +39,21 @@ ifneq ($(BR2_x86_64),y)
 >  KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
 >  endif
 
 > +# Don't force -fstack-protector when SSP is not available in toolchain
 > +KVM_UNIT_TESTS_MAKE_OPTS += \
 > +	EXTRA_CFLAGS=$(if $(BR2_TOOLCHAIN_HAS_SSP),,-fno-stack-protector)

Hmm, we have BR2_SSP_* options to configure the stack protection setting
to use nowadays, but this cannot work as:

- The autobuilder reference .config has BR2_TOOLCHAIN_HAS_SSP=y
- kvm-unit-tests uses the host compiler on x86-64 (where we don't know
- if ssp support is available) because of:

commit e1b344070c607f9a3f0a7004650f00c9e6e83c7b
Author: Cyril Bur <cyrilbur@gmail.com>
Date:   Wed Oct 26 14:19:15 2016 +1100

    kvm-unit-tests: Fix x86_64 to use host compiler

    kvm-unit-tests requires a multilib compiler for x86_64 as it compiles
    32bit boot code.

    This patch uses the BR2_HOSTARCH_NEEDS_IA32_COMPILER option to enforce
    this and avoids using TARGET_CROSS for x86_64 targets and uses the host
    32bit (and 64bit) capable compiler.

    Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
    [Thomas: reword comment in .mk file.]
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


This is all pretty broken. I guess the best solution we have for x86-64
is to unconditionally pass -fno-stack-protector.

-- 
Bye, Peter Korsgaard
