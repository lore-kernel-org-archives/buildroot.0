Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF2BCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D960841E19;
	Fri, 15 May 2026 17:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itifRQYqC5Ue; Fri, 15 May 2026 17:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C4741E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867255;
	bh=kiiyKtoW6Pf5r2QypKMCmFlpCUegRxz1MCdELaVRUec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ODIgC8cLNkcgPRKTyv+Zp7a0retZ0H94ylyi/leOg2tb+NzwP6EHOZ3ArKEUf1yv3
	 5pEVeZcR4cd/w7bl/1h5aVAxVc0RsgqnVqq2QMG3nNH058wJF/ryvx291+24AXTyB/
	 jSRl+6WS++8Yhof4hwGZha3TCIBTaAw3wrb8VFATaC9Rs1rNPS7pB8pd2WfRqYSUDs
	 JaRdL2LbA5vMBnGz1XOE14zRz9VtQel/kfHDZ5RbuGvU5ailF4Hte+sQBjUIIsTwNU
	 M45TCfkI7sPQsYJH0ht65FJ5Y5q88wSX+OG2WaEG5/gseNFAk4dlcoJ27k1rr2LQxc
	 1Cdq4r6CEucNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C4741E0D;
	Fri, 15 May 2026 17:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5BD623F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83D9440FAA
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMn9BBvCilMK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6190940FAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6190940FAC
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FA5D863D7; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:45:40 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2171dafd28e4da202879af684dd5752c7862d86d
X-Git-Newrev: d2e399c6743f8f40f65097c320cf82f11d12fad8
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.9FA5D863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/gcc: fix gcc-13
 build with host gcc 16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2e399c6743f8f40f65097c320cf82f11d12fad8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Backport 2 patches from upstream maintenance branch. Same fixes as
required for gcc-14.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 10ccbe079ca45e393f5f5c168c1bce56ce4eb2cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...libcody-Make-it-buildable-by-C-11-to-C-26.patch | 261 +++++++++++++++++++++
 ...sstream-and-memory-include-above-safe-cty.patch |  79 +++++++
 2 files changed, 340 insertions(+)

diff --git a/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
new file mode 100644
index 0000000000..e1d6b5eb32
--- /dev/null
+++ b/package/gcc/13.4.0/0005-libcody-Make-it-buildable-by-C-11-to-C-26.patch
@@ -0,0 +1,261 @@
+From 51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 21 Nov 2025 16:25:58 +0100
+Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
+
+The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
+and c++26.
+
+I see the u8 string literals are mixed e.g. with strerror, so in
+-fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
+the u8 literals everywhere are worth it either.
+
+2025-11-21  Jakub Jelinek  <jakub@redhat.com>
+
+	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
+	char in argument type.
+	(MessageBuffer::Space): Revert 2025-11-15 change.
+	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
+	with char8_t const * type of first argument.
+	(Packet::Packet): Similarly for first argument.
+	* client.cc (CommunicationError, Client::ProcessResponse,
+	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
+	IncludeTranslateResponse): Cast u8 string literals to (const char *)
+	where needed.
+	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
+
+(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=51b9a0f7dfd2441a30e0ebfd4b30f18f86b4ea54
+---
+ libcody/client.cc | 36 +++++++++++++++++++-----------------
+ libcody/cody.hh   | 22 ++++++++++++++++++++++
+ libcody/server.cc | 28 ++++++++++++++--------------
+ 3 files changed, 55 insertions(+), 31 deletions(-)
+
+diff --git a/libcody/client.cc b/libcody/client.cc
+index ae69d190cb7..147fecdbe50 100644
+--- a/libcody/client.cc
++++ b/libcody/client.cc
+@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
+ 
+ static Packet CommunicationError (int err)
+ {
+-  std::string e {u8"communication error:"};
++  std::string e {(const char *) u8"communication error:"};
+   e.append (strerror (err));
+ 
+   return Packet (Client::PC_ERROR, std::move (e));
+@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
+     {
+       if (e == EINVAL)
+ 	{
+-	  std::string msg (u8"malformed string '");
++	  std::string msg ((const char *) u8"malformed string '");
+ 	  msg.append (words[0]);
+-	  msg.append (u8"'");
++	  msg.append ((const char *) u8"'");
+ 	  return Packet (Client::PC_ERROR, std::move (msg));
+ 	}
+       else
+-	return Packet (Client::PC_ERROR, u8"missing response");
++	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
+     }
+ 
+   Assert (!words.empty ());
+-  if (words[0] == u8"ERROR")
++  if (words[0] == (const char *) u8"ERROR")
+     return Packet (Client::PC_ERROR,
+-		   words.size () == 2 ? words[1]: u8"malformed error response");
++		   words.size () == 2 ? words[1]
++		   : (const char *) u8"malformed error response");
+ 
+   if (isLast && !read.IsAtEnd ())
+     return Packet (Client::PC_ERROR,
+-		   std::string (u8"unexpected extra response"));
++		   std::string ((const char *) u8"unexpected extra response"));
+ 
+   Assert (code < Detail::RC_HWM);
+   Packet result (responseTable[code] (words));
+   result.SetRequest (code);
+   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
+     {
+-      std::string msg {u8"malformed response '"};
++      std::string msg {(const char *) u8"malformed response '"};
+ 
+       read.LexedLine (msg);
+-      msg.append (u8"'");
++      msg.append ((const char *) u8"'");
+       result.GetString () = std::move (msg);
+     }
+   else if (result.GetCode () == Client::PC_CONNECT)
+@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
+ 			  size_t alen, size_t ilen)
+ {
+   write.BeginLine ();
+-  write.AppendWord (u8"HELLO");
++  write.AppendWord ((const char *) u8"HELLO");
+   write.AppendInteger (Version);
+   write.AppendWord (agent, true, alen);
+   write.AppendWord (ident, true, ilen);
+@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
+ // HELLO $version $agent [$flags]
+ Packet ConnectResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
++  if (words[0] == (const char *) u8"HELLO"
++      && (words.size () == 3 || words.size () == 4))
+     {
+       char *eptr;
+       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
+@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
+ // PATHNAME $dir | ERROR
+ Packet PathnameResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"PATHNAME" && words.size () == 2)
++  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
+     return Packet (Client::PC_PATHNAME, std::move (words[1]));
+ 
+   return Packet (Client::PC_ERROR, u8"");
+@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
+ // OK or ERROR
+ Packet OKResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"OK")
++  if (words[0] == (const char *) u8"OK")
+     return Packet (Client::PC_OK);
+   else
+     return Packet (Client::PC_ERROR,
+@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
+ // PATHNAME $cmifile
+ Packet IncludeTranslateResponse (std::vector<std::string> &words)
+ {
+-  if (words[0] == u8"BOOL" && words.size () == 2)
++  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
+     {
+-      if (words[1] == u8"FALSE")
+-	return Packet (Client::PC_BOOL, 0);
+-      else if (words[1] == u8"TRUE")
++      if (words[1] == (const char *) u8"FALSE")
++	return Packet (Client::PC_BOOL);
++      else if (words[1] == (const char *) u8"TRUE")
+ 	return Packet (Client::PC_BOOL, 1);
+       else
+ 	return Packet (Client::PC_ERROR, u8"");
+diff --git a/libcody/cody.hh b/libcody/cody.hh
+index 789ce9e70b7..93bce93aa94 100644
+--- a/libcody/cody.hh
++++ b/libcody/cody.hh
+@@ -47,12 +47,21 @@ namespace Detail  {
+ 
+ // C++11 doesn't have utf8 character literals :(
+ 
++#if __cpp_char8_t >= 201811
++template<unsigned I>
++constexpr char S2C (char8_t const (&s)[I])
++{
++  static_assert (I == 2, "only single octet strings may be converted");
++  return s[0];
++}
++#else
+ template<unsigned I>
+ constexpr char S2C (char const (&s)[I])
+ {
+   static_assert (I == 2, "only single octet strings may be converted");
+   return s[0];
+ }
++#endif
+ 
+ /// Internal buffering class.  Used to concatenate outgoing messages
+ /// and Lex incoming ones.
+@@ -123,6 +132,13 @@ public:
+       Space ();
+     Append (str, maybe_quote, len);
+   }
++#if __cpp_char8_t >= 201811
++  void AppendWord (char8_t const *str, bool maybe_quote = false,
++		   size_t len = ~size_t (0))
++  {
++    AppendWord ((const char *) str, maybe_quote, len);
++  }
++#endif
+   /// Add a word as with AppendWord
+   /// @param str the string to append
+   /// @param maybe_quote string might need quoting, as for Append
+@@ -264,6 +280,12 @@ public:
+     : string (s), cat (STRING), code (c)
+   {
+   }
++#if __cpp_char8_t >= 201811
++  Packet (unsigned c, const char8_t *s)
++    : string ((const char *) s), cat (STRING), code (c)
++  {
++  }
++#endif
+   Packet (unsigned c, std::vector<std::string> &&v)
+     : vector (std::move (v)), cat (VECTOR), code (c)
+   {
+diff --git a/libcody/server.cc b/libcody/server.cc
+index e2fa069bb93..c18469fae84 100644
+--- a/libcody/server.cc
++++ b/libcody/server.cc
+@@ -36,12 +36,12 @@ static RequestPair
+   const requestTable[Detail::RC_HWM] =
+   {
+     // Same order as enum RequestCode
+-    RequestPair {u8"HELLO", nullptr},
+-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
+-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
+-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
+-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
+-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
++    RequestPair {(const char *) u8"HELLO", nullptr},
++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
+   };
+ }
+ 
+@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
+ 	  std::string msg;
+ 
+ 	  if (err > 0)
+-	    msg = u8"error processing '";
++	    msg = (const char *) u8"error processing '";
+ 	  else if (ix >= Detail::RC_HWM)
+-	    msg = u8"unrecognized '";
++	    msg = (const char *) u8"unrecognized '";
+ 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
+-	    msg = u8"already connected '";
++	    msg = (const char *) u8"already connected '";
+ 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
+-	    msg = u8"not connected '";
++	    msg = (const char *) u8"not connected '";
+ 	  else
+-	    msg = u8"malformed '";
++	    msg = (const char *) u8"malformed '";
+ 
+ 	  read.LexedLine (msg);
+-	  msg.append (u8"'");
++	  msg.append ((const char *) u8"'");
+ 	  if (err > 0)
+ 	    {
+-	      msg.append (u8" ");
++	      msg.append ((const char *) u8" ");
+ 	      msg.append (strerror (err));
+ 	    }
+ 	  resolver->ErrorResponse (this, std::move (msg));
+@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
+     return nullptr;
+ 
+   if (words.size () == 3)
+-    words.emplace_back (u8"");
++    words.emplace_back ((const char *) u8"");
+   unsigned version = ParseUnsigned (words[1]);
+   if (version == ~0u)
+     return nullptr;
+-- 
+2.54.0
+
diff --git a/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
new file mode 100644
index 0000000000..3b12747d68
--- /dev/null
+++ b/package/gcc/13.4.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
@@ -0,0 +1,79 @@
+From 9239757a9c6e3a6e8d94d56803329d556ec914d7 Mon Sep 17 00:00:00 2001
+From: Andrew Pinski <quic_apinski@quicinc.com>
+Date: Mon, 25 Nov 2024 14:03:27 -0800
+Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
+ [PR124830]
+
+This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
+the <memory> include to fix build issues with a C++20 host compiler.
+
+sstream in some versions of libstdc++ include locale which might not have been
+included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
+c++ header files needed to be included before hand as comment in system.h says:
+/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
+   poisoning the ctype macros through safe-ctype.h */
+
+I don't understand how it was working before when memory was included after
+safe-ctype.h rather than before. But this makes sstream consistent with the
+other C++ headers.
+
+gcc/ChangeLog:
+
+	PR target/117771
+	PR c/124830
+	* system.h: Move the include of sstream and memory above safe-ctype.h.
+
+Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
+(cherry picked from commit 046776dac7cc74bdbab36f450af80644a045858a)
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=9239757a9c6e3a6e8d94d56803329d556ec914d7
+---
+ gcc/system.h | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/gcc/system.h b/gcc/system.h
+index 0354883ed3f..1f013d3ac7a 100644
+--- a/gcc/system.h
++++ b/gcc/system.h
+@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
+ #ifdef INCLUDE_FUNCTIONAL
+ # include <functional>
+ #endif
++#ifdef INCLUDE_SSTREAM
++# include <sstream>
++#endif
++/* Some of the headers included by <memory> can use "abort" within a
++   namespace, e.g. "_VSTD::abort();", which fails after we use the
++   preprocessor to redefine "abort" as "fancy_abort" below.  */
++#ifdef INCLUDE_MEMORY
++# include <memory>
++#endif
+ # include <cstring>
+ # include <initializer_list>
+ # include <new>
+@@ -736,22 +745,10 @@ extern int vsnprintf (char *, size_t, const char *, va_list);
+ #define LIKELY(x) (__builtin_expect ((x), 1))
+ #define UNLIKELY(x) (__builtin_expect ((x), 0))
+ 
+-/* Some of the headers included by <memory> can use "abort" within a
+-   namespace, e.g. "_VSTD::abort();", which fails after we use the
+-   preprocessor to redefine "abort" as "fancy_abort" below.  */
+-
+-#ifdef INCLUDE_MEMORY
+-# include <memory>
+-#endif
+-
+ #ifdef INCLUDE_MUTEX
+ # include <mutex>
+ #endif
+ 
+-#ifdef INCLUDE_SSTREAM
+-# include <sstream>
+-#endif
+-
+ #ifdef INCLUDE_MALLOC_H
+ #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
+ #include <malloc.h>
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
