Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29506F53D79
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 17:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E02C740A97;
	Mon, 16 Mar 2026 17:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HI_fi7Xq-NfA; Mon, 16 Mar 2026 17:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7B840AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773680586;
	bh=xE3QfRRIfffGWKI3ondYybJq5d5zkKvHcNZXsLsTrOw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4cK8XeKHAOkF3VreGkXQUjISS+BgyPuH0CcRppiG/6TnGsN+52l1EBJDyY98IQBX
	 GtLyKMQzSTND2DUJCeECjMU+vg0EVxcBIRTOh4uwjcTwsmYHSy8pvhbNDHhEVdDeM8
	 o52BQ/Lq+HwK9PBMPGwpn46kZeBtHUCw3D4+3cSNh7a8hYK9zP74LCaKUi5Tm4PHSA
	 ZSDS5KWWruimodgBAGihlKxKr9DDQPZDJ0Yy++htPbZPb07yWBl3J0QiSitE4a0UHw
	 CUF+YppjpxRrGwVRbpBul4o6EYZ2tHwB+UtC35tObkOKcD1ta1sl4DSrMa8FcZkVrk
	 0oImdrVQhsqCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7B840AA5;
	Mon, 16 Mar 2026 17:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62A241B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 542726089F
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnvTa5BECdZp for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 17:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA88C6089E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA88C6089E
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA88C6089E
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0471477;
 Mon, 16 Mar 2026 10:02:56 -0700 (PDT)
Received: from debian (unknown [10.57.12.160])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E3653F73B;
 Mon, 16 Mar 2026 10:03:02 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 16 Mar 2026 18:02:45 +0100
Message-ID: <20260316170246.2414661-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316170246.2414661-1-vincent.stehle@arm.com>
References: <20260316170246.2414661-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 1/2] support/testing: bump test_atf u-boot to
 fix the build
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

UHl0aG9uIHNldHVwdG9vbHMgaGFzIHJlbW92ZWQgdGhlIG9ic29sZXRlIHBrZ19yZXNvdXJjZXMg
cHl0aG9uIG1vZHVsZSBpbgp2ODIuMC4wLiBUaGlzIG1vZHVsZSBpcyB1c2VkIGJ5IHRoZSBiaW5t
YW4gY29tbWFuZCBpbiBVLUJvb3QgdW50aWwKdjIwMjUuMTAuClNpbmNlIHRoZSBweXRob24tc2V0
dXB0b29scyBwYWNrYWdlIGhhcyBiZWVuIHVwZGF0ZWQgdG8gdjgyLjAuMCBpbgpCdWlsZHJvb3Qs
IHRoZSBweXRob24gdGVzdCB0ZXN0cy5ib290LnRlc3RfYXRmLlRlc3RBVEZBbGx3aW5uZXIgKHVz
aW5nClUtQm9vdCB2MjAyMy4xMCBhbmQgYmlubWFuKSBmYWlscyB0byBidWlsZCB3aXRoIHRoZSBm
b2xsb3dpbmcgZXJyb3IgWzFdOgoKICBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFt
ZWQgJ3BrZ19yZXNvdXJjZXMnCgpVcGRhdGUgdGVzdF9hdGYgdG8gdXNlIGEgbW9yZSByZWNlbnQg
VS1Cb290IHYyMDI2LjAxIChhbmQgYWRkIHRoZQpkZXBlbmRlbmN5IG9uIEdOVSBUTFMpLCB0byBm
aXggdGhlIGJ1aWxkLgoKTGluazogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy8xMzUwMDk0NjMzNyBbMV0KRml4ZXM6IDUxMzY1ZmYwNjM3OSAoInBhY2th
Z2UvcHl0aG9uLXNldHVwdG9vbHM6IGJ1bXAgdG8gdmVyc2lvbiA4Mi4wLjAiKQpTaWduZWQtb2Zm
LWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KQ2M6IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfYXRmLnB5IGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkKaW5kZXggYjgyMmI5ZDM1Ny4uMDJk
MGM3NGI4NCAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYu
cHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkKQEAgLTE2LDEz
ICsxNiwxNCBAQCBjbGFzcyBUZXN0QVRGQWxsd2lubmVyKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6
CiAgICAgICAgIEJSMl9UQVJHRVRfVUJPT1Q9eQogICAgICAgICBCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKICAgICAgICAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVS
U0lPTj15Ci0gICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIw
MjMuMTAiCisgICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIw
MjYuMDEiCiAgICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJvcmFuZ2Vw
aV96ZXJvX3BsdXMyIgogICAgICAgICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CiAgICAg
ICAgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15CiAgICAgICAgIEJSMl9UQVJHRVRf
VUJPT1RfTkVFRFNfUFlUSE9OMz15CiAgICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlM
SUJGRFQ9eQogICAgICAgICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0FURl9CTDMxPXkKKyAgICAg
ICAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFM9eQogICAgICAgICBCUjJfVEFSR0VUX1VC
T09UX1NQTD15CiAgICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9InUtYm9vdC1zdW54
aS13aXRoLXNwbC5iaW4iCiAgICAgICAgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX01BS0VPUFRT
PSJTQ1A9L2Rldi9udWxsIgotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
