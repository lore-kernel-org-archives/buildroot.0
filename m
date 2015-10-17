From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Oct 2015 10:52:54 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bypass buildroot
	wrapper
In-Reply-To: <1444856755-2011-2-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 14 Oct 2015 23:05:55 +0200")
References: <20151011120859.7e786a73@free-electrons.com>
 <1444856755-2011-1-git-send-email-arnout@mind.be>
 <1444856755-2011-2-git-send-email-arnout@mind.be>
Message-ID: <871tct27x5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The buildroot internal toolchain now adds a wrapper. When we use a
 > buildroot toolchain as an external toolchain, we want to bypass this
 > wrapper and call the compiler directly, for two reasons:

 > 1. The options added by the wrapper are not necessarily appropriate
 >    when it is reused as an external toolchain. For instance, ccache
 >    may have been enabled while building the toolchain but not when
 >    using it as an external toolchain.

 > 2. Currently, the wrapper expects to reside in .../usr/bin, but when
 >    used as an external toolchain it will be in .../ext-toolchain/bin.
 >    Therefore, the wrapper can't find the real binary and sysroot
 >    anymore.

 > To bypass the wrapper, we check for the existence of *.br_real files in
 > the external toolchain directory. If any such file exists, the wrapper
 > will add the .br_real suffix for all the wrapped files. Note that the
 > wrapper doesn't check if the *.br_real exists for each individual
 > wrapped file, it just assumes that all wrapped files have a
 > corresponding .br_real. This is currently true but that may change in
 > the future of course.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Peter, you requested the check to be in the .mk file rather than in
 > the wrapper. However, since we have only one wrapper for all wrapped
 > files, that means that either all of them or none of them should have
 > the .br_real suffix. Therefore, if we later wrap additional files
 > (e.g. ld), existing external buildroot toolchains will fail again. So
 > to fix that, there should be a check in the wrapper.c file itself. But
 > if we have a check in the wrapper.c, there's no point having a check in
 > the wrapper.mk as well... So Peter, please tell me if I should instead
 > drop the check in the .mk file and add one in the .c file. Note that
 > that can be done as a follow-up so it shouldn't block this patch.

Yeah, that's true. Either that or we need to add more complication to
the .mk file. I'll need to think a bit more about that.

In the mean time - Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
