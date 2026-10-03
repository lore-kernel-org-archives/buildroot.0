Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A245CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A5D340FF5;
	Sat,  3 Oct 2026 07:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4d87ISWKJdL; Sat,  3 Oct 2026 07:16:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2F2D941001
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011814;
	b=RIDwbEA5kTxfQFhMxGVvJZQcfMK5kFi2ndmjqP5ma5M7Inb0sMxTIrx+ehy3O2umJMtJ
	 0Q/vnpG/AA3pkTHc8dlQxwQ6M6hYookDCaVOcncjV6R6xL9JuHZCqAH66S35X+DltW+Ob
	 9HK235Kzxp8e6AYpYShU5yULYWpbvq0H1WKVosLWaYJRBC0EqSHpd660sJUrzhfmaS/Bx
	 X/8tUq8s3t6UJy7/KDOFf5ibt7rxtD7zJymrR8XOhfoF8oFJXKq4AxHf+ySBbkYiz4Rvc
	 d/yK6LPYh+g8BElkAtW+D7akB/qxpzyg7BG1ZJxiea1007y8psw9Pu6zjsOZWcaGGoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r0h7AsYauYrwW6g+5b0sFsal4oDKI9TBtOk6xXbduNM=;
	b=jH6Odf+HSIGUa2XI++pHHrVn6cxHqkihU9PaEghauOZ2d2pr+fCD67+xbwCh/AULvdsy
	 icQP4y+Vi3isTCIcJTVprdAFSlfauH7SonIVOOtEJ3hQvYzy9gjvq2yUjBBwLibtUvbAt
	 1GjsMFaouJryeMMuPLBGMty4Pl19KW/VwaHmXT0i83SywZzRlMVuibpFxF1iQC7qZ/Ze7
	 GYZgRcstDlUwm5TfClOlFr1GUA6Ds5llRh5X88MNzHafe3x589rrpcCPKIw6EiL2myeBD
	 Y2OW5xGQroIrVu6fQITEfvFCDmz2AXMA3f1KQAdPWU+6gWyG//dcDxxFAe6EQuwh8Sw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011814;
	bh=r0h7AsYauYrwW6g+5b0sFsal4oDKI9TBtOk6xXbduNM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OjzUzwrihyRAosgHRUfYLDXhDQ/067sTVysoNiwjn4ofXl//XCsnc+Qa8fhxR+hUP
	 SHFSclEw3Qgy5pP8Gb8Mjp73RrnXQDo8FSCPHfCvbSyouChkfLafBkO0bp+fD0L+P3
	 ftrZ2LWAHvkHUZXPmjqhBK4NUarhSKJX48efqZNq3mAIU52HQev+AqAgaFoR6Fm38G
	 lRWSAWZkNglYBb9vRheOBHeeUggfCQ4Kg2yiCDRtwTVy4hcMzqbpASSwad8NNkaXAS
	 Q7dve4MEPpf5BHDR94LcqqUm8TbZETh3RVw8WJGBw4YafGvVtuGqnbRNYMkMFyDO7z
	 zdOaTx2jt8q3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2D941001;
	Sat,  3 Oct 2026 07:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E2E1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 802B240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DA0xJcQQI4re for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 850E040050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011811;
 b=C4AkbBPhdH+PuGTQnklNCX+pxrygOCe/fp78hyNMvq6sOwG4MdP3lq4UaONwfwoEl/5Z
 OKNEJporeMi+PxZCmRtbwaj+IaQeIENbzkAedUbHfRhMLrtBV6vfMgRX+QX0f1cLqfQAH
 +iZt3iwdlg8vbPc79H5dkpOoClRO8TkqdPXeVAysvdndDygkxklFs7+ndrHv1JZE5N0M5
 IYYE3G2lNxM2BNnbSezonQTZU3g6J/ff1EmtEXUKB5ngjEweZEtkmPcO8uT38NRjZK8mN
 Lo3SqMI/h8FYie6moXpSyO7n/cMoObQiG42wvmolL9Ul0SOg93b3dvDnNI1lmOHM0KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011811;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/PwAp8uAuhH18NEkS7dV2NeIgsX9K7bZ1uzaRj4m61c=;
 b=TSapr2U2h8KbnmHY1verX9m5tvoZ5O8Bn7KmzantgA3t/Y7R92Axm0utr6GO70nxuulg
 tzqPCPwmcgI83giuiGuDNTlq+hNjzI8P9wt3Y7OHHUNBL/eH7wtvDAbobTzPUacY2ofAP
 dY+HLllpsSwRJSCoRvyK3DYGVlvhi/YfKiYN2TPStjoBDsHSRvXCJYp207GE6s4aUzFa/
 Vd6AKEXS6L5SohmNDM1DYI0YnMMJFkFECiZRASgVnVY9B54eQNl6BF/YoRsguhJYn8/eR
 HKzdJJ1A0gu03V9PlYw/VSrD4cO3wtEhVXR780+8ZV7wfAjBmh31xSGzqaQmbx2Fp3g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=korARbGy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=korARbGy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850E040050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=/PwAp8uAuhH18NEkS7dV2NeIgsX9K7bZ1uzaRj4m61c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=korARbGy6kvuQv5hFSbFU4kHuaap9D9lAxvvpohA9JHeXJIHLxWsT0hLbPVDp5nPZ
 uiGZWcdMIKMQfvQW3AADfY/L+jUqUVmaujMucW7lshKTXdlriEMZE/OILtImnpwWdW
 5uGpUBtVT+ynnD+KFeA5MjzFiYMuYagxZ5FM0so7JUv1+f9HD0vnyiM/ntGU4a3mtk
 mu5k93g4AxislKPydyMcuwmZXWO9CIwRVxjnVCSDPuRiDYcws0TCW9HGmTzn0pkoGQ
 Wk18CoQt1ahL/z6OWVX6IOGLKICdeVv+JM6V5UcLEi+Zkl+4neOtwu6Dn4NRYiKCjR
 L/iiiWhxOFttw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 cty5IJWoW8gFAPyN8WDLtZlXIvWgnU0CX4/8IYW8h2f6so8CKIxKJwyxsFh26LQ2XWZO9J5YRQw
 0wcz2ffjYKssnnPlNotLdQLPuJiJcowLlJH37fICh5lmJfAKwN1CWGp7mIdHFg4IQGHRN51w0ra
 Na9dM10WpS6hHsSkXFS6UgHDy0wt4AQTLQouVPaAxcVaGnCLZkWpMhskTC8h9GMclSUW/Qq51od
 kBItpC2aqJ3sJzhCOCp36QTegY5HOVNKmTZs+xvBxknQvU6izrokfmL83WKMBlpjGQvkioy25Cg
 VZ9zdGyBrsl4clwmFfVCfPyA2r6h92uCAatGNh7QXC/p6H57P20VoHuZxRH5/T+JEsiWHC525nT
 otBl5WiTP7XFv3xLTfsTn8PHgKOLoVC7UaWlnwfm6fMkr0ftAIm43VvE0/YMRkUqMldnR1lhpSY
 WtWwWEi3wjkR1l9k1c0KqvGwgyxQA7ya4vFDlOrrGSA40ulfxTAfadWSdhvF1YL6ipmA3FpQsRG
 A8SQCru0L1k/otBwovPbRPCdDon8jC8Ee19OIpxLPRLLgxmE0LrYFSt6dgSQA0iuf8rjEncE1t3
 L5rS44kl640pW41VOeCvtdTmnULUVV3UGhHirpDLyhc1avSpquJMyMGRAKOYqTLK
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5A21A4C5466;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-0oRt;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:47 +0200
Message-ID: <20261003070128.1295458-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 015/114] package/python-daphne: bump version to
 4.2.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-daphne/python-daphne.hash | 4 ++--
 package/python-daphne/python-daphne.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index e0619c6463..fbafd0a199 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  10ce77cd61e3b048bac7fe4539800f37  daphne-4.2.1.tar.gz
-sha256  5f898e700a1fda7addf1541d7c328606415e96a7bd768405f0463c312fcb31b3  daphne-4.2.1.tar.gz
+md5  2418ee7efc15d3ba3f44a05f78808929  daphne-4.2.3.tar.gz
+sha256  1c458f81926b37301cadc8ec1b6316d9a5db53fba061fc4826610395fe5d5c81  daphne-4.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index 69f5a9f466..065ac5e8f2 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 4.2.1
+PYTHON_DAPHNE_VERSION = 4.2.3
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/cd/9d/322b605fdc03b963cf2d33943321c8f4405e8d82e698bf49d1eed1ca40c4
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/ed/23/81d442839029f3f343e536650ee49dbfb5a444520876fadb5b5f19f33c02
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
