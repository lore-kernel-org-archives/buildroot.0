Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D4DCAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8AE60E15;
	Tue, 23 Sep 2025 13:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCBuhXe9S56j; Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF0360C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF0360C13;
	Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0D13E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAFBE60DDB
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spImLsMDw6En for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:52:38 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EBD560AAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBD560AAC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBD560AAC
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:37 +0000 (UTC)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-29-Y59_oATEMzKvFHGMmqFaLw-1; Tue,
 23 Sep 2025 09:52:33 -0400
X-MC-Unique: Y59_oATEMzKvFHGMmqFaLw-1
X-Mimecast-MFC-AGG-ID: Y59_oATEMzKvFHGMmqFaLw_1758635551
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82884195608D; Tue, 23 Sep 2025 13:52:30 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.33.218])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8D5391955F21; Tue, 23 Sep 2025 13:52:27 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Sep 2025 15:52:20 +0200
Message-ID: <20250923135223.1062683-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jbkLd6PlXxksv5Placwli7fFPMhydwphk4_Y43_o6u0_1758635551
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 1/4] configs/aspeed_ast2500evb: check hashes,
 use bootlin toolchain
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

VGhpcyBjb21taXQgYWRkcyBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkgYW5kCkJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WNl9FQUJJSEZfR0xJQkNfU1RBQkxFPXkg
aW4gdGhlCmRlZmNvbmZpZywgYnVtcHMga2VybmVsIHRvIDYuMTYuNywgYW5kIGFkZHMgY3VzdG9t
IGhhc2ggZmlsZXMgYW5kCnJlbW92ZXMgdGhlIGV4Y2VwdGlvbiBlbnRyeSBpbiAuY2hlY2twYWNr
YWdlaWdub3JlLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KLS0tCiAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxIC0KIC4uLi9hc3QyNTAwLWV2Yi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGlu
dXV4LWhlYWRlcnMuaGFzaCB8IDIgKysKIGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICB8IDIgKysKIGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2
Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggICAgICAgICB8IDIgKysKIGNvbmZpZ3MvYXNwZWVk
X2FzdDI1MDBldmJfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8IDggKysrKysrLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvcGF0Y2hlcy9saW51eC1oZWFk
ZXJzL2xpbnV1eC1oZWFkZXJzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQv
YXN0MjUwMC1ldmIvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAoKZGlmZiAt
LWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCmluZGV4IDEy
ZDExZjY3N2JlZS4uZDEwMGExNjVlZmZiIDEwMDY0NAotLS0gYS8uY2hlY2twYWNrYWdlaWdub3Jl
CisrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKQEAgLTg3LDcgKzg3LDYgQEAgY29uZmlncy9hbTU3
NHhfaWRrX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2Fu
ZGVzX2FlMzUwXzQ1X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25m
aWdzL2FyY3R1cnVzX3VjbHMxMDEyYV9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNr
SGFzaAogY29uZmlncy9hcmN0dXJ1c191Y3AxMDIwX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZv
cmNlQ2hlY2tIYXNoCi1jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBsaWJfZGVm
Y29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZp
ZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FzdXNfdGlua2VyLXNfcmsz
Mjg4X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FzdXNf
dGlua2VyX3JrMzI4OF9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaApkaWZm
IC0tZ2l0IGEvYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3BhdGNoZXMvbGludXgtaGVhZGVycy9s
aW51dXgtaGVhZGVycy5oYXNoIGIvYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3BhdGNoZXMvbGlu
dXgtaGVhZGVycy9saW51dXgtaGVhZGVycy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uZTFkYTliMzA5ZTdjCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYXNw
ZWVkL2FzdDI1MDAtZXZiL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51dXgtaGVhZGVycy5oYXNo
CkBAIC0wLDAgKzEsMiBAQAorIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4
L2tlcm5lbC92Ni54L3NoYTI1NnN1bXMuYXNjCitzaGEyNTYgIDViZTNkYWExZjk0MjdiMWJkYjM0
YzQ4OTRkOWMxYWRmYWMzOGNmZjY3NDM3NmZlMDYxMWEzMDY1NzI5YTFhODEgIGxpbnV4LTYuMTYu
Ny50YXIueHoKZGlmZiAtLWdpdCBhL2JvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9wYXRjaGVzL2xp
bnV4L2xpbnV4Lmhhc2ggYi9ib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvcGF0Y2hlcy9saW51eC9s
aW51eC5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTFkYTli
MzA5ZTdjCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3BhdGNo
ZXMvbGludXgvbGludXguaGFzaApAQCAtMCwwICsxLDIgQEAKKyMgRnJvbSBodHRwczovL3d3dy5r
ZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYworc2hhMjU2ICA1
YmUzZGFhMWY5NDI3YjFiZGIzNGM0ODk0ZDljMWFkZmFjMzhjZmY2NzQzNzZmZTA2MTFhMzA2NTcy
OWExYTgxICBsaW51eC02LjE2LjcudGFyLnh6CmRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvYXN0
MjUwMC1ldmIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoIGIvYm9hcmQvYXNwZWVkL2FzdDI1MDAt
ZXZiL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjBiZmJmMzA2ZmZiMAotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2FzcGVl
ZC9hc3QyNTAwLWV2Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKQEAgLTAsMCArMSwyIEBACisj
IExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICA4MWI0NTQzMjI3ZGIyMjhjMDNmOGExYmY1ZGRi
YzgxM2IwYmI4ZjY1NTVjZTQ2MDY0ZWY3MjFhNmZjNjgwNDEzICB1LWJvb3QtMjAyMi4wMS50YXIu
YnoyCmRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnCmluZGV4IDY0NjY2Y2MzZDcwNC4uY2E2
YTFlZjNkMzhlIDEwMDY0NAotLS0gYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZp
ZworKysgYi9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwpAQCAtMSwxMiArMSwx
NiBAQAogQlIyX2FybT15Ci1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZf
MTY9eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CitCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JP
T1RMSU49eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY2X0VBQklIRl9HTElC
Q19TVEFCTEU9eQorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CitCUjJfR0xPQkFM
X1BBVENIX0RJUj0iYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3BhdGNoZXMiCiBCUjJfVEFSR0VU
X0dFTkVSSUNfSE9TVE5BTUU9ImFzdDI1MDAtZXZiIgogQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VF
PSJBc3BlZWQgQVNUMjUwMCBFVkIiCiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJfUk9PVEZT
X1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2giCiBC
UjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNi40IgorQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNi43IgogQlIyX0xJTlVYX0tFUk5FTF9ERUZD
T05GSUc9ImFzcGVlZF9nNSIKIEJSMl9MSU5VWF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVT
PSJib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvbGludXguZnJhZ21lbnQiCiBCUjJfTElOVVhfS0VS
TkVMX1haPXkKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
