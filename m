Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C50DCA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 12:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355BE40910;
	Sun, 31 Aug 2025 12:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idvCIAO4QrkG; Sun, 31 Aug 2025 12:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B13540830
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B13540830;
	Sun, 31 Aug 2025 12:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69190278
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FC1840830
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BDLlevNOdb5 for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 12:46:29 +0000 (UTC)
X-Greylist: delayed 380 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 31 Aug 2025 12:46:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8283B407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8283B407F8
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=207.211.30.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8283B407F8
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 12:46:29 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-Lf2064zmOoWZaWit6CT-RQ-1; Sun,
 31 Aug 2025 08:40:06 -0400
X-MC-Unique: Lf2064zmOoWZaWit6CT-RQ-1
X-Mimecast-MFC-AGG-ID: Lf2064zmOoWZaWit6CT-RQ_1756644005
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 821C3180044F; Sun, 31 Aug 2025 12:40:04 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.9])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B207618003FC; Sun, 31 Aug 2025 12:40:02 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Sun, 31 Aug 2025 14:39:50 +0200
Message-ID: <20250831123953.391803-2-clg@kaod.org>
In-Reply-To: <20250831123953.391803-1-clg@kaod.org>
References: <20250831123953.391803-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oKzG5QRBJtaTghD2mQUJ_xT5IqD02ruS2BatNbZif1c_1756644005
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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

U2luY2UgTGludXggNi41IG1vdmVkIC5kdHMgZmlsZXMgdG8gdmVuZG9yIHN1Yi1kaXJlY3Rvcmll
cywgYWRqdXN0IHRoZQpwb3N0LWltYWdlLnNoIHNjcmlwdCB0byB0YWtlIGludG8gYWNjb3VudCB0
aGUgJ2FzcGVlZC8nIHByZWZpeCBpbiAuZHRzCmZpbGUgbmFtZXMuCgpTaWduZWQtb2ZmLWJ5OiBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGJvYXJkL2FzcGVlZC9jb21tb24v
cG9zdC1pbWFnZS5zaCAgIHwgNCArKy0tCiBjb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNv
bmZpZyB8IDYgKysrLS0tCiBjb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2RlZmNvbmZpZyB8IDYg
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9ib2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2ggYi9ib2FyZC9h
c3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2gKaW5kZXggZWE2NWE0OWFmZmYwLi44Yzk1M2UwMzhj
OWYgMTAwNzU1Ci0tLSBhL2JvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaAorKysgYi9i
b2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2gKQEAgLTMsOCArMyw4IEBACiBCT0FSRF9E
SVI9IiQoZGlybmFtZSAkMCkiCiBta2ltYWdlPSRIT1NUX0RJUi9iaW4vbWtpbWFnZQogCi1CT0FS
RF9EVD0kKHNlZCAtbiBcCi0gICAgICAgICAgICdzL15CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9E
VFNfTkFNRT0iXChbYS16MC05XC1dKlwpLioiJC9cMS9wJyBcCitCT0FSRF9EVD0kKHNlZCAtbnIg
XAorICAgICAgICAgICAtZSAnc3xeQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9Iihh
c3BlZWQvKT8oW2EtejAtOVwtXSopLioiJHxcMnxwJyBcCiAgICAgICAgICAgICR7QlIyX0NPTkZJ
R30pCiAKIHNlZCAtZSAicy8lQk9BUkRfRFRCJS8ke0JPQVJEX0RUfS5kdGIvIiBcCmRpZmYgLS1n
aXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVk
X2FzdDI1MDBldmJfZGVmY29uZmlnCmluZGV4IDIzMTIyNDJlNjQwNi4uZmZjMGVjOGQ1MmI1IDEw
MDY0NAotLS0gYS9jb25maWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZworKysgYi9jb25m
aWdzL2FzcGVlZF9hc3QyNTAwZXZiX2RlZmNvbmZpZwpAQCAtMSwxNyArMSwxNyBAQAogQlIyX2Fy
bT15Ci1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTc9eQorQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE2PXkKIEJSMl9UQVJHRVRfR0VORVJJ
Q19IT1NUTkFNRT0iYXNwZWVkLWV2YiIKIEJSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iQXNwZWVk
IEVWQiIKIEJSMl9TWVNURU1fREhDUD0iZXRoMCIKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJ
UFQ9ImJvYXJkL2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaCIKIEJSMl9MSU5VWF9LRVJORUw9
eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE3LjciCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI2LjE2LjQiCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0iYXNwZWVkX2c1
IgogQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJvYXJkL2FzcGVlZC9h
c3QyNTAwLWV2Yi9saW51eC5mcmFnbWVudCIKIEJSMl9MSU5VWF9LRVJORUxfWFo9eQogQlIyX0xJ
TlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Ci1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFN
RT0iYXNwZWVkLWFzdDI1MDAtZXZiIgorQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
ImFzcGVlZC9hc3BlZWQtYXN0MjUwMC1ldmIiCiBCUjJfUEFDS0FHRV9NVEQ9eQogQlIyX1RBUkdF
VF9ST09URlNfQ1BJTz15CiBCUjJfVEFSR0VUX1JPT1RGU19DUElPX1haPXkKZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnIGIvY29uZmlncy9hc3BlZWRfYXN0
MjYwMGV2Yl9kZWZjb25maWcKaW5kZXggMTA0ZjY4NTIwMGVmLi40ZTQ5YzRhY2JlYWIgMTAwNjQ0
Ci0tLSBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3Mv
YXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCkBAIC0xLDE2ICsxLDE2IEBACiBCUjJfYXJtPXkK
IEJSMl9jb3J0ZXhfYTc9eQotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81
XzE3PXkKK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xNj15CiBCUjJf
VEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9ImFzcGVlZC1ldmIiCiBCUjJfVEFSR0VUX0dFTkVSSUNf
SVNTVUU9IkFzcGVlZCBFVkIiCiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJib2FyZC9hc3BlZWQvY29tbW9uL3Bvc3QtaW1hZ2Uuc2giCiBCUjJf
TElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNy43IgorQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xNi40IgogQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05G
SUc9ImFzcGVlZF9nNSIKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJTlVY
X0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFzcGVlZC1hc3QyNjAwLWV2YiIKK0JSMl9MSU5VWF9L
RVJORUxfSU5UUkVFX0RUU19OQU1FPSJhc3BlZWQvYXNwZWVkLWFzdDI2MDAtZXZiIgogQlIyX1BB
Q0tBR0VfTVREPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQogQlIyX1RBUkdFVF9ST09URlNf
Q1BJT19YWj15Ci0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
