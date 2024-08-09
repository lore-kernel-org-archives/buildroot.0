Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31683C531DE
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29FC8447D;
	Fri,  9 Aug 2024 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gKVogoPJFPY; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C17008447E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C17008447E;
	Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16C6B1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0451361385
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJPmul5cIc23 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 334B661381
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334B661381
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 334B661381
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:18:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso2973407e87.0
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 12:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723231118; x=1723835918;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8g14rvEXyVWECR8BOmMGxR9izWa8LL0OXu5uXqTXoMg=;
 b=n8DLndVh75wbmiFKaj1EgH93bsuMc+HUsmdeKw26CNu1j7gAjHXnnnEgQdNvcIl5z4
 loKRTqjTF7FYVMgy8t4JJmXiBPe7RYwZF1112XZshr06MnusNFUueicR7YEKlonw0TIj
 XLIPZejvQ3dKm9R5fwaZ7mxPGI17EzwfvfFM6xIlQ2uGfBu94uL5WuPoaBt3Csc6TwAv
 pZTretUJDXBc0bX4m09LSnUpSqP2aUaNftPPLSqKvnJr+dcuT49tfob16asQBt2IzpMy
 yrEQRL8tomG+lDnmaBh49z9snyIkH8uaJECoXocXiPinJqDCDFYXOgMEDW5KHHjKCoAL
 kblQ==
X-Gm-Message-State: AOJu0YxVpQ9FtROY+yzhMWUhth2lcnS+lTgJ5LFQQkXc8GaRloHPy0MV
 z7xPwgghxgluE6jSQYnNkYTbf/guVFURhfXKhZOW8tAdqgaElWPrf6CrEdsA
X-Google-Smtp-Source: AGHT+IHs793W7+yQI9lFoV5QhdW2vJVh1Z/pRTyizTOYkNOM4XavYvm+Hp4jmtwO38yvZAGMmDJnHA==
X-Received: by 2002:a05:6512:3049:b0:52c:825e:3b1c with SMTP id
 2adb3069b0e04-530ee983123mr1855990e87.26.1723231117214; 
 Fri, 09 Aug 2024 12:18:37 -0700 (PDT)
Received: from tollan.lan (d149.broadband8.quicknet.se. [192.176.51.149])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f1b855sm8961e87.233.2024.08.09.12.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 12:18:36 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 21:18:29 +0200
Message-ID: <20240809191831.1389128-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723231118; x=1723835918; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8g14rvEXyVWECR8BOmMGxR9izWa8LL0OXu5uXqTXoMg=;
 b=CbzznmCREZzt6bDXX4ymp4SToSAJ3ax/0DisxbKSKx4xNrYlPEFBuNDAE547hXBakI
 jH6HOq+N/ztq7+lQt0xPD4WYnTnRqri9IdzkuUfPTpQM+Ek4xs5LjX7d79DZpdL3Cjk6
 +hhtNJRo+dR9womOsFOhnKtD4Gfdb5vQoXod9SomY9dOBYzb5HPtGaslGLQiQ0Swd7XL
 bfioGufoiAmTbXnmsmg62BRddoszwp5dZfbzwXwYmp5aeGaz1r4mYNo4jgt/swfkE8UU
 zx24ppG7ynhHDzwdrr1h2k7b2oklkzfW4CvnWluFWQfnWdt/Yu85mnKi0Vbkpd9x5KRm
 skzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CbzznmCR
Subject: [Buildroot] [PATCH v2 0/2] package/uboot-tools: bump to 2024.04 and
 add fdt_add_pubkey
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZkdF9hZGRfcHVia2V5IHRvb2wgZnJvbSB1Ym9vdC10b29scwoKVGhpcyByZXF1aXJlIGEg
YnVtcCBvZiB1Ym9vdC10b29scywgc2luY2UgZmR0X2FkZF9wdWJrZXkKd2FzIGluY2x1ZGVkIGlu
IHVib290IGluIDIwMjMuCgpDaGFuZ2VzIHYxIC0+IHYyOiBTZWxlY3QgdXRpbC1saW51eCBmb3Ig
bGlidXVpZCB3aGVuIGJ1aWxkaW5nIG1rZWZpY2Fwc3VsZQogICAgICAgICAgICAgICAgICBNYWtl
IG1rZWZpY2Fwc3VsZSBjb25maWd1cmFibGUgaW4gaG9zdCBidWlsZCAoc3VnZ2VzdGVkIGJ5IFRo
b21hcyBQZXRhenpvbmkpCgpNYXR0aWFzIFdhbHN0csO2bSAoMik6CiAgcGFja2FnZS91Ym9vdC10
b29sczogYnVtcCB0byB2ZXJzaW9uIDIwMjQuMDQKICBwYWNrYWdlL3Vib290LXRvb2xzOiBhZGQg
bmV3IHRvb2wgZmR0X2FkZF9wdWJrZXkKCiAuLi4vMDAwMS1kcm9wLWNvbmZpZ2gtZnJvbS10b29s
cy5wYXRjaCAgICAgICAgfCAyMCArKysrKysrKwogLi4uLXRvb2xzLW9ubHktaW4tbm8tZG90LWNv
bmZpZy10YXJnZXRzLnBhdGNoIHwgMTEgKystLS0KIHBhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmln
LmluICAgICAgICAgICAgICAgICB8IDEwICsrKysKIHBhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmln
LmluLmhvc3QgICAgICAgICAgICB8ICA5ICsrKysKIHBhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3Qt
dG9vbHMuaGFzaCAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3Vib290LXRvb2xzL3Vib290LXRv
b2xzLm1rICAgICAgICAgICAgfCA0NyArKysrKysrKysrKysrKystLS0tCiA2IGZpbGVzIGNoYW5n
ZWQsIDgyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
