Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA99C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61DDC60D62;
	Fri,  4 Sep 2026 12:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORuKj-EHoiQG; Fri,  4 Sep 2026 12:17:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 55F1560C26
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524261;
	b=o1SUQw40QuWV+L6mycrZ259ZGKadct26RLfd10C6vrKISY4RuhaFcEnqjUMiTkYVSK/I
	 cFQkgYaMW/3V0yFMEHpRKnloFYlyPefO1c9bZqlnp1oQgnKqXbzBzO0hENPpM8WrFgBkt
	 0oaKtfCfHOKX94I0W9tMrFctUASuw1TESdVhsSxzUfL8eXwj66sfvjJ2ow0jASduZwTAO
	 KKiCJ1fK2OL+IO73HAxvUhQfkaI5a7kn2TzIvvDLi20QpLUzeOvoMDGkYGw8dLLpNZu7I
	 vJOVHcn/8YQ/uxCw3kk5Um58jMHrWbz1K0nh1bWFfZBLMyg10Zd8BRU7mdyxYQv7zcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SL2F2fZjM5Xjwi4V1yZB3ZdHBMdcT5xSiVbhGnIAYlA=;
	b=UDk6B2i82871Mwqb02fjQJp3h2r8GPH0WLsXZoxMZ1PyBt6gU7kYArfE7DQQnXpopHP6
	 j8nMePR3pabxWXtDXh8RMlqrSniqdyx70eC7rOvIV1+ny9gUcv/KjYlFqGJyCZN4/eUrM
	 AnDljKqFpePfBLuPHFlsQ4wpFsRp95hJqayXDoN62NTjQz83oRXmUrqe9dmT+AueLWRdr
	 JAS4eMUKSxJKx+mgmVFVL4srQvT2WAQgLFcyqXDaNSHYhcXLifRqJa9KoqgPmLdZkMJ5w
	 SP1f9VqK27wcr1Y7k/i3d4gVmFADA7tfEQvj6cIRZz2gcSYiNa0w7vpy15XcP/zJ29g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524261;
	bh=SL2F2fZjM5Xjwi4V1yZB3ZdHBMdcT5xSiVbhGnIAYlA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U+QXTQ6hhSCZKRiErGvGeiu6On3RSMhMWbA6B97AmYcVOJqL5wx+5WCOGiC/NAy9L
	 BOZDwimn2rHpGCLHhE0myTA0T8TbvrtjE/Wq47su4HJ/WYb302pwQEhjUUF1Fa1RkJ
	 G7YZqA5lgndAtAfChX9+QVNuNpxehdOHMdBpca3LP48o+f1AluRezkEB2+aC00Gqo0
	 1+xeuXsx/qCDGWLdpjLG+gOacj5WfYd1h3v4bgMpCLj+Vm1N5QzoIC9htseXK40cnU
	 jK0WtKdstaTRjDBqf4oKGent5WAu2NEPs8QgtHIifKP68uSY+JJov2m3qMS47PxXRR
	 ssim68AxRHL3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F1560C26;
	Fri,  4 Sep 2026 12:17:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A86F010E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A34F40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zllIAjAaptbK for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5BAF340B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524256;
 b=nPXwo10HmKqGiB9T6odMle98rome9qyu+ipjCtGgQA9TZqqEoLV3vXdtKSfAjadohhBn
 qb61wqxpMmpE+Dvdulu1aYHh28mG4E543ETi/L2qugy5oHyJfx54PJ8SgFVcDAt73mvpK
 BbqDsPKLRTPGBIKzVs3kq9naTXSVAMjUMPNgpZMoa6cINk1f78aQUsRFcItID6VWsk7OW
 t8v2YFcaeeb/VxFvbNuBwlfXDuaujF0Q9KTWwDZXYUrKMgigFQwCYUS7RhfJCR8t3GIiP
 wM/XoHKS9VDS23Mv1wsOdOWvurpZcVJ93MqfNqxDX7XxuHRGKOul5ybr67h2h9etkzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524256;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Fx8qQFpuewsPbG6esqOiBSCQ0HeG+zpvS/idw9s2Mrc=;
 b=hhuDEvew2eRc4gzqZOJIw82OKfeIQTquvzpd7qkra6rk3K0kmubNKJoHPLWaoNa25Dri
 unbe8EEPqIGXXr9Q/3b/wYXn/UC9K+2EEripWGXV9HWFPyfWHTIBHTelJpeqzkgPrNCfC
 4QtR6m6fRYeMpNMkAhjJ5SqadZxS+nw+AfH3m2k0RMnBI9cug2u5mQm25+s8Vc3QAFvJq
 dw5ng3QA1F8FMp+wK9oGMvItTqnKY0wbM8oEScUhMiwz7BLT4LZhmqaXvEEdcO93BFwbb
 hIRCWbh4nGIoGIHdhmJoAPMIVBpKiHSWstgxweKzRfTNQVOJVujAS17rxINn9qLkR7A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h60B+JfV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BAF340B2E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-484392e3d33so559945f8f.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524254; x=1789129054;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Fx8qQFpuewsPbG6esqOiBSCQ0HeG+zpvS/idw9s2Mrc=;
 b=rF8SP38Ddj2h6xxW6CRPXsa4wLEAM7rzLD8RRXOmkhfZFC3357NNt/UM0kulNaJ5z8
 oGCnzFpaPUYcqa23bqR3QkT/a+leMw6vu4k0icijVzsM33YBLZkvBOkZIYobZTQJhvPt
 jrChDYfXqx16bKx81U4eDC5zIzcr1ndXrRAw/8xiEJAgBXFwhijQ49O6qX8D0w+oTQOi
 St+h0mTG62PvgoMtTHIHp2sI2EXV+lzje1AP8w2gghwcpiP+tBIh5wJiqB0++bPPV2Ii
 cBs1reL40JW1BhNMC+pW/K2nrFZswWE4YNx7lK3U+0PbvnobfdSO1eH1rGAv5vg9e/SZ
 uKsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkVJ47UrnKbIofzGvZoOkzd2wf8pjyavUD84juoTT2pEpsS3TQaIIUDIi2175o5ceSB4uuRlpTLjI=@buildroot.org
X-Gm-Message-State: AFuF++lAvQ6gJnp4cASHXAQMgS0Jqna0jugicuEj8RwuoQzD9tcq5mtN
 8NOSTKjfwIf3JN6VB4tu6MdEiKxdAGSwTvgyqLHYbLO9Eum4RgzyD6NK6UfL9Nak2zg=
X-Gm-Gg: AYBFou0gvrIp/7dNeNlPNSdRgPzXsh5uASLXIpNPKbSFZJ5lQhuUdr/Zx9vmQWokZ1x
 GQBMEom6W2q2yLvLx9kBUkbJKz+PAWfC1Kvya4JOrOU7N/BCGBxNPOftWFaQlxi6H3IyqVsnWQQ
 Vxi3kGVB8785b6CnwsAaxPUdXy2IErjJ4ZQcZsBZ6FljMnMb7B+OjLadHFzX4OjwULTy+RJA7KQ
 HJ8BbvNdTWgiF9G+Q3WL7RSPvV2nbLwarxVqDXYMlmbNV+xiTqm+R5B+LCJ7+NiBaz4OwHrilpT
 V4vB4pdiBlczkSv9Zu6cCScndg+FlBEZnVCDv1U3qiN4eokVftxKWfPnaVsefJbNffzfp0wIzsZ
 kEoPJ6koMWv+PnMr20ADX0Lir+Mcm2d2QX61RlsMOXNjKX9Qf305n89fin11E+sBY6xwDHyp2Dm
 mqWmdaiEtd4M2VVn9dGMXPP3YqL3Jw7hLIWOfI2g2d8La/uLLGSGYbZA==
X-Received: by 2002:adf:e19c:0:b0:485:8c17:976b with SMTP id
 ffacd0b85a97d-4858c1799f6mr3042252f8f.45.1788524253925; 
 Fri, 04 Sep 2026 05:17:33 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm6164188f8f.1.2026.09.04.05.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:33 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:32 +0200
Message-ID: <20260904121733.403861-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826141337.4035888-1-thomas.petazzoni@bootlin.com>
References: <20260826141337.4035888-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build issue with gcc <
 13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgdXBzdHJlYW0gY29tbWl0Cj4gZTQyZTMxOTMxMzdkMWIyMWU4
NGI0OTkzMzZlN2E4ODg3YjhhODY4OSAoImludGVsOiBhZGQgSmF5IiksIGEgQzIzCj4gY29uc3Ry
dWN0IGlzIHVzZWQgaW4gdGhlIGludGVsIGRyaXZlciBjb2RlOgo+IAo+IGVudW0gamF5X3ByZWRp
Y2F0aW9uIDogdWludDhfdAo+IAo+IFRoaXMgY2F1c2VzIGEgYnVpbGQgaXNzdWUgd2l0aCBHQ0Mg
PCAxMzoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL2ludGVsL2NvbXBpbGVyL2ph
eS9qYXlfYnVpbGRlci5oOjEyLAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvaW50ZWwv
Y29tcGlsZXIvamF5L2pheV9mcm9tX25pci5jOjIzOgo+IC4uL3NyYy9pbnRlbC9jb21waWxlci9q
YXkvamF5X2lyLmg6NTgyOjIyOiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBvciDigJgo4oCZ
IGJlZm9yZSDigJg64oCZIHRva2VuCj4gICA1ODIgfCBlbnVtIGpheV9wcmVkaWNhdGlvbiA6IHVp
bnQ4X3Qgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXgo+IC4uL3NyYy9pbnRlbC9j
b21waWxlci9qYXkvamF5X2lyLmg6NjM3OjI1OiBlcnJvcjogZmllbGQg4oCYcHJlZGljYXRpb27i
gJkgaGFzIGluY29tcGxldGUgdHlwZQo+ICAgNjM3IHwgICAgZW51bSBqYXlfcHJlZGljYXRpb24g
cHJlZGljYXRpb247Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fgo+IAo+IFdlIGZpeCB0aGF0IGJ5IGludGVncmF0aW5nIGEgcGF0Y2ggYWxyZWFkeSBhdmFpbGFi
bGUgaW4KPiBPcGVuRW1iZWRkZWQuIEl0IGNoYW5nZXMgdGhlIGNvZGUgdG8gbm90IHVzZSB0aGUg
QzIzIGNvbnN0cnVjdC4KPiAKPiBUaGlzIGJ1aWxkIGlzc3VlIHdhcyBlbmNvdW50ZXJlZCBvbiBo
b3N0LW1lc2EzZCB3aGlsZSBidWlsZGluZyBhbgo+IGFsbHllc3BhY2thZ2Vjb25maWcgY29uZmln
dXJhdGlvbiBpbnNpZGUgb3VyIHN0YW5kYXJkIERvY2tlcgo+IGNvbnRhaW5lci4KPiAKPiBCdWls
ZHJvb3QgY29tbWl0Cj4gYzA3M2M5NzYxNzkwMjFjODRlMGM4NGY2ZjIzZTkzOGI0Mzc4M2U3NSAo
InBhY2thZ2Uve21lc2EzZCwKPiBtZXNhM2QtaGVhZGVyc306IGJ1bXAgdmVyc2lvbiB0byAyNi4x
LjAiKSB0aGF0IHN3aXRjaGVkIHRvIG1lc2EzZAo+IDI2LjEuMCwgd2hpY2ggY29udGFpbnMgdGhl
IHByb2JsZW1hdGljIGNvbW1pdC4gVGhlcmVmb3JlIDIwMjYuMDUgaXMKPiBhZmZlY3RlZCwgYnV0
IG5vdCBlYXJsaWVyIEJ1aWxkcm9vdCB2ZXJzaW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0byAy
MDI2LjA1LnguIFRoYW5rcwoKPiAtLS0KPiAgLi4uZXItamF5LWpheV9pci5oLWRvLW5vdC11c2Vk
LXR5cGVkLWVuLnBhdGNoIHwgNDEgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNDEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tZXNhM2Qv
MDAwNS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVu
LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLzAwMDUtc3JjLWludGVsLWNv
bXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCBiL3BhY2thZ2Uv
bWVzYTNkLzAwMDUtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10
eXBlZC1lbi5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
YWYwNjYyODdlMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL21lc2EzZC8wMDA1LXNy
Yy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gK
PiBAQCAtMCwwICsxLDQxIEBACj4gK0Zyb20gMzQ1Y2NmOTNlOWQwMGRmZDBmNzEwODU4MzJhN2Rm
MDE3MGI3NGY3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KPiArRGF0ZTogU3VuLCAxNCBKdW4gMjAyNiAxNzo0
MjoxOSArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNyYy9pbnRlbC9jb21waWxlci9qYXkvamF5
X2lyLmg6IGRvIG5vdCB1c2VkIHR5cGVkIGVudW0KPiArCj4gK1RoaXMgaXMgYSBDMjMgZmVhdHVy
ZSBhbmQgbm90IHN1cHBvcnRlZCBieSBnY2MgPCAxMywgd2hpY2gKPiArbWFueSBob3N0IGRpc3Ry
b3Mgc3RpbGwgaGF2ZSAoZS5nLiBEZWJpYW4gMTIpLgo+ICsKPiArVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFt5b2N0byBob3N0IGRpc3RybyByZXF1aXJlbWVudHNdCj4gK1NpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Cj4gK1Vwc3RyZWFt
OiBOL0EsIGNvZGUgY29tcGxldGVseSBjaGFuZ2VkIHVwc3RyZWFtCj4gK1NpZ25lZC1vZmYtYnk6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLQo+
ICsgc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaCB8IDQgKystLQo+ICsgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQg
YS9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oIGIvc3JjL2ludGVsL2NvbXBpbGVyL2ph
eS9qYXlfaXIuaAo+ICtpbmRleCA4MzA3MDQ0ZWY4YS4uYWJmMTc1YTcxYmYgMTAwNjQ0Cj4gKy0t
LSBhL3NyYy9pbnRlbC9jb21waWxlci9qYXkvamF5X2lyLmgKPiArKysrIGIvc3JjL2ludGVsL2Nv
bXBpbGVyL2pheS9qYXlfaXIuaAo+ICtAQCAtNTc5LDcgKzU3OSw3IEBAIGpheV90eXBlX2lzX2Fu
eV9mbG9hdChlbnVtIGpheV90eXBlIHQpCj4gKyAgICByZXR1cm4gamF5X2Jhc2VfdHlwZSh0KSA9
PSBKQVlfVFlQRV9GIHx8IGpheV9iYXNlX3R5cGUodCkgPT0gSkFZX1RZUEVfQkY7Cj4gKyB9Cj4g
KyAKPiArLWVudW0gamF5X3ByZWRpY2F0aW9uIDogdWludDhfdCB7Cj4gKytlbnVtIGpheV9wcmVk
aWNhdGlvbiB7Cj4gKyAgICAvKiogTm8gcHJlZGljYXRpb24uICovCj4gKyAgICBKQVlfTk9UX1BS
RURJQ0FURUQgPSAwLAo+ICsgCj4gK0BAIC02MzQsNyArNjM0LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
amF5X2luc3Qgewo+ICsgICAgYm9vbCBkZWNyZW1lbnRfZGVwOjE7Cj4gKyAgICB1bnNpZ25lZCBw
YWRkaW5nICA6MTI7Cj4gKyAKPiArLSAgIGVudW0gamF5X3ByZWRpY2F0aW9uIHByZWRpY2F0aW9u
Owo+ICsrICAgdWludDhfdCBwcmVkaWNhdGlvbjsKPiArICAgIGVudW0gamF5X2NvbmRpdGlvbmFs
X21vZCBjb25kaXRpb25hbF9tb2Q7Cj4gKyAKPiArICAgIGpheV9kZWYgY29uZF9mbGFnOyAvKio8
IGNvbmRpdGlvbmFsIGZsYWcgKi8KPiArLS0gCj4gKzIuNTUuMAo+ICsKPiAtLSAKPiAyLjU1LjAK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
