Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54817C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 13:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54EC60605;
	Mon,  4 Mar 2024 13:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKwjdNjdyopn; Mon,  4 Mar 2024 13:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E2860611
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E2860611;
	Mon,  4 Mar 2024 13:50:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4A081BF3A0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0CDF40105
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3X6yq1qWALQ for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 13:50:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE448400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE448400EA
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE448400EA
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 13:50:23 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1dccb2edc6dso36492905ad.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 05:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560223; x=1710165023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TN49bhTakbYw4zfmHP+l/7H/p7O/zz/0eQKSq0rJj54=;
 b=xNEH3yKJqPPcrJU/M3oc+IJKVeEeZMjG8IpqAbHocixwl2gx30mavqbeLpiQb/Vdxi
 9KE0SKYUBYvQc2ds883akGzECx0xHw/jbxjJSk/3RkgCjaMBp7jQDCgKmxMx6YvR44Zw
 v/361N8dZUMKyHVXTx7QqbqUoEc0rvvaXCl/bozR232vP4P9lBH1NDRHzjNYqbtRz7zH
 Ot7l8wHsjQ4CLaKOw0G2KllVknTBa8pR0b/IWXmnR4uzg/h+4cxKnBEi6/V//Vk0PKQP
 NqAqkx31pQrOYsPtmGRygpjd7KLF06EJQ0a1hXev7tpggTaqW8zdcfqiREUYu/F5eEui
 y7AA==
X-Gm-Message-State: AOJu0YwTrOT2ZeVfqu7KXxLGq2AfGmER9DHS2QxMhXuFHR0uXHEZ8YAV
 RiZ8IpXisNlj7IIotgb9EwGH6kf7cWrKw950ykXHsC/3SvkPD339c6u6SMUy4MRTy9HV7mFVY7i
 SlBo3gg==
X-Google-Smtp-Source: AGHT+IG5KFVAjdv+fGnHmXm86dMN3h5TQ2wACxFMSTNwdhiSBB9OAXwq+64vMCJJnSkvrIwvRBu9Lg==
X-Received: by 2002:a17:902:f54a:b0:1dc:af71:29fc with SMTP id
 h10-20020a170902f54a00b001dcaf7129fcmr11428073plf.6.1709560222672; 
 Mon, 04 Mar 2024 05:50:22 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001db5fc51d71sm8479115pls.160.2024.03.04.05.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:50:22 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 10:50:13 -0300
Message-ID: <20240304135015.1741202-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1709560223; x=1710165023;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TN49bhTakbYw4zfmHP+l/7H/p7O/zz/0eQKSq0rJj54=;
 b=STD6ASxdzcI5FMxFLG9T9ZuHOCj1BnASyI0FkuzlgsmgGIyEpctmzQ0wuOf2oLBq/Z
 5B8KHT6Xa2RveKiDM1+Wr2ugGkkyjrpCxpdaVweAy6MU0LhZS0WWxwZjIXy2anDehzZd
 IGIVQb2/1bWc/11W5g/irQPcJ++0GLuXzBef8sDwC1YkAkZJfEqtgRS4ThPPZz0Tz3kG
 3nzlhPjABJ7fmKon7hdfHaiG1phi6Lhh+YJn550w1JOkebggUaJgIpNYUVvZcFtcM1vA
 U8S3x7H13YHgOcQWs2fsfmAp7bDK0WLy8EJKdqjUhab2LqP+k/GcY5eBrDbeO6l+GNK+
 +sIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=STD6ASxd
Subject: [Buildroot] [PATCH 1/3] package/python-sqlalchemy: bump version to
 2.0.27
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5o
YXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNx
bGFsY2hlbXkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hl
bXkuaGFzaAppbmRleCA3OTUxYTMyOTc4Li5mZjgzZjE2MGE0IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgN2FiZmMyOTcyZDdlMTYzMTVjOGI3NDkyZWEwZTBmZGIgIFNRTEFsY2hlbXktMi4wLjI1
LnRhci5negotc2hhMjU2ICBhMmM2OWE3NjY0ZmIyZDU0Yjg2ODJkZDc3NGMzYjU0ZjY3Zjg0ZmEx
MjNjZjg0ZGRhMmE1ZjQwZGNhYTA0ZTA4ICBTUUxBbGNoZW15LTIuMC4yNS50YXIuZ3oKK21kNSAg
MGU3YTk1N2NkZDBiYjgwZGU1MDFlNzYzMjcwYmNkYzggIFNRTEFsY2hlbXktMi4wLjI3LnRhci5n
egorc2hhMjU2IDg2YTZlZDY5YTcxZmU2Yjg4YmY5MzMxNTk0ZmEzOTBhMmFkZGE0YTQ5YjVjMDZm
OThlNDdiZjBkMzkyNTM0ZjggIFNRTEFsY2hlbXktMi4wLjI3LnRhci5negogIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgM2MwZjU5YWI4ODdkMDQxZGU2YTRlNTJm
ZmUzZTllZGI1ZDk1MjJkZTkwOWZhZTlhNmNkN2FkYjZlN2JlMzI5MyAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayBiL3Bh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5kZXggNDAwYWQ5
MmY2My4uMTc3ZTdmOGEzOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9w
eXRob24tc3FsYWxjaGVteS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhv
bi1zcWxhbGNoZW15Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4yNQorUFlUSE9OX1NRTEFMQ0hF
TVlfVkVSU0lPTiA9IDIuMC4yNwogUFlUSE9OX1NRTEFMQ0hFTVlfU09VUkNFID0gU1FMQWxjaGVt
eS0kKFBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1NRTEFMQ0hFTVlf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy83Yi9iYi84NWJk
OGUyMTFmNTQ5ODNlOTI3YzdjZDliMmFkNjY3NzNmYmVmNTA3OTU3MTU2ZmM3MmU0ODFhNjI2ODEK
K1BZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvYjkvZmMvMzI3ZjAwNzJkMWY1MjMxZDYxYzcxNWFkNTJjYjc4MTllYzYwZjBhYzgw
ZGMxZTUwN2JjMzM4OTE5Y2FhCiBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBFID0gc2V0dXB0
b29scwogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRSA9IE1JVAogUFlUSE9OX1NRTEFMQ0hFTVlf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
