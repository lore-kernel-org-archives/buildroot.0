Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB83CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 12:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F091D610AA;
	Sun, 31 Aug 2025 12:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USF0KDfrJfIN; Sun, 31 Aug 2025 12:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D0C610C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D0C610C9;
	Sun, 31 Aug 2025 12:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46C9E10E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C61182D7C
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkTQdjPOkPRB for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 12:46:45 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3400F82CAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3400F82CAC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3400F82CAC
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:45 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-38N4-v1gPH6cHa88eLVCfg-1; Sun,
 31 Aug 2025 08:40:10 -0400
X-MC-Unique: 38N4-v1gPH6cHa88eLVCfg-1
X-Mimecast-MFC-AGG-ID: 38N4-v1gPH6cHa88eLVCfg_1756644009
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 88DA21800285; Sun, 31 Aug 2025 12:40:09 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0C0D1180044F; Sun, 31 Aug 2025 12:40:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Sun, 31 Aug 2025 14:39:52 +0200
Message-ID: <20250831123953.391803-4-clg@kaod.org>
In-Reply-To: <20250831123953.391803-1-clg@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGEZWuXqbMHpievhUTHcTK_Jgw52kil2_2rM-6n1PrI_1756644009
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 3/4] configs/aspeed_ast2600evb_defconfig: bump
 U-Boot to commit 66672e5af36f
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

VXNlIGEgbmV3ZXIgY29tbWl0IElEICgyMDIzLTA3LTI0KS4gV2hpbGUgbm90IHRoZSBsYXRlc3Qs
IHRoaXMgY29tbWl0Cm1hcmtzIGEgc2lnbmlmaWNhbnQgbWlsZXN0b25lIGluIHRoZSBvbmdvaW5n
IGRldmVsb3BtZW50IGFuZCBzdXBwb3J0Cm9mIEFTVDI2MDAgU29DIGJvYXJkcy4KClNpZ25lZC1v
ZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogY29uZmlncy9hc3Bl
ZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNjAw
ZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCmluZGV4
IDRlNDljNGFjYmVhYi4uMjA1NzA5MTc3NmYzIDEwMDY0NAotLS0gYS9jb25maWdzL2FzcGVlZF9h
c3QyNjAwZXZiX2RlZmNvbmZpZworKysgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNv
bmZpZwpAQCAtMTgsNyArMTgsNyBAQCBCUjJfVEFSR0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJP
T1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQogQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fR0lUPXkK
IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy91LWJvb3QuZ2l0IgotQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19WRVJTSU9OPSJm
MmI4MmZhNGJhMTdlZDgwOTFmZTc2YzI4NDIyMDAwNjY0NWEyOTNiIgorQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fUkVQT19WRVJTSU9OPSI2NjY3MmU1YWYzNmZlMjk0ZGY1NmY4ZTc5NDIwNjllMzkw
OWYzNzkwIgogQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImV2Yi1hc3QyNjAwIgog
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQogQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fTUFL
RU9QVFM9IkRFVklDRV9UUkVFPWFzdDI2MDBhMS1ldmIiCi0tIAoyLjUxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
