Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C7CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 05:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C837261B40;
	Fri, 26 Sep 2025 05:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmGVDCNV5uAq; Fri, 26 Sep 2025 05:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED0E61B39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED0E61B39;
	Fri, 26 Sep 2025 05:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 411E212D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 05:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4434195B
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 05:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Br2dlS1kin4E for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 05:57:54 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8FA641959
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8FA641959
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8FA641959
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 05:57:52 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-lsPxdz9vM9OTgIJbyKcRyw-1; Fri,
 26 Sep 2025 01:57:47 -0400
X-MC-Unique: lsPxdz9vM9OTgIJbyKcRyw-1
X-Mimecast-MFC-AGG-ID: lsPxdz9vM9OTgIJbyKcRyw_1758866267
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 24AA6180034F; Fri, 26 Sep 2025 05:57:46 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.226.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0B89E1800446; Fri, 26 Sep 2025 05:57:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Fri, 26 Sep 2025 07:57:38 +0200
Message-ID: <20250926055738.319052-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7VdrPYBATgBCbmDcxS2vSsb_EylpgmbFoAQURkouClY_1758866267
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 1/1] configs/aspeed_ast2500evb: select CPU
 arm1176jzf
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

VGhlIEFzcGVlZCBBU1QyNTAwIFNvQyBmYW1pbHkgZW1iZWRzIGEgQVJNMTE3NkpaRiAzMi1iaXQg
Q1BVLiBzZWxlY3QKdGhpcyBhcmNoaXRlY3R1cmUgdmFyaWFudCBmb3IgdGhlIHRhcmdldC4KCkFs
bywgZml4ZXMgQ0kgdGhpcyBmYWlsdXJlOgoKICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExNDgxMjM4MzQxCgpXQVJOOiBkZWZjb25maWcgLi9jb25m
aWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBjYW4ndCBiZSB1c2VkOgogICAgICBNaXNz
aW5nOiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjZfRUFCSUhGX0dMSUJDX1NU
QUJMRT15CgpGaXhlczogNmU1ZTZmOThmZDczICgiY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yjog
YnVtcCBrZXJuZWwgdG8gNi4xNi43LCBjaGVjayBoYXNoZXMsIHVzZSBib290bGluIHRvb2xjaGFp
biIpClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQog
Y29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJf
ZGVmY29uZmlnIGIvY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcKaW5kZXggYTk1
NTMzNGE5MTJhLi4yZWE1ZWQ3NzRlOGUgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI1
MDBldmJfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmln
CkBAIC0xLDQgKzEsNSBAQAogQlIyX2FybT15CitCUjJfYXJtMTE3Nmp6Zl9zPXkKIEJSMl9UT09M
Q0hBSU5fRVhURVJOQUw9eQogQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WNl9FQUJJSEZfR0xJQkNfU1RBQkxFPXkKLS0g
CjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
