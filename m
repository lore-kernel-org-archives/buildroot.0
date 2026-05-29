Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2937CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B111F83B07;
	Fri, 29 May 2026 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-Z0yQasFqBB; Fri, 29 May 2026 17:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7790F83B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780076809;
	bh=MVq/D5CJowFs5XA8fYj08dW3uywA+fhFv5L/ncajIlc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k0QGArcq7XU588S4ORVxtv6Baji/0zZIYL9MMfCpTi2VxY+iUYntzY2VwF7sxaKE0
	 eKd7Md5wtn/tsvxQ2xhxORWHkJOx7k/3KFqhHYl2DTWIaz9EHVooaHBg5COj/sCNYJ
	 2gtKkZcS6XdGH4ZG2nwjoV3ziANuJrAKz2J8VDRs5h3EAlotq+k4NZfxXr2nTvQ/F4
	 iFYOGZSTpupMHfPXtqMzp0cy+GkbZl4517iPM5rRDrqQbLEcqlWm3BLL8XGCXl54bQ
	 gLgxIKC4gmhKLDXA/437AKkthdEMLBV3hzvZyRYTx64k4rOWa+KJHigk3qJ928eAaS
	 RBdII6g7kSBEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7790F83B0A;
	Fri, 29 May 2026 17:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6BCF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D8B440431
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-2P0ptUEbtk for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A0C340409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A0C340409
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0C340409
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 747A0B97C675; Fri, 29 May 2026 19:46:43 +0200 (CEST)
Message-ID: <ee26ce1f-109b-49d5-b904-a29a29dbc0cb@rnout.be>
Date: Fri, 29 May 2026 19:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>
References: <20260522172136.115768-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260522172136.115768-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780076804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=TdQp+k8kK4IMHB4v3y8Zf3k46WWxbfOfXNPaLo8Jrn4=;
 b=Qwdy1WH0XQQOXMhOYndsQ3lugjeV/6EfhWZcLl90Md60v+7ksS6ALkqkRt8rHcxvPmJqZB
 6AmCTqX+gescY0TFk0fvOUfcga4hf2x0/oYzMVz0maTTHhKd2S0ES1ipl9Oq+DYDScnKI5
 XfdIri39Ys4BMLoWKfBBaKLZrSLhm5mO546fko6Z1gdDsU4b0GGZhw1J0Vk+rdm9b9AtDt
 z+8dVKR1CCKPN3KL9LXL/IRs6bnswpRrmd9npejcLgV15KBPKuk5A0wQ4CcUqW+S2PABfK
 ZgMuLGZChHISVWjXl16qm4G1+KDgyVzmnSYFVWzNz3rQSRA59Joutp2f4aFQ2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Qwdy1WH0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: fix build with
 host gcc 16
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2026 19:21, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/3ff/3ff8d6a1d7bbc02be9118afff243709de43d186d/
> 
> /home/autobuild/autobuild/instance-16/output-1/build/host-gcc-bare-metal-15.2.0/libcody/cody.hh:
>   In member function 'void Cody::Detail::MessageBuffer::Space()':
> /home/autobuild/autobuild/instance-16/output-1/build/host-gcc-bare-metal-15.2.0/libcody/cody.hh:113:24:
>   error: no matching function for call to 'S2C(const char8_t [2])'
>    113 |     Append (Detail::S2C(u8" "));
>        |             ~~~~~~~~~~~^~~~~~~
>    * there is 1 candidate
>      * candidate 1: 'template<unsigned int I> constexpr char Cody::Detail::S2C(const char (&)[I])'
>        /home/autobuild/autobuild/instance-16/output-1/build/host-gcc-bare-metal-15.2.0/libcody/cody.hh:51:16:
>           51 | constexpr char S2C (char const (&s)[I])
>              |                ^~~
>        * template argument deduction/substitution failed:
>          *   mismatched types 'const char' and 'const char8_t'
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 263 ++++++++++++++++++
>   1 file changed, 263 insertions(+)
>   create mode 100644 package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
> 
> diff --git a/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
> new file mode 100644
> index 0000000000..7d6116a9c5
> --- /dev/null
> +++ b/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
> @@ -0,0 +1,263 @@
> +From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
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
> +
> +Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + libcody/client.cc | 36 +++++++++++++++++++-----------------
> + libcody/cody.hh   | 22 ++++++++++++++++++++++
> + libcody/server.cc | 28 ++++++++++++++--------------
> + 3 files changed, 55 insertions(+), 31 deletions(-)
> +
> +diff --git a/libcody/client.cc b/libcody/client.cc
> +index ae69d190cb77..147fecdbe500 100644
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
> +index 789ce9e70b75..93bce93aa94d 100644
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
> +index e2fa069bb933..c18469fae843 100644
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
> +2.43.7
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
