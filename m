Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED072CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B904740E31;
	Sat,  3 Oct 2026 01:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sfifthq6X7AJ; Sat,  3 Oct 2026 01:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CE75D40C03
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991220;
	b=lMovwmlxL26Jgwf//om34lx2FhlpwXdiI2XDxyN1Yp7KVH9Ijf2AjDhx9SQ8EgOVTWhH
	 fs77bUYXjlASUJZtmVIU41EBp58yjgLVQnUH/VRJP1h87PLjxfM6Dmq/lT19mHZ+n/DWS
	 gOyEP9DM0HUNJH1EWSNEreJhx5/2OrPzmRDyZHHfgK5UnlLa/2I+SGQTOFRLoCP8ar64+
	 5vll25I/v3dkR0YR8iG3C3/n33lyaE5fHOjLUs6VwT9JhSrgWbDyaEX63f0GtkY71qkW7
	 KxrmYxJJC80GVWSn7e2Lgf9WbVBjy4YVf5jZXAFeag4IDsWIQ+lfGqFLSZvYybGGfGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gEfYEtiPeFeeBDDermcJD0gOydMUO4O7jPoAaiwNdtY=;
	b=E4jMsuC9hT2ZWFxxF9iRillKOcJ72XbbN7lBDHo0O6WfJXLRtb95yl06LBFJH8ALcPEz
	 FP1MTmgQ1i9/k1X0M7DrtcPW3mfEu3xzNYrgrxUNdGRiC4M1WZCNPIgNV8ClLJKRiPwbt
	 SzvsNml/uFR6A7YV/Sn9zmc2nlfuZGtTQka+mWGtS6y8ACKTofxBtoeiFJ+fz9EmsZkDO
	 QM+E5OSJrkZ9tQ1Xtw0Uks1A8/ZMTdmkUCwnlgid1jc6ta09+4p2HUZxpaWdQN5RDrYFG
	 G20p7pTs1GHd8mNgyz81Oy485RcvUzohEtdZtc8dQegRUnob+NEcpTJZiNsL/XtCPMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991219;
	bh=gEfYEtiPeFeeBDDermcJD0gOydMUO4O7jPoAaiwNdtY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p9XV9s6g8ZXCtberFKTvCtjEdyFjP+sOAXr2yxLCUkU9cU9ZbInDbZAOA1eh4KNM6
	 a+gUQCtrUmDU7hCJp0v5VlD38ijfhVfXvnLB7+ZWAt7kSXWd+jTcku6jdbbvRYrZcH
	 pHcNWATc3ts5AfGQWQ5AoSexfVw/8JSKQsx76ehV4NStHNv6optkujkRNfYYloNIFx
	 q/BOoWQbNxxVq/nhGpv3f7RGjcaKZlZ33+q6xWYnhCKqdQtgJGesL1vg6qM1tU0dfk
	 ZyzVXDHc/W/YcF9cIY80vW44aOi93iSa2VizAmuC29rSisOyb/htZ8k0mrw5fbOfFx
	 DDkq0cLvySwEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE75D40C03;
	Sat,  3 Oct 2026 01:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F15C8179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB0581342
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rN7SIGUbVDaX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 647EA8134B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991216;
 b=F/pXqbcVSU6tYVECo7Ts7m2wCRj1wKTVa7got/FbA+M1cU4pJwcJPEis9vdgLkTnYxWB
 JUtNAj+JRh7wBodQWYEtLU5hHpVjE8rsCuP5frtlY07GXz6y1hAILNUNgFQ+KiQOsVwB2
 vBj3OWZCod/lQQbqKJDF+a9+mq35EXLIPFwNP6SDbzskaRhUPaOwX2tFzT703idtZ+Ely
 2989HpNuVb+SHcq5fjegwZNI00TSCrywVubj/1zdlnn1QAUX2N+8c0vZTZtAQdMHkT+/P
 MNfcHCiGt54xGimJzomSnf7ZR65D+ei3JzMBX/W7rbOPNt3u/5I7zhkgCKnB5MvDsCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991216;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5JtuKInNe8qgV7AAKo7GmlNI5/kLlti0rT996bvrWUk=;
 b=STqkSBQbHBzCPC3y/sKglEWk6Kd5W5tew+cQyQNzF44qQ3g4QrSsMyKhbHYiIZU1OuIq
 OeNjgd25LdJyfPSj+lAFfs3Eku9NEMNpTeKjuxWsnmnx2sdpqujYVfJtLg2bVEIg45HzN
 hVuFH6/fATv7NjUg1kji6fCCUCHys28OjsdaM51IacjIy2+doCXLMOQRMPu4NHZSBSwgd
 R+w6DPRQsHIC9rxaj0qKO6YQvHEHEwT7u2HYocZIKmfPGuxqVxw4Pm1ZKUkW7jCtpOkg7
 VzgK0kJwcuXjnD839vNuIuU5hofI/v2KshuUv53pR4rRrZeT1s6Tth3SOrN219uhm4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZwXnUQjS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZwXnUQjS
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647EA8134B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:36 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so494295a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991215; x=1791596015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5JtuKInNe8qgV7AAKo7GmlNI5/kLlti0rT996bvrWUk=;
 b=ZwXnUQjSBan2lBn45D8op0fNON+m4pewOsY1iWv45CFxmnqVxd0gCljeXCqIIAubNd
 wi/brz7CtAhjdD8jAxevvSHigG2aVZlbB/VFaASUCEfc8K3dzntVroJVitn3K7nhGe2P
 /66QwvJJfausI9uBFZY5pXYrM07LGAFQoJEu6lvJEo3jd3NlsCRbso4E8pi7PZI52Wye
 OiPArsZwiHzhLXh8zuP05eAXiYQAd6L/qpK/P9bXDIW19If9ksLkuRien2R6kGZhZGVF
 GlCnSccyqO6iqLGGVk/XUqtEoWbQUKnWhgk4WnjlqQJDrGWyN/TA6lA9s/rozHOqWNDV
 FtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991215; x=1791596015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5JtuKInNe8qgV7AAKo7GmlNI5/kLlti0rT996bvrWUk=;
 b=JwbQu2OMznmkhm3lSR3CEGx5AuhHiFMq/hRwsns/3NYIhrK0kHxXY5VGHOrUqPHoq/
 0t4LtpmMj2A8hy6iLwRl6zhJiLxmaBEkkzdnZ8zct1WPTtYzPXbXIu5Xl5uHVJkpcJ9A
 kL+xZ0gagWvwFjY9Akn7MbSOYoPGyXSoUxzmoYtntfXWXSIAqLaINtvAonTSOAclXivi
 zvjYRSLiqnFwD0cPid4/irHEldNRMg2RA1H1hxV+urlCn/zQlgJFckjDi9PMgrGCzezo
 VRtUrpW1OsH8ok+9eIXjojrskDIU1ppKPeEg12NOaBVr5g1uqrmtVGdYScBzg38qemRS
 O7TQ==
X-Gm-Message-State: AFuF++lpvFcJcxl8i1IzJTyTy/dOf/lmhOwEqZBR3Fd2gLBcTiYmD2ov
 4YqE57h7jj935Z23AW6tJwcxt7fRxlEqVkAQ18SnseN6R2+5ZXqbyFoIuV1sQw==
X-Gm-Gg: AYBFou35taVDvHekUEWoHuGCoYXMwW36RWMWWoA0epjhGALyqRpag8a1qOQ2SwnRSzf
 s4xSvtAqiquGb7IL5UdAbws2TIIruOewMkTieWEVXSJjRuQLwV0SmiFNTqsW7OG3huNJ/qr9YK0
 pnMy5dLEoiIiT0HRt4l8xejdOCLG5qY2hsypFQYwzB0cXRjPCSTKnS8Bdrw4hlQ7O3pybJ7/Pb8
 S0LEBwX34wbt4pJcdP19gHFO7amBAtq6fTYL5rghvT34QtwV69GjF8eiJrWHlDhcnDGx0cYAIp/
 7vLqLx8ynl/mIEHpYiyaZZM5AP2xnNedi+q9kfluaTj4vACMe2/tE3vFgjkXiTvKZcEvUYUSa29
 G53X3Q01AZ3l7QZ7vlu6YCeFfvcfTEDVSyw3QDajlJ3z/YwIAsHEVT7wdmt/VxW+A1TXSv9QOU/
 HmtvpzpE7rb77Itl3H4Zu1Igw/qCa/lZh2VXHQVg0SVjaPbacHRnvQOXHhm2N3La0oPIpP/cpp/
 2Fk6vTdauIemi38gaW6ENXZf5bxwbPC849uLLt3TAAuO5kGgbhK3t+72bss7uTQ+B8uE3JREV2o
 va/81zK/K8mAOjm8Y0Zsp9xjj3MSupmNDqcuH6A7T7+U9EzritEoj07C79uLOUV4BzuyWSXsikV
 qpziIFBx7DXNxjHdjKbyO/HGn9RQ8ZZdWwiYIwsj1Sg==
X-Received: by 2002:a05:6830:6485:b0:822:45c8:a94a with SMTP id
 46e09a7af769-82282e77f30mr4493390a34.17.1790991215284; 
 Fri, 02 Oct 2026 18:33:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:18 -0600
Message-ID: <20261003013304.400979-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump to
 version 2.15.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 8b4850c569..00e8f84957 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  08bd879ddfc1547b9cf1a32a90cfa86e  pydantic_settings-2.14.0.tar.gz
-sha256  24285fd4b0e0c06507dd9fdfd331ee23794305352aaec8fc4eb92d4047aeb67d  pydantic_settings-2.14.0.tar.gz
+md5  5adc6be6e91067201caff66b05f1186b  pydantic_settings-2.15.0.tar.gz
+sha256  694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117  pydantic_settings-2.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 10d79b46b7..c297fc7e79 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.14.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.15.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/ca/31c57507b13119d7d3cfa1576dad2911a4861e3be07b579395f4e9d393f9
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
