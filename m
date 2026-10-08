Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03026CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842BE6064F;
	Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXPi-iOhdc_x; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B18B60656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624088;
	b=a/3sEYYDhvIwWQTUMLQjqWwDF6h4VvWycgvgkWOmiUqYCX1RuPULCCwBzLIaSaZ/iW9p
	 erg4YIMOF6xr6LXGcdz1ddfRJBQDZD452AZeYkWPes1CpN8/Li5azlXHiTApXWQr9fmUU
	 BXX1vFKofTQiDUPGNUzfmmxERqpKjBbGQ9ZOOJeslK2J/owMVWPZp+gIDASkoKB27ixDP
	 b8pIbs6X4TECS0Y+3QbggE1dPgYXay4u2Zwe+OSEcbDv18o4KCQ4ZwiQq49lgIm0VgCsz
	 nVou9OiZrxmy4cOEUtFgUohRGVKRQ9WzzcgnbwW/6uqeYG94KImXiPZVRWm5jQ+n6FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UxYacIRaXlr4SlLBPYCtSTf0FaEtf0ccou3lkQzsNFk=;
	b=VYuGnhZBwdKnUyqxAWvbTArMPrwhbA++60XG20WcoMKErZQrMd+lqomlBE4hqFSTsvht
	 nJ3TmXYXs4sGFVrhTEd68Mg+gdJBlDRLeD/amBDM6kSyca2hKTfQAfOE+RJtnFNJ25dW5
	 kw4b2CXFJLXU9/hAxzNagUr65VLoOVd/c/r+5IjcVTYXCQyqI20bm5rwCGn920H/QiuQ4
	 4i62NpPK3tZbSfq/1d5t2q4QRUvDAMc/XKkot9R17sge2wkDTvcAPrYPlpD6Ltjl2cC+G
	 /0IcHFZEOG//0hAgACIj3T5ZOFhOG7cuBnrUK8lqqc66LwDZFwL9B4HBGDQHwr/pZ5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624088;
	bh=UxYacIRaXlr4SlLBPYCtSTf0FaEtf0ccou3lkQzsNFk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MomiW73w2Sr3B7aBkPYIMX2C3ZKzxd/VkkUaaHbY58tmLpt2W/+4ia3m8kbsLPmwj
	 NeM1WPxNdS67TlWY5e+cOrr1k+4MSMFfXTy/71NM0smr8X9JHOtIhmQk+99pQkp7cy
	 C4ie/Sufrw//HdrraX96Lw/H+d6TQfb8s+KbiBMhwNi5tAFLJQwO8xghLZAXaY8w04
	 BvEsQLOsR4ZD5kzdxPM0JJvb8ya3ABEtaQMF6duKjbsa5sW4wJy9ak7YqUgvTu/p5v
	 howzLGAELS2ozTvvPE18T1nN/bkgcQ4+oX8aAzub2eVb2ghoyBWyAx2MGerGQM8LU0
	 if9j4ajY2rQYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B18B60656;
	Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 530EA356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44E5840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9hnSgjWXN_B for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 28837400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=UkERq3N6XjbnqRWzZW69vW8uDcgQvA4F/zx7vOQHj5UkAhT6UN4sMkhgx1bZAkZ5evoz
 1xia4nLFwZUn9KMxv9boGsnxEI5PKnsyfssBrKqTwtinJzK1bfiZxUmHxpdzh7mSUP+yX
 NUGDyEPfDKVdUBG8/7xFXHzSHbsWYHy8Xo2GmY+qX3JCfqQTJ/jaKuBibFVfPtj5ZNIIh
 OGguGL/fpp/6FMCEbqI2atwjsyjAL6V3wPz7zUn71rOm+qb590wj4Bi8AqYPviFtN7DMi
 75NIk+aJfDF+zF6bIDXMZzFSI2MepmNwdl4/7trS1WuHzZjYGLI5KmrZ2cm8QQYBjeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mHCc12WdyKIFYvVj4wz4vEr/WnBFaAg/Vi+K4UUcOdg=;
 b=YaI3blaKypooIbB+5mTXKBP1w0ujSBdugVMgZ3H7M6rSDtFEIwswhoKWguCUykHwiMff
 v3ZzuleZUZ+RF92KL9oOIgfVopwwzRD8PKgZZWii6gGm3uTZBnkHmNGtgXAmEmbZSAY7x
 tu3Faxts/9ySy5GOOwuBpOnP5rv/OMOkVgcxjuUIpgDl2nhCtpecKL+9kXW098WWyWouA
 73SkMRuK2pG0MlZ6zqbvehXs07jJm6jf+1+dbEJNYsboHNIU92xGQfW6yGwilmioZimSt
 LvKFMV7vqyUnMHXEuobazStlcWawGHTD6YDrgBzPGaRVjU5eblFUY3184qBsxI4+n2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28837400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EC818F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:28:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9c1a024d42b53438d784e0347abdb05a098d1500
X-Git-Newrev: 2210953f2328bf3ea84a00bc341999bf62bc41b8
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.0EC818F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wireshark: fix
 support for lua
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6793390420767848309=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6793390420767848309==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2210953f2328bf3ea84a00bc341999bf62bc41b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since version 4.4.0 of wireshark, support for Lua 5.3 and 5.4 has been
added, and support for Lua 5.1 and 5.2 has been removed. See
https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html

This fixes an infinite loop during the build, as for some reason when
Lua 5.1 is available, the CMake check for Lua 5.3 or 5.4 loops
indefinitely, with cmake taking up 100% of one CPU core.

Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4c6ad81bfa4dd5b12c230c450dbf798c5a1542d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a67b915b5b..c394f85beb 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -109,8 +109,7 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
 endif
 
-# no support for lua53 yet
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
 else

--===============6793390420767848309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6793390420767848309==--
