Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F420C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38D34156D;
	Wed,  3 Jul 2024 13:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2MLnKHKR5QN; Wed,  3 Jul 2024 13:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4BF414BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4BF414BF;
	Wed,  3 Jul 2024 13:54:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3D81BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A23560647
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nx_fzxNVPpWH for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D964A60598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D964A60598
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D964A60598
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:54:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42567ddf099so37900065e9.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 06:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720014852; x=1720619652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wh4p17AEHOLmgHVOMiy1PQLELRa0A2d19tgmBuuHu3c=;
 b=sjm7+C94EGxytmUrL/rzDfAfDBy1c5cUS0l41ZJWcIET6dwV2lDFyjZtfLpHRVaDug
 IIUAE4vVWQYlGevsU875Ol8t1VXk1VOk2GNAWhaWdqREpe6jNq/PTt+LTmFrEmLrcbYf
 5sRE4y2D9eknyedHWACbjrehqc0fRhu4kMA4PY4BKeqzmi0diMQW4hJdSiP+inM0J9rn
 FHXVbdhAZTtgqBJa1UmE8lbRVyXlNmfiWG+vyLGjFp58OpCJcmyg047wimCeBZxsFAkx
 yqrZs6BWcXwyHP5EP4ClLYfgf+SaQz7NL9aViZqyEIsMPjQ+7Qt4jsDuMcyRJd7ERz1Z
 lWDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqTG352VoylNEWU9uZ6rRzsl7Bcgd3qSWuSBC5uD0Fgsql+9G1cOPrcFI4lCWOxmHZ/braPXRoq62vpSelK7DI18wVmbIgXQ==
X-Gm-Message-State: AOJu0Ywk6qis8pelOmJ0vHaYaqXKqwdGMNC54BD6oMPFoPqjoQXNvKYM
 8GEvk5TyhOxQcdkUyBx7PpCP7le8HNwjNel1r0/wywgRK/xOD3wPQjfCmuUyqYbuhbCt5BzW53V
 5
X-Google-Smtp-Source: AGHT+IF0s9KKiKLrymCho7n9YzvxioG0/eQMxp2YWWWEBt3q8ztQ02hcZFefzBpSMEahV+vsNh1fdg==
X-Received: by 2002:a05:600c:32a9:b0:425:6203:1874 with SMTP id
 5b1f17b1804b1-4257a034836mr80582845e9.37.1720014851930; 
 Wed, 03 Jul 2024 06:54:11 -0700 (PDT)
Received: from [10.5.0.35]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af376f5sm240882635e9.6.2024.07.03.06.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:54:11 -0700 (PDT)
Message-ID: <38ac9788-2fbd-448a-b4be-97e65d16d572@smile.fr>
Date: Wed, 3 Jul 2024 15:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240703125211.2711735-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240703125211.2711735-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720014852; x=1720619652; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wh4p17AEHOLmgHVOMiy1PQLELRa0A2d19tgmBuuHu3c=;
 b=0pnvWGRkQo2gfOGNysFOiXJY08VQFAkj7nsJSduqNlCa1D1Qsh/N/WZV7bbyR4hL/d
 yIoupg+vvxQWZEZAS93DABsMnkry0YFEUKRgcOOnbbhYQDu0UC9LOD3IraaCYc9Obj+u
 HMquvLmxkItEOuqPxdTfFjaFrdu7j4+2JpDvA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0pnvWGRk
Subject: Re: [Buildroot] [PATCH 1/1] package/libfcgi: update the patches to
 be applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMy8wNy8yMDI0IMOgIDE0OjUyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIGxpYmZjZ2kgZmFpbHMgdG8g
YnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDEtbGluay1hZ2FpbnN0LW1h
dGgucGF0Y2ggdXNpbmcgcGF0Y2g6Cj4gICAgIHBhdGNoaW5nIGZpbGUgbGliZmNnaS9NYWtlZmls
ZS5hbQo+ICAgICBIdW5rICMxIEZBSUxFRCBhdCAxOC4KPiAgICAgMSBvdXQgb2YgMSBodW5rIEZB
SUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0byBmaWxlIGxpYmZjZ2kvTWFrZWZpbGUuYW0ucmVqCj4g
Cj4gICAgIEFwcGx5aW5nIDAwMDItZGlzYWJsZS1leGFtcGxlcy5wYXRjaCB1c2luZyBwYXRjaDoK
PiAgICAgcGF0Y2hpbmcgZmlsZSBNYWtlZmlsZS5hbQo+ICAgICBIdW5rICMxIEZBSUxFRCBhdCA0
Lgo+ICAgICAxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNhdmluZyByZWplY3RzIHRvIGZpbGUg
TWFrZWZpbGUuYW0ucmVqCj4gCj4gVGhpcyBjb21taXQgcmVmcmVzaGVzIHRoZSBwYWNrYWdlIHBh
dGNoZXMgb24gdGhlIGN1cnJlbnQgcGFja2FnZSB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4g
IC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBw
YWNrYWdlL2xpYmZjZ2kvMDAwMS1saW5rLWFnYWluc3QtbWF0aC5wYXRjaCB8IDQgKysrLQo+ICBw
YWNrYWdlL2xpYmZjZ2kvMDAwMi1kaXNhYmxlLWV4YW1wbGVzLnBhdGNoICB8IDggKysrKystLS0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4g
aW5kZXggZGNhNzI1MzQ1MzUzLi5jYTk0ZmI1NmIwOTIgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFj
a2FnZWlnbm9yZQo+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAtODA5LDcgKzgwOSw3
IEBAIHBhY2thZ2UvbGliZVhvc2lwMi8wMDAxLXNyYy1lWHRsX2R0bHMuYy1maXgtYnVpbGQtd2l0
aC1saWJyZXNzbC0zLjQuMS5wYXRjaCBsaWJfCj4gIHBhY2thZ2UvbGliZWRpdC8wMDAxLWNoZWNr
LWJzZC1mdW5jdGlvbnMtaW4tbGliYnNkLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNr
YWdlL2xpYmV2ZW50LzAwMDEtRG9uLXQtZGVmaW5lLUJJT19nZXRfaW5pdC1mb3ItTGlicmVTU0wt
My01LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL2xpYmZjZ2kvMDAwMS1saW5r
LWFnYWluc3QtbWF0aC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAtcGFja2FnZS9saWJmY2dp
LzAwMDItZGlzYWJsZS1leGFtcGxlcy5wYXRjaCBsaWJfcGF0Y2guU29iIGxpYl9wYXRjaC5VcHN0
cmVhbQo+ICtwYWNrYWdlL2xpYmZjZ2kvMDAwMi1kaXNhYmxlLWV4YW1wbGVzLnBhdGNoIGxpYl9w
YXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL2xpYmZmaS8wMDAxLUZpeC11c2Utb2YtY29tcGFjdC1l
aC1mcmFtZXMtb24tTUlQUy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS9saWJm
bS8wMDAxLW1vZHVsZXMtZml4LWNyb3NzLWNvbXBpbGF0aW9uLnBhdGNoIGxpYl9wYXRjaC5VcHN0
cmVhbQo+ICBwYWNrYWdlL2xpYmZyZWVpbWFnZS8wMDAxLW5vLXJvb3QtaW5zdGFsbC5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJmY2dpLzAwMDEtbGlu
ay1hZ2FpbnN0LW1hdGgucGF0Y2ggYi9wYWNrYWdlL2xpYmZjZ2kvMDAwMS1saW5rLWFnYWluc3Qt
bWF0aC5wYXRjaAo+IGluZGV4IGVmYmE2NzEyM2UyMS4uOTA5YTI5NWJkNjE3IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbGliZmNnaS8wMDAxLWxpbmstYWdhaW5zdC1tYXRoLnBhdGNoCj4gKysrIGIv
cGFja2FnZS9saWJmY2dpLzAwMDEtbGluay1hZ2FpbnN0LW1hdGgucGF0Y2gKPiBAQCAtMywxMiAr
MywxNCBAQCBMaW5rIGxpYmZjZ2kgYWdhaW5zdCB0aGUgbWF0aCBsaWJyYXJ5Lgo+ICBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgQ2xhdmVpcm9sZSA8dGhvbWFzLmNsYXZlaXJvbGVAZ3JlZW4tY29tbXVu
aWNhdGlvbnMuZnI+Cj4gIFtMb3VpczogcmViYXNlIG9uIHRvcCBvZiAyLjQuMl0KPiAgU2lnbmVk
LW9mZi1ieTogTG91aXMgUmFubm91IDxsb3Vpcy5yYW5ub3VAc21pbGUuZnI+Cj4gK1tEYXJpbzog
bWFrZSB0aGUgcGF0Y2ggdG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1NpZ25l
ZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiAgCj4gIEluZGV4OiBiL2xpYmZjZ2kvTWFrZWZpbGUuYW0KPiAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
ICAtLS0gYS9saWJmY2dpL01ha2VmaWxlLmFtCj4gICsrKyBiL2xpYmZjZ2kvTWFrZWZpbGUuYW0K
PiAtQEAgLTE4LDQgKzE4LDUgQEAKPiArQEAgLTE5LDYgKzE5LDcgQEAKPiAgICAgICAgICAgICAg
ICAgICAgICAgIG9zX0BTWVNURU1ALmMKPiAgIGxpYmZjZ2lfbGFfQ0MgICAgICA9IEBQVEhSRUFE
X0NDQAo+ICAgbGliZmNnaV9sYV9DRkxBR1MgID0gQFBUSFJFQURfQ0ZMQUdTQAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmZjZ2kvMDAwMi1kaXNhYmxlLWV4YW1wbGVzLnBhdGNoIGIvcGFja2Fn
ZS9saWJmY2dpLzAwMDItZGlzYWJsZS1leGFtcGxlcy5wYXRjaAo+IGluZGV4IDRhOTkxNmYwMmFm
OC4uY2NkMDFjMGNlMDNjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZmNnaS8wMDAyLWRpc2Fi
bGUtZXhhbXBsZXMucGF0Y2gKPiArKysgYi9wYWNrYWdlL2xpYmZjZ2kvMDAwMi1kaXNhYmxlLWV4
YW1wbGVzLnBhdGNoCj4gQEAgLTEsMyArMSw1IEBACj4gK1tEYXJpbzogbWFrZSB0aGUgcGF0Y2gg
dG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1NpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAgQ29tbW9u
IHN1YmRpcmVjdG9yaWVzOiBsaWJmY2dpLTIuNC4wLm9yaWcvY2dpLWZjZ2kgYW5kIGxpYmZjZ2kt
Mi40LjAvY2dpLWZjZ2kKPiAgQ29tbW9uIHN1YmRpcmVjdG9yaWVzOiBsaWJmY2dpLTIuNC4wLm9y
aWcvZG9jIGFuZCBsaWJmY2dpLTIuNC4wL2RvYwo+ICBDb21tb24gc3ViZGlyZWN0b3JpZXM6IGxp
YmZjZ2ktMi40LjAub3JpZy9leGFtcGxlcyBhbmQgbGliZmNnaS0yLjQuMC9leGFtcGxlcwo+IEBA
IC04LDkgKzEwLDkgQEAgQ29tbW9uIHN1YmRpcmVjdG9yaWVzOiBsaWJmY2dpLTIuNC4wLm9yaWcv
bGliZmNnaSBhbmQgbGliZmNnaS0yLjQuMC9saWJmY2dpCj4gIGRpZmYgLWR1IGxpYmZjZ2ktMi40
LjAub3JpZy9NYWtlZmlsZS5hbSBsaWJmY2dpLTIuNC4wL01ha2VmaWxlLmFtCj4gIC0tLSBsaWJm
Y2dpLTIuNC4wLm9yaWcvTWFrZWZpbGUuYW0JMjAwMS0xMi0yMiAxNDowNTozOS4wMDAwMDAwMDAg
KzAxMDAKPiAgKysrIGxpYmZjZ2ktMi40LjAvTWFrZWZpbGUuYW0JMjAxNC0wNy0xOSAxNjo1Njoy
MS45MzUyMTY1NDAgKzAyMDAKPiAtQEAgLTQsNyArNCw3IEBACj4gLSAjICAkSWQ6IE1ha2VmaWxl
LmFtLHYgMS43IDIwMDEvMTIvMjIgMTM6MDU6Mzkgcm9icyBFeHAgJAo+IC0gIwo+ICtAQCAtMTAs
NyArMTAsNyBAQAo+ICsgCQlhY2xvY2FsLm00IG00L2xpYnRvb2wubTQgbTQvbHQqLm00IE1ha2Vm
aWxlLmluIGluc3RhbGwtc2ggbWlzc2luZyBsdG1haW4uc2ggXAo+ICsgCQlDT1BZSU5HIElOU1RB
TEwKPiAgIAo+ICAtU1VCRElSUyA9IGxpYmZjZ2kgY2dpLWZjZ2kgZXhhbXBsZXMgaW5jbHVkZQo+
ICArU1VCRElSUyA9IGxpYmZjZ2kgY2dpLWZjZ2kgaW5jbHVkZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
