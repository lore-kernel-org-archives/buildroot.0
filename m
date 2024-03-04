Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE17C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 13:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 734AC60B3A;
	Mon,  4 Mar 2024 13:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SndtgbPCxF5p; Mon,  4 Mar 2024 13:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EB260BCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EB260BCB;
	Mon,  4 Mar 2024 13:50:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 842221BF3A0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E73A40743
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2-xRWxA2Tac for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 13:50:32 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95573406D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95573406D0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95573406D0
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 13:50:32 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dc13fb0133so32719575ad.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 05:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560232; x=1710165032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIxRonl02QJYQpVcBjjvZ+x11wW9K+uxauCDQgPPHaA=;
 b=tYFhseMehHmoKKdcuA81393/NZyzQUzGpPAH7aWzq/T9ZYvV6ORZCN01mzfur8jI9t
 UmsNFcELwFpMZPua19m3Hh6NKqeF4rx/m1B3xRyphLv2zBiDoeDWqks5wHyuMpwR7yO2
 /4sNXUKyGrbGrEK2I3T2Tp0ku+29M1AIRdzzEAYvreXO1OnSyOfNBUd/YbMGpick92zy
 MgAQvN7ve+yeL+51qBwkaK9ikVDFyBy8J/H3yJZUAu1JNisAUv3OpJMGB4d17cJlxtAk
 Uz0Yt1VDrXh6dl9acxK5Lxs9X5b4khHaBSHW6yEXHbKeozBMRhUpNUvUPoEbfrkaqGEW
 e1xg==
X-Gm-Message-State: AOJu0Yz50LHGVF5CcwiTqa5AkE5YwbNGD4KnJR4+lCnqCzaV+mDGFwFD
 qRSHxH9sUKKbRfrWks3jnTMGfNUKM0DL5btCKpwSVTXAzDhpZuhzO062ln36id9k7vnKgKtHknm
 BdOYuQg==
X-Google-Smtp-Source: AGHT+IGpXB0hoNNwQ1hN1i+Ghm+EkV/vMp6umRz7kkp+STxIX1w6KUuHZYdv4ohSnooCHQ2hPjVrhA==
X-Received: by 2002:a17:902:9a49:b0:1dc:3261:ab7 with SMTP id
 x9-20020a1709029a4900b001dc32610ab7mr7225552plv.49.1709560231715; 
 Mon, 04 Mar 2024 05:50:31 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001db5fc51d71sm8479115pls.160.2024.03.04.05.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:50:31 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 10:50:15 -0300
Message-ID: <20240304135015.1741202-3-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304135015.1741202-1-flavio.tapajos@newtesc.com.br>
References: <20240304135015.1741202-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1709560232; x=1710165032;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIxRonl02QJYQpVcBjjvZ+x11wW9K+uxauCDQgPPHaA=;
 b=wwDDgYDWKG1zXx/DjfuyNe9sMSKR1RjKkJ6qUYzkVYsXZ2oYZFbv9Tk5Mn1QHl8RDY
 7GimSMzjKFN+fD/+pVQToCfNjcdy2/ELHlfsgKO6zvf9zJdiNhkuxPbAm+/alATJxgxL
 M3UWLuoB0gjtNvM0FSVtFI8SjxRAZjsLmLjEa3Wcx2zdrqlCZm4nfphxiCwvHijsmoHK
 G6X0WykpMxh8kJcKp9ct0HcbZWUPIk2am4A56moj0FcqwX2aoTOE6WafYKuUFJCcYiFk
 LU+WgFsakQJu+YXblL6QsaKW/8rw1/8UdbC4ecO4uO0j0GOAl3Ihz8M4LjWLzm8hveVt
 YfwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wwDDgYDW
Subject: [Buildroot] [PATCH 3/3] package/python-sqlalchemy: bump version to
 2.0.28
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
bXkuaGFzaAppbmRleCBmZjgzZjE2MGE0Li5mNDYzNmE1NmFiIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gKKysrIGIvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCkBAIC0xLDUgKzEsNSBAQAog
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24K
LW1kNSAgMGU3YTk1N2NkZDBiYjgwZGU1MDFlNzYzMjcwYmNkYzggIFNRTEFsY2hlbXktMi4wLjI3
LnRhci5negotc2hhMjU2IDg2YTZlZDY5YTcxZmU2Yjg4YmY5MzMxNTk0ZmEzOTBhMmFkZGE0YTQ5
YjVjMDZmOThlNDdiZjBkMzkyNTM0ZjggIFNRTEFsY2hlbXktMi4wLjI3LnRhci5negorbWQ1ICA3
ZjIzZWQ3YmVhODZhYTY5NmMyODk0ODQ1ZGQzMTFiYyAgU1FMQWxjaGVteS0yLjAuMjgudGFyLmd6
CitzaGEyNTYgIGRkNTNiNmM0ZTZkOTYwNjAwZmQ2NTMyYjc5ZWUyOGUyZGE0ODkzMjJmY2Y2NjQ4
NzM4MTM0NTg3ZmFmNzY3YjYgIFNRTEFsY2hlbXktMi4wLjI4LnRhci5negogIyBMb2NhbGx5IGNv
bXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKIHNoYTI1NiAgM2MwZjU5YWI4ODdkMDQxZGU2YTRlNTJm
ZmUzZTllZGI1ZDk1MjJkZTkwOWZhZTlhNmNkN2FkYjZlN2JlMzI5MyAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayBiL3Bh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hlbXkubWsKaW5kZXggMWZjZGEz
MzhkMy4uZGViNzQyOGM5NyAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9w
eXRob24tc3FsYWxjaGVteS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhv
bi1zcWxhbGNoZW15Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotUFlUSE9OX1NRTEFMQ0hFTVlfVkVSU0lPTiA9IDIuMC4yNworUFlUSE9OX1NRTEFMQ0hF
TVlfVkVSU0lPTiA9IDIuMC4yOAogUFlUSE9OX1NRTEFMQ0hFTVlfU09VUkNFID0gU1FMQWxjaGVt
eS0kKFBZVEhPTl9TUUxBTENIRU1ZX1ZFUlNJT04pLnRhci5negotUFlUSE9OX1NRTEFMQ0hFTVlf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iOS9mYy8zMjdm
MDA3MmQxZjUyMzFkNjFjNzE1YWQ1MmNiNzgxOWVjNjBmMGFjODBkYzFlNTA3YmMzMzg5MTljYWEK
K1BZVEhPTl9TUUxBTENIRU1ZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvM2EvMjMvY2M4ODQ0ZDQ4NzNlYzA0ODVmOTYxYzA0N2NhODMxMDQwYzNiYTdlY2Y5
ZDg4ZWM2ZjkyNDllMWQxY2JlCiBQWVRIT05fU1FMQUxDSEVNWV9TRVRVUF9UWVBFID0gc2V0dXB0
b29scwogUFlUSE9OX1NRTEFMQ0hFTVlfTElDRU5TRSA9IE1JVAogUFlUSE9OX1NRTEFMQ0hFTVlf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
