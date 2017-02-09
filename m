From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:53 +0100
Subject: [Buildroot] [PATCH 0/6] Deal with GCC PR libstdc++/64735
Message-ID: <20170209174759.15819-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libstdc++ does not support exception propagation without lock-free atomic int.
The issue has been filed as GCC PR libstdc++/64735 [1] and fixed in GCC trunk
r244051 [2] and will be available in GCC 7. Patch #1 adds an option for
toolchains affected by this bug.

Patch #2, #3, and #4 marks the architectures NIOS II, ARMv4, ARMv5 and SPARCv8
as affected by this bug.

At least package mpd version 0.20 does not build for those architectures as it uses
`exception_ptr`. The package was bumped within the current release cycle. Mark the
package as affected in patch #5.

Patch #6 adds a choice between version 0.20 and 0.19 to mpd to still allow
building the package for the above architectures. Version 0.19 does not use the
exception C++11 feature and is therefore unaffected by GCC PR libstdc++/64735.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
[2] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=244051

J?rg Krause (6):
  toolchain: add option for toolchains affected by GCC PR
    libstdc++/64735
  arch: mark NIOS II as affected by GCC PR libstdc++/64735
  arch/arm: mark ARMv{4,5} as affected by GCC PR libstdc++/64735
  arch/sparc: mark SPARCv8 as affected by GCC PR libstdc++/64735
  package/mpd: affected by GCC PR libstdc++/64735
  package/mpd: add choice between version 0.19 and 0.20

 arch/Config.in                |  1 +
 arch/Config.in.arm            |  2 ++
 arch/Config.in.sparc          |  1 +
 package/mpd/Config.in         | 27 +++++++++++++++++++++++++--
 package/mpd/mpd.mk            |  9 +++++++++
 toolchain/toolchain-common.in |  4 ++++
 6 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.11.1
