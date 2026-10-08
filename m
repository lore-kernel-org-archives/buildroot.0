Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26DECA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA9A40966;
	Sat, 10 Oct 2026 09:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lfw3TMGlq_RL; Sat, 10 Oct 2026 09:22:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE2EB40959
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624120;
	b=DqzxjxT4xuzFFJ3y0sjq9kfEgS+pDi9QPBCKYmZHHXpplGDGW8O7ywcPayTqxK5WhQoF
	 GkZpdkCfUOcST9R+st1A41Ii2YHQtE4DIbymfzgprfl/D27Iqg5D8zekmZ4/Mc5X9ewGX
	 4G7M3cqyykHuGVwzJzltbBk903mpu6qK055HdNE99kbDEh2Nla6sIPLwIc5zmp8TGTG61
	 G3/rk6ju0DITsFLzmYKRAw8XUGgODAl0ht/KwbGWWOXTSmfXw+h0Z5d4lLoWXkiUvdcQY
	 m8bOeLdx0Kvcfi+7fiNoUjZ7woZAkxSNEYueGqsCnDjNztu1BjfTODsb64knKpN3cvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vmv7kAYtUE2Q7CZ6R5wXO71Yg3AZ4WiQ6zfOVC0uRYU=;
	b=UPiY02i8fEbYSgq+5rscsC1lS5/Wd4JlYmG76dkO60DswmIThPQPFs/YmuNgGYGrLO73
	 5zMBe7m1VABk1HyHaWbpAzKSordBfW4MSZdfh2ZguVk2MgU3b80WUNjsKOznvjjnTHNnu
	 OJnLIknpkXMBLBZpog6FJYFvilB4JmCJFJCaYY1kNUaTyKYMfixhBQOScoEWUEnA2EAwx
	 8RwQ5jc2qiWdrjSCsTkGEAEhhxGiv2Ha6RNA/1H0rNIyHlOpPPeE1+jeuAAU00srJdCsg
	 gRN9E29vXB8a4a8VtA41zcd7OCW6X4LUbpiYFl+9pr6n6IBe/DB+aomzq7aOA0pkj8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624120;
	bh=vmv7kAYtUE2Q7CZ6R5wXO71Yg3AZ4WiQ6zfOVC0uRYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ciy3jHdxfPs+qaKGM3sbu+3SHvWobNVGe2c2UnxYcD4yqt69HWR+Z4LKH1W1+CJzt
	 oZEvrz16s2pQIcwwZU8PybcgGRYPX1YK8RyolRvmyrIoYmTxOb2UQor2RRFUiBMp+f
	 IIPM1bVq9EZW8rJHMaIYcKwJYQ/J3TmQa5pqdPR092M4CFCxJo9BxY3rohDNmItITE
	 TRzgHu07FpOdv8VPmsYzwDk0e/q35zjUb4uv3Sb6GjqHUljOPp2g9pCq6uxJ6VYwyc
	 eZvWY4P+KTPqSFfe/fUc36P3ek/qllFuzL8kZAmqy1BfeCZAIiHZLhBO3dx9D71rmi
	 jYgnH8eWy85TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE2EB40959;
	Sat, 10 Oct 2026 09:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E04356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6EE81316
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMTbZR5hc1H0 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 409E0812D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=jIO0ECr/BxJkY+bH5YUB9oiBhbLbeufYozqDnj4QkkArgQSed/PVxXdCDPO4z0hAba7Q
 zbQIJebVFgi4d7DS0i/CKHH8ccTtvnM5xMIR/+8ARiUAr60LfIKdQXawSEl/WROuJQuF2
 THdxVycdKRDqEbMvY5I/NMsVa5dJJwldbpQBDGFKcMU6+AZgdSxm0B1ycXRzCCk95Xln3
 cvA4ueXtnYHRi68rbeu9gVq2og/Nsq8nCAXGcgg1Ehe3QRtp3om7dhaaywJDjMmT5GM4h
 1+QQaSr01vTVJil2xAdsYtwFdqiyOUjy7w6mAl1VBhx1ijHZ8QX/z0iOZhfU3CGVowA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3j0a2YXe9ZAMycl6x6y3SnxIjbv6H/+oyIHaBR3ldHg=;
 b=keGt3Dhenl5/fyNZffHJWBEFgyn9s9bMztboQJWutusgZRVC5clAfl73KHj1XnKCCeZ9
 isvCv88zgaq7Iq9BRlhuXxndbPoCHytMDECat2V6hRTBlkh7n3l9zp4hTcZjixubWpi1d
 M2OnE+hFI0ZI3H4iACH3iRnOaDCXwWYekp58EgjKBOIQydrOXUq8pD1CyZLqC7eVpV1Vc
 C1uZaFx2iiHPeMriRaBlw2D9vboR+zuiCKGQO/etlv67P9AQAAJsDrgsjG45qj8tutfeX
 pzUTA7aGybCF+NQejMZ/q6wO7bwqEox6oh3fQDm1+oLIcBzfVI3+017Jya23QhEJ+fQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409E0812D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AAD08F0B8; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:08:16 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f25fc6742f64368c8f03fa1a8ef7b3105c959d9a
X-Git-Newrev: f6d5135cc67f212ef0c63c42cabc92e9dfa974ff
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.2AAD08F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/haproxy: allow
 Lua 5.4
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
Content-Type: multipart/mixed; boundary="===============3469620260714342414=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3469620260714342414==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6d5135cc67f212ef0c63c42cabc92e9dfa974ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

see commit "MEDIUM: lua: Add support for the Lua 5.4"
https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d36891dcee1a806c32ed926376aa8ed90855064)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index f75f18e031..d1d29645af 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -40,7 +40,7 @@ HAPROXY_MAKE_OPTS += USE_THREAD=1
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 HAPROXY_DEPENDENCIES += lua
 HAPROXY_MAKE_OPTS += \
 	LUA_LIB_NAME=lua \

--===============3469620260714342414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3469620260714342414==--
