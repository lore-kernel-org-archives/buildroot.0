Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B474CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 12:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DBDF40D5E;
	Sun, 31 Aug 2025 12:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH262VAJM_8z; Sun, 31 Aug 2025 12:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEC4407F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CEC4407F8;
	Sun, 31 Aug 2025 12:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE7210E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B03FA407C0
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLYRan4ll8RI for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 12:47:14 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04AC34018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04AC34018A
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04AC34018A
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:47:13 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-BrXWLrfiMHmvE2ymF-9Taw-1; Sun,
 31 Aug 2025 08:40:08 -0400
X-MC-Unique: BrXWLrfiMHmvE2ymF-9Taw-1
X-Mimecast-MFC-AGG-ID: BrXWLrfiMHmvE2ymF-9Taw_1756644008
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4DC9E180048E; Sun, 31 Aug 2025 12:40:07 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6D52D18003FC; Sun, 31 Aug 2025 12:40:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Sun, 31 Aug 2025 14:39:51 +0200
Message-ID: <20250831123953.391803-3-clg@kaod.org>
In-Reply-To: <20250831123953.391803-1-clg@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8deZhyLqTVJWCDFg1D1fApnHBLAm_A2PjRPuasot4nE_1756644008
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 2/4] configs/aspeed_ast2500evb: increase kernel
 partition size
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

TGludXggaW1hZ2VzIGFyZSBncm93aW5nIGxhcmdlciwgYW5kIHRoZSBjdXJyZW50IGtlcm5lbCBw
YXJ0aXRpb24gc2l6ZQpvZiA0MzUySyBpcyBubyBsb25nZXIgc3VmZmljaWVudC4gSW5jcmVhc2Ug
dGhlIHBhcnRpdGlvbiBzaXplIHRvCmFjY29tbW9kYXRlIHRoZSBsYXJnZXIgaW1hZ2VzLgoKU2ln
bmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBib2FyZC9h
c3BlZWQvYXN0MjUwMC1ldmIvZ2VuaW1hZ2UuY2ZnIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvYXNw
ZWVkL2FzdDI1MDAtZXZiL2dlbmltYWdlLmNmZyBiL2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9n
ZW5pbWFnZS5jZmcKaW5kZXggNDk4YTcxZTRkNzVkLi41NGYyMGVmNmU3YjQgMTAwNjQ0Ci0tLSBh
L2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9nZW5pbWFnZS5jZmcKKysrIGIvYm9hcmQvYXNwZWVk
L2FzdDI1MDAtZXZiL2dlbmltYWdlLmNmZwpAQCAtMzAsMTEgKzMwLDExIEBAIGltYWdlIGZsYXNo
LmltZyB7CiAJcGFydGl0aW9uIGZpdGltYWdlIHsKIAkJaW1hZ2UgPSAiaW1hZ2UuaXRiIgogCQlv
ZmZzZXQgPSA1MTJLCi0JCXNpemUgPSA0MzUySworCQlzaXplID0gNjAwMEsKIAl9CiAKIAlwYXJ0
aXRpb24gc3BhcmUgewotCQlvZmZzZXQgPSA0ODY0SwotCQlzaXplID0gMjc5MDRLCisJCW9mZnNl
dCA9IDY1MTJLCisJCXNpemUgPSAgMjYyNTZLCiAJfQogfQotLSAKMi41MS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
