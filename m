From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  6 Mar 2016 15:50:03 +0100
Subject: [Buildroot] [PATCH v2] package/czmq: fix static linking
Message-ID: <1457275803-20224-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, building czmq statically fails for some architectures with undefined
references to the math library:
  /usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libstdc++.a(compatibility-ldbl.o): In function `std::tr1::hash<long double>::operator()(long double) const':
  compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c): undefined reference to `frexpl'

It turns out that this is actually a problem with libstdc++. Depending on the
arch, some functions will be in compatibility-ldbl.o. If you use any of these
functions, that file will be linked in. And when that file is linked in, all
the _other_ functions, which you actually don't use, are also linked in. And
one of these functions is the template function hash<long double>::operator(),
which uses frexpl.

Requiring czmq to link with -lm is a bit weird, given that neither itself,
nor any of its dependencies really need it...

So ideally it should be fixed in libstdc++ itself. However, as upstream
accepted a patch to link with -lm, we use this patch to fix static linking.

Fixes:
http://autobuild.buildroot.net/results/206/2061238affb685db998100a56c6571538d089a5b/
http://autobuild.buildroot.net/results/caf/caf002d213c9dd09df07858c5c199411ca8ddfa3/
http://autobuild.buildroot.net/results/568/568ac92d2f6d0604b9bf354ea9dca0a7cb5341f6/
http://autobuild.buildroot.net/results/945/9452982fc14f579c61b45a1a189db5f89aab3b80/

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---

Changes v2:
 * use patch from upstream instead doing LIBS=-lm

Thanks to Arnout Vandecappelle and Thomas Petazzoni for looking into this complex
issue.

---
 package/czmq/czmq.hash | 1 +
 package/czmq/czmq.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 6398552..20ed7b6 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  e56f8498daf70310b31c42669b2f9b753c5e747eafaff6d4fdac26d72a474b27  czmq-v3.0.2.tar.gz
+sha256  74e003c05ab1391502dff2eaad96a5361b19583cd1ee0ad681c929721c8e1e3a  bcf583633e8b27a9bfbed1e4a717b9373f7446be.patch
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 0060c89..2b73b61 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -6,6 +6,7 @@
 
 CZMQ_VERSION = v3.0.2
 CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
+CZMQ_PATCH = https://github.com/zeromq/czmq/commit/bcf583633e8b27a9bfbed1e4a717b9373f7446be.patch
 
 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
-- 
2.7.2
