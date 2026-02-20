Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFD5E9A05B
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 01:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E28C607D4;
	Fri, 20 Feb 2026 01:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GCyhfiFOhMJ; Fri, 20 Feb 2026 01:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0493F60D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771550640;
	bh=InJgplbTI9oNa8sXiStZpPc3sqeH1IegNhci2rMRVTI=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mq4RMgrUM4mApIjAk1pc+qg0r/XN1JXSU1M4vaelbsaAVNabjLE/Kvi2CH+2DyzJf
	 8qPpE5/tDIGFzHRMbl5hqSsBQAyb2DedC/6KpYImLppfHDZR+ymABwXEUJkF28ENqv
	 90P9CmmCJ8kQQxuhQ3n5HbN84bEvkv2VCgiDI3oqz1J+JeZsHRE/FI6jy+zHsj78D8
	 7smviMRlV/bbYcJEOn8uFjHbBBbGoxl5mihycHKXmydinTOC9ZoOJ+oaxM34uAwXLz
	 eL3a5eBXgO8//leX/wjfoCg73wBX+Qh3qD7JsLiOLXTpbGlhOA63LcGF1Tcy2sr347
	 BWMnBE9C7xFLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0493F60D5F;
	Fri, 20 Feb 2026 01:24:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0C86206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAB924132F
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFH9AvrjswRR for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 01:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D86F74131C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D86F74131C
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D86F74131C
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 01:23:57 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-82310b74496so836291b3a.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771550637; x=1772155437;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGUH1SJu6xM95KdpU+rXU2BSXk+i3TmaGTMHX2lJmdY=;
 b=JdZOOaJcxcGuI0JBtV06ZXb1/p35WeNRzDpvw1C5RYX/xgBh8AGRb+twnpMYNNGuG6
 geJzCy+87Oan/jATNrTfAuKLG+JRzzHi2XYYEd9B53DdqnOZuwCiOMPvOhRDEO6A8MZ7
 t2ZsZE4/qf7UMwSZ7MRjKW7Yez3VEIEJHyW7TyfQaMHVNpMkwwLpUbJp3x1wdbYgvLdq
 UCocBXofOOMEUaG4c4YT/TW7zwObVcDTkEC5wGYbPJMAp3f+fjOdRJqnw0e/dOGyPLud
 NSw19LClqteR0vfR/PLe1TaHm5310rCqrCsp0mDHJlM6XJqYZHliS/MRYSpPwlT7W+kQ
 x2hg==
X-Gm-Message-State: AOJu0Yx6Sc2Mg+/sdjylbhJEPE4s7J9D2gBivysLXTdaoT7Gy6N/RLUu
 MyrBJd9EDj355wNl+563wTvEwsCvYtuR6XCseJRVDFLVdf9vhwaRUQbI
X-Gm-Gg: AZuq6aLfbY9dn2K5vICIJMogjNibju6Nrouo+mtcM/S6QrMR+/9GnwZWK/evbWsylmK
 7EfaIuJb0kZn6GQZAaE0WwTclvWs9Ytcavite/BWMY7XyPLml+vc0+EZmOH5FhL2mvP67qCxIpr
 CrgafOjHWF2ZZo/0m+2tLVgKazpeStELBme8C5Z0+x6GPFVyt2vj989zLU/iuuOZMhrrBBJtGJI
 J9Jm0F7IyAFE52a3qpX6FUO3tsc7uTCuY1AkaS9o1U7cXKF8LaxYtcyM7U2Eo5lkmveF91KWAVr
 +u3JoWY0AkJKYhGeevGjnol64TEVbozKWkohc+ta9j4iFT1Dn402iff1x3omqzXsSGk51gTdUL6
 Kzo06R7D9IaDZqTL1G8Br+T2nYy1vrkn+3+T8pjfBULPvM4U7XWWtSPX1xaL4UXdyxYgllhK+B7
 WSejmWiWJaiddxzAkp9rWmUmYR9g==
X-Received: by 2002:a05:6a00:7586:b0:821:70e7:74ca with SMTP id
 d2e1a72fcca58-824c965d569mr18276591b3a.70.1771550636788; 
 Thu, 19 Feb 2026 17:23:56 -0800 (PST)
Received: from wash-5.local ([50.120.91.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a627a5sm25606758b3a.27.2026.02.19.17.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 17:23:56 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 17:23:52 -0800
Message-Id: <20260219-virglrenderer-v3-0-e2ff1a23be3f@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MywqDMBCF4VeRWTclxktNV32P0sWYjDqgsUxEB
 PHdGwvdFM7mX5xvh0jCFOGe7SC0cuQ5pCguGbgBQ0+KfWow2tTa5FatLP0oFDwJiXKlR29ri76
 xkD5voY63r/d8pe5kntQyCOFPqXKjiz9lNee0Mk1Zdy7H6mbx0U/I49XN0+m2GEm1gsENpxNoW
 +A4Pg/iXMq+AAAA
X-Change-ID: 20260219-virglrenderer-c4dad969ad89
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771550636; l=4607;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=XvWxwDQeNmCtMmaR1zbHg6Xf9OIO8v7mfG1660ofs+g=;
 b=V4gIT5/0G7XMUt3h3Ez1jJWPOjHgWEr/fU0jzWf5O1ibo/0WULuIEWgXVUWC/paP1iyaSvUW4
 K5adlfsSbBkBSGymQ5I9BYKpKAAUUZukjnb+/M3WXjsUsjlUhyrbG8h
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771550637; x=1772155437; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yGUH1SJu6xM95KdpU+rXU2BSXk+i3TmaGTMHX2lJmdY=;
 b=ff3+bI3HyVLbTBBbuqov9fGFgiI2YMOZb5N/cifsP2/Wj3LemqnZjOkiGqkDjJf1n2
 8igRgfFS4LNSX/HVfdZ1U3dbxyEjCo8MXKqTi4AbMXRxQEuh34S6JopWGnCcwI/mCGHJ
 OvdiiVaAT/eRwDMVvjOt7lcKvuZX9BzTJUQDUya4ztloFTkmdx/gT6oROFP+s01XGlo7
 I0RdLaT4USqRJqVXNM/Nt/J7KwHPhgphPwTPyUqjNZAL01JlwDLFTsVpS37Y272lXNa8
 qE02Xu/YtiTmYWHeFaw8YPFbUJlyPBAwEAnbYfEkP3NQDOz6cR4cAHIEB/nvRyJkkxP7
 Ro3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ff3+bI3H
Subject: [Buildroot] [PATCH v3 0/2] Add virglrenderer support
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxkaW5nIHRoZSB2
aXJnbHJlbmRlcmVyIGxpYnJhcnkgaW4KYnVpbGRyb290LgoKVmlyZ2xyZW5kZXJlciBpcyBhIHVz
ZXJzcGFjZSBsaWJyYXJ5IHVzZWQgdG8gc3VwcG9ydCByZW5kZXJpbmcgYW5kCmNvbXB1dGUgaW4g
dmlydHVhbCBtYWNoaW5lcyBvdmVyIHZpcnRpby1ncHUuIFZpcmdscmVuZGVyZXIgc3VwcG9ydHMK
c2VyaWFsaXplZCBBUEkgbGV2ZWwgYWNjZXNzIHRvIE9wZW5HTCBhbmQgVnVsa2FuIHRocm91Z2gg
dmlyZ2wgYW5kIHZlbnVzCnJlc3BlY3RpdmVseSwgYXMgd2VsbCBhcyBtZWRpYXRlZCBEUk0gbGV2
ZWwgYWNjZXNzIHVzaW5nIGhvc3QgbmF0aXZlCmNvbnRleHQgWzBdLiBOb3RhYmx5IGxpYmtydW4g
WzFdIGFuZCBydXRhYmFnYV9nZnggWzJdIGFyZSBhbHNvIGNhcGFibGUgb2YKdXRpbGl6aW5nIHZp
cmdscmVuZGVyZXIuCgpGb3IgdjMgb2YgdGhlIHBhdGNoLCBJIHJlbW92ZWQgdGhlIGRlcGVuZGVu
Y3kgb24gKEhBU19MSUJFR0wgfHwKSEFTX0xJQkdMKSBpbiBmYXZvciBvZiBqdXN0IGRlcGVuZGlu
ZyBvbiBIQVNfTElCRUdMLiBUaGUgcHJvamVjdCBpcwppbnRlbmRlZCB0byBzdXBwb3J0IGJvdGgg
RUdMIGFuZCBHTFgsIGJ1dCBtb3N0IGdyYXBoaWNzIHBhdGhzIG5vd2FkYXlzCnVzZSBFR0wsIGFu
ZCB0aGlzIGlzIGEgYml0IHNpbXBsZXIuIFN1cHBvcnQgZm9yIEdMWCBjb3VsZCBiZSBhZGRlZCBp
biBhCmxhdGVyIHBhdGNoIGlmIGFueW9uZSBuZWVkcyBpdC4gCgpUaGUgZmlyc3QgcGF0Y2ggYWRk
cyB0aGUgbmV3IHZpcmdscmVuZGVyZXIgcGFja2FnZS4KClRoZSBzZWNvbmQgcGF0Y2ggYWRkcyBh
biBPcGVuR0wgY29uZmlnIGZvciBxZW11LCBhbmQgYSB2aXJnbHJlbmRlcmVyCmNvbmZpZyB0aGF0
IHNlbGVjdHMgaXQsIGFzIHZpcmdsL3ZlbnVzIGN1cnJlbnRseSByZXF1aXJlIGEgR0wKYWNjZWxl
cmF0ZWQgZGlzcGxheSBmcm9udGVuZC4gQW4gb3B0aW9uYWwgY29uZmlnIGZvciBlbmFibGluZyB2
ZW51cyBvbgp2aXJnbHJlbmRlcmVyIGVuYWJsZXMgdnVsa2FuIHBhc3N0aHJvdWdoLCBhbmQgYSBj
b25maWcgZm9yIHZhYXBpIGVuYWJsZXMKaGFyZHdhcmUgdmlkZW8gYWNjZWxlcmF0aW9uLgoKVGVz
dGVkIHdpdGggbGxhbWEtYmVuY2ggcnVubmluZyB3aXRoIHRoZSB2dWxrYW4gYmFja2VuZCBpbiBh
IG5lc3RlZCBWTS4gCkFzIHNlZW4gYmVsb3csIHRoZSBuZXN0ZWQgZ3Vlc3QgaXMgc2VuZGluZyBj
b21tYW5kcyB0byB0aGUgaG9zdCB0aHJvdWdoCnZpcnRpby1ncHUgdHdpY2UuCgogICAgICAgICMg
bGxhbWEtYmVuY2ggLW0gbGxhbWEtMi03Yi5RNF8wLmdndWYgLW5nbCAxMDAgCiAgICAgICAgZ2dt
bF92dWxrYW46IEZvdW5kIDEgVnVsa2FuIGRldmljZXM6CiAgICAgICAgZ2dtbF92dWxrYW46IDAg
PSBWaXJ0aW8tR1BVIFZlbnVzIChWaXJ0aW8tR1BVIFZlbnVzIChBTUQgUmFkZW9uIFJYIDY5MDAg
WFQgKFJBRFYgTkFWSTIxKSkpICh2ZW51cykgfCB1bWE6IDAgfCBmcDE2OiAxIHwgd2FycCBzaXpl
OiA2NCB8IHNoYXJlZCBtZW1vcnk6IDY1NTM2IHwgaW50IGRvdDogMSB8IG1hdHJpeCBjb3Jlczog
bm9uZQogICAgICAgIHwgbW9kZWwgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgc2l6
ZSB8ICAgICBwYXJhbXMgfCBiYWNrZW5kICAgIHwgbmdsIHwgICAgICAgICAgICB0ZXN0IHwgICAg
ICAgICAgICAgICAgICB0L3MgfAogICAgICAgIHwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIHwgLS0tLS0tLS0tOiB8IC0tLS0tLS0tLTogfCAtLS0tLS0tLS0tIHwgLS06IHwgLS0tLS0t
LS0tLS0tLS06IHwgLS0tLS0tLS0tLS0tLS0tLS0tLTogfAogICAgICAgIHwgbGxhbWEgN0IgUTRf
MCAgICAgICAgICAgICAgICAgIHwgICAzLjU2IEdpQiB8ICAgICA2Ljc0IEIgfCBWdWxrYW4gICAg
IHwgMTAwIHwgICAgICAgICAgIHBwNTEyIHwgICAgICAxMjIwLjk5IMKxIDEwLjEyIHwKICAgICAg
ICB8IGxsYW1hIDdCIFE0XzAgICAgICAgICAgICAgICAgICB8ICAgMy41NiBHaUIgfCAgICAgNi43
NCBCIHwgVnVsa2FuICAgICB8IDEwMCB8ICAgICAgICAgICB0ZzEyOCB8ICAgICAgICAgODIuMjQg
wrEgMS4wMCB8CgogICAgICAgIGJ1aWxkOiB1bmtub3duICgwKQoKTW9yZSBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgYmVuY2htYXJrIGFuZCByZXN1bHRzIGZyb20gb3RoZXIgaGFyZHdhcmUgb24KdGhl
IGxsYW1hLmNwcCBHaXRIdWIgZGlzY3Vzc2lvbiBoZXJlIFszXS4KCkZlZWRiYWNrIHdlbGNvbWUu
CgpbMF0gaHR0cHM6Ly93d3cuY29sbGFib3JhLmNvbS9uZXdzLWFuZC1ibG9nL2Jsb2cvMjAyNS8w
MS8xNS90aGUtc3RhdGUtb2YtZ2Z4LXZpcnR1YWxpemF0aW9uLXVzaW5nLXZpcmdscmVuZGVyZXIv
ClsxXSBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9saWJrcnVuClsyXSBodHRwczovL2dp
dGh1Yi5jb20vbWFnbWEtZ3B1L3J1dGFiYWdhX2dmeApbM10gaHR0cHM6Ly9naXRodWIuY29tL2dn
bWwtb3JnL2xsYW1hLmNwcC9kaXNjdXNzaW9ucy8xMDg3OQoKU2lnbmVkLW9mZi1ieTogSm9zZXBo
IEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBCdW1w
IHZlcnNpb24gdG8gdjEuMy4wCi0gQWRkIG9wdGlvbmFsIGRlcHMgZm9yIHBhbmZyb3N0IGFuZCBp
OTE1IG5hdGl2ZSBjb250ZXh0IChuZXcpCi0gQWRkIGNvbmZpZyBmb3IgdmFhcGkgc3VwcG9ydAot
IFJlbW92ZSBHTFggaW4gZmF2b3Igb2YgRUdMCi0gVXBkYXRlIHFlbXUgZG9jcyBsaW5rcywgYXMg
cHJldmlvdXMgb25lcyA0MDQgW1JvbWFpbl0KLSBGaXggaW52YWxpZCBjb25maWcgcmVmZXJlbmNl
IGluIEJSMl9QQUNLQUdFX1FFTVVfVklSR0xSRU5ERVJFUgogIFtSb21haW5dCi0gU2VsZWN0IGxp
YmVwb3h5IHdoZW4gZW5hYmxpbmcgT3BlbkdMIHN1cHBvcnQgaW4gcWVtdSBbUm9tYWluXQotIEFk
ZCBkZXBlbmRzIG9uIGdjYyA+PSA0LjEgdG8gdmlyZ2xyZW5kZXJlciAoZnJvbSBtZXNvbi5idWls
ZCkKLSBBZGQgZGVwZW5kcyBvbiBsaWJnYm0gdG8gdmlyZ2xyZW5kZXJlciBbUm9tYWluXQotIEFk
ZCBjb21tZW50cyBmb3IgbWlzc2luZyBkZXBlbmRlbmNpZXMgdG8gdmlyZ2xyZW5kZXJlciBLY29u
ZmlnCi0gU2VsZWN0IHZ1bGthbi1oZWFkZXJzIHdoZW4gdmVudXMgaXMgZW5hYmxlZCBbUm9tYWlu
XQotIERpc2FibGUgdmVudXMgZXhwbGljaXRseSB3aGVuIHRoZSBzeW1ib2wgaXNuJ3Qgc2VsZWN0
ZWQKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTEy
MDMtdmlyZ2xyZW5kZXJlci12Mi12Mi0wLTI4NDZmYzFhNTc5YUBnbWFpbC5jb20KCkNoYW5nZXMg
aW4gdjI6Ci0gUmViYXNlIG9udG8gbmV4dCAocHl0aG9uLWdsc2xhbmcgcGF0Y2ggbWVyZ2VkKQot
IEJ1bXAgdmVyc2lvbiB0byB2MS4yLjAKLSBSZW1vdmUgaGlkZGVuIGNvbmZpZ3MgZm9yIHZpcmds
cmVuZGVyZXIgdkRSTSBiYWNrZW5kcyBbUm9tYWluXQotIEZpeGVkIHR5cG8gaW4gcWVtdS9Db25m
aWcuaW4gW1JvbWFpbl0KLSBTcGxpdCB1cCBjb25maWdzIGZvciBxZW11IE9wZW5HTCBhbmQgdmly
Z2xyZW5kZXJlciBzdXBwb3J0IFtSb21haW5dCi0gTW9yZSBkZXRhaWxlZCBxZW11IGNvbmZpZyBo
ZWxwIG1lc3NhZ2VzCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1
MDYxOC12aXJnbHJlbmRlcmVyLXVwc3RyZWFtLXYxLTAtNTc1MjVhYzg0MDZlQGdtYWlsLmNvbQoK
LS0tCkpvc2VwaCBLb2d1dCAoMik6CiAgICAgIHBhY2thZ2UvdmlyZ2xyZW5kZXJlcjogbmV3IHBh
Y2thZ2UKICAgICAgcGFja2FnZS9xZW11OiBhZGQgdmlyZ2xyZW5kZXJlciBzdXBwb3J0CgogREVW
RUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3FlbXUvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKwogcGFja2FnZS9xZW11
L3FlbXUubWsgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrLQogcGFja2FnZS92aXJn
bHJlbmRlcmVyL0NvbmZpZy5pbiAgICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwogcGFja2FnZS92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIuaGFzaCB8ICA1ICsrKwog
cGFja2FnZS92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIubWsgICB8IDU3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogNmM4M2EwYjhlNTY1OGI5MDFkZDM1YWUy
MzIxNzA3NWYwMzVhZjk5OApjaGFuZ2UtaWQ6IDIwMjYwMjE5LXZpcmdscmVuZGVyZXItYzRkYWQ5
NjlhZDg5CgpCZXN0IHJlZ2FyZHMsCi0tIApKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBnbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
