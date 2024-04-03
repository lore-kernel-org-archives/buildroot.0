Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C7CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 22:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD3460594;
	Wed,  3 Apr 2024 22:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXwNIX9CQAR5; Wed,  3 Apr 2024 22:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8A1600BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8A1600BB;
	Wed,  3 Apr 2024 22:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCD5C1BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 22:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92F4822C4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 22:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqPzWeLS1TZe for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 22:33:38 +0000 (UTC)
X-Greylist: delayed 477 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Apr 2024 22:33:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95A90822C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A90822C3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95A90822C3
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 22:33:36 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id E1B0D240101
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 00:25:36 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4V8zpl6yF4z6tm8;
 Thu,  4 Apr 2024 00:25:35 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 22:24:44 +0000
Message-ID: <20240403222513.1267595-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1712183136; bh=UjY+n4oPp7jgEFs9ZgRYpaYAcDx9h0pH4cnA6TZlnWs=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=Ud43EnlZ5lEFC/MVRJyMJd56VBeUEUOqf05pOanXtQGILll4ABByVmrolfuQntm4V
 oUMZPacia2DxOE7zpka2Q/APd+2tN1EJRf9DiCMHAAFgSvdkkCWrsPhE+/7cYJc0om
 vyG9rq18XL+jJwAeVN2VSiHriEtYiI4iHvhqfOMDArBQ55KAs1xM7Hq38Fphgj3EpN
 +FqDp5S63Hf2CwvaDrZ/kD0tSJPm0GiuD/GBLGBjxUZy/P957wL8ELBahnGnJeiNR2
 ustufKpJLNSb2ObL3KhPL2uMKPxBDZumt9MZN7Y08jEKuMcftLATsSosJfi58rzIPf
 u1IBWTwZKmGPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=Ud43EnlZ
Subject: [Buildroot] [PATCH] configs/raspberrypizero2w_defconfig: fix typo
 in headers series option
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1aWxkIGZvciB0aGlzIGRlZmNvbmZpZyBmYWlscyB3aXRoOgoKICBJbmNvcnJlY3Qgc2Vs
ZWN0aW9uIG9mIGtlcm5lbCBoZWFkZXJzOiBleHBlY3RlZCA2LjgueCwgZ290IDYuMS54CgpGb3Vu
ZCB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB3aGlsZSB0cnlpbmcgdG8gZmluZCBib2FyZHMg
dGhhdCBoYXZlCm1pc3NpbmcgY3VzdG9tIGhlYWRlcnMgc2VyaWVzOgoKICBncmVwIC0tbnVsbCAt
LXJlY3Vyc2l2ZSAtLWZpbGVzLXdpdGhvdXQtbWF0Y2ggIkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9
eSIgLi9jb25maWdzIFwKICAgIHwgeGFyZ3MgLS1udWxsIGdyZXAgLS1udWxsIC0tZmlsZXMtd2l0
aC1tYXRjaGVzICJCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV8uKj15IiBcCiAgICB8IHhhcmdzIC0t
bnVsbCBncmVwIC0tbnVsbCAtLWZpbGVzLXdpdGhvdXQtbWF0Y2ggIkJSMl9LRVJORUxfSEVBREVS
U19bMC05XVwrX1swLTldXCs9eSJcCiAgICB8IHhhcmdzIC0tbnVsbCBncmVwIC0tZmlsZXMtd2l0
aG91dC1tYXRjaCAiQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV9bMC05XVwr
X1swLTldXCs9eSIKICAuL2NvbmZpZ3MvbWFuZ29waV9tcTFyZHcyX2RlZmNvbmZpZyAgIyBwYXRj
aCBwZW5kaW5nCiAgLi9jb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZwogIC4vY29u
Zmlncy9zaXBlZWRfbGljaGVlcGlfbmFub19kZWZjb25maWcgICMgcGF0Y2ggcGVuZGluZwoKU2ln
bmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBwb3N0ZW8uZGU+
Ci0tLQogY29uZmlncy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25maWcgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jb25m
aWdzL3Jhc3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJv
MndfZGVmY29uZmlnCmluZGV4IDFiZjMzNWMwNzYuLmUxNTI4ODlmMmQgMTAwNjQ0Ci0tLSBhL2Nv
bmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvcmFzcGJlcnJ5
cGl6ZXJvMndfZGVmY29uZmlnCkBAIC0zLDcgKzMsNyBAQCBCUjJfY29ydGV4X2E1Mz15CiBCUjJf
QVJNX0ZQVV9ORU9OX1ZGUFY0PXkKIAogIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCA2
LjEgc2VyaWVzCi1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzYuMT15CitC
UjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CiAKIEJSMl9UT09MQ0hB
SU5fQlVJTERST09UX0NYWD15CiAKLS0gCjIuNDMuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
