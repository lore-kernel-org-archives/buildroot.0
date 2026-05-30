Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E80CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E9284289;
	Sat, 30 May 2026 10:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3byRxoqenfoe; Sat, 30 May 2026 10:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC4A28529D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135954;
	bh=1dylm6y/3m8i4IE5jYi8M7MVGW2pbDkWC9X1LSRXr90=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LfFfbQs1NbCV5qBcmuTxkRFKX0RMiRhL9jmYX6IMvEjDhmCX92hBT8iseoC2OHk3f
	 9F4cLvhA2m7kytfh6zn/Mbuya+giUX2u4winWGSw+r0/6iASD0vUGD688IanJRXJHQ
	 MKVkF8ztPDL+q3UP8bpuOt1JHt8uyXXB1FM8X3lhEdafyc+p+XJLEO61kIyCYjAOAL
	 4GTy+WS4qK3NqN6n2Xh9yAF6I4NCShinK4vf78V7kkWH2asynhKHldRHFGdUOHr23U
	 v+pLgKQIsmR1HQGSSMwezF6sAIpBZXMBOjrXIIp43nK2nA/9wmYc+6jxHBTm32q5z0
	 Y/PaEgpneG1QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC4A28529D;
	Sat, 30 May 2026 10:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F15DA12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D246684289
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Jcx6seLyb2U for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.110;
 helo=smtp-outgoing-2003.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8266F8134D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8266F8134D
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8266F8134D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:12:30 +0000 (UTC)
X-mail-filterd: {"version":"1.9.5","queueID":"4gSGHZ6rl5z1dxml","contextId":
 "caf7cfc1-d2d0-4e86-a38c-e46c3be556cd"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0110.laposte.net (SMTP Server) with ESMTP id 4gSGHZ6rl5z1dxml;
 Sat, 30 May 2026 12:12:26 +0200 (CEST)
X-mail-filterd: {"version":"1.9.5","queueID":"4gSGHZ5nx1z1dxmP","contextId":
 "88a2e08c-d46a-46d4-8d1e-e8c6f46f27dd"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-160-203-96.subs.proxad.net [88.160.203.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0110.laposte.net (SMTP Server) with ESMTPSA id 4gSGHZ5nx1z1dxmP;
 Sat, 30 May 2026 12:12:26 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 80774703D074;
 Sat, 30 May 2026 12:10:22 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.99.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1wTGg1-000000003mk-059C; Sat, 30 May 2026 12:12:21 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sat, 30 May 2026 12:12:18 +0200
Message-ID: <20260530101218.14545-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1780135948;
 bh=R2CrGpJPN/ezktAe5tnYHu5AESU0dpdHjcIcbhM0Zms=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=tKdmMSkZyCx/BSW90n0rqKlyi39l3KIuy7N4qqfXaoPRpgCb2zJKApiiH/lLHnvadkOYP/f48dVrsq9dGNeoHecBhmmHVaUHRVWCWmhtEYQWYEfhOeP4vJ+CodrZyFecYYYj2sSDfy/bPJtJI7TRPfG3AVO/Pwz8yuopEJcuZjroVGhwnva8KNqMRPe89fRxyhlxicLY+nwVqjr6S829aHTpgZV3LhH/cuXL9gb/A/W/l/Shr8gVPiYvDzBCctfNlST2GpyLbFonzqkWKncbVCQ4DwgVbN7qk3CgSq4SrRf4syiFgd8Fwp7pN0FJDz8neE3ugSfoMvcgqSEUW8hTOA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=tKdmMSkZ
Subject: [Buildroot] [PATCH] arch/hppa: remove pa-risc 1.0
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIG5ldyBnbGliYyAyLjQzIHdlIGhhdmUgaW4gQnVpbGRyb290IHNpbmNlIGNvbW1pdCBbMV0g
aW50cm9kdWNlZCBjaGFuZ2VzCmFyb3VuZCA2NEIgYXRvbWljcyBbMl0sIHdoaWNoIGJyZWFrIHRo
ZSBidWlsZCBmb3IgUEEtUklTQyAxLjAuIFszXQoKVGhpcyBpcyB0aGUgb25seSBDIGxpYnJhcnkg
d2Ugc3VwcG9ydCBhdCB0aGlzIHBvaW50OyBmb3JjaW5nIHNvZnQtZmxvYXQKc2VlbXMgdG8gYmUg
YSB3b3JrYXJvdW5kLCBidXQgYXMgdGhpcyBhcmNoaXRlY3R1cmUgdmVyc2lvbiB3YXMgbm90IGFz
CndpZGVseSB1c2VkIGFzIHRoZSBsYXRlciAxLjEgYW5kIHdlIGhhdmUgbm8gaGFyZHdhcmUgb3Ig
c2ltdWxhdG9yIGZvciBpdCBhdAp0aGlzIHBvaW50LCByZW1vdmUgaXQgY29tcGxldGVseSBpbnN0
ZWFkIHRvIHNwYXJlIHRoZSBhdXRvYnVpbGRlcnMuCgpMaW5rOiBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMjI3Mzc4YjU5MzBiNjgxYzc5YTEzNDc2
YWU2MGE5ODc1M2E5OGEwMyBbMV0KTGluazogaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9
Z2xpYmMuZ2l0O2E9Y29tbWl0O2g9OWRhMDU4NTg1MmU1NTk5YWQ2ZTg0OWNjZGYyZjZmOWIwNDAz
OGEzYyBbMl0KTGluazogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzkw
NWM3ZThkYjBmOGI5MDE0ZjI2OTI1YzZlMTM3OWEwYzU0YWQ0NDYvIFszXQpTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgotLS0KIENvbmZp
Zy5pbi5sZWdhY3kgICAgfCA3ICsrKysrKysKIGFyY2gvQ29uZmlnLmluLmhwcGEgfCAyIC0tCiBh
cmNoL2FyY2gubWsuaHBwYSAgIHwgNCArLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29u
ZmlnLmluLmxlZ2FjeQppbmRleCA4ZmVkNGI3MmMxLi5hODcyZDIyOWNlIDEwMDY0NAotLS0gYS9D
b25maWcuaW4ubGVnYWN5CisrKyBiL0NvbmZpZy5pbi5sZWdhY3kKQEAgLTI3OCw2ICsyNzgsMTMg
QEAgY29uZmlnIEJSMl9CSU5VVElMU19WRVJTSU9OXzJfNDNfWAogCSAgYmludXRpbHMgMi40MyBo
YXMgYmVlbiByZW1vdmVkLCBzZWxlY3QgYSBuZXdlciB2ZXJzaW9uCiAJICBpbnN0ZWFkLgogCitj
b25maWcgQlIyX3BhcmlzYzEwCisJYm9vbCAiUEEtUklTQyBhcmNoaXRlY3R1cmUgdmVyc2lvbiAx
LjAgc3VwcG9ydCByZW1vdmVkIgorCXNlbGVjdCBCUjJfTEVHQUNZCisJaGVscAorCSAgRm9sbG93
aW5nIHRoZSBidWlsZCBpc3N1ZXMgd2l0aCBnbGliYyAyLjQzLCBCdWlsZHJvb3QgaGFzCisJICBy
ZW1vdmVkIHN1cHBvcnQgZm9yIHRoaXMgYXJjaGl0ZWN0dXJlIHZlcnNpb24uCisKIGNvbW1lbnQg
IkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAyNi4wMiIKIAogY29uZmlnIEJSMl9QQUNLQUdF
X1FFTVVfVEFSR0VUX0NSSVMKZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLmhwcGEgYi9hcmNo
L0NvbmZpZy5pbi5ocHBhCmluZGV4IDU3Njg0NjlmMzAuLjE2YzgyNmRkOWUgMTAwNjQ0Ci0tLSBh
L2FyY2gvQ29uZmlnLmluLmhwcGEKKysrIGIvYXJjaC9Db25maWcuaW4uaHBwYQpAQCAtMyw4ICsz
LDYgQEAgY2hvaWNlCiAJaGVscAogCSAgQXJjaGl0ZWN0dXJlIHR5cGUgKG9yIHZlcnNpb24pIHRv
IHVzZS4KIAotY29uZmlnIEJSMl9wYXJpc2MxMAotCWJvb2wgIlBBLVJJU0MgMS4wIgogY29uZmln
IEJSMl9wYXJpc2MxMQogCWJvb2wgIlBBLVJJU0MgMS4xIgogZW5kY2hvaWNlCmRpZmYgLS1naXQg
YS9hcmNoL2FyY2gubWsuaHBwYSBiL2FyY2gvYXJjaC5tay5ocHBhCmluZGV4IDlkMjJlNDM3MWYu
LmY0YTlhYzQxZDIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJjaC5tay5ocHBhCisrKyBiL2FyY2gvYXJj
aC5tay5ocHBhCkBAIC00LDkgKzQsNyBAQAogCiBpZmVxICgkKEJSMl9ocHBhKSx5KQogCi1pZmVx
ICgkKEJSMl9wYXJpc2MxMCkseSkKLUdDQ19UQVJHRVRfQVJDSCA6PSAxLjAKLWVsc2UgaWZlcSAo
JChCUjJfcGFyaXNjMTEpLHkpCitpZmVxICgkKEJSMl9wYXJpc2MxMSkseSkKIEdDQ19UQVJHRVRf
QVJDSCA6PSAxLjEKIGVuZGlmCiAKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
