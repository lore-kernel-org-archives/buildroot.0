Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4FDEB7EA4
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5AEC40612;
	Wed,  4 Mar 2026 08:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJjm-dt7hBvL; Wed,  4 Mar 2026 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE7D40661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772612574;
	bh=Ao13w/Jo/w7F6iCTpH2merp6cFwR+ZYBzxacFWV4p0A=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FTSGWYO4Jr9/M7+q4FFPAmlLEJcvNA7rG6JjmKfRViMnvU0PDzg3/38yw7EAr6pnL
	 IwCPz093wx25sKx+ae4NsynKerbly/RAuCjfruqlRneFqqf/TG19E5EeckMStcOrYA
	 AGs/ZhEXXesHZf0pOIkg3OmZnD+to0xUpcF016ZuoVhhtZcR+oIATF4aBHN6qv0R2W
	 0lGRFmMGxtdqnGzkojRSo6H39a72f93TaMc9y5ohSI6rGhyC95Wz/lTKbPc/FXbYmD
	 ksE88lzYUBYNLssu33BtVX18SwCQtyCqEvad5lZuUAZpCdpodRxPnSfJ/VjkV2jAsE
	 n/l/LvH4GiOdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE7D40661;
	Wed,  4 Mar 2026 08:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F64C231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15827810CC
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8gdcVicaoWv for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A97E8104F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A97E8104F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A97E8104F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 84F9B4E42536
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5CF315FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C69B5103696E4; Wed,  4 Mar 2026 09:22:46 +0100 (CET)
Date: Wed, 04 Mar 2026 09:22:40 +0100
MIME-Version: 1.0
Message-Id: <20260304-openscap_nptl_threads-v1-2-9dff92cc37e0@bootlin.com>
References: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
In-Reply-To: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772612567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WeTE1xxY5NytnUZOyGMRvS03wZncIX0CqzO4unBy2pk=;
 b=ZT6xVXIn5pSIUgPeKVg+BTrF1qWBOEYy1rJA+yWSeMQ3xjOfhev9xVIuoHuBvymm7C32H9
 1RyVTQSFrUEVUHXvogo8VaZiLwTnKgkAfA3L4mA454v6Z7zR4T85KAjSDIwv7n6tJx2wRD
 KtqTR9+vVLRXUha4d7oXYPH+vFEmky53/V39wi1lUI7RZUdvZfSIh1a0Di4F/EEjC5L2pT
 kr+M1UsTKeMrXTRDwpEIbWUTXA73FeARQbR6CmncWLT4NbvRLGDu/OcuDDK9Woa9NQnh4y
 PYWIH3C27cCzqIz+G047/YNGt+AJvmhgDddOPc1P82H2GvWE2NQo2n8Skg+F7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZT6xVXIn
Subject: [Buildroot] [PATCH 2/2] package/openscap: add dependency on NPTL
 threads
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T3BlbnNjYXAgY29kZSBpcyBjYWxsaW5nIE5QVEwgZnVuY3Rpb25zIHN1Y2ggYXMgcHRocmVhZF9i
YXJyaWVyX3dhaXQsCndoaWNoIGFyZSBub3QgcHJvdmlkZWQgYnkgcHRocmVhZHMuCgpNYWtlIHRo
ZSByZXF1aXJlbWVudCBvbiBOUFRMIHRocmVhZHMgZXhwbGljaXQgYnkgYWRkaW5nIHRoZQpjb3Jy
ZXNwb25kaW5nICBkZXBlbmRlbmN5IGluIG9wZW5zY2FwIENvbmZpZy5pbi4KCkZpeGVzOiBodHRw
czovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMmQ5NDc1YjdjZDJkNDEzYzk5ZDYy
MzNlYmIyMTNiYzkzMmYxZTM5OC8KU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4
aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiB8
IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3Bl
bnNjYXAvQ29uZmlnLmluCmluZGV4IGI1ZjgwOTMxNWM5MS4uZmE3NzkwNTg5OGFmIDEwMDY0NAot
LS0gYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL29wZW5zY2FwL0Nv
bmZpZy5pbgpAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TQ0FQCiAJYm9v
bCAib3BlbnNjYXAiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9T
VVBQT1JUUyAgIyBsaWJnY3J5cHQKIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkbGZj
bi5oCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwKIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfTElCQ1VSTAogCSMgSW4gdGhlb3J5IHNob3VsZCBidWlsZCB3aXRob3V0IGNy
eXB0bywgYnV0IGluIHByYWN0aWNlIGl0CiAJIyBkb2Vzbid0OiBodHRwczovL2dpdGh1Yi5jb20v
T3BlblNDQVAvb3BlbnNjYXAvaXNzdWVzLzIzMTAKQEAgLTE5LDUgKzIwLDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX09QRU5TQ0FQCiAJICBodHRwczovL3d3dy5vcGVuLXNjYXAub3JnLwogCSAgaHR0
cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQL29wZW5zY2FwCiAKLWNvbW1lbnQgIm9wZW5zY2FwIG5l
ZWRzIGxpYmdwZy1lcnJvciBhbmQgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5IgotCWRl
cGVuZHMgb24gIUJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUl9BUkNIX1NVUFBPUlRTIHx8IEJSMl9T
VEFUSUNfTElCUworY29tbWVudCAib3BlbnNjYXAgbmVlZHMgbGliZ3BnLWVycm9yIGFuZCBhIHRv
b2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkgYW5kIE5QVEwgdGhyZWFkcyIKKwlkZXBlbmRzIG9u
ICFCUjJfUEFDS0FHRV9MSUJHUEdfRVJST1JfQVJDSF9TVVBQT1JUUyB8fCBcCisJCUJSMl9TVEFU
SUNfTElCUyB8fCBcCisJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwKCi0tIAoyLjUz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
