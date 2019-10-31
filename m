From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 09:18:07 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: fix build without ssp on x86_64
In-Reply-To: <75579c3d-b696-5152-a4bc-ac65540f6ca0@mind.be> (Arnout
 Vandecappelle's message of "Sat, 26 Oct 2019 10:33:09 +0200")
References: <20190525222209.14372-1-fontaine.fabrice@gmail.com>
 <75579c3d-b696-5152-a4bc-ac65540f6ca0@mind.be>
Message-ID: <878sp1z5ts.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 26/05/2019 00:22, Fabrice Fontaine wrote:
 >> Makefile tries to detect stack-protector which will result in build
 >> failure on x86_64 if ssp is not available on host compiler so disable
 >> stack protector through EXTRA_CFLAGS
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  After more testing by Matt, applied to master with an updated commit message:

 >     package/kvm-unit-tests: fix build on Arch Linux x86_64

 >     On x86_64, we use the host compiler instead of the target compiler to
 >     build kvm-unit-tests, because it is built with -m32 and our target
 >     compiler doesn't support that.

 >     However, the compiler on Arch Linux is broken: it *always* builds with
 >     -fstack-protector, even when -ffreestanding is passed. However, when
 >     -fnostdlib is passed at link time (which is normally the case when
 >     building with -ffreestanding), it is not linked with the stack-protector
 >     library. This leads to a link time error:

 >     /usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
 >     .../x86/realmode.c:104: undefined reference to `__stack_chk_fail'

 >     Since the entire package is built with -ffreestanding, it doesn't
 >     support stack-protector at all. Therefore, simply pass
 >     -fno-stack-protector explicitly on x86_64 to work around the bug in Arch
 >     Linux.

 >     Bug reported upstream: https://bugs.archlinux.org/task/64270

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
