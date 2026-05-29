Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44533CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 113F484543;
	Fri, 29 May 2026 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-g3DGgGj12K; Fri, 29 May 2026 18:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCF98452A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078449;
	bh=pXMICbX1mXfbgAY7BGduKfN4pTzQotg3S85XC61NtfM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eMFTyd9bSOFCBGucqAyGhjGFzZwhmdJmFimRGcrvBP7GW1e8o2/sSWE1E/WnkWVZQ
	 BSY4YINslUOAAE0TYNNhaiZQhShg2lGVEN0C2pKyVVmTk5Ys9LjC4oAvSyOUA3uNBn
	 onr4wlrOYfwrwi7FaczKsJ1zO/DaYvJj06t4NSDZ/24b8SFHQj8etz+4BJ34Maxy2B
	 CLA22GOVV36yNLs0umEGnKpWma36NGfNmnwtscFWWhcvWNRP1kfMNe1hG9NgQ4L8uy
	 ngKwq8VnHiuYciIx2VpljcFOEGnxYtuA8FzaTGuX87zvFL94AhzX6FsinN3jErQ+z4
	 X3Lv4p5QmXjZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCF98452A;
	Fri, 29 May 2026 18:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73299288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53506423F9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCe_yxoaBQy7 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19B44423F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B44423F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19B44423F8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:14:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 592563625; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 18:13:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wT1iU-00000003AAf-1vhw;
 Fri, 29 May 2026 20:13:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 thomas.perale@mind.be
Cc: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
In-Reply-To: <7a78ce63-6abb-4614-96ed-5a9fa311da8f@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?=
 Szymanski"'s message of "Thu, 28 May 2026 17:48:57 +0200")
References: <6a166262.03c7beee.7ac76.c19c@mx.google.com>
 <7a78ce63-6abb-4614-96ed-5a9fa311da8f@armadeus.com>
Date: Fri, 29 May 2026 20:13:54 +0200
Message-ID: <87h5nqaxst.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eBkEARb4/ayRT9gzJ1W8VKhkPqRnF59oMS0fhPR370MuskWDlk5krHnWtOSQMcL7zyq18wbAheIelYK2KrzIdgOXJ4DTUAHEo+L6j2G+1uamfpl4iIpJatuTxiaK0llFbcd3fSNYw2PJ4vGOZ9vRxuP5rszK91Hpuu/Gi1+rJTKPfqvrjHmOwxohIowQD5mbo+akBGh2U8XsgPZjVe0HUtV6G9NfySHsM9tQvAGzkiPBJ61b4KZ4MgvPV5ZrRp94wZ39Hv96MjR33PipdHIiwdBSNppbVJ34jinaIyRcHspC7J4ChmtnQRamPnb61aMnnJDX2YW9KZ6BNi1UDNJs1g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YOzBms47QtFPoJj3v6lAZro1Z2ysCN9Hs8LAaaUyCro=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eBkEARb4
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-05-26
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gSGVsbG8sCiA+IE9uIDUvMjcvMjYgNTox
NyBBTSwgQnVpbGRyb290IE5vdGlmaWNhdGlvbnMgd3JvdGU6CiA+PiBDbGFzc2lmaWNhdGlvbiBv
ZiBmYWlsdXJlcyBieSByZWFzb24gZm9yIDIwMjUuMDIueAogPj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KID4+IAogLi4uPiBsaWJtb2RidXMtMy4x
LjExIHwgMQogPiBsaWJtb2RidXMgZmFpbHMgdG8gYnVpbGQgb24gMjAyNS4wMi54IHNpbmNlIEZl
YnJ1YXJ5IFsxXSBiZWNhdXNlIHRoZQogPiBwYWNrYWdlIHdhcyByZXBhY2tlZCBbMl1bM10gYW5k
IHRodXMgdGhlIGhhc2ggaGF2ZSBjaGFuZ2VkLgogPiBDYW4gY29tbWl0IGE3ZGIxZGIwODE2ZCAo
InBhY2thZ2UvbGlibW9kYnVzOiBidW1wIHZlcnNpb24gdG8gMy4xLjEyIikKID4gYmUgYmFja3Bv
cnRlZCB0byBmaXggdGhlIGlzc3VlID8KClNvdW5kcyBzZW5zaWJsZS4gVGhvbWFzLCB3aGF0IGRv
IHlvdSBzYXk/CgoKID4gWzFdIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvP3JlYXNv
bj1saWJtb2RidXMtMy4xLjExCiA+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vc3RlcGhhbmUvbGli
bW9kYnVzL2lzc3Vlcy84NDAjaXNzdWVjb21tZW50LTM5MDUwNzA0OTcKID4gWzNdIGh0dHBzOi8v
Z2l0aHViLmNvbS9zdGVwaGFuZS9saWJtb2RidXMvaXNzdWVzLzgyOSNpc3N1ZWNvbW1lbnQtMzg5
ODQ5NDM1MwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
