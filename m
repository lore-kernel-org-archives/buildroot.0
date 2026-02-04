Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC5E95373
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818D66090A;
	Wed,  4 Feb 2026 10:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ybaVUSKBrEk; Wed,  4 Feb 2026 10:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9266660A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770199557;
	bh=Acnr0wUxuR4V9r5RlrM8rtSbjsacgpfiOjq//yxXY1s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCAHbdI4HgWG3rZW3LavSXqKfyF8lcBkai7FbFxAkCoI1ClcPBTlXooKIrfe3HWVh
	 XFhNvDJO+IVGrHItzTdkwbjMM8yiqaXp6kRPHg3IbfouXJE/e26557NTdVoHSHRo3Y
	 NPke8wp5KkYtACffy2Tso7Jz+00fppxims8HBv697Fw4K0Al9FkA8yOlJjZdR9cL2c
	 8fkKrJYEnDnDcKaWW5FtTml/JJlBWfvItJub0KDkDYPY+itbOVGBvesYGXUP2VBjAT
	 dJnuOUFq/xEpvaMqzHBzMRGKNHpXtEj1Yd6djFRE/nKJxXS/bWecxEvx+7bymZJyBF
	 gHgI8uWdU7G0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9266660A3F;
	Wed,  4 Feb 2026 10:05:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7651173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97BCB8275A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkpcgyEQL0da for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A440581604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A440581604
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A440581604
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:05:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-435903c4040so4436132f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 02:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770199552; x=1770804352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cIgPbiji7J79cILwqghPbL0pPnCXfleVXs4zmrNgi98=;
 b=nmh8RHcfNFUbqyRDcJF8W+s397rWzibt3pO0Hu+2QElbTAGq9lDMI5ti7kAjCeatjL
 /aHslqT/Y7FB8PBehEEffWZ/tV7fD6mrfE4OsmL4ccFMKinEfkAO2uMeDKYJC4qS/JPT
 m/HkSCBRX37vttSos4eP56mu409PcOnsL1aqF1tKTZhkDsRB3BawsFT7HhMq5uwHgtcG
 a1j7B7nOGlYiQaPKrIWp46XE+7w1XSgk3Ry+X1qiT9GDP0V2ADA6Z0W2bNc5FR41H1RQ
 o7jH79FzP3DIi4N4C5L34LGLaKLxg/VRq0NXyLIxhSSAhd7IZ25XXvvVEWyFu7S1TeCo
 gzMg==
X-Gm-Message-State: AOJu0Yxxf2yYf6ajrIvTGGhGti0MItBAEQF/kamX3JmwX37JRVEgN4Qh
 xbt2DJBzxCiNBfcsPrVZSfCSoaOmcDavMMispeRYiZuVfmy4gMbQzxxcUIvO
X-Gm-Gg: AZuq6aLxzA96CWcEzbzquM/0d8Y5kujNgFq1QmHJGI3PYDg43aYeXGGPFFykjzzrfSG
 yjuIu9x7ZmWGhoFaNgoHrJDMk2K01j2p6xY1v5Gey95R4LDD903Fao04wrkF3IV4dYu4Mw4r9ZV
 OsFESy7ofnKd7LnV8q7x9+XR37SHLtFb9hYlfVE6W3rNFu25kzqxrI4uiezzzWgr/h63it487c9
 eVQ6oAVS6ChwliZjMwZkb771StjNpvyURL+xDj3EIUUkiKG+eWXEmq3sYJlyGkxLEfJ4L329Sob
 7nvsTAmn1+27JZspsaUjhFFRisaSDwuopiK4UzUkT0VqffJu5iH7fhVyAAdhLijNOrS+hnz8/X+
 vYTkhrv+Jb7VTxUrbIAGWJeJ8Nq1cWYi+IIAkXLJ+Fc4QU34agoC4gNJ5L8mft9LogmmhGjYBmu
 R3C5qZ9LR/hU0I3Wa8QDGlgj/Fpw==
X-Received: by 2002:a05:6000:402b:b0:435:7154:2a7 with SMTP id
 ffacd0b85a97d-43617e35225mr2864797f8f.6.1770199552076; 
 Wed, 04 Feb 2026 02:05:52 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e250b2sm5607462f8f.8.2026.02.04.02.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 02:05:51 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr,
	shirokovalexs@gmail.com
Date: Wed,  4 Feb 2026 11:05:49 +0100
Message-ID: <20260204100550.53737-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8ef76d7b-4573-4ea0-856b-3d5dd9e59a86@smile.fr>
References: <8ef76d7b-4573-4ea0-856b-3d5dd9e59a86@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770199552; x=1770804352; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIgPbiji7J79cILwqghPbL0pPnCXfleVXs4zmrNgi98=;
 b=YyKtN3DyojuPnmGcxo40ya6kYl+GsviiiGtV4iCtTa5B20qo0BbHOWAsGuW8TAqV9d
 bp0VrZD/hrI8PvvF0JIZGboOv+XRmLvhdKQXNA2ihfjDjx8/zPdqUhH/yYPLzEThtGAn
 sc2nL09Be36v1TWbSVeLJztbs62ry2ZY8nGfMEZCo3rNugHThWmOvMQu/f28CKq50IK+
 3ai0st2/U+qvx8LxXe8b21/jwWQret2tgXdHSJl9/UxgdJkkydN9L/QrVilcDj34oR1m
 qtW7s8sMjb8Aq7aXiCO0TzgjFzveY4C2774HmJtHyrDqO3P92C/SsJl3SORRPag3IOoi
 Gz1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YyKtN3Dy
Subject: Re: [Buildroot] [v7, 1/2] package/uutils-coreutils: new package
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

SGVsbG8sCgpUaGFuayB5b3UuIEnigJltIGdsYWQgdG8gcmV0dXJuIHRvIHRoZSB1dXRpbHMtY29y
ZXV0aWxzIGFjdGl2aXRpZXMuCiAKPiBXaGF0IGhhcHBlbnMgaWYgYSB1dGlsaXR5IHRoYXQgaXNu
J3Qgb24gdGhlIGxpc3QgaXMgc2VsZWN0ZWQ/CgpJdCB3aWxsIGxlYWQgdG8gYW4gZXJyb3IgZHVy
aW5nIHRoZSBidWlsZC4gVGhlIGVycm9yIG1lc3NhZ2UgaXMgcXVpdGUgY2xlYXIKKElNTywgb2Yg
Y291cnNlKS4gVGhhdCdzIHdoeSBJIGRlY2lkZWQgdG8gdHJ5IHRoaXMgYXBwcm9hY2guCgoJZXJy
b3I6IHRoZSBwYWNrYWdlICdjb3JldXRpbHMnIGRvZXMgbm90IGNvbnRhaW4gdGhpcyBmZWF0dXJl
OiBiYWQtdG9vbAoJbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI3MzogL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvdXV0aWxzLWNvcmV1dGlscy0wLjUuMC8uc3RhbXBfYnVpbHRdIEVy
cm9yIDEwMQoKPiBzaG91bGRuJ3Qgd2UgcHJvdmlkZSBkb2N1bWVudGF0aW9uIG9mIHRoZSBkZWZh
dWx0IGxpc3Qgc28gdXNlcnMgY2FuIGNob29zZSBhIHZhbGlkIG9wdGlvbj8KClllcywgaXTigJlz
IHBvc3NpYmxlLiBIb3dldmVyLCBzaW5jZSBJ4oCZbSBub3QgMTAwJSBjb25maWRlbnQgYWJvdXQg
dGhlIG92ZXJhbGwKYXBwcm9hY2gsIEnigJlkIHByZWZlciBub3QgdG8gY29weSBhbmQgcGFzdGUg
YSBsYXJnZSBudW1iZXIgb2YgbmFtZXMgZnJvbSBtayB0bwpDb25maWcuaW4uIEl0IGFsc28gZmVl
bHMgbGlrZSBhIG5pY2Ugc291cmNlIG9mIGNvcHktcGFzdGUgZXJyb3JzLgoKCj4gSSB0aGluayB0
aGF0IHRoaXMgZGVmYXVsdCBsaXN0IGNhbiBpbXByb3ZlLCBubz8KPiBJdCB3b3VsZCBiZSBnb29k
IGlmIHdlIGFkZCBhIGNvbW1lbnQgc28gdGhhdCBkZXZlbG9wZXJzIHBheSBhdHRlbnRpb24gdG8K
PiBpbXByb3ZpbmcgdGhlIGxpc3Qgd2hpbGUgdXBncmFkaW5nIHRoaXMgcGFja2FnZS4gCgpZZXMs
IHRoaXMgbGlzdCBsb29rcyBsaWtlIGl04oCZcyBzdWJqZWN0IHRvIGNoYW5nZSwgYW5kIEkgY2Fu
IGFkZCBtb3JlIGNvbW1lbnRzLgpIb3dldmVyLCB0aGUgc2l0dWF0aW9uIGhlcmUgaXMgdGhlIHNh
bWUgYXMgaW4gdGhlIHByZXZpb3VzIGNvbW1lbnQ6IEnigJltIG5vdCAxMDAlCmNvbmZpZGVudCBh
Ym91dCB0aGUgb3ZlcmFsbCBhcHByb2FjaC4gUG9zc2libHksIHdlIHdvbuKAmXQgbmVlZCBjb21t
ZW50cyBhdCBhbGwKb3IgbmVlZCBhbm90aGVyIGNvbW1lbnRzLgoKQW55d2F5LCBJJ2xsIHBheSBz
cGVjaWFsIGF0dGVudGlvbiB0byB0aGlzIHRvIGtlZXAgaXQgY2xlYXIgZm9yIG90aGVyIGRldmVs
b3BlcnMuCgoKUmVnYXJkcywKQWxleGFuZGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
