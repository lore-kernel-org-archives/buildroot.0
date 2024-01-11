Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBE1C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711BC8148D;
	Thu, 11 Jan 2024 10:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711BC8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT4iYGg4asP6; Thu, 11 Jan 2024 10:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DD0813A6;
	Thu, 11 Jan 2024 10:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2DD0813A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F20721BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D552143843
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D552143843
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLNfR6trX_pQ for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:38:35 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2698400CE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2698400CE
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2cc7d2c1ff0so58430401fa.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704969512; x=1705574312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nbh1yiQ80XLZGaIfa2kPrgNPUJkL4okOh9u0sDSc3+c=;
 b=QxGg4k1YQKN4G3G0Sf6NYFutWv3yVBW9QQREKlZVhIyGT7A1Vyhy+MSwv7IqK1yJ3y
 /s48oTpmHonipDWgDk2ecTeLf5DCcr+P4oyuolREVhSGiIF5i9be3XgLvjJTLUJ2bgFB
 dQGlARreHZ4ctdx4xajH+kX7OJD9/osHt2mwvSoP/yY8UWGYoqwLJF10bPGW8V01kHW7
 ACtnaotjq3jgMFfuFIyzN07HJQv31V3GDicZhDYPCnHr8/k+DSJN43b2W5yj22OGlbz9
 gqeFrXWGqLjHgZ8jR0G41BT9sQ0ulkOVRgcjYGqdjMPg2aPCsiFtjxUoAcMUGSzCUtH2
 OP1g==
X-Gm-Message-State: AOJu0Yx4wRR4qNR1mpEy9LMp+HCWKib9H+tvOPV1BVYGht0SqphSr49S
 rL1mgm5DKxsmlo673aBgEbV5R/EfClBVZo6X8fhHTWRjtuUOccg4
X-Google-Smtp-Source: AGHT+IGWQwa0vYghYWldFjL/O9ILLp7W2nC22FFULFANorK9ruQoRSrmrSJEqXa65nUXjRIxp/0N+A==
X-Received: by 2002:a2e:8885:0:b0:2cd:3418:7524 with SMTP id
 k5-20020a2e8885000000b002cd34187524mr288138lji.49.1704969512083; 
 Thu, 11 Jan 2024 02:38:32 -0800 (PST)
Received: from localhost.localdomain ([80.215.186.92])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a5d6e55000000b0033672cfca96sm869810wrz.89.2024.01.11.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:38:31 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:38:17 +0100
Message-Id: <20240111103819.3984913-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704969512; x=1705574312;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nbh1yiQ80XLZGaIfa2kPrgNPUJkL4okOh9u0sDSc3+c=;
 b=xcoxFaw7zeFHkcQpQRbzCVW4/LFtroujX2CoI2y59Yl/BW+wkZHMvOcuoSWzTrOCpE
 d+HErdQmyrgDOCm9ymKlxAJeL9341YIMToV1bFk8wp4ebCoX0o+QHlJJec9blbmZ3rqU
 JGCou64DZvharweGogdb6lGKl9ZssgOtOS/pdXdG1WZ10g9paGPD+QG8PwcJgQ2oFcy3
 sGT8/k7u4Sy/d2+PiXeYBIBL5lwJzwyh3AbI9N4vQ1ixEGszXXPO88EH1RVLFqRYMfzt
 l8oxP81KBY0wofPG63jUFUxlos7BuynAkIKBa24ihRGxcwmkdnLceykD77yosEMNebU8
 bdEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xcoxFaw7
Subject: [Buildroot] [PATCH v4 1/3] Revert "support/download: generate even
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Antoine Coutant <antoine.coutant@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
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
VGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KU2lnbmVkLW9m
Zi1ieTogQW50b2luZSBDb3V0YW50IDxhbnRvaW5lLmNvdXRhbnRAc21pbGUuZnI+Ci0tLQogc3Vw
cG9ydC9kb3dubG9hZC9oZWxwZXJzIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG93bmxvYWQvaGVscGVycyBiL3N1cHBvcnQvZG93
bmxvYWQvaGVscGVycwppbmRleCAyNjU2ODVlZmY1Li45MGE3ZDZjMWVjIDEwMDc1NQotLS0gYS9z
dXBwb3J0L2Rvd25sb2FkL2hlbHBlcnMKKysrIGIvc3VwcG9ydC9kb3dubG9hZC9oZWxwZXJzCkBA
IC01Myw5ICs1Myw2IEBAIG1rX3Rhcl9neigpIHsKICAgICB0bXA9IiQobWt0ZW1wIC0tdG1wZGly
PSIkKHB3ZCkiKSIKICAgICBwdXNoZCAiJHtpbl9kaXJ9IiA+L2Rldi9udWxsCiAKLSAgICAjIEVu
Zm9yY2UgZ3JvdXAvb3RoZXJzIG1vZGUgYml0cwotICAgIGNobW9kIC1SIGdvLXd4K1ggLgotCiAg
ICAgIyBFc3RhYmxpc2ggbGlzdAogICAgIGZpbmQgLiAtbm90IC10eXBlIGQgLWFuZCAtbm90IFwo
IC1mYWxzZSAiJHtmaW5kX29wdHNbQF19IiBcKSA+IiR7dG1wfS5saXN0IgogICAgICMgU29ydCBs
aXN0IGZvciByZXByb2R1Y2liaWxpdHkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
