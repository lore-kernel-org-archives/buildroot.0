Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64203CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315E540674;
	Tue,  6 Oct 2026 16:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1uOXNfzTmSR; Tue,  6 Oct 2026 16:31:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 53DF44066A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304284;
	b=FkLsE2PrNOyyPsQmb57/UMAVQkWIOetWMj83xUafY03FLYH/uHUP4iWvZKP6EYhTxRPD
	 /5wJNvbeY5dbxveTz4xL1Nhh4uJ+0f/UMO3uX7YcJ4C5Mv/Pq57TY46Pbg3x7ltqTXE6p
	 B7VUtq+qH7uzyuSUdobWwhGOlar3+m35CA3/FhSofU/y5/HRILjMpruTBbWnbT5bC4GRJ
	 qDRNZS+YVGgNeqngcJK0RaCMhNx4WarPw3yf/Su+6A4gHHzMr9KWApE2hUqRU4USwE1mE
	 oxxiOiB5hg58U6+6StEgWNphM8zdEqqC78StDd3xHAsgepv5DBW37bnnG0AJdALBGcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OCmbckH2Xud62Vq4WwjpRDOxRA0iHspiHmPJuZz8oQE=;
	b=SJ9WaHdW2y1w0oF2HMkOdJVnmg5iCFbGzEAF0RChEr46bbA5BvabAGD+Nle+UJZsVW3X
	 PSvETZHsmWbxLoVLhOGeJCeY3sdlvYId4zPwtZYs2xmC5PiBJIDuuZ/6mdz6jV1RGefl6
	 72mOwDhGQKTsRAL3fkE/zh7Ne6+wvuFHniOAFyWWP6S72mMfmKTYFJyvM0AMtXMPemf05
	 BG0KnEyGagIRaz3Xt1/dSCYyQgem8UcjkcUHvxT6xxXe1Q6jYAkb2EJft131YiAc5qi25
	 pVnryKUno2iuyyk9VwRpggFHES/LIbMSj1lXjkiuFsHlYzN3F0Tuvc0+JavYMCB2+EQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dtFjdybA;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304284;
	bh=OCmbckH2Xud62Vq4WwjpRDOxRA0iHspiHmPJuZz8oQE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvd34Lb7d6Om80GF/oawj3Zna/1/2rz5OV+GKMj9GsyWX8ZLPqv3GnxOSWIvcCdwq
	 uFKUCDieBAYBPLN8+wSCkZAxDDE8MbscdXWVaDjPWdYzlolSC8YwEUzHWDFutjVnHl
	 Vt1jsBjelv5L46jxIi37x+UEo07dnqFls9uIVf7fLm+h7JiHhgagY9JNZ+S2FakIy/
	 Bx1ryyzFP99VGH9EnjvypRhnzC73Ss1dUzF5sdiWzXYAz0MZItkpX+pQosNDUG50VN
	 ePhV0xTlunvJMhmMdZ3GF5AmRlpxSF9iGaJgAlEr1paiKe9+mxSWZXIHPiq9T8eesy
	 2yWsc0eb7fjpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DF44066A;
	Tue,  6 Oct 2026 16:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB475317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A0F405AB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UIUTXls_V3i for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DC1764054D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304121;
 b=YYvT0Rrc20Y3DJGsyZneH+n7lUTfRXg4qS1566xXo1O+7Pg2UJtQkI7w7o/zdrVTSKu7
 ts+T/PvR6doSdKbMq//4xQpElPNP4cWE72A5iVxZN59evWOkTUCHvcdkecpNnHUEapIMR
 eB2By0q/dDGSKBm6jHzjTKE3OWhuP7c6XfNpTNm6lY7Su9zfwlQU8MMpOFTATvIHJr08+
 9WLXFPsYpKPt/66uyH14XyQh+X85noRteAgguPF5xzRP/zYNifwaMZYjqMo908RVr9piI
 37o16AUN8+v3TDexWYbZJtUZmBVjC9x4bjna2RMYn7UbeIXgmkMvwg4fD0zK1YOU+FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304121;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QqE6trNrNMfV9t9bbsA5M9JZeoKCh90Wles6ofv0Qmo=;
 b=OPFX8v+5t97/oDy7bD/0Mzks1gxEHtz/ifMBq09D/M9w8POO/9DhUefqAUyAd6thVR7H
 Cb0JRRHf8pCz49iv2jtWHfDXKQYuRlV3R7uXTkB35jsDkIruqQoOqkdQX+3LsSONC+ZTQ
 IZmieMkCrW6HZAiHqoaxcghHiDgJ0+a/82CKgkAQzyqvuCAGAvfxiMLuNhtivxKmtFfwe
 ql0xOMhQfAYwEMXDg2wPKWYk0LbZhjJ88VJUbkThtj6wpAJVPs3xmJiqWT99XxpN+6u09
 a3ILOaEIl25mP3VbWc6Z7KzZJCfEixVJOnrb6DyiiSkWZaiDIb4fPthRwiMXWRT522Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dtFjdybA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dtFjdybA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1764054D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=QqE6trNrNMfV9t9bbsA5M9JZeoKCh90Wles6ofv0Qmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dtFjdybAtcZ94HMG5Kfb+/SGPvbbPuPxmfv/yKcHvdQWghU+rOTo1m44fa3ukUGC3
 15qSwDOeTDpqDbJGEQ0CRVyyq8B+SeUgLriNLzcAwI8AfGR1I2a9eHOtdTOYR3f8Ke
 9L0uPmu/j8G9kqLNR9AJ7MrjOR/QwtxW4Ga4Sb/UTzdD6PVnrafu9FalLN3WcPAGXg
 JIEEeUBsis8AIzBiP5NEL/o/mhpmoJWJXOv9F3Am15bxRhrInx92UXV1u48Sw+YKW7
 ku8ytKyRAAW0E2hYEY9nkoobXKPB/9n6i2SETmHZrap3hzlJEVkej+ET1zUUu0HiEF
 HECCy6dZSqh3Q==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 mZ09p+m/BXzKuD4IpgLnPrAMZ1Xe3hHqHWS9ZJZcNFJmHd8yxKaT7oGD1wLdh0/nFwuuj4IiUj0
 glhXFq3Up8y1Abnn9zJfYFYBvG8WYnkrbXwqJbGcMnLEn9o8cOp0wVk4D3Qyk3NCl8zj+a3XSfj
 M5Bdw0/8/xMVN8AdPgusgcuNjgPSBLM6xluo2QzPi1BjqfgdrlkWkB/GydQTK064PnyNhsh+E+T
 GMSRmgQiQXZtWIiq7GE2xytfih9NP8EvVrM69gCgD+AygePRyD6GJkq3/yokrPubOjDlBl9XFQM
 d4o7f/2H+jRxhjD8SMY71RF4rKaIafd1PVh4/ubdbpSEKzw4k/P86I19sT3/PeJlv4+T/fJNmLP
 lx3HvVIkzNIL3z9z51HbxB85fWNuFRwEsMuB5FrdCK2A4zK8+/MGxPhFZi1ytNvg8b+YOvVttAl
 uAS/UrMujlRVvfrx1+qc4rc7lMD66Q+iLLTYJqyfj8JCUUux7O4d8OcdNMQOO+g+eVqqdq4X5l+
 9SN/lOj3gSk8c+HMxEC5/rTLsu7h+v1b0mcr6yQ8ud/VRaYQjVsu+m4xHB6f/OnRQEJuZu4tGd5
 //yZpdIHykivDJ4d5RT6jPAhM1uBDZM6BdCBFuYUp4Pzlb8=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D65EEA4C53C2;
 Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-0uu0;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:50 +0200
Message-ID: <20261006162106.3439373-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 09/84] package/boost: program_options needs
 container
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 736255a33c..406a5b4d6c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -311,6 +311,7 @@ comment "boost-process needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
+	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  The program_options library allows program developers to
 	  obtain program options, that is (name, value) pairs from the
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
