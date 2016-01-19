From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 00:12:30 +0100
Subject: [Buildroot] [PATCH v3] libnspr: remove thumb2 handling
In-Reply-To: <1453243871-22360-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 19 Jan 2016 23:51:11 +0100")
References: <1453243871-22360-1-git-send-email-arnout@mind.be>
Message-ID: <87h9i9upsx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > libnspr currently passes --enable-thumb2 if the CPU has thumb
 > instructions. This option will pass -mthumb to the compiler. However,
 > if an external multilib toolchain is used that has a thumb-specific
 > variant (e.g. Sourcery), it will try to use that one. But we only copy
 > a single variant to the sysroot, so the build will fail with:

 > .../arm-none-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory
 > ...
 > collect2: error: ld returned 1 exit status
 > ../../config/rules.mk:303: recipe for target 'libnspr4.so' failed

 > We can in fact just remove the thumb2 handling. With current libnspr,
 > the thumb and thumb2 options just add -marm and -mthumb. But we already
 > pass that in our toolchain wrapper so it's completely redundant.

 > Note that when nothing is passed, the configure script still tries to
 > autodetect whether thumb2 is available (but doesn't do it correctly,
 > see the error above), but in the end it doesn't use the result for
 > anything. In other words, even if it detects that thumb2 is available,
 > it will _not_ pass -mthumb to the compiler.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Build-tested with various combinations of thumb, thumb2, floating point,
 > and external toolchains. I didn't test with an internal toolchain but
 > what could go wrong there? :-)

 > Also tested with the original build failure which led to the
 > introduction of the --enable-thumb2 handling:
 > http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214

 > Changes v2: added missing build failure output to commit message
 > Changes v3: Remove thumb2 handling completely

Committed, thanks.

-- 
Bye, Peter Korsgaard
