Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48E8107636F
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 05:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6731A61C6D;
	Wed,  1 Apr 2026 05:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeKaS0uiXhVN; Wed,  1 Apr 2026 05:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A56F461B66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775021739;
	bh=e6MYunkLZFcrjVX30Ndv+LL+bgew/Rdb5NlDidlKKBE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EjVPcdzJEEF24JoONaTNiWS9+HfT8J0H6lI2IHAEoWvStYYOcqdon/fgJLTvS1d7n
	 Z3XlTRt3YMuwdAXyI65UotkrqY3a0RWKYfSX/tBGsM/QkToCaA8Z0ujIapQWwkWScV
	 GuaDx/bCDHQ0zsrwpss+MFEHPwto5/YNylNNjJFCrpNfmeeqesBfEisHDwJt5m2DNr
	 T/1lCVxd7BrROHUmanPVTZzoKA2glLbMYlKCmo6i6TmArxm5JKaBt9WDJCUL5JOWUS
	 lx0J2EFJzsXzGQSCfRzJReD0YNBTaXViEmd3siJtB0F/7SPrJp0vQikDoUwAQ+EggV
	 bRgxONBDGTprg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56F461B66;
	Wed,  1 Apr 2026 05:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC52D25F
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 05:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA5E5406A0
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 05:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxg0-MYN1zW9 for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 05:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8391840066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8391840066
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8391840066
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 05:15:26 +0000 (UTC)
X-CSE-ConnectionGUID: H8YaheHORRGFcYYX9TJ0HQ==
X-CSE-MsgGUID: hkGwg7gASyi/WO8N9Ah5Zg==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 01 Apr 2026 07:15:23 +0200
Received: from unknown (HELO OPE16NORMBX604.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 07:15:23 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX604.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Wed, 1 Apr 2026 07:15:21 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 01 Apr 2026 07:15:21 +0200
X-CSE-ConnectionGUID: VbXaikpkQpS9vOD5vf02dA==
X-CSE-MsgGUID: 7W6oBuyWQGy1b+TvWwrfQw==
X-IronPort-AV: E=Sophos;i="6.23,153,1770591600"; d="scan'208";a="408147644"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 1 Apr 2026 07:15:21 +0200
Message-ID: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1775020526; x=1806556526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7E+pYc4emhNZP6StUZU7zt30fTwcgiNh0e5Dtj7i6Y0=;
 b=aLGwu4ZgPvQaCHCQ0ZgOtElEbt/uSUaxjm6P8HplUvSH3WgZPA876nql
 VM3r0HOjnBGvyLPlQe8NVcnoZVqojHqkml1D+OnJ8q7QiQPWgnlP1ySMH
 quqWbLZDIOsSjLBfzgYbzHNHQ0udTaGRETR8DD3RCfOJUwPAUxVXK305O
 /STi9hlP3mkpjJbrnHtgTa0jVwu2+jqgwlcPQzU3muvI5vzBAZfwLfu5l
 xXnROmU0QdqNOl+L7AXMZj2Uf6ttXIxPRlVwMUsbVaZBPiBg5TQHBMr7g
 LRES6EO/AK7gMc8afXNoGaq71Xe3wSMQMxMoxejbJglV4afJedQIGJJ2b
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=aLGwu4Zg
Subject: [Buildroot] [PATCH] package/mosquitto: disable building the
 crtl-shell for host variant
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, yann.morin@orange.com,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CgpUaGUgY3RybC1z
aGVsbCwgaW4gbW9zcXVpdHRvX2N0cmwsIG9wdGlvbmFsbHkgdXNlcyBhIGxpbmUtZWRpdGluZwps
aWJyYXJ5LCBlaXRoZXIgbGliZWRpdCBvciByZWFkbGluZS4gVGhlcmUgaXMgYSBzaW5nbGUgb3B0
aW9uIChpbgptb3NxdWl0dG8pIHRoYXQgZHJpdmVzIHdoZXRoZXIgdG8gYnVpbGQgYWxsIHRoZSBh
b3BwcyBvciBub25lLCBidXQKZm9yIHRoZSBob3N0IHZhcmlhbnQsIHdlJ3JlIG9ubHkgaW50ZXJl
c3RlZCBpbiBtb3NxdWl0dG9fcGFzc3dkLApub3QgbW9zcXVpdHRvX2N0cmwgKG5vciB0aGUgb3Ro
ZXJzIGVpdGhlcikuCgpFeHBsaWNpdGx5IGRpc2FibGUgdGhlIGN0cmwtc2hlbGwsIHRvIGF2b2lk
IGJ1aWxkIGZhaWx1cmVzIHdoZW4gdGhlCmhvc3QgaGFzIGEgbWl4ZWQgaW5zdGFsbGF0aW9uIG9m
IHJlYWRsaW5lIG9yIGxpYmVkaXQgdGhhdCBpcyBub3QKY29tcGF0aWJsZSB3aXRoIG91cnMuCgpG
aXhlczoKICAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84NTYvODU2
MzUyZGRkNjkwZGM4YjIzMTRkNDZhNmE4MzdkNzRjMjM3ZDY5ZgoKU2lnbmVkLW9mZi1ieTogWWFu
biBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgpDYzogUGV0ZXIgS29yc2dhYXJkIDxw
ZXRlckBrb3JzZ2FhcmQuY29tPgpDYzogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlz
dG9waGVAbWluZC5iZT4KQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNv
bT4KQ2M6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KCi0tLQpOb3RlOiBJ
IHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGxvY2FsbHksIHNvIEkgYW0gbm90
IGNlcnRhaW4Kb2YgdGhlIGZpeC4gVmluY2VudCwgSm9zZXBoLCBpZiB5b3UgY291bGQgdGVzdCBp
biB5b3VyIGF1dG9idWlsZGVycyAob3IKcHJvdmlkZSB0aGUgYGRwa2cgLS1nZXQtc2VsZWN0aW9u
c2Agb3Igc2ltaWxhciBmb3IgQXJjaC4uLikKLS0tCiBwYWNrYWdlL21vc3F1aXR0by9tb3NxdWl0
dG8ubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbW9zcXVpdHRvL21vc3F1aXR0by5tayBiL3BhY2thZ2UvbW9zcXVpdHRvL21vc3F1
aXR0by5tawppbmRleCAwNmRlN2ZjMmFmLi42ZDY4ZmE0NzczIDEwMDY0NAotLS0gYS9wYWNrYWdl
L21vc3F1aXR0by9tb3NxdWl0dG8ubWsKKysrIGIvcGFja2FnZS9tb3NxdWl0dG8vbW9zcXVpdHRv
Lm1rCkBAIC0xNTgsNiArMTU4LDcgQEAgSE9TVF9NT1NRVUlUVE9fQ09ORl9PUFRTID0gXAogCS1E
V0lUSF9QTFVHSU5TPU9GRiBcCiAJLURXSVRIX1RFU1RTPU9GRiBcCiAJLURXSVRIX0FQUFM9T04g
XAorCS1EV0lUSF9DVFJMX1NIRUxMPU9GRiBcCiAJLURXSVRIX1RMUz1PTgogCiAjIE1hbnVhbGx5
IGluc3RhbGwganVzdCB0aGUgb25lIHRvb2wgd2UgbmVlZAotLSAKMi4zNC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkNlIG1lc3NhZ2UgZXQg
c2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25m
aWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUg
ZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMg
YXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXINCmEg
bCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMu
IExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRp
b24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEg
ZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoNClRoaXMgbWVzc2FnZSBh
bmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2Vk
IGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7DQp0aGV5IHNob3VsZCBu
b3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4N
CklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0K
QXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2Fn
ZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsg
eW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
