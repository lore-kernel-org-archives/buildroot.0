Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6136BC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 16:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D7F40482;
	Wed, 10 Jan 2024 16:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0D7F40482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_lOvOCXF-PY; Wed, 10 Jan 2024 16:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925554360F;
	Wed, 10 Jan 2024 16:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925554360F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96CFC1BF2C7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CB178336F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB178336F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZO-m_HHc5fj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 16:35:20 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A8B383267
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 16:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8B383267
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so56354775e9.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 08:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704904518; x=1705509318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lIFDQm6rUp+oSUNDUIff/P2IYeo7FSHzG/xLF5QBy98=;
 b=o10MqxUbbL+qHtS7F3ywQURR9co8+6sBcGoLRCLaO+/56EJoGHQrF0HmrtRGf2pbdY
 lDS1zo5+7EBSv7z0XdDk3WSUm96xFDoAcnO4VY4/3wrfbBbXq3eplkulD7Tuv9bs64Ro
 FiuTQpMh5YbZFaJVrNFtVnMld+v2fcVGpOaV6lLjmmEsMMbHCzQwznsrdRgRFjV83paj
 ec7DWl6l2vX3OBJcuqmsW00E+1J7qXrYPh7Cq3RrJDLLg6tSBcSMcSIOPR4nqM8HYSIJ
 LoMwQCyjxLUsfEw4/E8ylXncoxtSgSoTC2bOXgqUv8oHnt9jfeJMBaMWHplG3g7fIg2m
 iyOg==
X-Gm-Message-State: AOJu0YxmYelJEAniV7paBSW74mKalpv6CPm1BvfuxF9V+JdGK7VgZIlL
 +66Y//IxlKUvYt+VRDJFADCMb63aizM5M9SZL+AbJ2VpdSMTjQ==
X-Google-Smtp-Source: AGHT+IGL2K6mCvuC9m04WNnts4M9evlMJbS3+dMSjiPuCe7o2bi2ETqxyo2KSUUi2XArBllMcAqYGQ==
X-Received: by 2002:a05:600c:468c:b0:40e:565a:5df2 with SMTP id
 p12-20020a05600c468c00b0040e565a5df2mr652381wmo.217.1704904517951; 
 Wed, 10 Jan 2024 08:35:17 -0800 (PST)
Received: from localhost.localdomain (176-161-53-116.abo.bbox.fr.
 [176.161.53.116]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b0040d7b340e07sm2720202wmo.45.2024.01.10.08.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:35:17 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 17:34:10 +0100
Message-Id: <20240110163412.3977522-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704904518; x=1705509318;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lIFDQm6rUp+oSUNDUIff/P2IYeo7FSHzG/xLF5QBy98=;
 b=i1mn0vtsgklExrAYt7O2wqwbelCnkIJ1dCGpZRcj5UJiIEvX31iMLG3KEC7HeBe8Bq
 RHVt7bLCANYvN5noIaz/M140JgegFMn0uB+OfiwBe6oI9COQa/eOWyQYhzthM00rfXcb
 Gmb1ETXQVph/44C3ftlS1D3SlehI0hpSKkQgBHx+D99HcwwQLqyZFkb8AXhn10F2L7C9
 IIBn5aYBGs6YWpkjCtJvh6zyxK72e776fRhJKWFR6yX8UX1kENVbMaTmgkdEAtbtk95j
 zFiatzcpSybAXLV9MKs7kOmp+0OltR++gmF2Qeh8pDKwb6onAfZIjr5v1H+XGtptZ5Po
 mb+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=i1mn0vts
Subject: [Buildroot] [PATCH v3 1/3] Revert "support/download: generate even
 more reproducible tarballs"
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
Cc: sebastian.weyer@smile.fr, Vincent Fazio <vfazio@xes-inc.com>,
 Antoine Coutant <antoine.coutant@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.naour@smile.fr,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkNvbW1pdCA3
NjhmOWY4MGY2MmMgKHN1cHBvcnQvZG93bmxvYWQ6IGdlbmVyYXRlIGV2ZW4gbW9yZSByZXByb2R1
Y2libGUKdGFyYmFsbHMpIGNhdXNlcyBub24tcmVwcm9kdWNpYmlsaXR5IGluIHRhcmJhbGxzIHdl
IHByZXZpb3VzeQpnZW5lcmF0ZWQsIGVzcGVjaWFsbHkgdGhlIGFyY2hpdmVzIGZvciB0d28gY2Fy
Z28tdmVuZG9yZWQgcGFja2FnZXMsCnJpcGdyZXAgYW5kIHNlbnRyeS1jbGkuCgpUaGUgY2F1c2Ug
aXMgdGhhdCB0aG9zZSB0d28gcGFrY2FnZXMgZXZlbnR1YWxseSB2ZW5kb3IgYSBmaWxlIHRoYXQg
aGFzCnRoZSB1K3ggYml0IHNldCwgYnV0IGlzIG90ZWhyd2lzZSBnby14LiBXaXRoIDc2OGY5Zjgw
ZjYyYywgdGhlIGZpbGVzIGFyZQpub3cgZ28reCwgc28gdGhlIGhhc2ggZm9yIHRob3NlIGdlbmVy
YXRlZCBhcmNoaXZlcyBoYXMgY2hhbmdlZC4KCkJlc2lkZXMsIHRoYXQgY29tbWl0IHdhcyB3cm9u
ZzogaXQgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgJ3InIGJpdCBmb3IKZ28gcGFydCwgbGVhdmlu
ZyBzb21lIG5vbi1yZXByb2R1Y2liaWxpdHkgc3RpbGwgdW5hY2NvdW50ZWQgZm9yLgoKU28sIHRv
IGdlbmVyYXRlIHJlYWxseSByZXByb2R1Y2libGUgYXJjaGl2ZXMsIHdlIHdvdWxkIG5lZWQgdG8g
Zml4IHRoYXQKcmVhZCBiaXQgYXMgd2VsbCwgYW5kIHRoYXQgaGFzIHRoZSBwb3RlbnRpYWwgdG8g
YWZmZWN0IGFsbCB0aGUgYXJjaGl2ZXMKd2UgZ2VuZXJhdGVkIHNvIGZhci4gSWYgd2Ugd2FudGVk
IHRvIGRvIHNvLCB3ZSdkIG5lZWQgYSB3YXkgdG8gdmVyc2lvbgphbGwgZ2VuZXJhdGVkIGFyY2hp
dmVzLCBsaWtlIHdlIGRvIGZvciBnaXQgYW5kIHN2biwgYnV0IG5vdyBmb3IgYWxsIHRoZQpkaWZm
ZXJlbnQgQ1ZTZXMsIGFzIHdlbGwgYXMgZm9yIGFsbCB0aGUgdmVuZG9yaW5nIHBvc3QtcHJvY2Vz
c2VzLgoKRm9yIDc2OGY5ZjgwZjYyYywgYWxsIHRoYXQgd2FzIG9mIGNvbmVybiB3YXMgdGhlIHdv
cmtpbmcgY29waWVzIG9mIENWU2VzCihpLmUuIGdpdCwgc3ZuLCBjdnMuLi4pIHRoYXQgd2UgY2Fj
aGUgaW4gdGhlIEJ1aWxkcm9vdCBkb3dubG9hZCBkaXIsIG5vdAp0aGUgdGVtcG9yYXJ5IGZpbGVz
IGR1cmluZyBwb3N0LXByb2Nlc3NpbmcuIEluZGVlZCwgaW4gdGhhdCBsYXR0ZXIgY2FzZSwKdGhl
IHVzZXIgaGFzIHZpcnR1YWxseSBubyB3YXkgdG8gbWFuZ2xlIHdpdGggdGhlIG1vZGUgb2YgdGhl
CmludGVybWVkaWF0ZSBleHRyYWN0IGJlZm9yZSByZXBhY2suCgpBbmQgd2UgZG8gaGF2ZSBhIGJp
ZyBmYXQgd2FybmluZyB0aGF0IHVzZXJzIHNob3VsZCBub3QgYXR0ZW1wdCB0byBtZWRkbGUKd2l0
aCB0aGUgZ2l0IHRyZWUgdGhhdCBCdWlsZHJvb3QgY2FjaGVzLgoKQXMgNzY4ZjlmODBmNjJjIGhv
d2V2ZXIgZGVtb25zdHJhdGVzLCBpcyB0aGF0IGl0IHRvb2sgcXVpdGUgYSBsb25nIHRpbWUKYmV0
d2VlbiB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBnaXQgY2FjaGluZywgYW5kIHRoZSB0aW1lIHNv
bWVvbmUKZXZlbnR1YWxseSBkaXNjb3ZlcmVkIHRoZXkgY291bGQgbWVkZGxlIGluIHRoZXJlLiBU
aGlzIHNob3dzIHRoYXQgdGhlCmlzc3VlIGl0IG5vdCBhY3R1YWxseSBjcml0aWNhbCBpbiBtb3N0
IHNldHVwcy4KCkFsc28sIHRoZSB0YXIgbWFudWFsIFswXSBoaW50cyBhdCBhIGJldHRlciBzb2x1
dGlvbiB0byBoYW5kbGUKcmVwcm9kdWNpYmlsaXR5LCB3aGljaCBldmVuIGF2b2lkcyB0b3VjaGlu
ZyB0aGUgZmlsZXMgb24gZGlzayB3aGljaCBpcwpldmVuIG5pY2VyOgoKICAgIOKAmC0tbW9kZT0n
Z28rdSxnby13J+KAmQogICAgICAgIE9taXQgaXJyZWxldmFudCBpbmZvcm1hdGlvbiBhYm91dCBm
aWxlIHBlcm1pc3Npb25zLgoKSWYgd2Ugd2VyZSB0byBhY3R1YWxseSBoYW5kbGUgdGhlIG1vZGUg
Yml0IGZvciByZXByb2R1Y2liaWxpdHksIHdlJ2QKbmVlZCB0bzoKICAtIGludHJvZHVjZSBhcmNo
aXZlIHZlcnNpb25pbmcgZm9yIGFsbCBkb3dubG9hZCBiYWNrZW5kcyBhbmQKICAgIHByb3N0LXBy
b2Nlc3NpbmcKICAtIHVzZSB0aGUgdGFyIG9mZmljaWFsbHkgc3VnZ2VzdGVkIG1ldGhvZAoKU28s
IHJldmVydCB0aGF0IGNoYW5nZSwgYXMgaXQgd2FzIGluY29tcGxldGUsIHdhcyBub3QgcmVhbGx5
IGZpeGluZyBtdWNoCmlzc3VlcywgYW5kIGNhdXNlcyBhY3R1YWwgaXNzdWVzLgoKVGhpcyByZXZl
cnRzIGNvbW1pdCA3NjhmOWY4MGY2MmMxZGE2ZTI5OGM2ODBmMGY0YmZhODg3ZjM4Yzc4LgoKWzBd
IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvdGFyL21hbnVhbC90YXIuaHRtbCNSZXByb2R1
Y2liaWxpdHkKClRoYW5rcyB0byBWaW5jZW50IGFuZCBBcm5vdXQgZm9yIHBvaW50aW5nIGF0IHRo
ZSB0YXIgbWFudWFsLgoKUmVwb3J0ZWQtYnk6IEFudG9pbmUgQ291dGFudCA8YW50b2luZS5jb3V0
YW50QHNtaWxlLmZyPgpSZXBvcnRlZC1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+CkNjOiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+CkNj
OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4K
VGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KVGVzdGVkLWJ5
OiBBbnRvaW5lIENvdXRhbnQgPGFudG9pbmUuY291dGFudEBzbWlsZS5mcj4KLS0tCiBzdXBwb3J0
L2Rvd25sb2FkL2hlbHBlcnMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC9kb3dubG9hZC9oZWxwZXJzIGIvc3VwcG9ydC9kb3dubG9h
ZC9oZWxwZXJzCmluZGV4IDI2NTY4NWVmZjUuLjkwYTdkNmMxZWMgMTAwNzU1Ci0tLSBhL3N1cHBv
cnQvZG93bmxvYWQvaGVscGVycworKysgYi9zdXBwb3J0L2Rvd25sb2FkL2hlbHBlcnMKQEAgLTUz
LDkgKzUzLDYgQEAgbWtfdGFyX2d6KCkgewogICAgIHRtcD0iJChta3RlbXAgLS10bXBkaXI9IiQo
cHdkKSIpIgogICAgIHB1c2hkICIke2luX2Rpcn0iID4vZGV2L251bGwKIAotICAgICMgRW5mb3Jj
ZSBncm91cC9vdGhlcnMgbW9kZSBiaXRzCi0gICAgY2htb2QgLVIgZ28td3grWCAuCi0KICAgICAj
IEVzdGFibGlzaCBsaXN0CiAgICAgZmluZCAuIC1ub3QgLXR5cGUgZCAtYW5kIC1ub3QgXCggLWZh
bHNlICIke2ZpbmRfb3B0c1tAXX0iIFwpID4iJHt0bXB9Lmxpc3QiCiAgICAgIyBTb3J0IGxpc3Qg
Zm9yIHJlcHJvZHVjaWJpbGl0eQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
