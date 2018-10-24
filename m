From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:29:53 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] core: detect and reject
 build paths which contain an '@'
Message-ID: <20181024122810.C5E778895F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fcf3e129512fa1efba405b28750f40e5d03ed81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

gcc does not build when the srcdir path contains a '@', because that
path is then substitued in a texi file as argument to an @include
directive. But then, the '@' in the path will start a command evaluation
of its own, thus breaking the build. For example, with a $(O) path set
to /home/ymorin/dev/buildroot/O/to at ti :

    perl ../../gcc/../contrib/texi2pod.pl ../../gcc/doc/invoke.texi > gcc.pod
    ../../gcc/doc/invoke.texi:1678: unknown command `ti'
    ../../gcc/doc/invoke.texi:1678: @include: could not find /home/ymorin/dev/buildroot/O/to/build/host-gcc-initial-7.3.0/build/gcc/../../gcc/../libiberty/at-file.texi

[Peter: use findstring instead of subst/compare]
Reported-by: c32 on IRC
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 7007dc2bc99ad191c418c468707cdc3980273cda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 36614a8c35..83f64f491d 100644
--- a/Makefile
+++ b/Makefile
@@ -60,6 +60,11 @@ override O := $(patsubst %/,%,$(patsubst %.,%,$(O)))
 # avoid empty CANONICAL_O in case on non-existing entry.
 CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
 
+# gcc fails to build when the srcdir contains a '@'
+ifneq ($(findstring @,$(CANONICAL_O)),)
+$(error The build directory can not contain a '@')
+endif
+
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
