From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Apr 2010 15:37:14 +0200
Subject: [Buildroot] [git commit master] uClibc: 0.9.31 dnslookup use after
	free fix
Message-ID: <20100406133829.299238D9B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb1cd08a9be7b085076c14e3fd4507b33c786cc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.31-dnslookup-use-after-free.patch   |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-dnslookup-use-after-free.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-dnslookup-use-after-free.patch b/toolchain/uClibc/uClibc-0.9.31-dnslookup-use-after-free.patch
new file mode 100644
index 0000000..9956d59
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-dnslookup-use-after-free.patch
@@ -0,0 +1,36 @@
+From eb1d8c8289f466ba3ad10b9a88ab2e426b8a9dc7 Mon Sep 17 00:00:00 2001
+From: Gabor Juhos <juhosg@openwrt.org>
+Date: Tue, 6 Apr 2010 09:55:19 +0200
+Subject: [PATCH] Fix use-after-free bug in __dns_lookup
+
+If the type of the first answer does not match with the requested type,
+then the dotted name was freed. If there are no further answers in
+the DNS reply, this pointer was used later on in the same function.
+Additionally it is passed to the caller, and caused strange
+behaviour.
+
+Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ libc/inet/resolv.c |    4 +---
+ 1 files changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/libc/inet/resolv.c b/libc/inet/resolv.c
+index 056539f..9459199 100644
+--- a/libc/inet/resolv.c
++++ b/libc/inet/resolv.c
+@@ -1517,10 +1517,8 @@ int attribute_hidden __dns_lookup(const char *name,
+ 				memcpy(a, &ma, sizeof(ma));
+ 				if (a->atype != T_SIG && (NULL == a->buf || (type != T_A && type != T_AAAA)))
+ 					break;
+-				if (a->atype != type) {
+-					free(a->dotted);
++				if (a->atype != type)
+ 					continue;
+-				}
+ 				a->add_count = h.ancount - j - 1;
+ 				if ((a->rdlength + sizeof(struct in_addr*)) * a->add_count > a->buflen)
+ 					break;
+-- 
+1.7.0
+
-- 
1.6.3.3
