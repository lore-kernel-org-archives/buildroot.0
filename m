Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F00BC5DF80
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 08:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3F28100D;
	Tue, 18 Aug 2026 08:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsFluTMEj0G1; Tue, 18 Aug 2026 08:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C3480FFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787041839;
	bh=ssbMsb3FV2opJaYKz3VJKJpzAA/0OHwjAJEH6qtqzlI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pSIhLP2pQBTZvd+IzMGkBfwMUj9pKKtw6qf8ZBYIZmNSZGVWLlxC49KXAVJDJnvnk
	 yfKTOwsP1vkrU+CR8bDrIjmb8Jn0BpFP6jDCcyV2jD80zjoGjJoL4YCpJ9Gtw3CUUe
	 q+tpSjLZR2dfp/VT+osPH4U1ViWsapYjsV957yWh+mPx0McsXufc9Wnl4BxO2V0IBG
	 PpcnpRKyuW/v0coeiawMDKEkH/eTdMxu12ucwVw9iE+RV+wRKWZN7HT4XS98sm8dhW
	 03fDTJ6mY3ZZreVfk16xJuI9GPXf8uph073W+irjjrMevhEY8AFQPOOU9+zDqGFIA3
	 h0Ik9j36lrDRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C3480FFF;
	Tue, 18 Aug 2026 08:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AEAE333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C1EB80FFF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2rmegwkXrfw for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 08:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DB1C80FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB1C80FFE
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DB1C80FFE
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 08:30:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so39379235e9.2
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 01:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787041834; x=1787646634;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pYh4MpI3E8kOs/pDtzdOdPR8DisIqOnFJLKjRJSklHQ=;
 b=eXpDYFjDwDPa53N9VCPU/9T3XLUtlvkycbw/UYQTXoW9L2vKGkSky0YIE++go83hW2
 yAriTR+E4I9YzsM21cWm6LIexsbSQ6OTjvuYDNodLO7qRD/E0T34OInYYUpFgzdfg1U6
 3s7eGcJhVtvqK7x2diZED3ZCbWbCOOS2yErWLnpuEtG/waJGh5duhec+ZHbgXD7renw2
 nfi17bJmnGS1xY/MjiBA0YKktVkx6RvVYxSO8Nry+yDFOHxQHFei978wK9zSMT7DqZMr
 daN6HzToRk+7TH235lNpvRaFHhf6xxJTmyAXAgmY8XBda/fJD8s7e5cAuAUfJ6e/vD7s
 sVEw==
X-Gm-Message-State: AOJu0YwT6rkVQGvG1js0kALCq5dwq6rnRhJgKOqWcbx6Z6OAJpyYArQ9
 wJ+i6csvMJ/qFE/FhTuVxtNaWewYR7ATR5FEojHG4ik9Fr4nIGsss85WCDZeKgRa1UjoNaTIENq
 esDH4P2M=
X-Gm-Gg: AR+sD11CsBrAWKHswWLJCl8Zy1cS4Lp9y/ObsGCMaTn9G7SaHsAncQpLRrqPGNbHMgv
 83BF9D272idk23XoTCj2Y/e8QGihxBZp8+22CmX04bExFcXngQdHjtPv5RMiuXW/3aL+lFhCTqJ
 7G4h/2xRYlbyEmd8gzzj/xn+nOmDJJfuUOpYr2e5pABFvDWdxAhr/sdd8NwIqPXTDon+vhO056U
 Ys1YF9kTnIPlbHOj4N68grLIrcv9T1kBE8dhsxtniA9fH027xIC70jluSgAeMzanh/nbz2UcfrU
 z/dPuXZCoubEaa3xqJflx+N6dhiGj2WricGxyrfK6sxBK+/drX+fw7IfbUONe+88ASJL8DqpPnx
 6RVBgjHlFKenzXjtfqBLEXjvlj50hnG9DfeiqVvV1TLMHA2xPrAzhUrnpyLPpx7mQjDoM1zu+/n
 3C2Z/e3AAW7EaqPEoL0X+ZDZZ2H0rFh9seUzEyrr2umxkkGpAIDCJYB1G0oW3Q0DKmJYb0dEcSJ
 KNs/w==
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-4998797d111mr425367295e9.15.1787041833986; 
 Tue, 18 Aug 2026 01:30:33 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.219.175.240])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499961098cdsm254847215e9.6.2026.08.18.01.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 01:30:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 18 Aug 2026 10:28:07 +0200
Message-ID: <20260818082809.952856-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump to
 v17.11
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlbGVhc2UsIHNlZToKICAtIGh0dHBzOi8v
d3d3LnBvc3RncmVzcWwub3JnL2RvY3MvMTcvcmVsZWFzZS0xNy0xMS5odG1sCgpGaXhlcyB0aGUg
Zm9sbG93aW5nIHZ1bG5lcmFiaWxpdGllczoKCi0gQ1ZFLTIwMjYtNjQ3MQotIENWRS0yMDI2LTE0
NjYzCi0gQ1ZFLTIwMjYtNjQ2NAotIENWRS0yMDI2LTE2MjM5Ci0gQ1ZFLTIwMjYtMTQ2NjkKLSBD
VkUtMjAyNi0xNDY2NAotIENWRS0yMDI2LTE4MDI0Ci0gQ1ZFLTIwMjYtMTYyMzgKLSBDVkUtMjAy
Ni0xNDY2OAotIENWRS0yMDI2LTE0NjYyCi0gQ1ZFLTIwMjYtMTQ2NzkKLSBDVkUtMjAyNi0xNDY4
MAotIENWRS0yMDI2LTY0NjkKLSBDVkUtMjAyNi0xNTc0MQotIENWRS0yMDI2LTY0NzAKLSBDVkUt
MjAyNi0xNDY2NgotIENWRS0yMDI2LTE0NjgxCi0gQ1ZFLTIwMjYtMTQ2NzIKLSBDVkUtMjAyNi0x
NjI0MQotIENWRS0yMDI2LTE4NDA4Ci0gQ1ZFLTIwMjYtMTkzODUKLSBDVkUtMjAyNi0xNDY3MAot
IENWRS0yMDI2LTE0Njc3Ci0gQ1ZFLTIwMjYtMTQ2NzMKLSBDVkUtMjAyNi0xNTc0MgotIENWRS0y
MDI2LTE0Njc2Ci0gQ1ZFLTIwMjYtMTQ2NzgKLSBDVkUtMjAyNi0xNDY3MQoKQXNzaXN0ZWQtYnk6
IENsYXVkZTpjbGF1ZGUtc29ubmV0LTUKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jl
c3FsLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoIGIvcGFja2FnZS9w
b3N0Z3Jlc3FsL3Bvc3RncmVzcWwuaGFzaAppbmRleCA0OGJiYmQyNDQzLi5jYTBkMzUwNzA4IDEw
MDY0NAotLS0gYS9wYWNrYWdlL3Bvc3RncmVzcWwvcG9zdGdyZXNxbC5oYXNoCisrKyBiL3BhY2th
Z2UvcG9zdGdyZXNxbC9wb3N0Z3Jlc3FsLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0
cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3NvdXJjZS92MTcuMTAvcG9zdGdyZXNxbC0xNy4x
MC50YXIuYnoyLnNoYTI1Ngotc2hhMjU2ICAwNzhhMDM1MTZkY2RiZGI3MDVmZWNhZjQxNWVhM2Qx
M2E5NTZjNTg5ZTQ2ZjA5ZmVkNjhhMDZmYjAwNTk4YzkwICBwb3N0Z3Jlc3FsLTE3LjEwLnRhci5i
ejIKKyMgRnJvbSBodHRwczovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIvc291cmNlL3YxNy4xMS9w
b3N0Z3Jlc3FsLTE3LjExLnRhci5iejIuc2hhMjU2CitzaGEyNTYgIGRkMjdmMmIzYzU5ZTczZWQx
NGFhMzMyNDkwMTI0MmJmNjlhMDMyYTYzNDc4MDVmMjc0ZTYyNjAzMjJkNDI5NzkgIHBvc3RncmVz
cWwtMTcuMTEudGFyLmJ6MgogIyBMaWNlbnNlIGZpbGUsIExvY2FsbHkgY2FsY3VsYXRlZAogc2hh
MjU2ICAzZDZhZjkyZmY4YTRjMmNkZjY5YWZiMWNmNDRlZGVhNzI3OTIyZjVjZDBjZjhiNWY3MmIx
MWNkZWNhYzhmZGZkICBDT1BZUklHSFQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcG9zdGdyZXNxbC9w
b3N0Z3Jlc3FsLm1rIGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKaW5kZXggNmY2
ZjM2NzAyZi4uZDdmYWQ3YzVhMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3Rn
cmVzcWwubWsKKysrIGIvcGFja2FnZS9wb3N0Z3Jlc3FsL3Bvc3RncmVzcWwubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QT1NUR1JFU1FMX1ZFUlNJT04g
PSAxNy4xMAorUE9TVEdSRVNRTF9WRVJTSU9OID0gMTcuMTEKIFBPU1RHUkVTUUxfU09VUkNFID0g
cG9zdGdyZXNxbC0kKFBPU1RHUkVTUUxfVkVSU0lPTikudGFyLmJ6MgogUE9TVEdSRVNRTF9TSVRF
ID0gaHR0cHM6Ly9mdHAucG9zdGdyZXNxbC5vcmcvcHViL3NvdXJjZS92JChQT1NUR1JFU1FMX1ZF
UlNJT04pCiBQT1NUR1JFU1FMX0xJQ0VOU0UgPSBQb3N0Z3JlU1FMCi0tIAoyLjU0LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
