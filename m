Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48301C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFF460D98;
	Fri,  3 Jul 2026 14:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rbPentHYjAZ; Fri,  3 Jul 2026 14:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7CB960EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089151;
	bh=ty+Zee9OYclKEpL9da8CZFAF4FaMKx06ivhmirT+rwM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WmW/EClZ5a212N90NhZpOOXrbgsBoa8eH39qrT/SIgJO1jYMhhiF3SpllWa3UEr5U
	 0F+Bee5Z4nIuAG/7mHVMH4H4DO3UR/QR6l1TqAl3qCavwy036VTVWRWBnAuWCF3xl/
	 l9mAch/VKBKpJOJFv2YqqFVv2J5CWUlemLSSRwA+FZZjhRTFIs0hu+hQeI2Sjka7dZ
	 kotvtsBbUW81H/wn+fLdpYGYGUIwDjuqKGr9TrNtebFbC4x57+sRUppWAAipOm/4bt
	 k77qvQxp81lt8g1uExRmwr0czBZWKDpo3RCbhuM4Oad2RdahzcgAiwdvUfxih2B6+q
	 1avr1O7Jq+3ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7CB960EDE;
	Fri,  3 Jul 2026 14:32:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BEC8363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51A03824E2
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnY1rMaVA72u for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F6CF824CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F6CF824CB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F6CF824CB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493c54e205aso4476235e9.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089147; x=1783693947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ssh/eBxMUH9Vqsw2y+PMJKMEGBPvy+m6fqbc7uwEncc=;
 b=TICAGoeKyx1idC0LvT5HvUq9IgTH5nrBTd8AQwRJpPO+nzqSqF7W0CgLG9WEeTZ+oz
 RDo9xSQCIuWKW4dn+4vw7nTh0vO/yF9S4Mn7K7kBoaPwE1eh9LsEEklKsF+bYgRgzsP0
 Ji6NS+e7bEuUpabrz74glv/Y/xcKAmigLrXC2lDFhZQjYD2fAW60plzCvQ16mMo8kayg
 HhauqwQMnlUs3A0zFnBdu1XWWuCcLLMQX/YpzOZY64LgOL3KstYOINkDY22cZSJyJxzk
 s33gNelhzR+SmfNXE9lG2SuMRfjLwXkYvp5n3jOCeAUSJ3mLZCC3KTMvbgJM3AmeimTE
 EGaA==
X-Gm-Message-State: AOJu0YzVB9GBeFCIPMzpuF3PJ1ZSDEg9vkOEjgdKRvq68t+Q9RdB5Gdb
 Yu8qw1SvckhsMx6hPjGgDGQLVOq5jycg4aYaloudeoGomYIiYwF0j1TNFvonJ8e8tIax2KwQqAf
 CyADp
X-Gm-Gg: AfdE7cmRYtSXwJgVa3NZnXqF2kKHcEu23g+69rveDV06Cea75xeKd8Gsvwtblgkql2T
 EFJv/6e4/hpaYlOB7MHnZfwgSNvIGueZrOOBWkvVL+hXIQzLBbrbd3s1uBOhccbPGlMfN/+tu8I
 dbkPZqu7+395ULTZr/g6xcgT1AuAsrN5VbhEymv/gZPb87Gc2NJUlVxVyX9YADi52oOwMeYMZsj
 pHtqQ1cgFPwSBiL9eHp/r+WTFsspMPuF4/UNbYN8v0AUNgfKob3ynCIdFASuElKu9k+poIf6N+I
 sIxkAySJ83VXAZyVKhNNLff93sSq3zabvn7iom0Bk1tyDqDH1si5925bFIF4dxE87eXt32D5puK
 hoRkbFO/jDFUYAsQJY6j+EMw8VkoY7d6wbbgFjs7mek4LbrRW81VlqWiy78CsAWmNxSTL2D/wjn
 3kWQx5dOAavpfegqE=
X-Received: by 2002:a05:600c:3515:b0:493:bdae:1a2e with SMTP id
 5b1f17b1804b1-493d0f2e6e1mr1436035e9.22.1783089146767; 
 Fri, 03 Jul 2026 07:32:26 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef183e7sm238370705e9.2.2026.07.03.07.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:26 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:25 +0200
Message-ID: <20260703143225.274712-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626082852.96329-1-thomas.perale@mind.be>
References: <20260626082852.96329-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089147; x=1783693947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ssh/eBxMUH9Vqsw2y+PMJKMEGBPvy+m6fqbc7uwEncc=;
 b=gIjEIwoer40gqXge3bO56KvBJXHTCkrr1JJ9n8hfQX/UuAn13l9mMQBH7uNArgfw/r
 JQgXWfwm+Co+htTmVBSG4TmTVA+jqEyrcDpFRSlDT+SvYVdsmd0o56LqNkeE0qpNhIWy
 m+lubbLPg3s8UwO15uIPNVLobICQy+XG6sNzGx+QAw7GYr9VF9B/5+ZqA/q6G0O1FdXs
 GZl5sWrolVwb46tSYM+r3L1IU2AjxR9MKKPV8SW3moZfWYlLx4QYdIpRH/jD/6Blgzu2
 bW+rkRH5a9hbny76IUt8W5vZ7oKYgGX7B+KQnH6THq7AVSzqtWZqBF6a70ijfbXyHcnH
 QdrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gIjEIwoe
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/4] package/squid: backport patch
 for CVE-2026-33515
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
> - CVE-2026-33515:
>     Squid is a caching proxy for the Web. Prior to version 7.5, due to
>     improper input validation, Squid is vulnerable to out of bounds read
>     when handling ICP traffic. This problem allows a remote attacker to
>     receive small amounts of memory potentially containing sensitive
>     information when responding with errors to invalid ICP requests. This
>     attack is limited to Squid deployments that explicitly enable ICP
>     support (i.e. configure non-zero `icp_port`). This problem cannot be
>     mitigated by denying ICP queries using `icp_access` rules. Version 7.5
>     contains a patch.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-33515
>   - https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/squid/0003-CVE-2026-33515.patch | 199 ++++++++++++++++++++++++
>  package/squid/squid.mk                  |   3 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 package/squid/0003-CVE-2026-33515.patch
> 
> diff --git a/package/squid/0003-CVE-2026-33515.patch b/package/squid/0003-CVE-2026-33515.patch
> new file mode 100644
> index 0000000000..c99a0362cf
> --- /dev/null
> +++ b/package/squid/0003-CVE-2026-33515.patch
> @@ -0,0 +1,199 @@
> +From 8138e909d2058d4401e0ad49b583afaec912b165 Mon Sep 17 00:00:00 2001
> +From: Joshua Rogers <MegaManSec@users.noreply.github.com>
> +Date: Thu, 12 Feb 2026 20:28:43 +0000
> +Subject: [PATCH] ICP: Fix validation of packet sizes and URLs (#2220)
> +
> +Fix handling of malformed ICP queries and replies instead of passing
> +invalid URL pointer to consumers, leading to out-of-bounds memory reads
> +and other problems. These fixes affect both ICP v2 and ICP v3 traffic.
> +
> +* Reject packets with URLs that are not NUL-terminated.
> +* Reject packets with URLs containing embedded NULs or trailing garbage.
> +
> +The above two restrictions may backfire if popular ICP agents do send
> +such malformed URLs, and we will need to do more to handle them
> +correctly, but it is _safe_ to reject them for now.
> +
> +Also protect icpHandleUdp() from dereferencing a nil icpOutgoingConn
> +pointer. It is not clear whether icpHandleUdp() can be exposed to nil
> +icpOutgoingConn in current code. More work is needed to polish this.
> +
> +Upstream: https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
> +CVE: CVE-2026-33515
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/ICP.h             |  8 ++++--
> + src/icp_v2.cc         | 57 +++++++++++++++++++++++++++++++++++++------
> + src/icp_v3.cc         | 10 +++++---
> + src/tests/stub_icp.cc |  5 ++--
> + 4 files changed, 66 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/ICP.h b/src/ICP.h
> +index 10a8e1c673b..e9ad8d0cef1 100644
> +--- a/src/ICP.h
> ++++ b/src/ICP.h
> +@@ -89,8 +89,12 @@ extern Comm::ConnectionPointer icpIncomingConn;
> + extern Comm::ConnectionPointer icpOutgoingConn;
> + extern Ip::Address theIcpPublicHostID;
> + 
> ++/// A URI extracted from the given raw packet buffer.
> ++/// On errors, details the problem and returns nil.
> ++const char *icpGetUrl(const Ip::Address &from, const char *, const icp_common_t &);
> ++
> + /// \ingroup ServerProtocolICPAPI
> +-HttpRequest* icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from);
> ++HttpRequest *icpGetRequest(const char *url, int reqnum, int fd, const Ip::Address &from);
> + 
> + /// \ingroup ServerProtocolICPAPI
> + bool icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request);
> +@@ -102,7 +106,7 @@ void icpCreateAndSend(icp_opcode, int flags, char const *url, int reqnum, int pa
> + icp_opcode icpGetCommonOpcode();
> + 
> + /// \ingroup ServerProtocolICPAPI
> +-void icpDenyAccess(Ip::Address &from, char *url, int reqnum, int fd);
> ++void icpDenyAccess(const Ip::Address &from, const char *url, int reqnum, int fd);
> + 
> + /// \ingroup ServerProtocolICPAPI
> + PF icpHandleUdp;
> +diff --git a/src/icp_v2.cc b/src/icp_v2.cc
> +index 25f7b71d25e..312104024de 100644
> +--- a/src/icp_v2.cc
> ++++ b/src/icp_v2.cc
> +@@ -425,7 +425,7 @@ icpCreateAndSend(icp_opcode opcode, int flags, char const *url, int reqnum, int
> + }
> + 
> + void
> +-icpDenyAccess(Ip::Address &from, char *url, int reqnum, int fd)
> ++icpDenyAccess(const Ip::Address &from, const char * const url, const int reqnum, const int fd)
> + {
> +     debugs(12, 2, "icpDenyAccess: Access Denied for " << from << " by " << AclMatchedName << ".");
> + 
> +@@ -453,8 +453,41 @@ icpAccessAllowed(Ip::Address &from, HttpRequest * icp_request)
> +     return checklist.fastCheck().allowed();
> + }
> + 
> ++const char *
> ++icpGetUrl(const Ip::Address &from, const char * const buf, const icp_common_t &header)
> ++{
> ++    const auto receivedPacketSize = static_cast<size_t>(header.length);
> ++    const auto payloadOffset = sizeof(header);
> ++
> ++    // Query payload contains a "Requester Host Address" followed by a URL.
> ++    // Payload of other ICP packets (with opcode that we recognize) is a URL.
> ++    const auto urlOffset = payloadOffset + ((header.opcode == ICP_QUERY) ? sizeof(uint32_t) : 0);
> ++
> ++    // A URL field cannot be empty because it includes a terminating NUL char.
> ++    // Ensure that the packet has at least one URL field byte.
> ++    if (urlOffset >= receivedPacketSize) {
> ++        debugs(12, 3, "too small packet from " << from << ": " << urlOffset << " >= " << receivedPacketSize);
> ++        return nullptr;
> ++    }
> ++
> ++    // All ICP packets (with opcode that we recognize) _end_ with a URL field.
> ++    // RFC 2186 requires all URLs to be "Null-Terminated".
> ++    if (buf[receivedPacketSize - 1] != '\0') {
> ++        debugs(12, 3, "unterminated URL or trailing garbage from " << from);
> ++        return nullptr;
> ++    }
> ++
> ++    const auto url = buf + urlOffset; // a possibly empty c-string
> ++    if (urlOffset + strlen(url) + 1 != receivedPacketSize) {
> ++        debugs(12, 3, "URL with an embedded NUL or trailing garbage from " << from);
> ++        return nullptr;
> ++    }
> ++
> ++    return url;
> ++}
> ++
> + HttpRequest *
> +-icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from)
> ++icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
> + {
> +     if (strpbrk(url, w_space)) {
> +         url = rfc1738_escape(url);
> +@@ -472,13 +505,18 @@ icpGetRequest(char *url, int reqnum, int fd, Ip::Address &from)
> + }
> + 
> + static void
> +-doV2Query(int fd, Ip::Address &from, char *buf, icp_common_t header)
> ++doV2Query(const int fd, Ip::Address &from, const char * const buf, icp_common_t header)
> + {
> +     int rtt = 0;
> +     int src_rtt = 0;
> +     uint32_t flags = 0;
> +-    /* We have a valid packet */
> +-    char *url = buf + sizeof(icp_common_t) + sizeof(uint32_t);
> ++
> ++    const auto url = icpGetUrl(from, buf, header);
> ++    if (!url) {
> ++        icpCreateAndSend(ICP_ERR, 0, "", header.reqnum, 0, fd, from, nullptr);
> ++        return;
> ++    }
> ++
> +     HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
> + 
> +     if (!icp_request)
> +@@ -545,7 +583,9 @@ icp_common_t::handleReply(char *buf, Ip::Address &from)
> +         neighbors_do_private_keys = 0;
> +     }
> + 
> +-    char *url = buf + sizeof(icp_common_t);
> ++    const auto url = icpGetUrl(from, buf, *this);
> ++    if (!url)
> ++        return;
> +     debugs(12, 3, "icpHandleIcpV2: " << icp_opcode_str[opcode] << " from " << from << " for '" << url << "'");
> + 
> +     const cache_key *key = icpGetCacheKey(url, (int) reqnum);
> +@@ -680,7 +720,10 @@ icpHandleUdp(int sock, void *)
> + 
> +         icp_version = (int) buf[1]; /* cheat! */
> + 
> +-        if (icpOutgoingConn->local == from)
> ++        // XXX: The IP equality comparison below ignores port differences but
> ++        // should not. It also fails to detect loops when `local` is a wildcard
> ++        // address (e.g., [::]:3130) because `from` address is never a wildcard.
> ++        if (icpOutgoingConn && icpOutgoingConn->local == from)
> +             // ignore ICP packets which loop back (multicast usually)
> +             debugs(12, 4, "icpHandleUdp: Ignoring UDP packet sent by myself");
> +         else if (icp_version == ICP_VERSION_2)
> +diff --git a/src/icp_v3.cc b/src/icp_v3.cc
> +index c912dd4c062..844768aa0bc 100644
> +--- a/src/icp_v3.cc
> ++++ b/src/icp_v3.cc
> +@@ -32,10 +32,14 @@ class ICP3State: public ICPState
> + 
> + /// \ingroup ServerProtocolICPInternal3
> + static void
> +-doV3Query(int fd, Ip::Address &from, char *buf, icp_common_t header)
> ++doV3Query(int fd, Ip::Address &from, const char * const buf, icp_common_t header)
> + {
> +-    /* We have a valid packet */
> +-    char *url = buf + sizeof(icp_common_t) + sizeof(uint32_t);
> ++    const auto url = icpGetUrl(from, buf, header);
> ++    if (!url) {
> ++        icpCreateAndSend(ICP_ERR, 0, "", header.reqnum, 0, fd, from, nullptr);
> ++        return;
> ++    }
> ++
> +     HttpRequest *icp_request = icpGetRequest(url, header.reqnum, fd, from);
> + 
> +     if (!icp_request)
> +diff --git a/src/tests/stub_icp.cc b/src/tests/stub_icp.cc
> +index 44091838b58..d148ab66d48 100644
> +--- a/src/tests/stub_icp.cc
> ++++ b/src/tests/stub_icp.cc
> +@@ -29,11 +29,12 @@ Comm::ConnectionPointer icpIncomingConn;
> + Comm::ConnectionPointer icpOutgoingConn;
> + Ip::Address theIcpPublicHostID;
> + 
> +-HttpRequest* icpGetRequest(char *, int, int, Ip::Address &) STUB_RETVAL(nullptr)
> ++const char *icpGetUrl(const Ip::Address &, const char *, const icp_common_t &) STUB_RETVAL(nullptr)
> ++HttpRequest* icpGetRequest(const char *, int, int, const Ip::Address &) STUB_RETVAL(nullptr)
> + bool icpAccessAllowed(Ip::Address &, HttpRequest *) STUB_RETVAL(false)
> + void icpCreateAndSend(icp_opcode, int, char const *, int, int, int, const Ip::Address &, AccessLogEntryPointer) STUB
> + icp_opcode icpGetCommonOpcode() STUB_RETVAL(ICP_INVALID)
> +-void icpDenyAccess(Ip::Address &, char *, int, int) STUB
> ++void icpDenyAccess(const Ip::Address &, const char *, int, int) STUB
> + void icpHandleIcpV3(int, Ip::Address &, char *, int) STUB
> + void icpConnectionShutdown(void) STUB
> + int icpSetCacheKey(const cache_key *) STUB_RETVAL(0)
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index c031f1aa03..4a56e32e59 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -18,6 +18,9 @@ SQUID_IGNORE_CVES += CVE-2025-59362
>  # 0002-Proxy-auth-data-visible-to-scripts.patch
>  SQUID_IGNORE_CVES += CVE-2025-62168
>  
> +# 0003-CVE-2026-33515.patch
> +SQUID_IGNORE_CVES += CVE-2026-33515
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
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
