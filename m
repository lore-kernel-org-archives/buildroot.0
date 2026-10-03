Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9E8CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA2981316;
	Sat,  3 Oct 2026 08:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi3xuX4QyQ-O; Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B362A811CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017152;
	b=FzDzCGpjRaHsXWtdExFVG7NleaIxjAzKk/k3oR4XKyhCDg5J01ybSsirvZfhDa6n63+q
	 BNZyI7R86GQHb7EO+/+x6hqni2lo3m9n4DOCtWFyrB1b/lnaUekRXBxZICi2UF8gHb9Oo
	 GORuO3fvi2M6tGRdBdPLvQNubFflE1uiFkPKCcoF/YnIGci9Jz7NMF/dP70yU8cT6Afzh
	 SyngnZ1ELlJxvJhW5/kjFgL8o3ZBVUJHTazsMZshN4gDqeF8SWbHiqwyTFJyWQ1nr13Ao
	 rri83/xl4DX983aBzlDsz1KZBkaFfMxni/JKrsmJB+UOoisEjPm3ijATeroc3r9OcxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sfsas3W6lWBk9EugkuDswlaM2FG1IE3qOnbQp+/g8Hg=;
	b=kuSC1LF9kJbX/sSOb7AHyWAT7o6myliQFSrK0xvAoRsoKVSx4TvJhCMud9WeQG7B8Gbe
	 5VFlZDFAT/c4n7sychKXyFfaG5NMB5u6NDw5awb6IF0bxKZlYSN8UxqkQQLIR4cEEU2jt
	 /HcugmoHSjVk2JwzKWWAjDN0lpLk/zfZM6XrupfUoxGRG/KsGBAkboiHIzxj741T8sa9A
	 5DNTrQH/ULnNyI/Z205K2uXVEcMkAVoW9DDjavua8jpnzYaLLpmbg4tLTC1QT4xnVe65b
	 pzwX3AxSR54cFK6omjVGTJLoo6ugeuFCXCmkZIkIlEgbkQ3eBxqHcjU6ISbmcRsPUqA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017152;
	bh=sfsas3W6lWBk9EugkuDswlaM2FG1IE3qOnbQp+/g8Hg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y0j9QJKaoQjGLCSpHkThvvaThDVczBWwJqmBd3Sqvi1fcb3R9MNGLJry/nwWrvkMS
	 VD/JQGN1/49xho3+u8l76EZEua4EyiVRvBNb+AKRd3UPvJQaqJcuV7BzhwIge+CfGj
	 3D1yGxzH8yQm/7Fm628lYRZBI3DiybMBIoPbCMwVfkR60i+wt4QjDJFGWgcf83Keqc
	 0ZRVOp2oCzvnPMHEGrqf49LPB3RRkM9alkeljEIYUvJIwvPFo4YcNwjdpn87bjCcuw
	 /S9uw5IAxiiAMSRHqNH2OnsbGRWO1hTVE1MHjvzlZK4HIsZJfoVt/RzgpIwO4/mzut
	 1iW41uP15gENA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B362A811CE;
	Sat,  3 Oct 2026 08:45:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1DDE2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFEC6400F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTdz29J4mv3n for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EBAA040059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017149;
 b=nLOZ9yKtJKHNZ0+xeg/hjTMjke+YvCzkWV8jFXsvLFL7khVOneFBgTJbekMhKf8zMxgC
 8eUlCD3IXwJ7t5w0vxNPvehjpJ8a4+5o1Ro8CzjnJPNKtyLktUylknEoVBfyvwZiHAqqb
 YSIgHExLDmAKP1gGa+8Z3MHUantXLXIvmyjAdLXZSsZNlnMFrcofQVsfOahzUYeEGP6Bd
 jPMTYn0T10GMzPBM6mqiEhuoFYvz0hHZLaBt9kFiBTxJnvF/YK/FrjYsNHhZwqhuvG4TM
 QBumpa9GTLN/0RnA+AVZBE3E7EfDt54dRwgDvk+9bkLrFYObSbtaPLO6NBzAblGAGWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017149;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6A1swkCh21UUu8G/ojivkB4O9Vkbaf9fEY0LxqbMmj8=;
 b=Lz6WGc/WchQowlRtSzl8vKnQOCAcMTpMBjKAmIh8udp79WWJAWEJGiXqXbLHdCZFeyAK
 ILd4KWXXxvxwrlTSNiPV5RuF+ahJ3BFeG/sOM4C3JVU0dCtY3zv0DTjYjCo05/RFABYjW
 FfJL+L05rKsf1MCFn4904VMUhC1vzenHBSlBtiRk1Ehid0Y+v0mY2AkH7fde9uLlqboV7
 pPZ3bqQCjkeruJt3BZPWPywfwV4wKBGc7iFHyZAo5Z0pWT0NNFlB8i5VVh/5Z2uP/UX+q
 fdVBJslQ8NcorS9wYtixdIaeFbKDLkN7cjc4/gs35PFkRIbHuNlLVdyeY2fxoKBcyfA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lKxIoG7W; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::26; helo=mail-oo2-x26.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lKxIoG7W
Received: from mail-oo2-x26.google.com (mail-oo2-x26.google.com
 [IPv6:2607:f8b0:4864:31::26])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBAA040059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:48 +0000 (UTC)
Received: by mail-oo2-x26.google.com with SMTP id
 46e09a7af769-821c01c2fc5so679661a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017147; x=1791621947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6A1swkCh21UUu8G/ojivkB4O9Vkbaf9fEY0LxqbMmj8=;
 b=lKxIoG7WbeBRpAplYDEz6nXLcUi08e5tnnyxDLwWN/UELVudoj0V84Nqz++nmWRgb/
 +5Hf1ZiUR3FEeiLcmmMbVBZVYrjjm7Dt+XJzayEWPaSIT06kMJaznV3fNbUKSGXy6swh
 GWs18Tpz2k5/+Mi8d89LdpzEBkZe1/ds7l0W4MytPlYcdSpYLqJpE0HSjxrlXDpZK6f6
 CB+FpyE9Ux6VuMuzakc13mtu3Q+ObasM4b2V6PtkQGyg4GzAH6E/6m3y1hcDRBKN1N7O
 yYIrNUYyGV3hUL+/IFBcbElxYiEO7lKW4VovtmhsNxP3Ed5wFqjEuPB+BPz61DGnAp6L
 YJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017147; x=1791621947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6A1swkCh21UUu8G/ojivkB4O9Vkbaf9fEY0LxqbMmj8=;
 b=b72I06qr1GTec+0SEngOcUA3/V0avKPU2XOZ0ONzFIGHi2QMvFi39JZtpkA3iTv5sT
 TNEZdlq7yEGuqv0JFyihauq/2K5g4w2D6G9NeFohPJ93rPreLz9nekjZCIubVcEzbkMP
 kBlI9k/lXZQMgntm0ub8Da97ZPo2GYIVGQzW0Hx+nAOrnJ1gGFuWTjlmz3ozsxh6Y7SK
 vjlg8hTM0l96fPAcsab799YGWMwY0CFXsXOeslQ2wvEqaGI6hzmw4Jq0zLOYsgRZzF9e
 38WqrcdiAkR2nFVl7Or5+iHuB/1lQ1CNNaOJ7mz4otjOAyWH3C7UjS6D/hCUKiT80Axk
 nDXg==
X-Gm-Message-State: AFuF++mqzLY3hddNWfbE8jki5TlNjh0Vt7IRA2odUPsU9ltndDaotRBH
 KvmTf4RVImahh8O+EXZPyPw5KiOFWh3mNbmk6aayoU2T/3XGSIcr/39VrKXqbw==
X-Gm-Gg: AYBFou35C1k67atIzMZzk+Wj8/vb+SBku+cMUINinjpAgCXKo/D9RQtGr3rRtCGL1U+
 f2fi0Zs2jGnk5YA8W06aaowJqawy1FiaUBfT4ZXIOummCam9rwmCPE23Wn5l93yOrDZaRya1PD0
 z61f1pcYhDShalAZwJ7PeqNl/He3BZmgQLiZnWvhlK3p/bp6yWcmkVL4DfBQwKnftrhc351JrNd
 dpTQl3CtnhmCgM+drNem0ZBRI2zxPEe1C1RWuKdfbfqMNL5c1JgtoUjo5n6Yfe+D5xXOLBgVkL8
 +GO+p7iXnwxsLPaQYxu9TYF0i3kxUxbWYz+ZLPH3sIgs4uOX/kM0HbCzbwHX/BumKjNoLAD/FeF
 9614Rk48D4KBiYHqR60AmyvR0doldKS0TapNEUBA+23uEumePJ/bFKdv1g6+jgfh6HINMHZ6Io5
 qGQQsh8Ii5We44UYb+uoHHY+H7xROhZfohLnpKOHq/N8TUZDegernWDD4L4KPS//EvJ2bRZP78W
 yJyjZsYdHbNPg7Fr65UWWzCJ26atpeKjnPirJ+V2vFZKg2QxfVZkHIvQVNLKf3dPcSXM2P+7ZLv
 9Gdc2tbKdiQdZw1dzetSmEqfv0Gssg9bVHsll9ZcOUSoJPnVPODRXzGC3AbDKR6oslSD/3fEQ5K
 0mEh58hu1K9EtRm05i2fIYi43EufO9pUcSkPGHmPaZhwVGx/ZjiLr
X-Received: by 2002:a05:6830:6d49:b0:822:978:f7bd with SMTP id
 46e09a7af769-82283c6bb11mr5616584a34.28.1791017147555; 
 Sat, 03 Oct 2026 01:45:47 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:12 -0600
Message-ID: <20261003084453.545653-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to version
 2.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index e604cd2d1d..f2c11f1315 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  8c20930a780872dafd6f22175398ccf7  soupsieve-2.8.3.tar.gz
-sha256  3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349  soupsieve-2.8.3.tar.gz
+md5  411ed4ba0a31ea6cd7025bda680b0834  soupsieve-2.10.tar.gz
+sha256  49e9380d7d2905463583bafe285e818c7366a9ed7b3aee221c1ac79c905d8bc0  soupsieve-2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 04d33f67be..1c4279ce06 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8.3
+PYTHON_SOUPSIEVE_VERSION = 2.10
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/71/c3/1b817965ac12dc002d7c9cd7dfffdd7d4fbf9b45763ef2ffe7b86ee94670
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
