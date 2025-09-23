Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD05FCAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1A8660C13;
	Tue, 23 Sep 2025 13:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRZjv1fjd_cs; Tue, 23 Sep 2025 13:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6FCD60E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6FCD60E1C;
	Tue, 23 Sep 2025 13:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A03EE7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0748781179
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yjh71KmO16X for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:52:40 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB45880F65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB45880F65
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB45880F65
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:39 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-9L57iif0NLq74grl7T48rg-1; Tue,
 23 Sep 2025 09:52:36 -0400
X-MC-Unique: 9L57iif0NLq74grl7T48rg-1
X-Mimecast-MFC-AGG-ID: 9L57iif0NLq74grl7T48rg_1758635556
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 896C219560B2; Tue, 23 Sep 2025 13:52:35 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.33.218])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CDC1D1955F21; Tue, 23 Sep 2025 13:52:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Sep 2025 15:52:22 +0200
Message-ID: <20250923135223.1062683-3-clg@kaod.org>
In-Reply-To: <20250923135223.1062683-1-clg@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4W1K1Yap0dSgjoUOynSIjULLxJm--M4Wp0rjP-lGDUg_1758635556
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 3/4] configs/aspeed_ast2500evb: bump U-Boot to
 2025.07
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

U2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBib2Fy
ZC9hc3BlZWQvYXN0MjUwMC1ldmIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIHwgMiArLQogY29u
Zmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcgICAgICAgICAgICAgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggYi9i
b2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCmluZGV4IDBi
ZmJmMzA2ZmZiMC4uNDQwNTI2OTc3YmQ5IDEwMDY0NAotLS0gYS9ib2FyZC9hc3BlZWQvYXN0MjUw
MC1ldmIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCisrKyBiL2JvYXJkL2FzcGVlZC9hc3QyNTAw
LWV2Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKQEAgLTEsMiArMSwyIEBACiAjIExvY2FsbHkg
Y2FsY3VsYXRlZAotc2hhMjU2ICA4MWI0NTQzMjI3ZGIyMjhjMDNmOGExYmY1ZGRiYzgxM2IwYmI4
ZjY1NTVjZTQ2MDY0ZWY3MjFhNmZjNjgwNDEzICB1LWJvb3QtMjAyMi4wMS50YXIuYnoyCitzaGEy
NTYgIDBmOTMzZjZjNWE0MjY4OTViZjMwNmU5M2U2YWM1M2M2MDg3MGU0YjU0Y2RhNTZkOTUyMTFi
ZWM5OWU2M2JlYzcgIHUtYm9vdC0yMDI1LjA3LnRhci5iejIKZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
YXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnIGIvY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9k
ZWZjb25maWcKaW5kZXggY2E2YTFlZjNkMzhlLi40YzYzZjUxOGYzZmEgMTAwNjQ0Ci0tLSBhL2Nv
bmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYXNwZWVkX2Fz
dDI1MDBldmJfZGVmY29uZmlnCkBAIC0yMiw3ICsyMiw3IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0NQ
SU9fWFo9eQogQlIyX1RBUkdFVF9VQk9PVD15CiBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RF
TV9LQ09ORklHPXkKIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQotQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4wMSIKK0JSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjUuMDciCiBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RF
RkNPTkZJRz0iZXZiLWFzdDI1MDAiCiBCUjJfVEFSR0VUX1VCT09UX0NPTkZJR19GUkFHTUVOVF9G
SUxFUz0iYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3Vib290LmZyYWdtZW50IgogQlIyX1RBUkdF
VF9VQk9PVF9ORUVEU19EVEM9eQotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
