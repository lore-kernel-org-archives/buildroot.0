From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 23:31:29 +0100
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: really fix build on
 Arch Linux x86_64
In-Reply-To: <20191117184114.1917-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 17 Nov 2019 19:41:14 +0100")
References: <20191117184114.1917-1-arnout@mind.be>
Message-ID: <878so7zgou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > On x86_64, we use the host compiler instead of the target compiler to
 > build kvm-unit-tests, because it is built with -m32 and our target
 > compiler doesn't support that.

 > However, the compiler on Arch Linux is broken: it *always* builds with
 > -fstack-protector, even when -ffreestanding is passed. However, when
 > -fnostdlib is passed at link time (which is normally the case when
 > building with -ffreestanding), it is not linked with the stack-protector
 > library. This leads to a link time error:

 > /usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
 > .../x86/realmode.c:104: undefined reference to `__stack_chk_fail'

 > Since the entire package is built with -ffreestanding, it doesn't
 > support stack-protector at all. Therefore, simply pass
 > -fno-stack-protector explicitly on x86_64 to work around the bug in Arch
 > Linux.

 > Commit c0ffd16e4 tried to do this, but got the condition wrong:
 > -fno-stack-protector was passed in all cases *except* for x86_64. This
 > commit fixes that, by inverting the condition and moving the
 > --cross-prefix part to the else branch.

 > Fixes: (no new autobuild failures yet)

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
