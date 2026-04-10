Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6E9F36B9A
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 01:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0E040D93;
	Fri, 10 Apr 2026 01:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hadL6yRlnYrI; Fri, 10 Apr 2026 01:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9B14107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775785457;
	bh=lp7Gh9OSOa9fFOcsUcmECXGUdtLrKH+JSxwrq8XSyxE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LBcm1zw7v8YH4xH+ZHvUeP5ilhxBasvGxmrYtzg4q/pqA0SUaaawY+G1aac73734j
	 CElUWw7HjrZzZiM3qbXzb9+aDNjGaBGQXdL2WrpZnRjRQyaR/7N7nXs1oWLfylFRfH
	 jYKxB+3xUMEhKJjQd0mMhBvbXm15uFqsvzeFj6lMAkVaGZgsKhgeS27Gsqm8IuqdAC
	 qU3xNnHRhfdbTpYPzd1ubYIumprOBo6GUvc2plfdWTglS3EN/9qIPDn4z3347V1aW9
	 5J3GWkc6Z5b5O5j/bTPQZPVJOrtmUlel9gLSCIx0r79nsoKNys56uJd6HaE7f1urIy
	 xyoaJ4WpaJ7VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9B14107C;
	Fri, 10 Apr 2026 01:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75AA7237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6157D4107C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeLWelhaslRu for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 01:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 624A440D93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624A440D93
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 624A440D93
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:44:13 +0000 (UTC)
Received: from obsidian.. (syn-068-189-041-004.res.spectrum.com [68.189.41.4]
 (may be forged)) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 63A1iBVX003155
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 9 Apr 2026 18:44:12 -0700
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 18:43:08 -0700
Message-ID: <20260410014309.18115-2-sen@hastings.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVaVxXiKu/AYYdJLEiPx5GIGD+TVsblo4mQYnM4CckJy3edQucrAJLDp10bYuKn/tR53tbsE2W7ZahX1cKE2TU2g
X-Sonic-ID: C;roTPxX408RGucKIf40Rrfg== M;uB07xn408RGucKIf40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 0/1] [RFC] re-add lua 5.2.4
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm caught a bit between a rock and a hard place,
I want to use the simplefb (https://codeberg.org/gnarz/simplefb) library
with mpv, however simplefb needs lua 5.2 (or later with slight modification)
and cannot be easily backported to 5.1.
mpv of course only supports 5.2, 5.1 or luajit.
Porting mpv to lua 5.3 or newer would be pretty unwise, the mpv maintainers
have made it very clear it would break stuff (internally & externally)
and they are very uninterested in changing it, see:
https://github.com/mpv-player/mpv/wiki/FAQ#why-does-mpv-not-support-lua-53-or-newer
https://github.com/mpv-player/mpv/issues/9225

The least painful solution to my problem I can think of is re-adding lua 5.2
support to buildroot, basically entirely for the benefit of mpv.
It's very unlikely mpv will *ever* support a newer version of lua.

Any objections? It seems like we are still supporting lua 5.1 for legacy reasons,
and I am happy to maintain this.

Sen Hastings (1):
  package/lua: re-add lua 5.2.4

 Config.in.legacy                              | 10 +--
 package/lua/5.2.4/0001-root-path.patch        | 17 ++++
 .../lua/5.2.4/0002-shared-libs-for-lua.patch  | 78 +++++++++++++++++++
 package/lua/5.2.4/0011-linenoise.patch        | 26 +++++++
 package/lua/5.2.4/lua.hash                    |  2 +
 package/lua/Config.in                         |  7 +-
 package/lua/lua.mk                            |  6 +-
 package/luainterpreter/Config.in              |  4 +
 package/mpv/mpv.mk                            |  2 +-
 9 files changed, 144 insertions(+), 8 deletions(-)
 create mode 100644 package/lua/5.2.4/0001-root-path.patch
 create mode 100644 package/lua/5.2.4/0002-shared-libs-for-lua.patch
 create mode 100644 package/lua/5.2.4/0011-linenoise.patch
 create mode 100644 package/lua/5.2.4/lua.hash

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
