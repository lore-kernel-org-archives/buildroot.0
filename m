Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99CCC5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 15:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4629960B68;
	Tue, 27 Feb 2024 15:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKpIBJq3OPb6; Tue, 27 Feb 2024 15:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3495C60BB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3495C60BB6;
	Tue, 27 Feb 2024 15:38:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B36D1BF307
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 15:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0838340735
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WXfNyVw-R1V for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 15:38:31 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2CF6403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CF6403A7
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2CF6403A7
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 15:38:30 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1dc09556599so38317695ad.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 07:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709048309; x=1709653109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8xF+RMhLjf4xBGKVHC/C31tfL5FspP5CAbErb7Ojf+0=;
 b=Wsmf3BUrAxEu18n0nMOXXXwukPyKRKmImFy6hQ2+oQGTlca+C5QI3vRxRssaPZu9zo
 edwioZRg0nOwW+U66sJDIcqc4f5+eMIgUqR/V3oBzZTXGZ//OVIlO45kBYgWusWQHXuI
 3Xu1oILKDyckQ7MpyrjnTzzXdkk5GmxxyZYsQpnV0bntmmy/W9j8Z9wlWfaFHjc2mIoq
 xr3BpUR29COyEfZ6IzyCHPVQOAqMjQ4dSCaKHBwecWiXRDZqUB/wkOVklcXqicWXtVQo
 58lke8iv4d7UGh4pC6j4irCKZxaopnTotQnAwEgLRxMWH0IYSxvXFUtAw91V+Icpbyao
 AoBg==
X-Gm-Message-State: AOJu0Yz+w6MzBDEx3pdQfJwQdPHbmm1Z4D7+1FNXO8NLVQ0dygQ++Oev
 /YGCc+dawv9NFqbwjj8wv5xXKZT2LlEAE0FveEFgtboipFpeuOdqzeZ3Uwwwgwy2e43UW/7SOEn
 Wfqk=
X-Google-Smtp-Source: AGHT+IHZbVqn3LSpqFVqiDVadivCptniIP9qZ9PVYErJJTqmKVsCKtBUFSexRhql1qtPYm9SxYFPxQ==
X-Received: by 2002:a17:902:bb95:b0:1dc:794e:27b2 with SMTP id
 m21-20020a170902bb9500b001dc794e27b2mr11360655pls.56.1709048309291; 
 Tue, 27 Feb 2024 07:38:29 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 mn12-20020a1709030a4c00b001dca6d1d574sm1664065plb.302.2024.02.27.07.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 07:38:28 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 12:38:15 -0300
Message-ID: <20240227153815.583392-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1709048309; x=1709653109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8xF+RMhLjf4xBGKVHC/C31tfL5FspP5CAbErb7Ojf+0=;
 b=Ev6WaRYRoUj6DohP/rbh/O9AA+Cjrz/AnPwrzV+RRI/P36lE44q7P5+tb58ocACBH0
 ClXMcZOikpNykSbU64UD3q7kLrpsXCnQtYsHTDV80usbRs2nwSG/mxkJdNuZG2I/2qgI
 bv3L9UDkge1jPJLH6BkB2Kqssb6WP6KvLGY/L+qX8uB9PbnaKa3fLY60XbJT+ctKjbcO
 z5P/jrLjD/h5WSQZ0yQ3npEWF2Lzj1CM4w07KgGVdmDx6ezMFS0jBN/l0MgJAx17Q10s
 /TLu3QdWFnXnDTOkF8YUdmag66MrXBCXfpVf5JGdjZ0yqtt52TykGUSW4cdk5B0+mwsN
 LfDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ev6WaRYR
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2402.0
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
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCA5YzAwMzY1MzU1Li4y
MTJhMWFjY2VhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICA3NzQwMzIwMDYxMjhhODk2NDM3ZjU5MTNlMTMyYWEyN2RiZmI5MzdjZDg4NDdlNDQ5NTIyZDVh
MTJkNjNkMDNlICByc3lzbG9nLTguMjMxMi4wLnRhci5negorc2hhMjU2ICBhY2JkZDg1Nzk0ODlk
ZjM2YjRhMzgzZGM2OTA5YTYxYjc2MjM4MDdmMGFmZjU0YzA2MjExNWYyZGU3ZWE4NWJhICByc3lz
bG9nLTguMjQwMi4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDE5MTk4NjNmNGYuLmFkNGNmYTI0YTcgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yMzEyLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjQwMi4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
