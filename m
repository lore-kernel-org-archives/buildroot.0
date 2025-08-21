Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1168ECA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 09:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F3DE6162B;
	Thu, 21 Aug 2025 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTF2ITSJa-g4; Thu, 21 Aug 2025 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6A661619
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6A661619;
	Thu, 21 Aug 2025 09:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48253EC3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E879841E9
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVo39Oh23W2V for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 09:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A743083B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A743083B83
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A743083B83
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:16:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -872957066; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 Aug 2025 09:16:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1up1Ow-00Fpu6-2f;
 Thu, 21 Aug 2025 11:16:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 11:16:01 +0200
Message-Id: <20250821091601.3774405-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821091601.3774405-1-peter@korsgaard.com>
References: <20250821091601.3774405-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BWeZ3Uu72dvLV4LvkwXxt33hqDkEpaJZVDo9uLwLCGHIvZuwate6uj8TvPk79CcGHy8k58l8z8lkPTkUyBo2hwJqO286ReULeBZERXs6OEvySMwEt7zasxyr8soMPLDLs++kxkT82f1WLpIuQ2UTj/SR9afR6O2i/zzcRIMUh7Z26fnBBFCtLgU/8qYANgLOnE4ciHb6odzjOWlsR6DC3MCiUQnchJ2wSiqA7QPEM8znLQRJKfUsWxJYAP8zYGMeVh/nzW+/GGOg8qmXfkbWxv+lxOCuMaPy1s2dRHj+ZKebIupYXbd+QJck5BHYU/JY8ALhUIj9qqHL9BXdaHa8Yg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mjn8hfIazeAPLwCKgZSndZheQRk/UXvA7DeYxofXGBQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=BWeZ3Uu7
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/proftpd: fix build w/ gcc-15
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

VGhlIHNvdXJjZSBjb2RlIGNvbnRhaW5zIGEgbnVtYmVyIG9mIHZhcmlhYmxlcyBuYW1lZCAnYm9v
bCcsIHdoaWNoIGNvbmZsaWN0cwp3aXRoIHRoZSBDMjMga2V5d29yZC4gIFRoaXMgaXMgZml4ZWQg
dXBzdHJlYW0gaW4gMS4zLjkgd2l0aApodHRwczovL2dpdGh1Yi5jb20vcHJvZnRwZC9wcm9mdHBk
L2NvbW1pdC82MWJlN2ViMTRmMjAwYjk3ODA0YTNjZmE4NWZlZDUxNjYxMDY3YzYyCmJ1dCB0aGF0
IHVuZm9ydHVuYXRlbHkgZG9lcyBub3QgY2xlYW5seSBiYWNrcG9ydCB0byAxLjMuOCwgc28gaW5z
dGVhZCB1c2UKLXN0ZD1nbnUxOCB3aGVuIGJ1aWxkaW5nIHdpdGggR0NDID49IDE1IHRvIGZpeCB0
aGUgZm9sbG93aW5nIGlzc3VlczoKCnRhYmxlLmM6MTI4MDozMTogZXJyb3I6IOKAmGJvb2zigJkg
Y2Fubm90IGJlIHVzZWQgaGVyZQogMTI4MCB8IGludCB0YWJsZV9oYW5kbGluZ19zaWduYWwoaW50
IGJvb2wpIHsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+CnRhYmxl
LmM6MTI4MDozMTogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMy
M+KAmSBvbndhcmRzCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNn
YWFyZC5jb20+Ci0tLQogcGFja2FnZS9wcm9mdHBkL3Byb2Z0cGQubWsgfCA4ICsrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wcm9m
dHBkL3Byb2Z0cGQubWsgYi9wYWNrYWdlL3Byb2Z0cGQvcHJvZnRwZC5tawppbmRleCA4NGE0OTlh
NWMwLi5kNDUwNDg5Y2IwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Byb2Z0cGQvcHJvZnRwZC5tawor
KysgYi9wYWNrYWdlL3Byb2Z0cGQvcHJvZnRwZC5tawpAQCAtMjcsNiArMjcsMTQgQEAgUFJPRlRQ
RF9DT05GX09QVFMgPSBcCiAJLS13aXRoLWdudS1sZCBcCiAJLS13aXRob3V0LW9wZW5zc2wtY21k
bGluZQogCisjIHNvdXJjZSBjb2RlIGNvbnRhaW5zIGEgbnVtYmVyIG9mIHZhcmlhYmxlcyBuYW1l
ZCAnYm9vbCcsIHdoaWNoCisjIGNvbmZsaWN0cyB3aXRoIHRoZSBDMjMga2V5d29yZC4gRml4ZWQg
dXBzdHJlYW0gaW4gMS4zLjkgd2l0aAorIyBodHRwczovL2dpdGh1Yi5jb20vcHJvZnRwZC9wcm9m
dHBkL2NvbW1pdC82MWJlN2ViMTRmMjAwYjk3ODA0YTNjZmE4NWZlZDUxNjYxMDY3YzYyCisjIHNv
IGNhbiBiZSBkcm9wcGVkIHdoZW4gYnVtcGluZyB0byB0aGF0CitpZmVxICgkKEJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzE1KSx5KQorUFJPRlRQRF9DT05GX0VOViArPSBDRkxBR1M9IiQoVEFS
R0VUX0NGTEFHUykgLXN0ZD1nbnUxOCIKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElC
SUROMikseSkKIFBST0ZUUERfREVQRU5ERU5DSUVTICs9IGxpYmlkbjIKIGVuZGlmCi0tIAoyLjM5
LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
