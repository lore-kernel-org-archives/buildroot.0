Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B5DC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F160400E2;
	Tue, 14 May 2024 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbif4WEd7j5w; Tue, 14 May 2024 20:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F6840127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F6840127;
	Tue, 14 May 2024 20:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27D861BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20F6840304
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JE5sbhLfrobY for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 20:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABBD840284
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBD840284
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABBD840284
 for <buildroot@buildroot.org>; Tue, 14 May 2024 20:28:35 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:fd4b:fc3:7e21:7e8a] (unknown
 [IPv6:2a01:e0a:12:eba0:fd4b:fc3:7e21:7e8a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 88D0CBFD87;
 Tue, 14 May 2024 22:28:32 +0200 (CEST)
Message-ID: <5647a701-8c5a-4ce6-92c3-3c252e1cd91b@grenoble.cnrs.fr>
Date: Tue, 14 May 2024 22:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715718512;
 bh=6NR1oHybf2VACYPYH/fobX7yImVWHzz2NJvxLm8sQ6w=;
 h=Date:To:Cc:From:Subject:From;
 b=DN3t3ZSnvR/1ctUYFxTbP/s1jFHFuj/Yvxc34pjAPRHUSLt6NTThSL/3D3QORYuoj
 kIjYHhmZSsWojRzmbFNbXr50ECvgQD+Fptn3XuxeAou7lRUKSnU3b2Fieyr1CREdxR
 O6fFJpS4O2Be5TkMpIgcCn0gN8j5f6dRipM629xF/9Au8lqhoJYZSAwmTt2Nvvo8my
 IpCJb2jgxrL976ecnPTWBHcwFxcrjSfgcEGB4gQ5Dw5YUHMuMCN4FZ/0JV2468tNbr
 u9cqFZDotJVepmJjQBiELi4tlls7CglVJyJ6IlLqi1Xfbm6mxQltE2s3IRUhuAJkeL
 tXV1011qfRsiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=DN3t3ZSn
Subject: [Buildroot] Nginx fails to build with GCC 14
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gYWxsIQoKQnVpbGRpbmcgbmdpbnggd2l0aCBHQ0MgMTQgZmFpbHMgYXQgdGhlIGNvbmZp
Z3VyZSBzdGVwIHdpdGg6CgogICAgLi9jb25maWd1cmU6IGVycm9yOiBsaWJhdG9taWNfb3BzIGxp
YnJhcnkgd2FzIG5vdCBmb3VuZC4KClN0ZXBzIHRvIHJlcHJvZHVjZToKCiAgICBnaXQgY2hlY2tv
dXQgOTc2NDI1OGFhZjBlICAjIG1hc3RlciBhcyBvZiAyMDI0LTA1LTE0CiAgICBtYWtlIGNsZWFu
CiAgICBtYWtlIGRlZmNvbmZpZwogICAgdXRpbHMvY29uZmlnIC0tZW5hYmxlIEdDQ19WRVJTSU9O
XzE0X1gKICAgIHV0aWxzL2NvbmZpZyAtLWVuYWJsZSBQQUNLQUdFX05HSU5YCiAgICBtYWtlIG9s
ZGRlZmNvbmZpZwogICAgbWFrZQoKSWYgdGhlIG9wdGlvbiBHQ0NfVkVSU0lPTl8xNF9YIGlzIG9t
aXR0ZWQgKHdlIHRoZW4gZGVmYXVsdCB0byBHQ0MgMTMpLAp0aGUgYnVpbGQgc3VjY2VlZHMuCgpM
b29raW5nIGF0IG91dHB1dC9idWlsZC9uZ2lueC0xLjI0LjAvb2Jqcy9hdXRvY29uZi5lcnIsIGl0
IGFwcGVhcnMgdGhlCmVycm9yIGlzIG5vdCBjYXVzZWQgYnkgYSBtaXNzaW5nIGxpYnJhcnksIGJ1
dCBieSBhbiB1bnJlbGF0ZWQK4oCcaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZeKAnSBlcnJvciBv
biB0aGUgdGVzdCBwcm9ncmFtOgoKICAgIC4uLgogICAgY2hlY2tpbmcgZm9yIGF0b21pY19vcHMg
bGlicmFyeQogICAgb2Jqcy9hdXRvdGVzdC5jOiBJbiBmdW5jdGlvbiAnbWFpbic6CiAgICBvYmpz
L2F1dG90ZXN0LmM6OTo0ODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiAnQU9fY29tcGFy
ZV9hbmRfc3dhcCcgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJs
ZS1wb2ludGVyLXR5cGVzXQoKSSBkaWQgbm90IGRpZyB0aGlzIG11Y2ggZnVydGhlci4gSG93ZXZl
ciwgSSBub3RpY2VkIHRoYXQgdGhlIGZpbGUKcGFja2FnZS9uZ2lueC9uZ2lueC5tayBjb250YWlu
cyB0aGlzIGNvbW1lbnQ6CgogICAgIyBkaXNhYmxlIGV4dGVybmFsIGxpYmF0b21pY19vcHMgYmVj
YXVzZSBpdHMgZGV0ZWN0aW9uIGZhaWxzLgoKd2hpY2ggbWFrZXMgbWUgd29uZGVyIHdoeSAuL2Nv
bmZpZ3VyZSBpcyBwcm9iaW5nIGZvciB0aGUgbGlicmFyeSBhbnl3YXkuCgpSZWdhcmRzLAoKRWRn
YXIgQm9uZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
