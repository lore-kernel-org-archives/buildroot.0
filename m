Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8FC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C195D811AE;
	Fri, 25 Sep 2026 14:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5scQ8iD51Mf; Fri, 25 Sep 2026 14:43:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BDF70811E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347427;
	b=j1iUGOBE6kL7HADZkCF37Xb4Y9ZaHoIsXgoQ1ieSB31EQTD1Hbbc/lqB6kLFXNYY/aPD
	 HZYwJziZSdxXUTZgmJ/Z/r29L46FAdm3EapDO7i3uQ2eyxgAaxy+BiTz0xdOCLV96RY6J
	 gfRHOujt3sx28/imcEzTsycpsmx5PJho0aIAZulmzTzQeEHd/roIUUREcMu7Ib+mbmpzL
	 BsqSXzFNWCzATZNcH9EWegUQrXA6hXTi3d2T9rPa4lv5n0Fxfs1CcFPm92KYR25ivG9g5
	 MlYZUZKv/Rxn5wpOm9IEK/U07QfRpDON+KpmMhgRZNlSI6tNs15DV6h39jXn3FR5emw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xOVqmq6Zr8DUhxwLEBlexjPUdvKIdxk0TJLv1RGuMj8=;
	b=OEgsyvi2vg9d2ePNTj1U/0vjO48R08lVVvXB7gUudTzgzCPSw78xUu4tkjVhJr5uIgqr
	 egxLlYOsnR4j0vKWoDMLTt2Vqdbe9fcaezlLGvmtjOHqlLPOgnEfR1clyxq/3kkdyYlbT
	 /o95/6GlQlEavDgDuqoWJdEkZNXW2MqJSNmMjHT403j0zhvt6+WDC95+FjQh/628Wc7Jx
	 ol+cb9yQ/rNaKzt4DMnyWKhDpkjObJBTEwy2FlySxTcKJd4e9pgyPCarqwbDbZKS3VeYd
	 m8KU5YXy9tpuQLaiZBUkYLM93uvduKWBiPGEOHzxwHe+HxyaANNkc5IoeMkB3pjLmYQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347427;
	bh=xOVqmq6Zr8DUhxwLEBlexjPUdvKIdxk0TJLv1RGuMj8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BJ4+vWaFhKJ7TATifpXNdPIu3WKVLzAstY1VK0dfjhReAMDV1gkb9P+vBbdgIM+xR
	 Qbx+5vaY3+FjnqsNQIa9lfkDdaS3TioOX2gdGxqKU+pwHx9MaWR+3XeKlQEaRqAiqt
	 I5nOUQDAZ28duE8vbc/7qngsEhlYEkUZLYAqDmiD48vrhd3TffV02mQagdHDKZ02pS
	 34leyh3Tx5V7BiMrHrx3fTicKrSZsc2zPXHwIxs4TvhPfzmjojAL8pzIarQTkFPaTr
	 N3UNTZY0R/N7vc33Gn14H4Q4xFh3pcrMy+CGQceP9iyPKvjXG4Ud3Nt+YVOwOgZpcj
	 7Og42QN43DJNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF70811E1;
	Fri, 25 Sep 2026 14:43:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 163E6334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1382760DDD
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wr1BDP9iJB3p for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1121460DD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347426;
 b=kFbh/1ngvzWrYXDW5WHFYJLz1l/t7dnLinBSNoCqTWB9LI0zdBKCFlYQR/p4InS5jqk9
 fc9BKsjoCC4HtIxz10vevnT01bTlHlI51SZI8uyzC3hwUnwssfsV9jGNN0JssFM+imxJZ
 IBqfGLtw3f63+46mX2SuF1G8JF+3+gTrY4Kw1Qt/+eAxbeRZFZ+FgCWtK9NZSX4fBrg+6
 arULdmhVB3b3UyBmjHLzjoh/NlkGR3bTv/VnKK1WkbuvZxPGXpiM131VbKQ6qgjeLsoPa
 ofgbEB5ramGjPtTfbsZBbfeIXKh9plajG0sRzbnviAAZbybY4Mw/utVwrZUdKRj8WPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347426;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=IO+r7vmBIiKNBzqoczVKKz+ozfCLGgeIlFHr5r/ZLGM=;
 b=Bus6jEIdzShPEStV5czlzuMHA7VTIrgIg9MRgkfkTVN/mo9jz7fYPXzf3hhkYx/fEi/E
 povXJ0TYUb2jkmJxOp3kk3NO9ZEso3ENDz6ezMivHsn1ytY2tJbYhcyRZh1Q75p1MjYc4
 s3LjjzZRS2OHuPsla7ndhVcsEgob+L7KNVUbTGdon7wL34ahFv4NgexorWrf68XgE32zZ
 oE6zjMz5LQTaZJMQ8TrVGO4AytPySf28y2l5NtAaAtPuRaorEzCdo5V64N6tgWZkZgplH
 dNsEdoNjuC0Lvhf7Xlt9+b0N/d0CWHxkonKLZqpyM8wby7N7olQkw1bhKcLsnCFAZBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VwvxZ7Vb; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1121460DD3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:45 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so7616235e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347424; x=1790952224;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IO+r7vmBIiKNBzqoczVKKz+ozfCLGgeIlFHr5r/ZLGM=;
 b=hmtD+mAV4VbPdiCUYV1Ai+EA/fSKSnGZqPxZ53va81kh9EzGSGoqTvhNL55wA/ZDDu
 gYUOa9wbkDv9FHHJ57Nsu/nQsdRNxPmUHnuzecVCx/xxAj6XHGRH0GsvxDO/ygD607Hi
 B/UKbP5KwF+WvjhCOok9n55ED7brxl/OR1b4rIX6ZS9BjOZWuHJ8NthKU6QqTfwGPVcH
 BQQC6m0ftU/o1bnqAjQPWIMG4Ohgbn2hkGG9oj6JzOFzQSp4AuIgLonSdoDFa7Ip9Lgi
 MGDoQgXuef2a/gQPcxWvr38XZRewEZ2ELWkfLuYChfpeOHd8mp4xVy79Bvy1sJ47Mxi1
 SKgg==
X-Gm-Message-State: AFuF++lzKPDkEpVj9WFOUXAFcMVIAy2tq7FP2yUb8PqYuRVrUHnv/ETt
 6kTL9dd3m32p8WrHl4SL9hLn+2LRS+n/h/Vqxh+l/1BB5og7kQlq8zHC9kLOekIbfQxN/eQjsRc
 004ZcYPdnnw==
X-Gm-Gg: AYBFou0gMkVCPnQff8urWcsO7r8taDxBevISN904eOah/Uv5EgITQ9x8KEwPuSEsNZz
 eD9OpCWGNXR52pz0iW7DCpaFOOnYtKNAZWCiRyvjELPbt239XszkSYUj358cFKCHQg7qdubjCvj
 7aPyJXTSiKy9mYw1Qnq70oM5m0/IEWJ924Epgl87uVPJEBUwki5xrfHpvLLLlr6wkEW4/zfET6Q
 W+huG9EpUxUQgMOEebp6egWc3yJ+rxJyrmWiYJasG0TPIlod/YpueXQaRyLTt5cbiLNoknqqEzP
 vtvpIIHDIDVTZlwXjkV04HaFcs225D/5n6oMF+0bhm01kV8aeaHjkDIWKVcMkikJG/vykcG2Xb2
 d+oyGiQP6oyQ2tL+RxFf8+uEUO71W7BF+QByZzJ6FWWtLT3XuKCAeICj5ObHb1wDUAvZDCXIx9c
 Ung3QvxHaMhE1V3CimFtQKF0PjrD0OB5IXNSB3sJfAHh6F4wtyTvCdiAsPRHnuuHiq+apk7Ttc6
 5HFIKw+5+d3UnC6jA0Glbk5nX/ttRLM3jSdsFPzeA==
X-Received: by 2002:a05:600c:4fc7:b0:49d:433:c3b6 with SMTP id
 5b1f17b1804b1-49fe66eefa4mr109347905e9.27.1790347423893; 
 Fri, 25 Sep 2026 07:43:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff285550asm37723105e9.3.2026.09.25.07.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:43 -0700 (PDT)
To: buildroot@buildroot.org,
	Neal Frager <neal.frager@amd.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:39 +0200
Message-ID: <20260925144342.4095021-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIDAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaCBhc3N1bWVz
IHRoYXQgdGhlIHFlbXUteGVuIGZpbGVzIGFyZSBpbmNsdWRlZAo+IGluIHRoZSB4ZW4gc291cmNl
IHRyZWUuIEhvd2V2ZXIsIGlmIEJSMl9QQUNLQUdFX1hFTl9UT09MUyBpcyBub3QgZW5hYmxlZCwg
dGhlCj4gcWVtdS14ZW4gZGVwZW5kZW5jeSB3aWxsIG5vdCBiZSBoYW5kbGVkIGFuZCB0aGUgcGF0
Y2ggd2lsbCBmYWlsIHRvIGFwcGx5IHdpdGgKPiB0aGUgZm9sbG93aW5nIGVycm9yLgo+IAo+IEZp
eGVzOiBidWlsZCBlcnJvciBiZWxvdwo+IEFwcGx5aW5nIDAwMDItVXBkYXRlLWxpbmtlci1mbGFn
cy5wYXRjaCB1c2luZyBwYXRjaDoKPiBwYXRjaGluZyBmaWxlIHRvb2xzL01ha2VmaWxlCj4gSHVu
ayAjMSBzdWNjZWVkZWQgYXQgMzYgKG9mZnNldCAtMSBsaW5lcykuCj4gSHVuayAjMiBzdWNjZWVk
ZWQgYXQgMTg1IChvZmZzZXQgLTggbGluZXMpLgo+IGNhbid0IGZpbmQgZmlsZSB0byBwYXRjaCBh
dCBpbnB1dCBsaW5lIDc2Cj4gUGVyaGFwcyB5b3UgdXNlZCB0aGUgd3JvbmcgLXAgb3IgLS1zdHJp
cCBvcHRpb24/Cj4gVGhlIHRleHQgbGVhZGluZyB1cCB0byB0aGlzIHdhczoKPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IHxkaWZmIC0tZ2l0IGEvdG9vbHMvcWVtdS14ZW4vaW5jbHVkZS9o
dy94ZW4veGVuX25hdGl2ZS5oIGIvdG9vbHMvcWVtdS14ZW4vaW5jbHVkZS9ody94ZW4veGVuX25h
dGl2ZS5oCj4gfGluZGV4IDZiY2M4M2JhLi4yNTkwOTA0ZSAxMDA2NDQKPiB8LS0tIGEvdG9vbHMv
cWVtdS14ZW4vaW5jbHVkZS9ody94ZW4veGVuX25hdGl2ZS5oCj4gfCsrKyBiL3Rvb2xzL3FlbXUt
eGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gTm8gZmlsZSB0byBwYXRjaC4gIFNraXBwaW5nIHBhdGNoLgo+IDEgb3V0IG9mIDEgaHVu
ayBpZ25vcmVkCj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjIzOTogb3V0cHV0
L2J1aWxkL3hlbi00LjIxLjEvLnN0YW1wX3BhdGNoZWRdIEVycm9yIDEKPiAKPiBUbyBhdm9pZCBt
YWtpbmcgQlIyX1BBQ0tBR0VfWEVOX1RPT0xTIGEgcmVxdWlyZWQgb3B0aW9uLCBmaXggdGhlCj4g
MDAwMi1VcGRhdGUtbGlua2VyLWZsYWdzLnBhdGNoIHNvIHRoYXQgbW9kaWZ5aW5nIHNvdXJjZSBm
cm9tIHRoZSBxZW11LXhlbgo+IHBhY2thZ2UgaXMgbm8gbG9uZ2VyIGluY2x1ZGVkLgo+IAo+IElu
c3RlYWQgb2YgcGF0Y2hpbmcgcWVtdS14ZW4sIGEgYmV0dGVyIHNvbHV0aW9uIGlzIHVuZGVmaW5p
bmcgdGhlCj4gX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyBmcm9tIHRoZSBxZW11LXhlbiBwYWNr
YWdlLgo+IAo+IFRvIHRlc3Q6Cj4gQlIyX2FhcmNoNjQ9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJO
QUw9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15Cj4gQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKPiBCUjJfUEFDS0FHRV9YRU49
eQo+ICAjIEJSMl9QQUNLQUdFX1hFTl9UT09MUyBpcyBub3Qgc2V0Cj4gCj4gU2lnbmVkLW9mZi1i
eTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+Cj4gVGVzdGVkLWJ5OiBNYXR0IFdl
YmVyIDxtYXR0QHRoZXdlYmVycy53cz4KCkFwcGxpZWQgdG8gMjAyNi4wOC54LiBUaGFua3MKCj4g
LS0tCj4gVjEtPlYyOgo+IC0gY2hhbmdlZCBtZXRob2QgdG8gbW9kaWZ5IHBhdGNoZXMgaW5zdGVh
ZCBvZiB4ZW4ubWsKPiBWMi0+VjM6Cj4gLSByZW1vdmVkIHRleHQgZnJvbSBjb21taXQgbWVzc2Fn
ZSB3aGljaCBhcHBlYXJzIGFzIHN0YXJ0IG9mIHBhdGNoCj4gVjMtPlY0Ogo+IC0gbWVyZ2VkIGlu
dG8gcGF0Y2ggc2VyaWVzIGFzIHRoZSBmaXJzdCBwYXRjaAo+IFY0LT5WNToKPiAtIHJlbW92ZWQg
cWVtdS14ZW4gcGF0Y2gKPiAtIHVuZGVmaW5lZCBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIGZy
b20gcWVtdS14ZW4KPiAtLS0KPiAgcGFja2FnZS94ZW4vMDAwMi1VcGRhdGUtbGlua2VyLWZsYWdz
LnBhdGNoIHwgMTYgKy0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdlL3hlbi94ZW4ubWsgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hlbi8wMDAy
LVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggYi9wYWNrYWdlL3hlbi8wMDAyLVVwZGF0ZS1saW5r
ZXItZmxhZ3MucGF0Y2gKPiBpbmRleCBhYzAyNzIyNzgxLi4zYmE2NzhjZDliIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaAo+ICsrKyBiL3Bh
Y2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaAo+IEBAIC0xNiw4ICsxNiw3
IEBAIFVwc3RyZWFtOiBCdWlsZHJvb3Qgc3BlY2lmaWMuIFRoaXMgaXMgYSB0ZW1wb3JhcnkgcGF0
Y2ggZm9yIGFuIGludGVybWVkaWF0ZSBidW1wCj4gIFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiAgLS0tCj4gICB0b29scy9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKystCj4g
LSB0b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmggfCAgMiArLQo+IC0g
MiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsgMSBm
aWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCj4gIAo+ICBkaWZm
IC0tZ2l0IGEvdG9vbHMvTWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQo+ICBpbmRleCBhOWEzMTk2
ZS4uNWQyODk2NTEgMTAwNjQ0Cj4gQEAgLTY5LDE5ICs2OCw2IEBAIGluZGV4IGE5YTMxOTZlLi41
ZDI4OTY1MSAxMDA2NDQKPiAgIAkJLS1iaW5kaXI9JChMSUJFWEVDX0JJTikgXAo+ICAgCQktLWRh
dGFkaXI9JChTSEFSRURJUikvcWVtdS14ZW4gXAo+ICAgCQktLWxvY2Fsc3RhdGVkaXI9JChsb2Nh
bHN0YXRlZGlyKSBcCj4gLWRpZmYgLS1naXQgYS90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hl
bi94ZW5fbmF0aXZlLmggYi90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZl
LmgKPiAtaW5kZXggNmJjYzgzYmEuLjI1OTA5MDRlIDEwMDY0NAo+IC0tLS0gYS90b29scy9xZW11
LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmgKPiAtKysrIGIvdG9vbHMvcWVtdS14ZW4v
aW5jbHVkZS9ody94ZW4veGVuX25hdGl2ZS5oCj4gLUBAIC0yLDcgKzIsNyBAQAo+IC0gI2RlZmlu
ZSBRRU1VX0hXX1hFTl9OQVRJVkVfSAo+IC0gCj4gLSAjaWZkZWYgX19YRU5fSU5URVJGQUNFX1ZF
UlNJT05fXwo+IC0tI2Vycm9yIEluIFhlbiBuYXRpdmUgZmlsZXMsIGluY2x1ZGUgeGVuX25hdGl2
ZS5oIGJlZm9yZSBvdGhlciBYZW4gaGVhZGVycwo+IC0rI3dhcm5pbmcgSW4gWGVuIG5hdGl2ZSBm
aWxlcywgaW5jbHVkZSB4ZW5fbmF0aXZlLmggYmVmb3JlIG90aGVyIFhlbiBoZWFkZXJzCj4gLSAj
ZW5kaWYKPiAtIAo+IC0gLyoKPiAgLS0gCj4gIDIuNTEuMAo+ICAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS94ZW4veGVuLm1rIGIvcGFja2FnZS94ZW4veGVuLm1rCj4gaW5kZXggNzUyNTJkMTEyMy4u
YmRkZmRiYmEzOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3hlbi94ZW4ubWsKPiArKysgYi9wYWNr
YWdlL3hlbi94ZW4ubWsKPiBAQCAtNDAsNyArNDAsOCBAQCBYRU5fTUFLRV9FTlYgPSBcCj4gIAlD
Uk9TU19DT01QSUxFPSQoVEFSR0VUX0NST1NTKSBcCj4gIAlIT1NUX0VYVFJBQ0ZMQUdTPSItV25v
LWVycm9yIiBcCj4gIAlYRU5fSEFTX0NIRUNLUE9MSUNZPW4gXAo+IC0JJChUQVJHRVRfQ09ORklH
VVJFX09QVFMpCj4gKwkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAo+ICsJRVhUUkFfQ0ZMQUdT
X1FFTVVfWEVOPSItVV9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18iCj4gIAo+ICBpZmVxICgkKEJS
Ml9QQUNLQUdFX1hFTl9IWVBFUlZJU09SKSx5KQo+ICBYRU5fTUFLRV9PUFRTICs9IGRpc3QteGVu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
