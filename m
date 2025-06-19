Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A42C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59ECA8145A;
	Thu, 19 Jun 2025 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MB5cdBcGwUFA; Thu, 19 Jun 2025 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E48481363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E48481363;
	Thu, 19 Jun 2025 14:48:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F20C0E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C51813DB
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnsA6FpZGXo5 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44BF68114B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BF68114B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44BF68114B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so7803345e9.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750344519; x=1750949319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROGXmJeSGR/1K58omt18vX1kjjksSFa4fYrmMg8SDmQ=;
 b=G6ghrokerQPrADl9AE+7kPQofYAq8snVRaVity5Ow6e9vj6k2p9/wW9CWUFK0g7MQ+
 qEFly7WVtkv5bbx+7Qw/l5+SCKfz53RQzNWoBFhN4iyT2vA132LuQY/P6/rrku84Vzrg
 Ipdf2zFsEA70UttvuGI00El2hieSPCTTtork+CvSjLfShvY2buAZsMZVl58c0DIjGdKZ
 v6vPV7dWaZqbD93rNDE2DuKgFVrzDIpGKPO2AZRTK8OwWFdDQjcvRXfsmIN6RzdLqWlJ
 DSevAAYBUySoTCC8/jpl+XzkZIJqypr1dP4dCogG+oHsgD1xUsB/OHStfU5jH6IRMHrl
 e+bA==
X-Gm-Message-State: AOJu0Yz1In214Ta4W673aNnVEL4dQRNms0i1FIisocZwV5yRHAucg8CR
 gaHGRj5c8DSdY80xOtWWiEYoVNxXy3/6ogTmr+djD9ga8V3AG2kuoe3nGBzEcXz2ONnZ9OrVtSN
 2E/q2r/o=
X-Gm-Gg: ASbGnctek8W+o5ZTh3r//QPfTevnWFqGxcpxKpjomrywGZ8iAuJ9xred+mtgxfRHLim
 o74SSErFcr3L498hpHUXoNTnTMtr5UvejOz5ZflH9idmb6+C/8w0rZO0rdyZrCBtFJoyZPyH/ZU
 4mRPehTIJz4IHFeQBGvJHI6BQmdAhEIZo1gTBR8/UoLVF2/ygl5fXFrK3on7QwGIcJPGv2dhxX1
 vGLBLCueK7QYRwKB7FDb2TqDWaWMAmWq/o3VO06nLIw/Jl3P4vqDiQEpf/6juWRwEopf5Zq8YPX
 t1YF7iqiA+/W/Ho51A31jY8/yj6mW585BDlCiDtgJxOOb3IVfMTURpk+AFHenrxG80ZJAOx68Q=
 =
X-Google-Smtp-Source: AGHT+IGtA/gHWSWhEZKmjdw4PhjW4y2LypwS2DrY4S3hxFhM72bqeHzReIDGl14UtZ8UrX/SR9171g==
X-Received: by 2002:a05:600c:1d06:b0:450:c20d:64c3 with SMTP id
 5b1f17b1804b1-4533caad17fmr212344275e9.18.1750344518754; 
 Thu, 19 Jun 2025 07:48:38 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97ac4asm30717835e9.3.2025.06.19.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 07:48:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 714145F760;
 Thu, 19 Jun 2025 15:48:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 15:48:33 +0100
Message-ID: <20250619144837.1298990-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750344519; x=1750949319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ROGXmJeSGR/1K58omt18vX1kjjksSFa4fYrmMg8SDmQ=;
 b=e5/Y+W3Z6LWeUDzskEKz1hxGHagvipLKtJofvBtNNk/fLlEEC8DTqKoMjur2fSrCD6
 eLZxit1OIxURvklhzBxoQjf1nHqaBtm9DhhyQgIuoBIO10P8h05D6pXsZ5fbC33i0KZU
 ry0B0FC/9ZiGlK+qgH+6jt84sOuxJ5ToujQW+fm+WhYWkKXjnwRuG8FGa26xxvJErg9e
 REh4KIK04rPlqVn/am94/7aVUjpxltL3qNx00LBpMVMfsw8wwvrFizK1IAD1aB84Ak3b
 N8zQ+HUTEcOerKy+m5kFklt7IfnsYHbbIEdSpnvMpFjQakNOq3g0LxKauqj+B2GQQIOb
 je0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e5/Y+W3Z
Subject: [Buildroot] [PATCH 0/3] kvm-unit-tests: update deps and fine tune
 qemu
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

VGhlIGt2bS11bml0LXRlc3RzIHJlY2lwZSBpcyBhIGxpdHRsZSBvdXQgb2YgZGF0ZSB3aXRoIHRo
ZQpkZXBlbmRlbmNpZXMgaXQgbmVlZHMuIFdpdGggdGhhdCBhbmQgc29tZSB0d2Vha2luZyBvZiB0
aGUgb2YgcHJvY2Vzc29yCmRlcGVuZGVuY2llcyB3ZSBjYW4gbm93IGJ1aWxkIGt2bS11bml0LXRl
c3RzIGZvciBhcm02NC4KCk9uIHRoZSB3YXkgSSd2ZSBhZGRlZCBzb21lIG5ldyBjb25maWcgb3B0
aW9ucyBmb3IgUUVNVSBzbyB5b3UgY2FuIGp1c3QKc2VsZWN0IHlvdXIgbmF0aXZlLCBrdm0tb25s
eSBRRU1VIGJ1aWxkLgoKQWxleC4KCkFsZXggQmVubsOpZSAoMyk6CiAgcGFja2FnZS9rdm0tdW5p
dC10ZXN0czogYXNzdW1lIEFBcmNoNjQgc3VwcG9ydHMgS1ZNCiAgcGFja2FnZS9rdm0tdW5pdC10
ZXN0czogYWRkIHNvbWUgbWlzc2luZyBkZXBzCiAgcGFja2FnZS9xZW11OiBpbnRyb2R1Y2Uga3Zt
IGFuZCB0Y2cgc3lzdGVtIG9wdGlvbnMKCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
biAgICAgICAgIHwgMTcgKysrKysrKysrKystLS0tLS0KIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
a3ZtLXVuaXQtdGVzdHMubWsgfCAgMSArCiBwYWNrYWdlL3FlbXUvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0KIHBhY2thZ2UvcWVtdS9xZW11
Lm1rICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5n
ZWQsIDQzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0gCjIuNDcuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
