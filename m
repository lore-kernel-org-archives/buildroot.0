Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF09CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CD582D7C;
	Sun, 31 Aug 2025 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYVp6uhyMHoS; Sun, 31 Aug 2025 12:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E2982D2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E2982D2F;
	Sun, 31 Aug 2025 12:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF066D2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0DEC407C0
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awFMPxlbe_J0 for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 12:46:44 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F057F4018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F057F4018A
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F057F4018A
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:43 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-deaCFPrQPm6FyLemFD8fgA-1; Sun,
 31 Aug 2025 08:40:12 -0400
X-MC-Unique: deaCFPrQPm6FyLemFD8fgA-1
X-Mimecast-MFC-AGG-ID: deaCFPrQPm6FyLemFD8fgA_1756644011
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AA46518003FD; Sun, 31 Aug 2025 12:40:11 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2B6B718003FC; Sun, 31 Aug 2025 12:40:09 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Sun, 31 Aug 2025 14:39:53 +0200
Message-ID: <20250831123953.391803-5-clg@kaod.org>
In-Reply-To: <20250831123953.391803-1-clg@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7K-BcS620fWVAOnst3QqA84dxREupzNMkiXO5rrW84A_1756644011
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 4/4] configs/aspeed_*: update hostname and
 /etc/issue
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

SW5jbHVkZSB0aGUgU29DIG1vZGVsIGluIGJvdGggaG9zdG5hbWUgYW5kIC9ldGMvaXNzdWUgdG8g
bWF0Y2ggdGhlCi5kdHMgZmlsZSBuYW1lcy4KClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29h
dGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25m
aWcgfCA0ICsrLS0KIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnIHwgNCArKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNw
ZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCmluZGV4IGZmYzBlYzhkNTJiNS4uNjQ2NjZjYzNkNzA0
IDEwMDY0NAotLS0gYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZworKysgYi9j
b25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwpAQCAtMSw3ICsxLDcgQEAKIEJSMl9h
cm09eQogQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE2PXkKLUJSMl9U
QVJHRVRfR0VORVJJQ19IT1NUTkFNRT0iYXNwZWVkLWV2YiIKLUJSMl9UQVJHRVRfR0VORVJJQ19J
U1NVRT0iQXNwZWVkIEVWQiIKK0JSMl9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRT0iYXN0MjUwMC1l
dmIiCitCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IkFzcGVlZCBBU1QyNTAwIEVWQiIKIEJSMl9T
WVNURU1fREhDUD0iZXRoMCIKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL2Fz
cGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaCIKIEJSMl9MSU5VWF9LRVJORUw9eQpkaWZmIC0tZ2l0
IGEvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcgYi9jb25maWdzL2FzcGVlZF9h
c3QyNjAwZXZiX2RlZmNvbmZpZwppbmRleCAyMDU3MDkxNzc2ZjMuLjA1NzJmNzg1OTkyNyAxMDA2
NDQKLS0tIGEvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKKysrIGIvY29uZmln
cy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKQEAgLTEsOCArMSw4IEBACiBCUjJfYXJtPXkK
IEJSMl9jb3J0ZXhfYTc9eQogQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82
XzE2PXkKLUJSMl9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRT0iYXNwZWVkLWV2YiIKLUJSMl9UQVJH
RVRfR0VORVJJQ19JU1NVRT0iQXNwZWVkIEVWQiIKK0JSMl9UQVJHRVRfR0VORVJJQ19IT1NUTkFN
RT0iYXN0MjYwMC1ldmIiCitCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IkFzcGVlZCBBU1QyNjAw
IEVWQiIKIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJ
UFQ9ImJvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaCIKIEJSMl9MSU5VWF9LRVJORUw9
eQotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
