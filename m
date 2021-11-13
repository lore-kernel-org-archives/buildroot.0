Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11702C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53D660F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C53D660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4400A4027C;
	Sat, 13 Nov 2021 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dwr8qi4C5SYP; Sat, 13 Nov 2021 13:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2E240277;
	Sat, 13 Nov 2021 13:29:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA6801BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2B8040204
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7QU6jV23cKu for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D13340219
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s13so20682768wrb.3
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/QvejTuJhOxPMyqTNVFWyUXe7Joa5obWsaFtdgO3CL8=;
 b=P51Jh6Ee6geo+I2W42B6YTSvb0NUnr8f8PN/FBZ0/9k6YUCB6JrktOlOfw5I4g8QY1
 UKj8R1Naq3MPFfwMwPwpLWXHODkcR9wityKLYfA9ubFfpb2+0pwnoMdPfqyP0bkP72Rg
 WMgVNcC7gzvTiqvaIaud8VHx+Vo4U11CIk4J2vsa//z+0B2jfVTpaBlQg39o3aVkNx9L
 bWg7nfqaw7SphLab661jDAvhEyDAUPjB0R8GvEUy9fAAgJyOfXSd/pVISIRyPo6EFLvy
 gAD5X50vlPL5V4NYGJb/PbWe+ljWIiXiyR23NZh7+4DISabHptmPktvv8fJk3GsGNqXh
 oaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/QvejTuJhOxPMyqTNVFWyUXe7Joa5obWsaFtdgO3CL8=;
 b=5R7eK8Puq+epw+UE5+P0NXnubYuiJY7wzMsznLSS8RcGIcVGXtM0r6TdTYfBRwj4oY
 R0PXQLARPxLKDqsJSll8iyGvBV2qs+fC4cciYATPj2lszdRFIJ///zzhyNHQlvQMKmK8
 SabdZVGTFaOEGLsclcQRfVwoaEXeBaM/MVpWeUwuWSKGS/qkIGCf7fU+JnqtlKp9pOCX
 gSmKuTPD1K2/UVymdVyCfJ+P1NEtyRrHw+An6rklpeZ/D4HFKIwlgvBFbte9BlTYCMA/
 LItYQptw6r82ed7qxB43MJQ0MqObaGF5XwovKnmTICdWLaRNmC7U9E4hNYE9eqRrUYV6
 JdXw==
X-Gm-Message-State: AOAM533nv6P0zN8VVAqrz0svVAC0XL70ArVj8qx08g1DikicWNgMo6U2
 jpAHiJAMj5rR1uFj0T36U0ZtfBI+oZ74ow==
X-Google-Smtp-Source: ABdhPJzcjjQc5d7g7nfVsN4BLzBxcRhYqqc7j0CYwstaY4ymOLb6lLdkcNVW587UCPwCQAqUiGuI3g==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr28458425wrn.335.1636810112215; 
 Sat, 13 Nov 2021 05:28:32 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:31 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:17 +0100
Message-Id: <980373ae3cf6a335acaf4dda544e3ab01c960f84.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/16 v2] core/pkg-generic: also list files
 installed in images/
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29tZSBwYWNrYWdlcyBpbnN0YWxsIG5vdGhpbmcgaW4gdGFyZ2V0IG5vciBzdGFnaW5nLCBidXQg
aW5zdGFsbCBpbWFnZXMKKGxpa2UgdGhlIGtlcm5lbCB2bWxpbnV4LCBvciBhIGJvb3Rsb2FkZXIg
Ym9vdCBibG9iLi4uKQoKSWYgd2Ugd2FudCB0byBhcHByb3ByaWF0ZWx5IGFjY291bnQgZm9yIHRo
ZSBmaWxlcyBpbnN0YWxsZWQgYnkgZWFjaApwYWNrYWdlLCB3ZSBhbHNvIG5lZWQgdG8gdGFrZSBp
bWFnZXMvIGludG8gYWNjb3VudC4KClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPgpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4KQ2M6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29t
PgoKLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBmaXggdHlwbyBpbiBjb21taXQgbG9nIChIZXJ2
w6kpCi0tLQogcGFja2FnZS9wa2ctZ2VuZXJpYy5tayB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rIGIvcGFj
a2FnZS9wa2ctZ2VuZXJpYy5tawppbmRleCBhYjQ4MjQwMjgzLi41NjI2YWYxZDg3IDEwMDY0NAot
LS0gYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCisrKyBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsK
QEAgLTI3Niw2ICsyNzYsNyBAQCAkKEJVSUxEX0RJUikvJS8uc3RhbXBfY29uZmlndXJlZDoKIAkk
KGNhbGwgcHJlcGFyZS1wZXItcGFja2FnZS1kaXJlY3RvcnksJCgkKFBLRylfRklOQUxfREVQRU5E
RU5DSUVTKSkKIAlAJChjYWxsIHBrZ19zaXplX2JlZm9yZSwkKFRBUkdFVF9ESVIpKQogCUAkKGNh
bGwgcGtnX3NpemVfYmVmb3JlLCQoU1RBR0lOR19ESVIpLC1zdGFnaW5nKQorCUAkKGNhbGwgcGtn
X3NpemVfYmVmb3JlLCQoQklOQVJJRVNfRElSKSwtaW1hZ2VzKQogCUAkKGNhbGwgcGtnX3NpemVf
YmVmb3JlLCQoSE9TVF9ESVIpLC1ob3N0KQogCSQoY2FsbCBmaXh1cC1saWJ0b29sLWZpbGVzLCQo
TkFNRSksJChIT1NUX0RJUikpCiAJJChjYWxsIGZpeHVwLWxpYnRvb2wtZmlsZXMsJChOQU1FKSwk
KFNUQUdJTkdfRElSKSkKQEAgLTQwMiw2ICs0MDMsNyBAQCAkKEJVSUxEX0RJUikvJS8uc3RhbXBf
dGFyZ2V0X2luc3RhbGxlZDoKICQoQlVJTERfRElSKS8lLy5zdGFtcF9pbnN0YWxsZWQ6CiAJQCQo
Y2FsbCBwa2dfc2l6ZV9hZnRlciwkKFRBUkdFVF9ESVIpKQogCUAkKGNhbGwgcGtnX3NpemVfYWZ0
ZXIsJChTVEFHSU5HX0RJUiksLXN0YWdpbmcpCisJQCQoY2FsbCBwa2dfc2l6ZV9hZnRlciwkKEJJ
TkFSSUVTX0RJUiksLWltYWdlcykKIAlAJChjYWxsIHBrZ19zaXplX2FmdGVyLCQoSE9TVF9ESVIp
LC1ob3N0KQogCUAkKGNhbGwgY2hlY2tfYmluX2FyY2gpCiAJJChRKXRvdWNoICRACi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
