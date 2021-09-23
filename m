Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A65AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:21:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE2A61107
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE2A61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E17EA4163C;
	Thu, 23 Sep 2021 09:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g42-SFKFa70V; Thu, 23 Sep 2021 09:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36919415D1;
	Thu, 23 Sep 2021 09:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89CE31BF318
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 865EE607B0
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6SL_bysCastY for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 09:21:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C5D607AC
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 09:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D29B6610D1;
 Thu, 23 Sep 2021 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632388899;
 bh=N1ACXmkvzb4/cChczYCrrh5nih4nZabKq0dZzEaIpZY=;
 h=From:To:Cc:Subject:Date:From;
 b=apPlUBCUv1AH46OvtXK3GMzpUWQh0JxGpzHnrsrEYs58qVR4saSWHDs6VMgZnEsY8
 gEhN4Y6we5AiN/BcpOscDvMQsgQ+EGB2M6F0bT3Vldd3hkkaLx4nxSlwOKt6IQX0ZJ
 prszERdn+Rvwq+AVbG0uD7Q6XCDe73UsiYKadNIwutCdJuq8Y46e0ijuc6uRuCa3I6
 46P6nL4cmz3r9mGodj9u8xD28jctcX1ZxEvqOPSiWZyDhYg1YfUshPCUgyWlIg0tw4
 oVSvMkLezDTtzwTy6CsNLr2JbU93HT6MdqeafrwsyZ3rjPRTOeQ3ZRfosrIR1GGO2N
 vIqa/JSJxS9Ng==
From: Antoine Tenart <atenart@kernel.org>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 11:21:36 +0200
Message-Id: <20210923092136.141553-1-atenart@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/refpolicy: make sure xmllint is used
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

V2hlbiBwYXJzaW5nIGFuZCBhZGRpbmcgbW9kdWxlcyB0aGUgcmVmcG9saWN5IGJ1aWxkIHN5c3Rl
bSBjaGVja3MgdGhlaXIKdmFsaWRpdHkgdXNpbmcgeG1sbGludC4gQnkgZGVmYXVsdCB0aGUgaG9z
dCBzeXN0ZW0gdmVyc2lvbiBpcyB1c2VkIGFuZAppZiBub3QgZm91bmQgYW4gZXJyb3IgaXMgZGlz
cGxheWVkIGJ1dCB0aGUgYnVpbGQgaXMgbm90IHN0b3BwZWQuIFRoaXMKbGVhZHMgdG8gaW50ZXJl
c3RpbmcgaXNzdWVzIHdoZXJlIG1vZHVsZXMgYXJlIG5vdCBhZGRlZCBjb3JyZWN0bHkgdG8KbW9k
dWxlcy5jb25mWzFdIChvdGhlciBwb3NzaWJsZSBpc3N1ZXMgYXJlIGxpa2VseSkuCgpGaXggdGhp
cyBieSBhZGRpbmcgYSBkZXBlbmRlbmN5IG9uIGhvc3QtbGlieG1sMiBhbmQgZXhwbGljaXRseSB1
c2UgdGhlCnhtbGxpbnQgYmluYXJ5IGJ1aWx0IGJ5IEJ1aWxkcm9vdC4KClsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMTA4MzAxMTQ1MzEuMjI4NTE3OC0xLWpvc2UucGVr
a2FyaW5lbkB1bmlraWUuY29tLwoKVGVzdGVkLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBl
a2thcmluZW5AdW5pa2llLmNvbT4KU2lnbmVkLW9mZi1ieTogQW50b2luZSBUZW5hcnQgPGF0ZW5h
cnRAa2VybmVsLm9yZz4KLS0tCiBwYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsgYi9wYWNrYWdlL3JlZnBvbGlj
eS9yZWZwb2xpY3kubWsKaW5kZXggZWIzNDVkMGY5OGM5Li45NzVjM2I1ODRjNDIgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5taworKysgYi9wYWNrYWdlL3JlZnBvbGlj
eS9yZWZwb2xpY3kubWsKQEAgLTE0LDcgKzE0LDggQEAgUkVGUE9MSUNZX0RFUEVOREVOQ0lFUyA9
IFwKIAlob3N0LXBvbGljeWNvcmV1dGlscyBcCiAJaG9zdC1weXRob24zIFwKIAlob3N0LXNldG9v
bHMgXAotCWhvc3QtZ2F3aworCWhvc3QtZ2F3ayBcCisJaG9zdC1saWJ4bWwyCiAKIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfUkVGUE9MSUNZX0NVU1RPTV9HSVQpLHkpCiBSRUZQT0xJQ1lfVkVSU0lPTiA9
ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX1JFUE9fVkVSU0lP
TikpCkBAIC0zMCw2ICszMSw3IEBAIGVuZGlmCiAjIENhbm5vdCB1c2UgbXVsdGlwbGUgdGhyZWFk
cyB0byBidWlsZCB0aGUgcmVmZXJlbmNlIHBvbGljeQogUkVGUE9MSUNZX01BS0UgPSBcCiAJUFlU
SE9OPSQoSE9TVF9ESVIpL3Vzci9iaW4vcHl0aG9uMyBcCisJWE1MTElOVD0kKExJQlhNTDJfSE9T
VF9CSU5BUlkpIFwKIAlURVNUX1RPT0xDSEFJTj0kKEhPU1RfRElSKSBcCiAJJChUQVJHRVRfTUFL
RV9FTlYpIFwKIAkkKE1BS0UxKQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBs
aXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
