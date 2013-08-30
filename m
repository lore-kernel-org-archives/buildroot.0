From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Aug 2013 14:11:09 +0200
Subject: [Buildroot] [PATCH] strongswan: fix build failure when host ==
	target architecture
In-Reply-To: <1377860918-15176-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 30 Aug 2013 13:08:38 +0200")
References: <1377860918-15176-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li3je5uq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The strongswan configure.in uses the AC_LIB_PREFIX macro, which adds
 Thomas> --with-lib-prefix and --without-lib-prefix options, and which, by
 Thomas> default assumes that adding ${prefix}/lib to LDFLAGS and
 Thomas> ${prefix}/include to CPPFLAGS is a good idea. Obviously, when
 Thomas> cross-compiling, it is definitely not a good idea.

 Thomas> In the specific case of strongswan, the result is that when testing if
 Thomas> the backtrace() function was available, the small C program was being
 Thomas> built and linked with -L/usr/lib. So when the host architecture and
 Thomas> target architecture are identical, it may find the backtrace()
 Thomas> function in the host C library, without looking at the target C
 Thomas> library:

 Thomas> configure:16457: /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/usr/lib conftest.c  >&5
 Thomas> /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: warning: libc.so.0, needed by /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/lib/../lib64/libgcc_s.so, may conflict with libc.so.6

 Thomas> Passing --without-lib-prefix prevents this default behavior from
 Thomas> happening, and no stupid value is added to CPPFLAGS or LDFLAGS.

Committed, thanks.

-- 
Bye, Peter Korsgaard
