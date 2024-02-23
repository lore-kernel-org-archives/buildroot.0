Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B4CC54E49
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F12C821CE;
	Fri, 23 Feb 2024 20:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4klDKHDZmNRp; Fri, 23 Feb 2024 20:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E6BD821ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6BD821ED;
	Fri, 23 Feb 2024 20:14:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 432EE1BF2FE
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 314924084D
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 20:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn3CITKEAv9o for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 20:14:05 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 813094084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813094084A
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 813094084A
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 20:14:05 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-29a7951c6faso715170a91.1
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 12:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708719244; x=1709324044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NiQPmCiMZeAvTnAau6CDik/129xaRolc2LqYfn78Uw=;
 b=OFktF98WbFN/iRoehliqAcoYhANneFrEenTlIEKUx1dHnvKkv27YhwLst94YtSAt/n
 NzMtPBA0M+3zZCMh6RQq/EiIEANn0ip8IJ7x/1TYjmgt7qJozvQC57mWDYSHH6hG73Kw
 X8yLy9yBSrPemHUgGzApRHseoaVGN2gmANBivVwc14Ppm1LUgIFFJJw1p35TlUocsllR
 npGoeUdrwdAh4wHZG2Uc3cnLdmO+El25o61U8t4Laur+olMg51F9JCSMNKfsuQd/Zlzo
 iDVSa2zXdcWbu1opDWzXtMMZ6/8eiUL/A7grSNTbzD6QmV8VJ50HLOvOfbGr/3pLUae4
 UklA==
X-Gm-Message-State: AOJu0YwEDmW/flcneZnT6TROmBXEUjgGLPCP65SH32YV/kUnrcny2Jck
 FtVAoOdjFlSAF1Yr1C70b+gTcI7CcV/PAnANyjnapBe11N3L5ZDgIl1IhVrBODajMv4wf26+2LY
 9fWAl9A==
X-Google-Smtp-Source: AGHT+IHfQaa+sVmnLsS4SfdUe7odgwcHLegIHQVyBvwPrY752gALq7ZlUOWbgJVbL3Uaq+lbai/wEQ==
X-Received: by 2002:a17:90a:bd0a:b0:299:dd2:47f with SMTP id
 y10-20020a17090abd0a00b002990dd2047fmr870531pjr.10.1708719244504; 
 Fri, 23 Feb 2024 12:14:04 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 pd7-20020a17090b1dc700b0029696f7f443sm1911281pjb.50.2024.02.23.12.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 12:14:04 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 17:13:54 -0300
Message-ID: <20240223201354.478070-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223201354.478070-1-flavio.tapajos@newtesc.com.br>
References: <20240223201354.478070-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1708719244; x=1709324044;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NiQPmCiMZeAvTnAau6CDik/129xaRolc2LqYfn78Uw=;
 b=mQ8XHL8wbJGgWGqImoIkyUg5x6peon53Z4ZIMVnqxLw3EqQ1hcJZN5ylPvgV/xl26g
 6K7/yFhdXiv+lJq4Kv0tQzDDWZxYdG63qdpMMv8mzIUAb7vVLmvS0FaLaIF9xxKCXQtX
 QuCPnoPxC0G3jllJwDQXDQR7BeYKDL5RLHDrRtRDiP8unq8zVWCQd6Lfe8I/IkAxDPbq
 M2EY3JhrmIuRl6n+BF6Ww5e3d69Xn0+iec80dMElW6G9nU7oCZ98iUUDs2nGoUsay7L4
 6z3DQnk7c8XnUxBlAaIZcApepyg2rSH4+1jlvBkqwreFkTXcJfEDZ4p6g6Ogntnmo24l
 lA2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mQ8XHL8w
Subject: [Buildroot] [PATCH 2/2] package/python-paho-mqtt: bump version to
 2.0.0
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
Cc: Davide Viti <zinosat@gmail.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1wYWhvLW1xdHQuaGFz
aCB8IDIgKy0KIHBhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5o
YXNoIGIvcGFja2FnZS9weXRob24tcGFoby1tcXR0L3B5dGhvbi1wYWhvLW1xdHQuaGFzaAppbmRl
eCA4MWI5ZGRhODFkLi4yOWQ0ZGZjNzdkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1wYWhv
LW1xdHQvcHl0aG9uLXBhaG8tbXF0dC5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0
dC9weXRob24tcGFoby1tcXR0Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIGxvY2FsbHkgY29tcHV0
ZWQKLXNoYTI1NiAgNmUzNWMxYmUyNDJhOTAxZmM5YzAwYmFkN2QzN2I1Y2M0YTQ5N2YzOThkZmNl
YjRlZDBkODAxOGE5NTliZTY1MCAgcHl0aG9uLXBhaG8tbXF0dC0xLjYuMS50YXIuZ3oKK3NoYTI1
NiAgNjNlOWYyZjlmMmUzYTYzNDViMmE1MDAxMGVjZGJiY2ZkYTZjYjFmNWNmZjczYTJmMzk1Mjhk
YWM4ZGViZDFkMCAgcHl0aG9uLXBhaG8tbXF0dC0yLjAuMC50YXIuZ3oKIHNoYTI1NiAgNjY0MDhi
MDQ5MjQ5YzNiZGIwYmExZWQyODVmNTQyMmNlNjdlMzcxZDQwMTUxYmViZDRkODA2YWY0NTRmZmU3
YyAgTElDRU5TRS50eHQKIHNoYTI1NiAgZThjZjdkNTRlYTQ2YzE5YWJhNzkzOTgzODg5YjdmNzQy
NWUxZWJmY2FhY2NlYzc2NGE3ZGIwOTE2NDZlMjAzYyAgZWRsLXYxMAogc2hhMjU2ICA4YzM0OWY4
MDc2NGQwNjQ4ZTY0NWY0MWVmMjM3NzJhNzBjOTk1YTA5MjRiNTIzNWY3MzVmNGEzZDA5ZGYxMjdj
ICBlcGwtdjIwCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wYWhvLW1xdHQvcHl0aG9uLXBh
aG8tbXF0dC5tayBiL3BhY2thZ2UvcHl0aG9uLXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lm1r
CmluZGV4IGYyNTVhNzg0N2QuLmI5MTgwZTNiYTAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9u
LXBhaG8tbXF0dC9weXRob24tcGFoby1tcXR0Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBhaG8t
bXF0dC9weXRob24tcGFoby1tcXR0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotUFlUSE9OX1BBSE9fTVFUVF9WRVJTSU9OID0gMS42LjEKK1BZVEhPTl9Q
QUhPX01RVFRfVkVSU0lPTiA9IDIuMC4wCiBQWVRIT05fUEFIT19NUVRUX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLGVjbGlwc2UscGFoby5tcXR0LnB5dGhvbix2JChQWVRIT05fUEFIT19NUVRUX1ZFUlNJ
T04pKQogUFlUSE9OX1BBSE9fTVFUVF9MSUNFTlNFID0gRVBMLTIuMCwgRURMdjEuMAogUFlUSE9O
X1BBSE9fTVFUVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQgZXBsLXYyMCBlZGwtdjEwCi0t
IAoyLjQzLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
