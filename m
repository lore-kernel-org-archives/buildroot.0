Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA0CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 12:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA93610D0;
	Sun, 31 Aug 2025 12:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBd9n7-B7b_t; Sun, 31 Aug 2025 12:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C072610D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C072610D2;
	Sun, 31 Aug 2025 12:46:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6BEA10E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5DB40830
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf-fwfOK4DQF for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 12:46:24 +0000 (UTC)
X-Greylist: delayed 376 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 31 Aug 2025 12:46:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37363407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37363407F8
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37363407F8
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:22 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-BSXynAW4MNav-yFDiD7r8g-1; Sun,
 31 Aug 2025 08:40:02 -0400
X-MC-Unique: BSXynAW4MNav-yFDiD7r8g-1
X-Mimecast-MFC-AGG-ID: BSXynAW4MNav-yFDiD7r8g_1756644002
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 049CB195609D; Sun, 31 Aug 2025 12:40:02 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF4B118003FC; Sun, 31 Aug 2025 12:39:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Sun, 31 Aug 2025 14:39:49 +0200
Message-ID: <20250831123953.391803-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xRHgXh4rEHSbSyNsMjOXAa8bD-fOjGjLuADumV98U4k_1756644002
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 0/4] configs/aspeed-*: Linux and U-Boot versions
 update
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

SGVsbG8sCgpUaGlzIHNlcmllcyB1cGRhdGVzIHRoZSBMaW51eCBhbmQgVS1Cb290IHZlcnNpb25z
IGZvciB0aGUgQXNwZWVkCmFzdDI1MDBldmIgYW5kIGFzdDI2MDBldmIgYm9hcmRzLiBUaGUgZmlu
YWwgcGF0Y2ggaXMgYW4gb3B0aW9uYWwKaW1wcm92ZW1lbnQgdGhhdCBhZGRzIHRoZSBTb0MgbW9k
ZWwgdG8gYm90aCB0aGUgaG9zdG5hbWUgYW5kCi9ldGMvaXNzdWUgb2YgdGhlIGdlbmVyYXRlZCBp
bWFnZS4KCkJ1aWxkcyBmb3IgYm90aCBkZWZjb25maWdzIHdlcmUgY3JlYXRlZCBvbiBnaXRsYWIg
OgoKICBodHRwczovL2dpdGxhYi5jb20vbGVnb2F0ZXIvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzIw
MTM1ODg5ODkKCmFuZCB0aGUgaW1hZ2VzIHdlcmUgdGVzdGVkIHVzaW5nIFFFTVUuCgpUaGFua3Ms
CgpDLgoKCkPDqWRyaWMgTGUgR29hdGVyICg0KToKICBjb25maWdzL2FzcGVlZC0qOiBidW1wIExp
bnV4IHRvIDYuMTYuNAogIGNvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmI6IGluY3JlYXNlIGtlcm5l
bCBwYXJ0aXRpb24gc2l6ZQogIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnOiBi
dW1wIFUtQm9vdCB0byBjb21taXQKICAgIDY2NjcyZTVhZjM2ZgogIGNvbmZpZ3MvYXNwZWVkXyo6
IHVwZGF0ZSBob3N0bmFtZSBhbmQgL2V0Yy9pc3N1ZQoKIGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2
Yi9nZW5pbWFnZS5jZmcgfCAgNiArKystLS0KIGJvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFn
ZS5zaCAgICAgfCAgNCArKy0tCiBjb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyAg
IHwgMTAgKysrKystLS0tLQogY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcgICB8
IDEyICsrKysrKy0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBk
ZWxldGlvbnMoLSkKCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
