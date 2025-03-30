Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1BFC28B20
	for <buildroot@archiver.kernel.org>; Sun, 30 Mar 2025 17:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0858160BBE;
	Sun, 30 Mar 2025 17:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lio9SomZ8qjk; Sun, 30 Mar 2025 17:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A29660BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A29660BA2;
	Sun, 30 Mar 2025 17:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3873D0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 17:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2E381062
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 17:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpBYrOiSUslp for <buildroot@buildroot.org>;
 Sun, 30 Mar 2025 17:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91ACB810D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91ACB810D4
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91ACB810D4
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 17:32:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so7156590a12.0
 for <buildroot@buildroot.org>; Sun, 30 Mar 2025 10:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743355920; x=1743960720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRDdaoG1ImAp0Pnrs6YhJ99LyKOrVzW2laxpCsSsS5c=;
 b=f6BRw5t7nNdiW00Ir8SPh4tj3LXjZizzZgvt2fn+UL1X/tkkQm7ZjE1UhnvCqtF4Ko
 Sp+JdXVKDxNRR1xGGwB7avulJpOBcpJ6rOp7GJy7agS1dud6Pnl1L1F9Y4+mqaTEgR6E
 lUXBi7paqM6iNrBn33q2r2zZOi0Am3YPQt8Yfe4nEHHCLCUp2LSl9Cfp5z1vZT4y5rOO
 llr6R0dVp+mCPTyboa5uQ7SI4GSod9U2KrjmtFH85/90DZiBXvzggm/7hctH2+tXzjkx
 LaaUXOLaoCvycQtQE5wWB6yZG5WRVr2QntlPO26I9br8ZPtumKpCPThsuYarhpCaCZ4o
 JE5g==
X-Gm-Message-State: AOJu0Yx/81pOTiJAWJABQbFYTUsyCZfUBwBCM/2FOFE+X+kfTAfqZkyC
 UpgCikmipF60KK7tlCxHXglxOiMwwrzmMeP2608rAhfM6yLzvg8njkzd
X-Gm-Gg: ASbGnctoLz9T42FVwrdsy66/T093WmkBbhjgLjfujSqGg6UPOcriR+nZ4l1XZXdGpR3
 LoDQqBYICIVsPhYq4/55HaVuRmLplJgdcy7Ev8OdZXiOWr9m1VGPwUa/o9zzL8SjIyBm9rhDaYW
 K8LRSiMBYOiomuDEiunJT5exrwukTcTSC9246N7zsnPRZjgVJ1iI6JFlC8/x0WOTCYxRrNgDoQL
 pqwBAIKMOOunF+6PFCRkyvfh7lGm8+MVtlAASSWaBdaKSYfeS2zZfgkX/qsC4CPwwSHeFe69Nar
 9uvgddEEUqWAv8nbaCk6gO6KlXSaDi9sUR/xWy/zDOtKlbKJlbP/4tTo6H4=
X-Google-Smtp-Source: AGHT+IGAO7cDPXpnkxkQxSYVknw7mXNBxv5zC9LAtQCllwd8yPhjprrqTFAGtd32r0z7vbDvQDWgVw==
X-Received: by 2002:a17:906:c153:b0:ac7:16ef:e994 with SMTP id
 a640c23a62f3a-ac738bfee38mr540486066b.56.1743355919993; 
 Sun, 30 Mar 2025 10:31:59 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922c0c5sm501936766b.9.2025.03.30.10.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 10:31:59 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: romain.naour@openwide.fr,
	romain.naour@smile.fr
Date: Sun, 30 Mar 2025 19:31:56 +0200
Message-ID: <20250330173158.186734-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241208134004.143901-1-shirokovalexs@gmail.com>
References: <20241208134004.143901-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743355920; x=1743960720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRDdaoG1ImAp0Pnrs6YhJ99LyKOrVzW2laxpCsSsS5c=;
 b=XDWvU7MHqcHDETRxZlAx+l0O8CpeY/AIi+XhtBszOjlSYfUcQBWYvLYaw+W/VDv0oW
 zAQt34wN0dxpNGa971CQjD2FMtbinGZo5rQ0ezgt+Ul2x8ABDy1OW1c3RfIfKyanRceQ
 fJ9rm3Vr+7G7QsSOiYG5Cc8l8ISqm+1yLrFLsRCLcZmuJMbSSx7T/t5xTaJB5r55NCgX
 OpAIoUGuK+dvnJ6eYYO3HWACW7wyknPqrZRaWJZQdETUnlJGmZu7AwRTad1Z5k2xmJOZ
 tnj5SS8w3sAe8+88nA6d3ohB7tdQzBuEcFR2Pcmtb6EvRGGRpEP3UF1rJWMStucwD0Xd
 P+Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XDWvU7MH
Subject: [Buildroot] [1/1] package/rust-coreutils:new package
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

SGVsbG8gUm9tYWluLCBBbGwsCgpTb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuIEhlcmXi
gJlzIGFuIHVwZGF0ZSBmcm9tIG15IHNpZGUuCgpJIHRlc3RlZCB0aGUgb2xkIHBhdGNoZXMgd2l0
aCB0aGUgQVJNIGJ1aWxkIGFuZCB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIGVycm9yCm9uIHRo
ZSBvcmlnaW5hbCAwLjAuMTcgdmVyc2lvbiwgYXMgd2VsbCBhcyBvbiBuZXdlciAwLjAuMjggYW5k
IDAuMC4zMCB2ZXJzaW9ucy4KVGhlIGlzc3VlIGNvbWVzIGZyb20gdGhlICJzdGRidWYiIGNyYXRl
LCB3aGljaCBpcyBlbmFibGVkIGJ5IHRoZQoKICBVVVRJTFNfQ09SRVVUSUxTX0NBUkdPX0JVSUxE
X09QVFMgPSAtLWZlYXR1cmVzIHVuaXggCgpmbGFnLiAKClRoaXMgaXMgYSBrbm93biBpc3N1ZSBh
bmQgaGFzIGJlZW4gZG9jdW1lbnRlZCBvbiB0aGUgdXV0aWxzIHNpZGUgWzJdLgoKSeKAmWQgbGlr
ZSB0byByZWNoZWNrIHNvbWUgYXNwZWN0cyBvZiB0aGUgdXV0aWxzIHNpZGUsIGVzcGVjaWFsbHkg
c2luY2UgaXQgaGFzIGl0cwpvd24gYnVpbGQucnMgc2NyaXB0LCB3aGljaCBjb3VsZCBiZSBhIHNv
dXJjZSBvZiBwb3J0YWJpbGl0eSBpc3N1ZXMuCgpBcyBhIHRlbXBvcmFyeSBzb2x1dGlvbiB3ZSBj
YW4gZGlzYWJsZSB0aGUgIi0tZmVhdHVyZXMgdW5peCIgYW5kIHVzZSBvbmx5IHRoZQpkZWZhdWx0
IGNvcmUgdXRpbGl0aWVzLiBPbiBvbmUgaGFuZCwgdGhpcyB3aWxsIGFsbG93IHVzIHRvIGJ1aWxk
IGFuZCBkZWxpdmVyIGEKd2lkZSByYW5nZSBvZiB1dGlsaXRpZXMuIE9uIHRoZSBvdGhlciBoYW5k
LCBpdCB3aWxsIHByb3ZpZGUgYSBnb29kIHdheSB0bwpyZXByb2R1Y2UgYW5kIGZpeCB0aGUgaXNz
dWUuCgpMaW5rcyBbM10gYW5kIFs0XSBwcm92aWRlIGRldGFpbGVkIGluZm9ybWF0aW9uIGFib3V0
IHdoaWNoIHV0aWxpdGllcyBhcmUKaW5jbHVkZWQgaW4gdGhlICJjb3JlIiBhbmQgd2hpY2ggb25l
cyBhcmUgcHJvdmlkZWQgYnkgdGhlICJ1bml4IiBmZWF0dXJlLgoKSW4gdGhlIG5leHQgZmV3IGRh
eXMsIEkgcGxhbiB0byB3b3JrIG9uIGFuZCBzaGFyZToKCi0gVXBkYXRpbmcgdGhlIG9yaWdpbmFs
IHBhdGNoIFsxXSB0byB1c2UgdGhlIGxhdGVzdCB1dXRpbHMtY29yZXV0aWxzIHZlcnNpb24KLSBG
aXhpbmcgdGhlIGJ1aWxkIGJ5IGRpc2FibGluZyAiLS1mZWF0dXJlcyB1bml4IiBieSBkZWZhdWx0
IGFuZCBhbGxvd2luZyBpdAogIG92ZXIgY29uZmlndXJhdGlvbiBmbGFnCi0gQWRkaW5nIHJ1bnRp
bWUgdGVzdHMKLSBTaGFyaW5nIHRoZSBjaGFuZ2VzIGFzIHBhY2thZ2UvdXV0aWxzLWNvcmV1dGls
cyB2NAoKQW55IGNvbW1lbnRzIGFuZCBzdWdnZXN0aW9ucyBhcmUgdmVyeSB3ZWxjb21lLgoKVGhh
bmsgeW91IQoKTGlua3M6CgpbMV0gLSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjMwMzE3MTUxODAyLjEyNDI4NTgtMS1zZWJhc3RpYW4ud2V5
ZXJAc21pbGUuZnIvIApbMl0gLSBodHRwczovL2dpdGh1Yi5jb20vdXV0aWxzL2NvcmV1dGlscy9i
bG9iL2FlYTIzNDA4ZmQ4MzllOGYzMzE2ZDVlNTgzOWJlYzQzOTg0MWFmNWQvQ2FyZ28udG9tbCNM
MTkxClszXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS91dXRpbHMvY29yZXV0aWxzL2Jsb2IvYWVhMjM0
MDhmZDgzOWU4ZjMzMTZkNWU1ODM5YmVjNDM5ODQxYWY1ZC9DYXJnby50b21sI0w2MgpbNF0gLSBo
dHRwczovL2dpdGh1Yi5jb20vdXV0aWxzL2NvcmV1dGlscy9ibG9iL2FlYTIzNDA4ZmQ4MzllOGYz
MzE2ZDVlNTgzOWJlYzQzOTg0MWFmNWQvQ2FyZ28udG9tbCNMMTU0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
