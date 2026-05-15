Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD52BCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79EF541D64;
	Fri, 15 May 2026 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG23qphs4Q4I; Fri, 15 May 2026 17:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC99C41DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867239;
	bh=atVaSzauR9Tz72oASNYcXDxU3DHcRD1yRf9/+CSxNKY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nKfA839/SQ0aOx2RqO+c0jtdMxrZP66AXAnAguhkBOUYtRMIe7HbH+BQ+4Jso8Ttc
	 cR+OlUZ4+V6pGlsd5zGgdSdlKfmQYX8FSWosmwYTqi5yfjScDHw2mQMuj+NyE036pi
	 854MMEZd9QWMPZ8ud8GSR/pwwkT2sdDW9drDDgpV+sMMoEIHzH199sB32GKYPFVfDC
	 j/lySHSQFWMcdododkGFc/l+3mdh8dO8cWI7rqreUOIHmRhhT5pkt/kaaGt/lPelV4
	 EfglsFvrEwTBgSsiGVQt7QqkOG82/F9HqZi3gXMF9iBGAfihd64dQgOTzbejOIliHr
	 qvUj+8lOJsg+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC99C41DED;
	Fri, 15 May 2026 17:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C73BF23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC9968466D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAMZLCBwwKFH for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29E4084671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E4084671
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E4084671
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48374014a77so500135e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867208; x=1779472008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/hWdnnLlTvG1UjqozUFTHu1pSZFU6CH16s+XwMn1ps=;
 b=HdqHWkKaSTlsAmXpwXr/Bj1DRPN8EQltwKTVsVaFy3N0f3VLmXK+38jIIcBkc0m8wJ
 kUVbdQ1GxiLiHq3D5HaDCP1JamJCKDyvPO+gI/iPoiUPKljJvMIvStILgmAxFDyrqggx
 OJzTo+HJugxa7QHI4/EmJLcZXLhknmYTGxxHxWYtLuCxJLDl1tS15PHaHEiqtc2+PQcR
 Yk/jC0kljiPeAQiAuH4tAS7MfXJZAYOgVxugsBu033mCfEL6mubdnkD4F6kU6lBM1M2z
 xzAnv7DyqtecnjRfSBe8HEUDRKDGd7GukRUpbbzWh26R4zEHV2pLmpEAnY3dlJpxY+FM
 nRiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tQkaC3xTEv2RR+vrjO1e602sMunakBZvI+PFYFq6q8sBmBgkPPLUU4lAaBdHQ34oNYHX/Gff53jk=@buildroot.org
X-Gm-Message-State: AOJu0YyCRMyY9FADFaDEgW3vOgPTFB6LHaK306d7nl1YJptOp+uDFHxi
 zYkHECEj88V9VTqEsZdFxNMeCDPlHBfJ2aGTt4NGmsNCBHPoQ4dmIc826H7auTxGdkZC01B4zG+
 M/E6i
X-Gm-Gg: Acq92OFOkM3A1aJWUpHEeWYaYzJCRNGHMrBofG8parWf4ZiDMx6SyVZYjlhOvucIs40
 GYhDV/VOV2Q6YO62Ee0wVsHcw0k8ciYOSTMxXAxPX6wz1kvI9tM84BKmz/Y6VfZI+Vxb6w1ZhYX
 RTVgmk93LqU0xfVlDHnXGodxDpRG3E5AdmvIzoqoKgjUpYy414EaDu+mXPhz6MIdnRKM10GnBxf
 mq/n+vB047HgytoPQmGpwUjXH9/2cOCA0MwrEtqn2VcbQH7Q5Z1a/urF6OY9tfVVXW3fauB60lT
 q/O4/MZwoMkR0iaDQilDN4lLzdEGnppw0w5S4i29ID6bhlexg5c/oddjBrVnERt+Nzv/dpaIEma
 69zrH03rNI+laWzaa0cpSFRAAvwHhOBG2iIIDAjLorNWiayS8CAB5xfDDvgCNwGJcH6pIV3NsNa
 xOVMP7BESlnjcKz3QsqG3kYpN90S9ljS1o52xozA/KuJzC3ceAd/TsPVU=
X-Received: by 2002:a05:600c:8b47:b0:48f:dfe3:dae3 with SMTP id
 5b1f17b1804b1-48fe63223edmr76795235e9.17.1778867208104; 
 Fri, 15 May 2026 10:46:48 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5cab882sm79973215e9.13.2026.05.15.10.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:47 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:47 +0200
Message-ID: <20260515174647.530748-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506083350.3959360-2-buildroot@bubu1.eu>
References: <20260506083350.3959360-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867208; x=1779472008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/hWdnnLlTvG1UjqozUFTHu1pSZFU6CH16s+XwMn1ps=;
 b=OpfEbO4JmifivcclgxejJM+n9PtXBIikrYKZnNmcFmbxsr19J8yk8B47Hm9swRkATk
 cKN3wMIFefjO1WwxP3VmjvfenX9xlOOqHXXEpiA23yKNZeu47AX8BT8ffgcq437K4fbb
 Q5hYtiaLLIxSvmLLCTmfjN30WwSAyLqVjYqv6Wv75QybfGqIWGmiwB+PFsIPGBoIoCyT
 zv8dcWhIPrERYKQfhOc24nNBKpwzp7yxj6ofRBUOzdCQfO0xMwJ+YMfdC3GWifgroyZE
 tOWcS6LJ2rebIkuGyTYEIITt/69fzypelmwUxPb1PM/CHIywHYu0uMXgBiPI72IjS80g
 647w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OpfEbO4J
Subject: Re: [Buildroot] [PATCH 2/3] package/gcc: fix gcc-14 build with host
 gcc 16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backport two patches from upstream gcc-14 maintenance branch. Requires
> one more patch on top of the fix for gcc-15.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 261 ++++++++++++++++++
>  ...am-and-memory-include-above-safe-cty.patch |  78 ++++++
>  2 files changed, 339 insertions(+)
>  create mode 100644 package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
>  create mode 100644 package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> 
> diff --git a/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
> new file mode 100644
> index 0000000000..f9f983b464
> --- /dev/null
> +++ b/package/gcc/14.3.0/0005--libcody-Make-it-buildable-by-C-11-to-C-26.patch
> @@ -0,0 +1,261 @@
> +From daa3e1ead791bc58208043cfc4595ba1a78cdd34 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelinek <jakub@redhat.com>
> +Date: Fri, 21 Nov 2025 16:25:58 +0100
> +Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
> +
> +The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
> +and c++26.
> +
> +I see the u8 string literals are mixed e.g. with strerror, so in
> +-fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
> +the u8 literals everywhere are worth it either.
> +
> +2025-11-21  Jakub Jelinek  <jakub@redhat.com>
> +
> +	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
> +	char in argument type.
> +	(MessageBuffer::Space): Revert 2025-11-15 change.
> +	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
> +	with char8_t const * type of first argument.
> +	(Packet::Packet): Similarly for first argument.
> +	* client.cc (CommunicationError, Client::ProcessResponse,
> +	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
> +	IncludeTranslateResponse): Cast u8 string literals to (const char *)
> +	where needed.
> +	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
> +
> +(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> +Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=daa3e1ead791bc58208043cfc4595ba1a78cdd34
> +---
> + libcody/client.cc | 36 +++++++++++++++++++-----------------
> + libcody/cody.hh   | 22 ++++++++++++++++++++++
> + libcody/server.cc | 28 ++++++++++++++--------------
> + 3 files changed, 55 insertions(+), 31 deletions(-)
> +
> +diff --git a/libcody/client.cc b/libcody/client.cc
> +index ae69d190cb7..147fecdbe50 100644
> +--- a/libcody/client.cc
> ++++ b/libcody/client.cc
> +@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
> + 
> + static Packet CommunicationError (int err)
> + {
> +-  std::string e {u8"communication error:"};
> ++  std::string e {(const char *) u8"communication error:"};
> +   e.append (strerror (err));
> + 
> +   return Packet (Client::PC_ERROR, std::move (e));
> +@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
> +     {
> +       if (e == EINVAL)
> + 	{
> +-	  std::string msg (u8"malformed string '");
> ++	  std::string msg ((const char *) u8"malformed string '");
> + 	  msg.append (words[0]);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  return Packet (Client::PC_ERROR, std::move (msg));
> + 	}
> +       else
> +-	return Packet (Client::PC_ERROR, u8"missing response");
> ++	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
> +     }
> + 
> +   Assert (!words.empty ());
> +-  if (words[0] == u8"ERROR")
> ++  if (words[0] == (const char *) u8"ERROR")
> +     return Packet (Client::PC_ERROR,
> +-		   words.size () == 2 ? words[1]: u8"malformed error response");
> ++		   words.size () == 2 ? words[1]
> ++		   : (const char *) u8"malformed error response");
> + 
> +   if (isLast && !read.IsAtEnd ())
> +     return Packet (Client::PC_ERROR,
> +-		   std::string (u8"unexpected extra response"));
> ++		   std::string ((const char *) u8"unexpected extra response"));
> + 
> +   Assert (code < Detail::RC_HWM);
> +   Packet result (responseTable[code] (words));
> +   result.SetRequest (code);
> +   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
> +     {
> +-      std::string msg {u8"malformed response '"};
> ++      std::string msg {(const char *) u8"malformed response '"};
> + 
> +       read.LexedLine (msg);
> +-      msg.append (u8"'");
> ++      msg.append ((const char *) u8"'");
> +       result.GetString () = std::move (msg);
> +     }
> +   else if (result.GetCode () == Client::PC_CONNECT)
> +@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
> + 			  size_t alen, size_t ilen)
> + {
> +   write.BeginLine ();
> +-  write.AppendWord (u8"HELLO");
> ++  write.AppendWord ((const char *) u8"HELLO");
> +   write.AppendInteger (Version);
> +   write.AppendWord (agent, true, alen);
> +   write.AppendWord (ident, true, ilen);
> +@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
> + // HELLO $version $agent [$flags]
> + Packet ConnectResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
> ++  if (words[0] == (const char *) u8"HELLO"
> ++      && (words.size () == 3 || words.size () == 4))
> +     {
> +       char *eptr;
> +       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
> +@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
> + // PATHNAME $dir | ERROR
> + Packet PathnameResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"PATHNAME" && words.size () == 2)
> ++  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
> +     return Packet (Client::PC_PATHNAME, std::move (words[1]));
> + 
> +   return Packet (Client::PC_ERROR, u8"");
> +@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
> + // OK or ERROR
> + Packet OKResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"OK")
> ++  if (words[0] == (const char *) u8"OK")
> +     return Packet (Client::PC_OK);
> +   else
> +     return Packet (Client::PC_ERROR,
> +@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
> + // PATHNAME $cmifile
> + Packet IncludeTranslateResponse (std::vector<std::string> &words)
> + {
> +-  if (words[0] == u8"BOOL" && words.size () == 2)
> ++  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
> +     {
> +-      if (words[1] == u8"FALSE")
> +-	return Packet (Client::PC_BOOL, 0);
> +-      else if (words[1] == u8"TRUE")
> ++      if (words[1] == (const char *) u8"FALSE")
> ++	return Packet (Client::PC_BOOL);
> ++      else if (words[1] == (const char *) u8"TRUE")
> + 	return Packet (Client::PC_BOOL, 1);
> +       else
> + 	return Packet (Client::PC_ERROR, u8"");
> +diff --git a/libcody/cody.hh b/libcody/cody.hh
> +index 789ce9e70b7..93bce93aa94 100644
> +--- a/libcody/cody.hh
> ++++ b/libcody/cody.hh
> +@@ -47,12 +47,21 @@ namespace Detail  {
> + 
> + // C++11 doesn't have utf8 character literals :(
> + 
> ++#if __cpp_char8_t >= 201811
> ++template<unsigned I>
> ++constexpr char S2C (char8_t const (&s)[I])
> ++{
> ++  static_assert (I == 2, "only single octet strings may be converted");
> ++  return s[0];
> ++}
> ++#else
> + template<unsigned I>
> + constexpr char S2C (char const (&s)[I])
> + {
> +   static_assert (I == 2, "only single octet strings may be converted");
> +   return s[0];
> + }
> ++#endif
> + 
> + /// Internal buffering class.  Used to concatenate outgoing messages
> + /// and Lex incoming ones.
> +@@ -123,6 +132,13 @@ public:
> +       Space ();
> +     Append (str, maybe_quote, len);
> +   }
> ++#if __cpp_char8_t >= 201811
> ++  void AppendWord (char8_t const *str, bool maybe_quote = false,
> ++		   size_t len = ~size_t (0))
> ++  {
> ++    AppendWord ((const char *) str, maybe_quote, len);
> ++  }
> ++#endif
> +   /// Add a word as with AppendWord
> +   /// @param str the string to append
> +   /// @param maybe_quote string might need quoting, as for Append
> +@@ -264,6 +280,12 @@ public:
> +     : string (s), cat (STRING), code (c)
> +   {
> +   }
> ++#if __cpp_char8_t >= 201811
> ++  Packet (unsigned c, const char8_t *s)
> ++    : string ((const char *) s), cat (STRING), code (c)
> ++  {
> ++  }
> ++#endif
> +   Packet (unsigned c, std::vector<std::string> &&v)
> +     : vector (std::move (v)), cat (VECTOR), code (c)
> +   {
> +diff --git a/libcody/server.cc b/libcody/server.cc
> +index e2fa069bb93..c18469fae84 100644
> +--- a/libcody/server.cc
> ++++ b/libcody/server.cc
> +@@ -36,12 +36,12 @@ static RequestPair
> +   const requestTable[Detail::RC_HWM] =
> +   {
> +     // Same order as enum RequestCode
> +-    RequestPair {u8"HELLO", nullptr},
> +-    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
> +-    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
> +-    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
> +-    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
> +-    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> ++    RequestPair {(const char *) u8"HELLO", nullptr},
> ++    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
> ++    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
> ++    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
> ++    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
> ++    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
> +   };
> + }
> + 
> +@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
> + 	  std::string msg;
> + 
> + 	  if (err > 0)
> +-	    msg = u8"error processing '";
> ++	    msg = (const char *) u8"error processing '";
> + 	  else if (ix >= Detail::RC_HWM)
> +-	    msg = u8"unrecognized '";
> ++	    msg = (const char *) u8"unrecognized '";
> + 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
> +-	    msg = u8"already connected '";
> ++	    msg = (const char *) u8"already connected '";
> + 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
> +-	    msg = u8"not connected '";
> ++	    msg = (const char *) u8"not connected '";
> + 	  else
> +-	    msg = u8"malformed '";
> ++	    msg = (const char *) u8"malformed '";
> + 
> + 	  read.LexedLine (msg);
> +-	  msg.append (u8"'");
> ++	  msg.append ((const char *) u8"'");
> + 	  if (err > 0)
> + 	    {
> +-	      msg.append (u8" ");
> ++	      msg.append ((const char *) u8" ");
> + 	      msg.append (strerror (err));
> + 	    }
> + 	  resolver->ErrorResponse (this, std::move (msg));
> +@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
> +     return nullptr;
> + 
> +   if (words.size () == 3)
> +-    words.emplace_back (u8"");
> ++    words.emplace_back ((const char *) u8"");
> +   unsigned version = ParseUnsigned (words[1]);
> +   if (version == ~0u)
> +     return nullptr;
> +-- 
> +2.54.0
> +
> diff --git a/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch b/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> new file mode 100644
> index 0000000000..e48dd91c18
> --- /dev/null
> +++ b/package/gcc/14.3.0/0006-build-Move-sstream-and-memory-include-above-safe-cty.patch
> @@ -0,0 +1,78 @@
> +From 046776dac7cc74bdbab36f450af80644a045858a Mon Sep 17 00:00:00 2001
> +From: Andrew Pinski <quic_apinski@quicinc.com>
> +Date: Mon, 25 Nov 2024 14:03:27 -0800
> +Subject: [PATCH] build: Move sstream and memory include above safe-ctype.h
> + [PR124830]
> +
> +This picks r15-5661-gf6e00226a4ca6 to older branches, also moving
> +the <memory> include to fix build issues with a C++20 host compiler.
> +
> +sstream in some versions of libstdc++ include locale which might not have been
> +included yet. safe-ctype.h defines the toupper, tolower, etc. as macros so the
> +c++ header files needed to be included before hand as comment in system.h says:
> +/* Include C++ standard headers before "safe-ctype.h" to avoid GCC
> +   poisoning the ctype macros through safe-ctype.h */
> +
> +I don't understand how it was working before when memory was included after
> +safe-ctype.h rather than before. But this makes sstream consistent with the
> +other C++ headers.
> +
> +gcc/ChangeLog:
> +
> +	PR target/117771
> +	PR c/124830
> +	* system.h: Move the include of sstream and memory above safe-ctype.h.
> +
> +Signed-off-by: Andrew Pinski <quic_apinski@quicinc.com>
> +Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> +Upstream: https://gcc.gnu.org/git?p=gcc.git;a=commit;h=046776dac7cc74bdbab36f450af80644a045858a
> +---
> + gcc/system.h | 21 +++++++++------------
> + 1 file changed, 9 insertions(+), 12 deletions(-)
> +
> +diff --git a/gcc/system.h b/gcc/system.h
> +index b18482c7190..da331f105ba 100644
> +--- a/gcc/system.h
> ++++ b/gcc/system.h
> +@@ -222,6 +222,15 @@ extern int fprintf_unlocked (FILE *, const char *, ...);
> + #ifdef INCLUDE_FUNCTIONAL
> + # include <functional>
> + #endif
> ++#ifdef INCLUDE_SSTREAM
> ++# include <sstream>
> ++#endif
> ++/* Some of the headers included by <memory> can use "abort" within a
> ++   namespace, e.g. "_VSTD::abort();", which fails after we use the
> ++   preprocessor to redefine "abort" as "fancy_abort" below.  */
> ++#ifdef INCLUDE_MEMORY
> ++# include <memory>
> ++#endif
> + # include <cstring>
> + # include <initializer_list>
> + # include <new>
> +@@ -758,22 +767,10 @@ private:
> + #define LIKELY(x) (__builtin_expect ((x), 1))
> + #define UNLIKELY(x) (__builtin_expect ((x), 0))
> + 
> +-/* Some of the headers included by <memory> can use "abort" within a
> +-   namespace, e.g. "_VSTD::abort();", which fails after we use the
> +-   preprocessor to redefine "abort" as "fancy_abort" below.  */
> +-
> +-#ifdef INCLUDE_MEMORY
> +-# include <memory>
> +-#endif
> +-
> + #ifdef INCLUDE_MUTEX
> + # include <mutex>
> + #endif
> + 
> +-#ifdef INCLUDE_SSTREAM
> +-# include <sstream>
> +-#endif
> +-
> + #ifdef INCLUDE_MALLOC_H
> + #if defined(HAVE_MALLINFO) || defined(HAVE_MALLINFO2)
> + #include <malloc.h>
> +-- 
> +2.54.0
> +
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
