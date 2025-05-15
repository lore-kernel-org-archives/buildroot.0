Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C544C2D0CB
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 06:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19ECE82221;
	Thu, 15 May 2025 06:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pd5nCncqXWx7; Thu, 15 May 2025 06:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4819E811C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4819E811C3;
	Thu, 15 May 2025 06:05:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C626153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 220F76085A
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnfph-N77PLv for <buildroot@buildroot.org>;
 Thu, 15 May 2025 06:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4135360859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4135360859
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4135360859
 for <buildroot@buildroot.org>; Thu, 15 May 2025 06:05:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfe99f2a7so808935e9.2
 for <buildroot@buildroot.org>; Wed, 14 May 2025 23:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747289136; x=1747893936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmq6cGrgmeMMI3mETLkxpn4yG9o3Or/5o9o66zGRzaU=;
 b=BPNeSSH3im8LLRHBrmT1h9hLk86I7h8VRqAmzh2UlHZvxwcrJn0d1yEKYuEiF8sLYu
 wt80FiI1y5hB32I69Di8Xf02PnpcDwcf5mYHfnvnjEToWIDxqZQHEu5BHZ10iY28qVfQ
 SO3sI/tXNsKRtYe7sI5ZYRRVBxAJtj072LQa8PnubJ6seV3u5fAhRUYog0dueH0Z8bQN
 13rfCUVJmFCMM8CBjHAFrBo+FJakzVdRyCG3JG0XC9ObXBGeYpebDIsp/lUp22xoX1B9
 Imm45KksfJiEuBQXJh97nyOhSiXgmz44nHZ89iEaxmMoAKI+sUetG0i0frVKCc73J3JP
 euyA==
X-Gm-Message-State: AOJu0YwzvJgB1WBxJXJB/SMl9c2ydXzteKmSU4e+cflbmCPCsqDRBtbr
 dwgQL2NqrXK93xv8VCo0rGxdidR4hylKTf7uTa7A+sqe4SLH8YklPGda90f3Bpc=
X-Gm-Gg: ASbGncvydI03NL2ARNFFmh17R3FPpY+qFrlTwfMGvB4E7mAb2bfqyg1mrj98tndiSZ/
 1NHHKKB7Lmd2cC4aZQfn56tYoEMdm2hYgwoiuTzgdrGd6kcJx5G0RVn2agNmNIw6PH0cSG4bi7d
 jJjAHGK1w/eU+hJL8cfv4P+RxE7nfflwzEcajKc11GJUrrkh6lIQ3H7uYOOhOaRrWxGUy+3z3AG
 iFCAF6bm3LGVERzk0cIaeT4I1jH1u6trMFzxnQFIveJCBYnXnXpg2x7YI0l1mtpnAfE4r/afWUd
 3xIkyGV0/JYh9xSb9DbqYNyEf7aOpmUZIrMfbRDQYOToPOGiaPFsfXQTbV71fO6jNPTE1h2Ah+O
 Du3iSvF11ab9uZ0o0xxk54TQv1n1+Jqdufg==
X-Google-Smtp-Source: AGHT+IGwantRnUvdSTjG2t0VjEJbLQOF/G6aX6ublsbFlfvLf5iIrohw0p7YfqCW/X+I3VCBrZML1w==
X-Received: by 2002:a05:600c:3c96:b0:43b:c0fa:f9bf with SMTP id
 5b1f17b1804b1-442f20e0b14mr18863025e9.3.1747289135450; 
 Wed, 14 May 2025 23:05:35 -0700 (PDT)
Received: from archlinux.. (etr91-h01-123.dsl.sta.abo.bbox.fr.
 [176.148.127.123]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380615sm54837285e9.16.2025.05.14.23.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 23:05:34 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Thu, 15 May 2025 08:05:26 +0200
Message-ID: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747289136; x=1747893936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=fmq6cGrgmeMMI3mETLkxpn4yG9o3Or/5o9o66zGRzaU=;
 b=jQvrQPHI3CEEqbD0/cU6xGDqZC4u2RwvzwnpYp+5im7y7OI7fCjuBpgdm85D6MJf76
 k2UFcuwCTSxrj8BAshtYHnCO6vFTyKg9a9zbrUVdAxAVJX51Q81FGy4Hwbg555PIgqRo
 9xYd4UVktmulA2oUEIlNPxpiMfL2V2QxBjcuuVPS7iZzEco8gi/1wBBddturb5VFMu5M
 6ZRAiVlOtlo7GxD9yAaaMpMoV5WZP1LkOp7tcf0mQ9Ps8rd2eka5OEDmGeDdqJVkLcid
 bIPJtbZh8uh4glFmsuPnu3ffEAgkfLeBcAPLSwWi9x/3CIiTP8JggTBqQIvwokFgpxXl
 LtZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jQvrQPHI
Subject: [Buildroot] [PATCH v2 0/2] package/mesa3d: allow building vc4
 without NEON
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBhbGxvd3MgYnVpbGRpbmcgdGhlIHZjNCBkcml2ZXIg
Zm9yIHRvb2xjaGFpbi9DUFUKd2l0aG91dCBzdXBwb3J0IGZvciBORU9OIChSYXNwYmVycnkgUGks
IFJhc3BiZXJyeSBQaSBaZXJvLCBSYXNwYmVycnkgUGkKWmVybyBXLCBDb21wdXRlIE1vZHVsZSku
CgpUaGUgZmlyc3QgcGF0Y2ggcmV2ZXJ0cyBhIGNvbW1pdCB0aGF0IGlzICJzdXBlcnNlZGVkIiBi
eSBhbiBpbnRlcm5hbApwYXRjaC4KClRoZSBzZWNvbmQgcGF0Y2ggdXBkYXRlcyB0aGUgaGVscCBt
ZXNzYWdlcyBvZiBWQzQvVjNEIGRyaXZlciB0byByZWZsZWN0CnRoZSBjdXJyZW50IHN1cHBvcnQg
b2YgaGFyZHdhcmVzIChSYXNwYmVycnkgUGkgbW9kZWxzLCBhbmQgVmlkZW9Db3JlCnZlcnNpb25z
KS4KCkkgaGF2ZSB0ZXN0ZWQgaXQgb24gUmFzcGJlcnJ5IFBpIDEgb25seSB0byBydW4gT3BlbkdM
RVMgdGhpbmdzIChrbXNjdWJlLApxdCBndWkgZXhhbXBsZXMpLgoKQ2hhbmdlcyBzaW5jZSB2MToK
IC0gUmV3b3JkIGNvbW1pdCBtZXNzYWdlCiAtIFVwZGF0ZSBkcml2ZXJzIGhlbHAgbWVzc2FnZXMg
KGluIGEgZGVkaWNhdGVkIGNvbW1pdCkKCkdhw6tsIFBPUlRBWSAoMik6CiAgUmV2ZXJ0ICJwYWNr
YWdlL21lc2EzZDogR2FsbGl1bSBWQzQgZHJpdmVyIGRlcGVuZHMgb24gTkVPTiIKICBwYWNrYWdl
L21lc2EzZDogdXBkYXRlIHZjNC92M2QgZHJpdmVycyBoZWxwIG1lc3NhZ2VzCgogcGFja2FnZS9t
ZXNhM2QvQ29uZmlnLmluIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
