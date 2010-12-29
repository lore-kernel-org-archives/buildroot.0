From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 21:58:35 +0100
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <4D1B9D16.1080902@zacarias.com.ar> (Gustavo Zacarias's message of
	"Wed, 29 Dec 2010 17:41:58 -0300")
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	<1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
	<874o9xldzj.fsf@macbook.be.48ers.dk>
	<4D1B9D16.1080902@zacarias.com.ar>
Message-ID: <87hbdwjnyc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 12/28/10 19:38, Peter Korsgaard wrote:
 >> Seeing this I thought the build would be broken because GCC isn't moved
 >> yet, but I see you do move it later on in this patch, even if it isn't
 >> mentioned in the commit message.

 Gustavo> Comment added.

Thanks.

 >> I find this quite complicated. I would prefer something like:
 >> 
 >> config BR2_PACKAGE_BINUTILS
 >> bool "binutils"
 >> depends on BR2_TOOLCHAIN_BUILDROOT
 >> help
 >> ..
 >> 
 >> config BR2_PACKAGE_BINUTILS_FULLINSTALL
 >> bool "perform full installation"
 >> depends on BR2_PACKAGE_BINUTILS
 >> help
 >> Select this to install all binary utilies and not just libbfd.
 >> 
 >> And then move the MPC/MPFR/GMP selects under
 >> BR2_PACKAGE_GCC_TARGET. Also add selects for BR2_PACKAGE_BINUTILS +
 >> FULLINSTALL.

 Gustavo> Easier to define BR2_PACKAGE_BINUTILS that builds all
 Gustavo> of binutils and only installs libbfd + BR2_PACKAGE_BINUTILS_TARGET to
 Gustavo> install the full version.

Yes, that's what I meant about the _FULLINSTALL option.

 >> You have trailing spaces here and elsewhere.

 Gustavo> Hopefully fixed.

Thanks.

 Gustavo> $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
 Gustavo> -	# gcc >= 4.3.0 have to also build all-target-libgcc
 >> 
 >> Why are you removing those comments? We still support gcc 4.2.x

 Gustavo> Because these are in STAGE1 (DIR1) where it's completely irrelevant /
 Gustavo> doesn't apply and just amounts to misinformation.
 Gustavo> gcc-initial doesn't use nor install headers since the extra gcc build
 Gustavo> stage was added. Same scenario for libgcc.
 Gustavo> They're leftover comments. That's the reason i kept the ones in
 Gustavo> gcc-intermediate.

Ahh ok, thanks.

 >> Why remove this ARCH_IS_64 stuff?

 Gustavo> This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb
 Gustavo> which does a symlink trick to make libstdc++ available. It's
 Gustavo> simpler to just copy libstdc++ (and libgcj/libgcc while at it)
 Gustavo> to the sysroot which is fixed in patch #5 from my series.

Ok, good.

-- 
Bye, Peter Korsgaard
