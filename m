From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2021 09:23:15 +0000
Subject: [Buildroot] [Bug 13751] New: libopenssl (static): huge drop in
 performance in newer versions of buildroot
Message-ID: <bug-13751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13751

            Bug ID: 13751
           Summary: libopenssl (static): huge drop in performance in newer
                    versions of buildroot
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: maksis33 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I've done some benchmarking with different TLS 1.3 ciphers with an Intel
Celeron N3150 CPU that has support for the AES-NI instruction set. I used
static builds of AirDC++ Web Client (http://airdcpp-web.github.io) that were
built with different versions of buildroot. Target architecture is x86_64
(nocona). Transfer speeds are limited by the CPU (one core is maxed out).


Encrypted download speeds (Buildroot 2021.02.1):

TLS_AES_128_GCM_SHA256: 27 MB/s
TLS_AES_256_GCM_SHA384: 24 MB/s
TLS_CHACHA20_POLY1305_SHA256: 41 MB/s


Encrypted download speeds (Buildroot 2019.02):

TLS_AES_128_GCM_SHA256: 62 MB/s
TLS_AES_256_GCM_SHA384: 59 MB/s
TLS_CHACHA20_POLY1305_SHA256: 54 MB/s


Note that those are actual network file transfers with additional overhead, so
the plain decrypt speed difference should be much bigger than that ("openssl
speed -evp aes-128-cbc" is about 5x faster than "openssl speed aes-128-cbc" on
the same system).

I'd assume that the issue has something to do with
http://lists.busybox.net/pipermail/buildroot/2019-October/263030.html as the
OpenSSL target arch is "gcc no-asm" in Buildroot 2021.02.1 while 2019.02
targets "linux-x86_64" and also has various *_ASM flags present in the
Makefile. I also confirmed with objdump that the binary built with 2021.02.1 is
missing all references to aesenc/aesdec/other AES-NI instructions while those
instructions are present in the binary built with 2019.02.

I read
https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491
and https://github.com/openssl/openssl/issues/9839 but I don't fully understand
why the target architecture was changed. I'd say that ASM support is a must for
applications similar to AirDC++.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
