Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F16E7543D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 10:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB0F817C0;
	Tue,  3 Oct 2023 10:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB0F817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWXodpwKKFGL; Tue,  3 Oct 2023 10:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D711081518;
	Tue,  3 Oct 2023 10:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D711081518
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 907241BF34D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B4741E62
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B4741E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBZEFe2os1Dz for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 10:01:28 +0000 (UTC)
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22F2641E61
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 10:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F2641E61
ARC-Seal: i=1; a=rsa-sha256; t=1696326383; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Se/Sv5gX0FZ5NTaDfKTCxo72ADBRC2ysSCd536E6eqQ0+oK2i2yMGzMI3KZAQs2rlxLNEgDjB8F27Cf0//4QjObulqIl/QdZte4RnidsKhnpIHYo3YmWgWVEWHFmitRrzNdDo2FVBAfGRUxdbp5y/Ay/IRMAB8fYj2VhoAWmgz4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696326383;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MA+SfXylA5LAPESQvO4TlVijK08yQm1LDb2xSyIueIQ=; 
 b=aFfutOe/SQqxBfrt85xYpCPXGQVNKUZe27mkwRM/GVR0a9vjxUE9MaP6/wU/1jLpGiL+agdsba5X06/EJFSJcDLsX5wVsSC2uLIp568bYrh8On/JhPF3hSTXRyKbVqkbHRKSKJXmDQ57PGDDrs7gBrZIjrzfZFTAGN5LnjdCbmw=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696326380803395.4384288770101;
 Tue, 3 Oct 2023 02:46:20 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231003094612.62025-1-enki@fsck.pl>
Date: Tue,  3 Oct 2023 11:46:09 +0200
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696326383; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MA+SfXylA5LAPESQvO4TlVijK08yQm1LDb2xSyIueIQ=;
 b=XLBA7xdhHEzGysGk9eRAAEA+5DYv4SXKs2xc2rO8pmIIlrkoqc4EiNXLvCYo+KvP
 v0esaPPXdqRfCvadAo+PPOnYsmT6UQkIEJNpnkygKnXXKuu17nfUCa8fh1w+QdnIVAM
 e/PwRlauBgLMMUMaB4U11ltT+DmfwnCksvS4tHQs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=XLBA7xdh
Subject: [Buildroot] [PATCH 0/3] Support for D-Link DNS-320L
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
Cc: Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIGlzIGEgc2hvcnQgcGF0Y2hzZXQgdG8gc3VwcG9ydCBhIEQtTGluayBETlMt
MzIwTCBOQVMuClRoZXJlIGFyZSB0d28gZGV2aWNlLXNwZWNpZmljIHBhY2thZ2VzIHdoaWNoIGFy
ZSByZXF1aXJlZCBmb3IgcHJvcGVyCnN5c3RlbSBtYW5hZ2VtZW50IG9uIHRoZSBkZXZpY2UgYXMg
d2VsbCBhcyBhIG91dC1vZi10cmVlIERUUy4KSSBhbSBnb2luZyB0byBzZW5kIGl0IHVwc3RyZWFt
IHdoZW4gSSBsZWFybiBtb3JlIGFib3V0IGRldmljZSB0cmVlcy4KSSBoYXZlIGFkZGVkIG15c2Vs
ZiBhcyBhIG1haW50YWluZXIgdG8gdGhlIERFVkVMT1BFUlMgZmlsZSBmb3IgYWxsCnJlbGV2YW50
IHBhcnRzLgoKVGhlIHBhY2thZ2VzIGhhdmUgYmVlbiBjaGVja2VkIHdpdGggbm8gaXNzdWVzIGRl
dGVjdGVkOgoK4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKclyB1dGlscy9kb2NrZXItcnVu
IG1ha2UgY2hlY2stcGFja2FnZQozODkyNzEgbGluZXMgcHJvY2Vzc2VkCjAgd2FybmluZ3MgZ2Vu
ZXJhdGVkCgpBbiBleGFtcGxlIGJvb3QgbG9nIGlzIHByZXNlbnRlZCBiZWxvdzoKaHR0cHM6Ly9n
aXN0LmdpdGh1Yi5jb20vZW5raXVzei80ODJmYWI2OGVmN2E2MzBjOGNmYWFkNmYxM2Y2MzkxOQoK
SSBoYXZlIG5vdGljZWQgdGhhdCB0aGUgcGFja2FnZXMgZG8gbm90IGJ1aWxkIGZvciBhbGwgYXJj
aGl0ZWN0dXJlcyB3aGljaCBpcwphIHByb2JsZW0gSSBkbyBub3QgeWV0IGtub3cgaG93IHRvIHNv
bHZlOgoK4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKclyBjYXQgaW5pcGFyc2VyLmNvbmZp
ZwpCUjJfUEFDS0FHRV9JTklQQVJTRVI9eQrinpwgIGJ1aWxkcm9vdCBnaXQ6KG1hc3Rlcikg4pyX
IHV0aWxzL3Rlc3QtcGtnIC0tY29uZmlnIGluaXBhcnNlci5jb25maWcgLXAgaW5pcGFyc2VyCiAg
ICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12NS11Y2xpYmMgWzEvNl06IE9LCiAgICAgICAg
ICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IE9LCiAgICAgICAgICAgICAg
ICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IEZBSUxFRAogICAgICAgICAgICAgICAg
ICAgICBib290bGluLXg4Ni02NC1tdXNsIFs0LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAg
YnItYXJtLWZ1bGwtc3RhdGljIFs1LzZdOiBGQUlMRUQKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNvdXJjZXJ5LWFybSBbNi82XTogT0sK4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKc
lyBjYXQgZG5zMzIwbC1kYWVtb24uY29uZmlnCkJSMl9QQUNLQUdFX0ROUzMyMExfREFFTU9OPXkK
4p6cICBidWlsZHJvb3QgZ2l0OihtYXN0ZXIpIOKclyB1dGlscy90ZXN0LXBrZyAtLWNvbmZpZyBk
bnMzMjBsLWRhZW1vbi5jb25maWcgLXAgZG5zMzIwbC1kYWVtb24KICAgICAgICAgICAgICAgICAg
ICBib290bGluLWFybXY1LXVjbGliYyBbMS82XTogT0sKICAgICAgICAgICAgICAgICAgICAgYm9v
dGxpbi1hcm12Ny1nbGliYyBbMi82XTogT0sKICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJt
djdtLXVjbGliYyBbMy82XTogRkFJTEVECiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2
LTY0LW11c2wgWzQvNl06IE9LCiAgICAgICAgICAgICAgICAgICAgICBici1hcm0tZnVsbC1zdGF0
aWMgWzUvNl06IEZBSUxFRAogICAgICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJt
IFs2LzZdOiBPSwo2IGJ1aWxkcywgMCBza2lwcGVkLCAyIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1p
bmZvIGZhaWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCgpUaGVzZSBmYWlsdXJlcyBob3dldmVyIGRv
bid0IHNlZW0gdG8gYmUgcmVsZXZhbnQgZm9yIHRoZSBkZXZpY2UgSSdtIGJ1aWxkaW5nIHRoZQpw
YWNrYWdlcyBmb3IgYXMgdGhleSBydW4gYXJtdjUgd2hpY2ggaXMgc3VjY2Vzc2Z1bC4gQXJlIHN1
Y2Nlc3NmdWwgYnVpbGRzIGZvciBhbGwKdG9vbGNoYWlucyBhIHByZXJlcXVpc2l0ZSBmb3IgdXBz
dHJlYW0gaW5jbHVzaW9uPyBJIGRvIG5vdCB3YW50IHRvIHNwYW0gdGhlIGF1dG9idWlsZGVyCmxv
Z3Mgd2l0aCBmYWlsdXJlcy4KCkNoZWVycywKCk1hY2llaiBHcmVsYSAoMyk6CiAgcGFja2FnZS9p
bmlwYXJzZXI6IG5ldyBwYWNrYWdlCiAgcGFja2FnZS9kbnMzMjBsLWRhZW1vbjogbmV3IHBhY2th
Z2UKICBib2FyZC9uZXRnZWFyL2RuczMyMGw6IG5ldyBib2FyZAoKIERFVkVMT1BFUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBib2FyZC9kLWxpbmsvZG5zMzIw
bC9kdHMva2lya3dvb2QtZG5zMzIwbC5kdHMgfCAyMTggKysrKysrKysrKysrKysrKysrCiBjb25m
aWdzL2RuczMyMGxfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysKIHBhY2th
Z2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBwYWNrYWdl
L2RuczMyMGwtZGFlbW9uL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgIDcgKwogcGFja2FnZS9k
bnMzMjBsLWRhZW1vbi9TNTBkbnMzMjBsLWRhZW1vbiAgICAgIHwgIDM3ICsrKwogcGFja2FnZS9k
bnMzMjBsLWRhZW1vbi9kbnMzMjBsLWRhZW1vbi5oYXNoICAgIHwgICAxICsKIHBhY2thZ2UvZG5z
MzIwbC1kYWVtb24vZG5zMzIwbC1kYWVtb24ubWsgICAgICB8ICAzMSArKysKIHBhY2thZ2UvaW5p
cGFyc2VyL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBwYWNrYWdlL2luaXBh
cnNlci9pbmlwYXJzZXIuaGFzaCAgICAgICAgICAgICAgfCAgIDIgKwogcGFja2FnZS9pbmlwYXJz
ZXIvaW5pcGFyc2VyLm1rICAgICAgICAgICAgICAgIHwgIDQyICsrKysKIDExIGZpbGVzIGNoYW5n
ZWQsIDM2OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvZC1saW5rL2Ru
czMyMGwvZHRzL2tpcmt3b29kLWRuczMyMGwuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmln
cy9kbnMzMjBsX2RlZmNvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZG5zMzIwbC1k
YWVtb24vQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9kbnMzMjBsLWRhZW1v
bi9TNTBkbnMzMjBsLWRhZW1vbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZG5zMzIwbC1k
YWVtb24vZG5zMzIwbC1kYWVtb24uaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZG5z
MzIwbC1kYWVtb24vZG5zMzIwbC1kYWVtb24ubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2luaXBhcnNlci9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2luaXBhcnNl
ci9pbmlwYXJzZXIuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW5pcGFyc2VyL2lu
aXBhcnNlci5tawoKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
