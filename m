Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD20CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94C7840BA1;
	Sun,  7 Apr 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p00YaVzlJ4uT; Sun,  7 Apr 2024 19:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A58D940BE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A58D940BE6;
	Sun,  7 Apr 2024 19:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B29A1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6817440BE6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwcdtaqMWkQV for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A70940BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A70940BA1
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A70940BA1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:58:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d858501412so46434341fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519937; x=1713124737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZ2ACmozlOFZW6KaPln8wGuX/8LzZxLEuRlRUIyLv18=;
 b=PmGJcX3bf7t7+Wpfi8DOQ2cV+XJn/aCfpbcSKBAWofujxnXZoknDxo7hfdZt7pDNMn
 ThrnzXavIZGghR5ckMsDJBikpkqJRUN4G7OucEgmDo1qcV8ajg8hqDwnHeF6RWrGSHLA
 cRGq1p9NtMx1qyieGbwTBFJvjDIT/TrXEZpFyeMj8WkDdqbQpOU+VKc2+SvwPzeUS0Dw
 EDPwl+425hvHAEA6CNE/SZ5lueUzxhVgy6VUUDrhehlI55nICwviIf/TYnQiZuJ0wQN4
 7OrZKDxwKBiQypRBjwbznFucvWUhSz/m5rjafPTI+HLwPLy/VAQyXNEv1VfVQgBZqe2b
 aHGg==
X-Gm-Message-State: AOJu0YwM3uwyYfIeq3lgGl2edYqR7PnkC+FGn532Lxuk/qp1GVrlJZ2E
 UG6jMAu5qU1Cn6aTJyFn0Jqm9a93NAqY1BF8T3oUcj7SG8wYrlcinb2OTBoFzCFcJCmvkq1plIp
 uQ8t/PSs9d8CqyAKKi9smemxxydQ=
X-Google-Smtp-Source: AGHT+IF7MXCkhM+uGfywDoDo7UuPElGdS/5O8eai37D3bGH6c65dnKji0PF4HfCsks15B1dPyVWjN3e5a7j+kDFYDhE=
X-Received: by 2002:a19:3858:0:b0:516:afeb:e27e with SMTP id
 d24-20020a193858000000b00516afebe27emr4550360lfj.29.1712519936742; Sun, 07
 Apr 2024 12:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
 <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
In-Reply-To: <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 7 Apr 2024 21:58:45 +0200
Message-ID: <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712519937; x=1713124737; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ2ACmozlOFZW6KaPln8wGuX/8LzZxLEuRlRUIyLv18=;
 b=ZvNtiPEYvdLS1mrej/7XDhI3HQkUnlyRN1AJopiOvWwFK/QP3fnxdvlUyljEvZ75y/
 NEtbLMrqkJbD4zlxBHLTf+u61R28al9hd+v7BGNcqcpFAXd1rn014JegTFfGdcA7KDhT
 UzwJjMBfYc9HrVLPtKcES56SfhH47K/XyUIjDTzt0xzMAFTmZutHhmefxDIfMesOlaxL
 uVStrU+dSNCuIq0eFwFOeSH9+OvTax6EJW2VqRmQQCsaLhZDi9Hhnmu62tq9RoNJXLFG
 qrfFIjpIZW9SvBC2aWxHyPLd9ptTpoGHUydXUjiwmzrQPhCBAL+Ia/IIsEI6og4PIpGZ
 yAPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZvNtiPEY
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBkaW0uIDcgYXZyLiAyMDI0IMOgIDIxOjMzLCBBcm5vdXQgVmFuZGVjYXBwZWxs
ZSA8YXJub3V0QG1pbmQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAwNy8wNC8yMDI0IDEzOjU0
LCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFp
bHVyZSByYWlzZWQgc2luY2UgY29tbWl0Cj4gPiA4OTM3ZGI4ZGQ1OTVlMDk4ODc1MWU1ZGJiNTY4
ZTg3MGIwN2IzOWNjOgo+ID4KPiA+ICAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQv
cnVuL2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2Vz
L3NldHVwdG9vbHMvYnVpbGRfbWV0YS5weSIsIGxpbmUgNzYsIGluIGZldGNoX2J1aWxkX2VnZ3MK
PiA+ICAgICAgcmFpc2UgU2V0dXBSZXF1aXJlbWVudHNFcnJvcihzcGVjaWZpZXJfbGlzdCkKPiA+
IHNldHVwdG9vbHMuYnVpbGRfbWV0YS5TZXR1cFJlcXVpcmVtZW50c0Vycm9yOiBbJ3NldHVwdG9v
bHNfc2NtJ10KPgo+ICAgSWYgdGhlIHBhY2thZ2UgX2RvZXNfIGJ1aWxkIHdpdGhvdXQgc2V0dXB0
b29sc19zY20sIGl0IG1lYW5zIHRoYXQgdGhlCj4gc2V0dXAuY2ZnIGlzIHdyb25nLiBTbyBhbiB1
cHN0cmVhbSBwYXRjaCB0byBmaXggdGhhdCB3b3VsZCBiZSBiZXR0ZXIuLgoKRnJvbSBteSB1bmRl
cnN0YW5kaW5nLCB1cHN0cmVhbSB1c2VzIHNldHVwdG9vbHNfc2NtIHRvIHJldHJpZXZlIHZlcnNp
b24gc2luY2UKaHR0cHM6Ly9naXRodWIuY29tL3Jhd3B5dGhvbi9yZW1pL3B1bGwvNDA0L2NvbW1p
dHMvZjI3NjMwNzIxZDJiYmNmYmNlNTE1ZGMyZTZiZTMxNjdmNmEwNmEzNAoKU28gc2V0dXB0b29s
c19zY20gaXMgbm90ICJzdHJpY3RseSIgbmVlZGVkLgoKSSB1c2VkIC0tc2tpcC1kZXBlbmRlbmN5
LWNoZWNrIGJlY2F1c2UgaXQgaXMgYWxyZWFkeSBkb25lIGluIDYgb3RoZXIKcGFja2FnZXMgc2lu
Y2UgY29tbWl0IDg5MzdkYjhkZDU5NWUwOTg4NzUxZTVkYmI1NjhlODcwYjA3YjM5Y2MKCgo+Cj4g
ICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+Cj4gPiBGaXhlczogODkzN2RiOGRkNTk1ZTA5ODg3
NTFlNWRiYjU2OGU4NzBiMDdiMzljYwo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzU5ZmYyODk1YmFhNDkyNjBmYjgzYmMzNzU5OTM5MDcxNDRiOTQ1YWYKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KPiA+IC0tLQo+ID4gICBwYWNrYWdlL3B5dGhvbi1yZW1pL3B5dGhvbi1yZW1pLm1r
IHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yZW1pL3B5dGhvbi1yZW1pLm1rIGIvcGFja2FnZS9weXRo
b24tcmVtaS9weXRob24tcmVtaS5tawo+ID4gaW5kZXggNDE5YTM0NDFhNy4uZWMxNjQ5ZjhhNCAx
MDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXJlbWkvcHl0aG9uLXJlbWkubWsKPiA+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLXJlbWkvcHl0aG9uLXJlbWkubWsKPiA+IEBAIC0xMSw1ICsxMSw2
IEBAIFBZVEhPTl9SRU1JX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvYjcvNWMvZmNhOWQ5MjczZmM5ZDVmCj4gPiAgIFBZVEhPTl9SRU1JX0xJQ0VOU0UgPSBB
cGFjaGUtMi4wCj4gPiAgIFBZVEhPTl9SRU1JX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiAg
IFBZVEhPTl9SRU1JX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gPiArUFlUSE9OX1JFTUlfQlVJ
TERfT1BUUyA9IC0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrCj4gPgo+ID4gICAkKGV2YWwgJChweXRo
b24tcGFja2FnZSkpCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
