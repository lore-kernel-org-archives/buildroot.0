Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6999CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC40A822BC;
	Fri, 19 Sep 2025 12:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wi8yd2Z5X4eX; Fri, 19 Sep 2025 12:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F84822F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F84822F3;
	Fri, 19 Sep 2025 12:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B267D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BAA840AF5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3RQ2pThSR2N for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFA440E32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFA440E32
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB4F485FD8; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:48:52 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: f74ebcf5c4bb09c5e208777d30673e4b305ae845
X-Git-Newrev: 349fe10e5bc25c527e63c82325696230a6de8ecf
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.CB4F485FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libselinux: fix
 build issues caused by 3.8.1 bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8533540759710008101=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8533540759710008101==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=349fe10e5bc25c527e63c82325696230a6de8ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Since the bump to version 3.8.1 in commit
1ae3ad4e878e1f4217ba3276ff0c9e584234afa4, libselinux fails to build
with at least

- Musl configurations
- RISC-V 32-bit configurations
- OpenRISC configurations

These build failures are due to additional checks on the size of some
data structures:

matchpathcon.c:270:47: error: '__ino_t' undeclared here (not in a function); did you mean 'ino_t'?
  270 | static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
      |                                               ^~~~~~~
      |                                               ino_t
matchpathcon.c:270:15: error: expression in static assertion is not an integer
  270 | static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
      |               ^~~~~~

These issues have been fixed in follow-up upstream commits, which we
backport.

Fixes:

  https://autobuild.buildroot.net/results/00a1ab30cc6b7af503aa96384ba4c4444c217401/ (musl)
  https://autobuild.buildroot.net/results/c8321be687201937bd5eb48b31dfabac12f4e9ea/ (glibc or1k)
  https://autobuild.buildroot.net/results/7b94f44282582d5994f40a741cc0c38bd68b53bd/ (risc-v 32-bit)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d5aab5289c3a148c23d65d288f5d651e158318c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...hpathcon_filespec_add64-if-defined-__INO_.patch | 84 ++++++++++++++++++++++
 ...ux-be-careful-with-non-portable-LFS-macro.patch | 56 +++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/package/libselinux/0003-Inject-matchpathcon_filespec_add64-if-defined-__INO_.patch b/package/libselinux/0003-Inject-matchpathcon_filespec_add64-if-defined-__INO_.patch
new file mode 100644
index 0000000000..6573cb1673
--- /dev/null
+++ b/package/libselinux/0003-Inject-matchpathcon_filespec_add64-if-defined-__INO_.patch
@@ -0,0 +1,84 @@
+From daecc54878e6768b3e6a2b2a0061d2690a63dea4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=BD=D0=B0=D0=B1?= <nabijaczleweli@nabijaczleweli.xyz>
+Date: Thu, 20 Mar 2025 16:55:17 +0100
+Subject: [PATCH] Inject matchpathcon_filespec_add64() if
+ !defined(__INO_T_MATCHES_INO64_T) instead of using __BITS_PER_LONG < 64 as
+ proxy
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The __INO_T_MATCHES_INO64_T is defined
+if ino_t would be the same size as ino64_t
+if -D_FILE_OFFSET_BITS=64 were not defined.
+
+This is /exactly/ what
+  /* ABI backwards-compatible shim for non-LFS 32-bit systems */
+  #if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && __BITS_PER_LONG < 64
+is trying to get at, but currently fails because x32/RV32 are "LFS"
+with 32-bit longs and 64-bit time_ts natively.
+
+Thus, the
+  static_assert(sizeof(unsigned long) == sizeof(__ino_t), "inode size mismatch");
+assertion fails (__ino_t is the "kernel ino_t" type,
+which generally corresponds to the kernel's ulong, which is u64 on x32).
+
+glibc headers allow us to check the condition we care about directly.
+
+Fixes: commit 9395cc0322 ("Always build for LFS mode on 32-bit archs.")
+Closes: #463
+Closes: Debian#1098481
+Signed-off-by: наб <nabijaczleweli@nabijaczleweli.xyz>
+Cc: Alba Mendez <me@alba.sh>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: 5c3fcbd931b7f9752b5ce29cec3b6813991d61c0
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/selinux/selinux.h | 2 +-
+ src/matchpathcon.c        | 8 ++++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/include/selinux/selinux.h b/include/selinux/selinux.h
+index f3cf5a20..f64896b7 100644
+--- a/include/selinux/selinux.h
++++ b/include/selinux/selinux.h
+@@ -537,7 +537,7 @@ extern int matchpathcon_index(const char *path,
+    with the same inode (e.g. due to multiple hard links).  If so, then
+    use the latter of the two specifications based on their order in the 
+    file contexts configuration.  Return the used specification index. */
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && __BITS_PER_LONG < 64
++#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && !defined(__INO_T_MATCHES_INO64_T)
+ #define matchpathcon_filespec_add matchpathcon_filespec_add64
+ #endif
+ extern int matchpathcon_filespec_add(ino_t ino, int specind, const char *file);
+diff --git a/src/matchpathcon.c b/src/matchpathcon.c
+index 51f0e4ff..a4f65045 100644
+--- a/src/matchpathcon.c
++++ b/src/matchpathcon.c
+@@ -261,7 +261,7 @@ int matchpathcon_filespec_add(ino_t ino, int specind, const char *file)
+ 	return -1;
+ }
+ 
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && __BITS_PER_LONG < 64
++#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && !defined(__INO_T_MATCHES_INO64_T)
+ /* alias defined in the public header but we undefine it here */
+ #undef matchpathcon_filespec_add
+ 
+@@ -280,9 +280,13 @@ int matchpathcon_filespec_add(unsigned long ino, int specind,
+ {
+ 	return matchpathcon_filespec_add64(ino, specind, file);
+ }
++#elif (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) || defined(__INO_T_MATCHES_INO64_T)
++
++static_assert(sizeof(uint64_t) == sizeof(ino_t), "inode size mismatch");
++
+ #else
+ 
+-static_assert(sizeof(unsigned long) == sizeof(ino_t), "inode size mismatch");
++static_assert(sizeof(uint32_t) == sizeof(ino_t), "inode size mismatch");
+ 
+ #endif
+ 
+-- 
+2.51.0
+
diff --git a/package/libselinux/0004-libselinux-be-careful-with-non-portable-LFS-macro.patch b/package/libselinux/0004-libselinux-be-careful-with-non-portable-LFS-macro.patch
new file mode 100644
index 0000000000..9a1d874706
--- /dev/null
+++ b/package/libselinux/0004-libselinux-be-careful-with-non-portable-LFS-macro.patch
@@ -0,0 +1,56 @@
+From bfcdaf2ff36d69a57810470f5405e5f27e51e01c Mon Sep 17 00:00:00 2001
+From: Alyssa Ross <hi@alyssa.is>
+Date: Sat, 26 Apr 2025 17:13:57 +0200
+Subject: [PATCH] libselinux: be careful with non-portable LFS macro
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl does not provide the obsolete LFS64 APIs (like ino64_t) — ino_t
+has always been 64-bit on all platforms there.  That means there's
+also no __INO_T_MATCHES_INO64_T macro, meaning the check would pass
+and reach the static asserts for the shim, which would fail due to
+there being no ino64_t to check the size of.  Fix this by only
+assuming the absense of __INO_T_MATCHES_INO64_t is meaningful when
+another non-portable Glibc macro, __INO64_T_TYPE, is defined.  If both
+are missing, that probably just means there is no ino64_t.
+
+Fixes: 5c3fcbd9 ("Inject matchpathcon_filespec_add64() if !defined(__INO_T_MATCHES_INO64_T) instead of using __BITS_PER_LONG < 64 as proxy")
+Signed-off-by: Alyssa Ross <hi@alyssa.is>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: 21dd00713ae99b13e36c632992cb171c6ec1abce
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/selinux/selinux.h | 2 +-
+ src/matchpathcon.c        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/selinux/selinux.h b/include/selinux/selinux.h
+index f64896b7..b1431e5d 100644
+--- a/include/selinux/selinux.h
++++ b/include/selinux/selinux.h
+@@ -537,7 +537,7 @@ extern int matchpathcon_index(const char *path,
+    with the same inode (e.g. due to multiple hard links).  If so, then
+    use the latter of the two specifications based on their order in the 
+    file contexts configuration.  Return the used specification index. */
+-#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && !defined(__INO_T_MATCHES_INO64_T)
++#if defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64 && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
+ #define matchpathcon_filespec_add matchpathcon_filespec_add64
+ #endif
+ extern int matchpathcon_filespec_add(ino_t ino, int specind, const char *file);
+diff --git a/src/matchpathcon.c b/src/matchpathcon.c
+index a4f65045..240c9fa7 100644
+--- a/src/matchpathcon.c
++++ b/src/matchpathcon.c
+@@ -261,7 +261,7 @@ int matchpathcon_filespec_add(ino_t ino, int specind, const char *file)
+ 	return -1;
+ }
+ 
+-#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && !defined(__INO_T_MATCHES_INO64_T)
++#if (defined(_FILE_OFFSET_BITS) && _FILE_OFFSET_BITS == 64) && defined(__INO64_T_TYPE) && !defined(__INO_T_MATCHES_INO64_T)
+ /* alias defined in the public header but we undefine it here */
+ #undef matchpathcon_filespec_add
+ 
+-- 
+2.51.0
+

--===============8533540759710008101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8533540759710008101==--
