From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 29 Mar 2019 16:00:27 -0700
Subject: [Buildroot] Problems with package/mtd on host after update
Message-ID: <CAGt4E5s49bpiLA6r+xsNPtGGaxEH8pjs0VPcJOv0fGK7_nCduw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Since the switch from mtd-utils 2.0.2 to mtd-utils 2.1.0, I have
noticed several issues when building mtd-utils for the host. (The idea
of using Buildroot's mtd-utils is to be independent of Linux distros
on the host machine.)

1) It builds without CRYPTO support on the host, because it's using
host/bin/pkg-config to search for OpenSSL. Of course, this won't find
the system installation of OpenSSL, and the OpenSSL package in
Buildroot doesn't support host build. So, there's no OpenSSL on the
host.

2) Because it builds without CRYPTO, mkfs.ubifs bails with an assertion error.

mkfs.ubifs: ubifs-utils/mkfs.ubifs/fscrypt.h:166:
inherit_fscrypt_context: Assertion `0' failed.

The error stems from
http://git.infradead.org/mtd-utils.git/blob/HEAD:/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#l2105

Calls to inherit_fscrypt_context() are unconditional and, since
WITH_CRYPTO is false, inherit_fscrypt_context() calls assert(0).

One can re-build mtd-utils with CPPFLAGS=-DNDEBUG to silence the
assert. However, Buildroot doesn't do this out of the box and,
besides, it would be nicer to build it with crypto enabled. That means
1) would need to be addressed.

3) Once past the crypto assertion, mkfs.ubifs bails again. This time
with "Expected symlink", but without specifying what file it is
objecting to.

The error stems from
http://git.infradead.org/mtd-utils.git/blob/HEAD:/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c#l1535

I tracked the offending file down to dev/console (i.e. a character
device file) that is being included in the root file system. Clearly
!S_ISLNK() seems to narrow a restriction here.

All of these problems are new with mtd-utils 2.1.0. The previous
version was able to process our root file system without issues.

I am assuming that it makes sense to at least report the S_ISLNK()
issue upstream, as well.

Regards,
-Markus
