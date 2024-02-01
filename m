Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159A6C47DDB
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 13:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D2304047B;
	Thu,  1 Feb 2024 13:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2304047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMit2YH77CW4; Thu,  1 Feb 2024 13:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D5B840227;
	Thu,  1 Feb 2024 13:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D5B840227
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF8991BF396
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 13:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B536A4152D
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 13:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B536A4152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whK_qvly806h for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 13:07:52 +0000 (UTC)
X-Greylist: delayed 1558 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 01 Feb 2024 13:07:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB9B410B5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEB9B410B5
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 13:07:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A1DA1C0007
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 13:07:49 +0000 (UTC)
Message-ID: <9a9a9c97-156a-49e1-bdcd-43ed22580778@linatsea.fr>
Date: Thu, 1 Feb 2024 14:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: fr, en-US
From: Thierry Bultel <thierry.bultel@linatsea.fr>
X-GND-Sasl: thierry.bultel@linatsea.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linatsea.fr; s=gm1; t=1706792869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oeF+ZdEXeyHUI+zfrQ8hoNsdNu8YHpm5F/Xkgw9STwE=;
 b=Wpk7sEzaJC5rgT5m86G4t3jX1hclioCNnTb7gM4Xo4sorDEkoxKPJRNsj6lloGDfZ4v61F
 Fjkc8khjdEErONVM/lrJy5Zc2V35XPWpcWkb35VWhi79FwZvutFjr3x7MVA1eufgYvQ1S9
 vLK5PQXSIr4sACkg+6JzvNdjncaoE3IFrUjwSp8KZ1ymbWzSJ7D1WKz1lKnInzPMER9izY
 GJ7aGjL7epgRkfWcGt3z9cKk6NXtLyrZ98SRT4gLHSjE0tqA35FAU3zU1h7RCXh54hAL6l
 VmHpxsDN4FeHM2/4gCvh3nE5jdwSnZYvdDBoNdzG8j3qgMp1RiyJVaxnDLQ34w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linatsea.fr header.i=@linatsea.fr header.a=rsa-sha256
 header.s=gm1 header.b=Wpk7sEza
Subject: [Buildroot] Systemd unit complains about cgroup with 5.15.x kernel
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJIGFtIHVzaW5nIHN5c3RlbWQgMjU0LjUsIGJ1aWxkcm9vdAphbmQgY3VycmVudGx5IHVz
aW5nIGEga2VybmVsIHZlbmRvciBicmFuY2ggOgoKZ2l0QGdpdGh1Yi5jb206dmFyaWdpdC9saW51
eC1pbXguZ2l0CmxmLTUuMTUueV92YXIwMQppbXhfdjdfZGVmY29uZmlnCgoKSSBoYXZlIHZlcmlm
aWVkIHRoYXQgZXZlcnkgb3B0aW9ucyBmaXhlZCBieSBTWVNURU1fQ09ORklHX0ZJWFVQUyBoYXZl
IApiZWVuIHNldCBhY2NvcmRpbmdseQoKLS0tPgoKc3lzdGVtZCBpcyBmYWlsaW5nIHRvIHN0YXJ0
IHNvbWUgdW5pdHM6CgpzeXN0ZW1kWzFdOiB3cGFfc3VwcGxpY2FudC5zZXJ2aWNlOiBGYWlsZWQg
dG8gY3JlYXRlIGNncm91cCAKL3N5c3RlbS5zbGljZS93cGFfc3VwcGxpY2FudC5zZXJ2aWNlOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CmFuZCBhbHNvOwogwqAoYWdldHR5KVsyMTddOiBzZXJp
YWwtZ2V0dHlAdHR5bXhjMC5zZXJ2aWNlOiBGYWlsZWQgdG8gYXR0YWNoIHRvIApjZ3JvdXAgCi9z
eXN0ZW0uc2xpY2Uvc3lzdGVtLXNlcmlhbFx4MmRnZXR0eS5zbGljZS9zZXJpYWwtZ2V0dHlAdHR5
bXhjMC5zZXJ2aWNlOiAKTm8gbWVkaXVtIGZvdW5kCgouLi4gYW5kIEkgZG8gbm90IGhhdmUgYSBz
ZXJpYWwgY29uc29sZS4KCkkgYW0gY3VycmVudGx5IGRpZ2dpbmcgaW50byBzeXN0ZW1kIGNvZGUg
dG8gZmluZCBvdXQgd2hhdCBpcyBwb3NzaWJseSAKd3JvbmcgLi4gYnV0IGlmIGFueW9uZSBnZXRz
IGEgY2x1ZSwgSSB3b3VsZCBhcHByZWNpYXRlICEKClRoYW5rcyAhClRoaWVycnkKCgotLSAKUmU6
IHRlc3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
