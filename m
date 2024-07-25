Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD76C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A170460ACE;
	Thu, 25 Jul 2024 15:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3pEoJoqAxPm; Thu, 25 Jul 2024 15:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 294DD60AD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294DD60AD6;
	Thu, 25 Jul 2024 15:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E07811BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC44A81EDC
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnXhPRrQyNrO for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:38:05 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECCF081EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCF081EDB
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECCF081EDB
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:38:04 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7a1be7b5d70so797226a12.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721921884; x=1722526684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Atw9Ocmlk6zwlb7VJl3xmlYfeaXiECfq9kxdF8es80s=;
 b=r9EMQsVOxm7+tjdLpcqslKaWM6CNNyqL8Ybf/4mK7/Eo1wNAhbs7IwkZxTYmsGuTU+
 DdHMv6U/rgTyMPxK6dUkiXwAEnoOM+oL/aRbCW/j6WoG2C/yqGXLWvV0hQVbLqcFoXTF
 NxX15S/ySeVICzrribVLKpRXdAEeG0SIsz3bg5H9QtoLtw3Y4yINnQeZbj8573rOb8ER
 1oRnyr7fuNQhqZ+cvYFZRNzbrjxrqdk07ZuVn2+LzuNmpnMhL0clCE3cXJdbhgHfn79Q
 lUEhlxLQqjA+itjvLIWCuY7Ejfyg2THlDJjZ+p5j1+I6gMyd7y3fLMDIC85XnFEW+pk4
 6Gvw==
X-Gm-Message-State: AOJu0YxXoVnlAywD4vkeRZW8MygPyrCzYaNTyEk8GG8fpUgD1bREduIH
 Yh5StB45uCC1Ygc3aPGePeKoXxMmKA2yWOgJGfXngGCHuL9b4scPyIiF5EBBV33iPzRIK2j8tmo
 a
X-Google-Smtp-Source: AGHT+IEcHul0+gAgOmdwRrtG/CrZMKJtCgeZ36HGBlSs1PxWeV6GlhsgEZoqstvokzzMI4prxpvWUw==
X-Received: by 2002:a17:90b:1e49:b0:2c9:6aab:67c4 with SMTP id
 98e67ed59e1d1-2cdb93b8279mr9012014a91.10.1721921883699; 
 Thu, 25 Jul 2024 08:38:03 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c9c764sm1703749a91.26.2024.07.25.08.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 08:38:03 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 12:37:42 -0300
Message-ID: <20240725153743.101494-3-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725153743.101494-1-flavio.tapajos@newtesc.com.br>
References: <20240725153743.101494-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1721921884; x=1722526684;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Atw9Ocmlk6zwlb7VJl3xmlYfeaXiECfq9kxdF8es80s=;
 b=mn4hSOHbao3rxPCU+eE5ojlrs8daoGLedjP3tEpzLS32CEa/sLFMIzgdUZ+WoX/ROR
 YFP+dKj2zYjKKcFhK4usQKsd3ZQUr9RHCmTnGwGYkt/mLxulrbzsj6hn4GpwW0qGG/ii
 dTkdHtWswK1qIIgDmESlPBM3c/Fi15iKEDugMa1PAl8l62wn1ztqNiluTqRFABIQ5uSy
 YRoQJOwa7CgTZxMdcsoUqkxNeKhHLRWZbkpl5mDLX0lsM4LO3BbHY5qzjrJtMiXSANbp
 ZllizWsLJVGWx2iqVAn68lTQIqJhm6MYAN/suN1QzLVynNVRl8WFRZglesW5Iihtat0a
 3njQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mn4hSOHb
Subject: [Buildroot] [PATCH 3/3] package/rsyslog: bump version to 8.2406.0
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCAyMTJhMWFjY2VhLi5j
YWY0MTFjMzIyIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICBhY2JkZDg1Nzk0ODlkZjM2YjRhMzgzZGM2OTA5YTYxYjc2MjM4MDdmMGFmZjU0YzA2MjExNWYy
ZGU3ZWE4NWJhICByc3lzbG9nLTguMjQwMi4wLnRhci5negorc2hhMjU2ICAxMzQzZTAyNjlkZDMy
MTY2ZmZkZTA0ZDdjZWViZmEwZTcxNDZjZjFkYmM2OTYyYzU2YmY0MjhjNjFmMDFhN2RmICByc3lz
bG9nLTguMjQwNi4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IGFlNjQ1MDExYmEuLmRmNTg1MmQ3MzEgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yNDAyLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjQwNi4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
