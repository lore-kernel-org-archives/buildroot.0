Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21BDCAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8992660EA3;
	Tue, 23 Sep 2025 13:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd7eYVwwYLzD; Tue, 23 Sep 2025 13:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FC660E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FC660E46;
	Tue, 23 Sep 2025 13:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6895DE7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED8981179
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHzk-0QAya_p for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:52:43 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D9F880F65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9F880F65
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D9F880F65
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:43 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-TqftmMIgOtq0CAzpMkvt9A-1; Tue,
 23 Sep 2025 09:52:38 -0400
X-MC-Unique: TqftmMIgOtq0CAzpMkvt9A-1
X-Mimecast-MFC-AGG-ID: TqftmMIgOtq0CAzpMkvt9A_1758635557
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6C8E21955F2A; Tue, 23 Sep 2025 13:52:37 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.33.218])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 142221955F21; Tue, 23 Sep 2025 13:52:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Sep 2025 15:52:23 +0200
Message-ID: <20250923135223.1062683-4-clg@kaod.org>
In-Reply-To: <20250923135223.1062683-1-clg@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1GzZoJkf-yl_HjvBtsHrM-OYVAeKUfx2usbNnL6-8Xw_1758635557
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 4/4] configs/aspeed_ast2600evb: check hashes,
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
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WN19FQUJJSEZfR0xJQkNfU1RBQkxFPXkg
aW4gdGhlCmRlZmNvbmZpZywgYnVtcHMga2VybmVsIHRvIDYuMTYuNywgYW5kIGFkZHMgY3VzdG9t
IGhhc2ggZmlsZXMgYW5kCnJlbW92ZXMgdGhlIGV4Y2VwdGlvbiBlbnRyeSBpbiAuY2hlY2twYWNr
YWdlaWdub3JlLgoKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KLS0tCiAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxIC0KIC4uLi9hc3QyNjAwLWV2Yi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGlu
dXV4LWhlYWRlcnMuaGFzaCB8IDIgKysKIGJvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2ggICAgICAgICB8IDIgKysKIGJvYXJkL2FzcGVlZC9hc3QyNjAwLWV2
Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2ggICAgICAgICB8IDIgKysKIGNvbmZpZ3MvYXNwZWVk
X2FzdDI2MDBldmJfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8IDggKysrKysrLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvcGF0Y2hlcy9saW51eC1oZWFk
ZXJzL2xpbnV1eC1oZWFkZXJzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQv
YXN0MjYwMC1ldmIvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAoKZGlmZiAt
LWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCmluZGV4IGQx
MDBhMTY1ZWZmYi4uNTA0NzFmM2Y4NTBmIDEwMDY0NAotLS0gYS8uY2hlY2twYWNrYWdlaWdub3Jl
CisrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKQEAgLTg3LDcgKzg3LDYgQEAgY29uZmlncy9hbTU3
NHhfaWRrX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2Fu
ZGVzX2FlMzUwXzQ1X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25m
aWdzL2FyY3R1cnVzX3VjbHMxMDEyYV9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNr
SGFzaAogY29uZmlncy9hcmN0dXJ1c191Y3AxMDIwX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZv
cmNlQ2hlY2tIYXNoCi1jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyBsaWJfZGVm
Y29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNv
bmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FzdXNfdGlua2VyX3Jr
MzI4OF9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaAogY29uZmlncy9hdDkx
c2FtOTI2MGVrbmZfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKZGlmZiAt
LWdpdCBhL2JvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGlu
dXV4LWhlYWRlcnMuaGFzaCBiL2JvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9wYXRjaGVzL2xpbnV4
LWhlYWRlcnMvbGludXV4LWhlYWRlcnMuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLmUxZGE5YjMwOWU3YwotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2FzcGVl
ZC9hc3QyNjAwLWV2Yi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXV4LWhlYWRlcnMuaGFzaApA
QCAtMCwwICsxLDIgQEAKKyMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9r
ZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYworc2hhMjU2ICA1YmUzZGFhMWY5NDI3YjFiZGIzNGM0
ODk0ZDljMWFkZmFjMzhjZmY2NzQzNzZmZTA2MTFhMzA2NTcyOWExYTgxICBsaW51eC02LjE2Ljcu
dGFyLnh6CmRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvYXN0MjYwMC1ldmIvcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoIGIvYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL3BhdGNoZXMvbGludXgvbGlu
dXguaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmUxZGE5YjMw
OWU3YwotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2FzcGVlZC9hc3QyNjAwLWV2Yi9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKQEAgLTAsMCArMSwyIEBACisjIEZyb20gaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y2Lngvc2hhMjU2c3Vtcy5hc2MKK3NoYTI1NiAgNWJl
M2RhYTFmOTQyN2IxYmRiMzRjNDg5NGQ5YzFhZGZhYzM4Y2ZmNjc0Mzc2ZmUwNjExYTMwNjU3Mjlh
MWE4MSAgbGludXgtNi4xNi43LnRhci54egpkaWZmIC0tZ2l0IGEvYm9hcmQvYXNwZWVkL2FzdDI2
MDAtZXZiL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCBiL2JvYXJkL2FzcGVlZC9hc3QyNjAwLWV2
Yi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5kZTM4Nzc0MWQyMDQKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9hc3BlZWQv
YXN0MjYwMC1ldmIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoCkBAIC0wLDAgKzEsMiBAQAorIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgMTZkYTM2ZDE4MzJmMDU4Y2YxYTY2NzNiNmEyZWVk
ZWVmMTI2MDU3NmMxNWU3NmM0OTk4ZTMwZDBmYjEzZDMzOSAgdWJvb3QtNjY2NzJlNWFmMzZmZTI5
NGRmNTZmOGU3OTQyMDY5ZTM5MDlmMzc5MC1naXQ0LnRhci5negpkaWZmIC0tZ2l0IGEvY29uZmln
cy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcgYi9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZi
X2RlZmNvbmZpZwppbmRleCAwNTcyZjc4NTk5MjcuLjJhNzUxNmRjZDM1MyAxMDA2NDQKLS0tIGEv
Y29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKKysrIGIvY29uZmlncy9hc3BlZWRf
YXN0MjYwMGV2Yl9kZWZjb25maWcKQEAgLTEsMTMgKzEsMTcgQEAKIEJSMl9hcm09eQogQlIyX2Nv
cnRleF9hNz15Ci1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMTY9eQor
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CitCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49
eQorQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY3X0VBQklIRl9HTElCQ19TVEFC
TEU9eQorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CitCUjJfR0xPQkFMX1BBVENI
X0RJUj0iYm9hcmQvYXNwZWVkL2FzdDI2MDAtZXZiL3BhdGNoZXMiCiBCUjJfVEFSR0VUX0dFTkVS
SUNfSE9TVE5BTUU9ImFzdDI2MDAtZXZiIgogQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJBc3Bl
ZWQgQVNUMjYwMCBFVkIiCiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJfUk9PVEZTX1BPU1Rf
SU1BR0VfU0NSSVBUPSJib2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2giCiBCUjJfTElO
VVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNi40IgorQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNi43IgogQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9
ImFzcGVlZF9nNSIKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tF
Uk5FTF9JTlRSRUVfRFRTX05BTUU9ImFzcGVlZC9hc3BlZWQtYXN0MjYwMC1ldmIiCi0tIAoyLjUx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
