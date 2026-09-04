Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF4C79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7013C60C14;
	Sat,  5 Sep 2026 08:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYx8HO66aSlk; Sat,  5 Sep 2026 08:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8A14560D59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595966;
	b=A1HhxTaP1Rg+dgGQmF+mkeOnZev13WBWNJJalT1istJijPYaM43vRByBaQQET0BpXCMs
	 Ry19BaijBKg0PU7u7yxMZMADm+oNUNh4ki44wKGYwQfE7v+qJ41LYm0bJy02nBXjCpKHD
	 PU7mkP/YdgJBR04PGMpn85moF1Dnuugb9i/4ljhPbbPFfypFIjOxnog9p0HF1aWmB5+nm
	 tGHIGkpbfTGPstPKKVt8OPVVkHwu7Ryvj0HitTbyrbBpZMJLroR2Pe/ehu9/9QF65F+Jb
	 laU/Zcx1zxjN6NuByc7rrDOlwwa/uKyZa21Yd3nLcptnBKmdPZzmhCIucRplDPxVGRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=EaLr/m3nHUIIsSm1B4/Jl9KSPznmpTNa2fFT1TsBQ7s=;
	b=T0RWzWeOt/EkevlV88ztSrfZs584O2h4vOMF1114Hdt3HoR0ZGHE8amzL+azuNp+2RwR
	 IsPwijJa3rk9Bb45DBVCEetMlkhVPADEOkRuR7ZeFUINlIo7ry0lEdvIEAL6NCyGN2EQM
	 SN8Qe/2nbbU7Y7UiK4nb98hqD5akSwXWkCG9u6NfcpBJV/xcKiLs93KTV06H3ej2F1A/8
	 KpKXIaoBFJvJwIjmAyXpBnsaA7AvuZMw+ywTkN8JYlqWLtG8NH706C8oPHkhVT/8/kQCo
	 2p2q7nzfvlYTEbgepAFIStyRvrSF1M6AyRXRUyrZD+CheD2jvk+cJT4KqJmaL2LDpfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595966;
	bh=EaLr/m3nHUIIsSm1B4/Jl9KSPznmpTNa2fFT1TsBQ7s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqG2/PebO7LvBb+bwCstXVuJxtClkotKxdohWnn3jUC+s5w/AKjsJ5mnmTth+YLfN
	 Q+GczKRhLNy19Vb+pH4lKv0DVRapQZG0tIXXjygKF2Sfst42hqWqUvfK0bzGSChvRv
	 WokjJaHnSQO24iJJLj425Yg7D7bnn6vAJ+SN3ZsbP4rVwWhu7zaUH1KzxWwnYvcFtR
	 ulkL9iMVW5cvuMUhvFtE+YLtLLcQFRB1vsQOwd24sorSFGWzgcF/Ww1zJnPREZJGDq
	 BmgJKOmTooviommThPsbFZw6PC1/6KSsBuVe8HSaUDEAd6fSMRmlhYVpLuADxNApM/
	 snR1/bK4fHIHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A14560D59;
	Sat,  5 Sep 2026 08:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 238B8136A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C5B81184
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZTzeogqyUge for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2868281176
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595954;
 b=PkvTLAm19o4p0V4y1I+3wRps9/Aj9AmeHC2PcI/6nUAf41gLVXqD/i1sRsOx9xXIfP09
 ufE/In2zyky9Oszrv7KewUz1v8cL+0yeO8yYWqkRRpZEZ6n0vXl8PPpNPl4BAzkIIbBdJ
 MNsF6bJHhHTwFKvXhO/lEkS8/08055rop+nosEl03IIPgE54T+nUlvl0s30K1CQf/DAXn
 VWJmRY4WPYqM1nGpkoW1YQhYU/Xedk4vk6ThcmRMJg/C6G5rbFrCGiBkSk2joh8/Qc06v
 D62dEwlWDGsZCCo3LC+PXXjHuAG4CgBisQi6ZrWrP7z3ZG/hw80ETdkoPs4OJ+ABcKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595954;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=h5ECF2aes6sGUU6XUGs/Uso/ufXijgLbympc+7m6K5k=;
 b=bOL5nkCNA7hzzIBo5kyYedjM/+WnhLPTYMYZ9ewOlgTMu99YSyEa8OC7IfZBMTWazCi+
 8qH+FqVIsGXv0BV8K1KwFgjWOfraioL2usGX7fBRPQuXHwt/vo1n8o7fhaaG3k8lrdbGe
 Tl13WPDXL+dzMXxLmjRk3AMf7jiO6dmOf08mXE5nkBK7GVdWaMiJxprC3to5xcbV8AGSo
 CYMeMf/YJ6VAvVIiQZ3sIjCMGI16UrgBWJ3uKjm+YkbnTrcMeTDv4QnzJj5S1jH/heyhQ
 Qk4Wlkd057KErWyFQTTqEBYv743pX5O0ikEjHx8nIKtiId5+Ig1JQ4GOeF6f0K9EeUA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CcZvZekW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CcZvZekW
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2868281176
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48436216a98so1193217f8f.0
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595952; x=1789200752; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h5ECF2aes6sGUU6XUGs/Uso/ufXijgLbympc+7m6K5k=;
 b=CcZvZekWmKymxvL1fKsnx2F8nbH4SBv7usEn4O+WNN7GrMg2vorMQInAruJBaE6h0q
 aG7rOpjhizohF4F9gTOFEKU01GO7V5Dl12rcp4VtbJezTCUASS68G39wIJJzrxlqXxed
 xhlP4F/sOCAMFCmh60agq7WiHPM8FqP7OQMapIRjhKTK8cyGtG5OWktFoluxiD7TQtR7
 rgabOBp5bk2iR8yLXJvJilDtvH2eV16VssqveGc8/JyEjVR7krdKqyFF9ojY2Fx/bxjq
 oK7/5u2BVNHuwJrhtgYGmErBo/MvOpcK7YuXEbNrVhVrt4rHkP/pDJJ51c3hnQYArxo0
 lF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595952; x=1789200752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h5ECF2aes6sGUU6XUGs/Uso/ufXijgLbympc+7m6K5k=;
 b=F1mmKiLfhPsx3s0fOa3GSlF9peduyPu+s37sJJKJt0f5DBgPUOdRMmrB6vaO/uKYVU
 ADi2GE1kZa0FS/cFr+QiHb/YJ9wXnWInOf0Uzcrqb/nhmXq+Gc8P79hDRsshBb9byGgO
 DY2YUrYo+h0cNgEsjZNRSsYKzsbmsyZJOxaZoCVMarBxr2qaSDCaJ+uSqH0Ncz9c6Iy6
 iSf74yD5UDlumliqO9UG3jPLOfgAdMphebS8VBhdUze2fryb873/dppBJdNYW1u25I2Y
 qzdzUi6Wzl/BCjnHryR46opKy1/53MhzVj57Cy5yl+DMsMhFwYNBrvD7h6h+NmWbJTc0
 UvNA==
X-Gm-Message-State: AFuF++lc/hqOvvY5xyZ1uJliCMEOJdQ4t/IJEKLR7GkufxBoJa0n4D1r
 PdrK5IuwvqpXp/zgX3Ref0UnaDrM+qJsfgATQN1+kJ4Qbouf+qG5oPApqSZKNQ==
X-Gm-Gg: AYBFou0jzHp2e9iKXw5qxuvQ4IvBNwXImZU+OjWod9xiFWvMDZBiQYWtPPnmzDIxJm8
 utbumCu3zMKTFDwl2xzd0Rbe/E8nLhZrOajl/uYpAijkymhTDbcgL/Z+S1mpEnXeAi+E1w5pAnt
 6WMTdJ1wUWJFSvKa98S614+prb7KsZ9W5ycWCJhgX/73Zz52IiXZIO4VxdUSrruXmfqVTrSh6Y5
 aTqB/N5ytplVe+CJ5dn6bBch3ZHXo8N/P8Oj7wtUKChkIlSMCD5BroIrEH4IXg/F+UmOhT8XsqH
 EtlEqJjJuiJz7YHpLAtNzmFic8JMFvcyOQCVIt2L/3B9KgigZaiCRCKScXnih30CKmyKffflGtp
 9XogYYfyIZVOPnF7VIo4MusHr/bzVLWlvlBYpW7RI3YfOOQcCWGk4Y9p33YQ4ylfer09A5YjknS
 PLHJhMvVdjnixSpw6Wm57MwJzyUjDD16AgEXL8m27SIwfJwAEVXBka7aX0jLlUvTwZfK2jCtplF
 zrqN0d1tn8EHQbad7s=
X-Received: by 2002:a05:600c:3e1a:b0:49c:fc6c:bdff with SMTP id
 5b1f17b1804b1-49cfc6cc078mr84898145e9.22.1788595951520; 
 Sat, 05 Sep 2026 01:12:31 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:31 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:19 +0200
Message-ID: <20260904185921.587878-11-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/12] package/luajson: bump to version 1.3.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luajson/luajson.hash | 2 +-
 package/luajson/luajson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index ea779994d..0bb2d80dc 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
+sha256  b5a14159119748a0170a1286710eabbf4580c3a86544849e7ce8139a68fd7cb4  luajson-1.3.5-1.src.rock
 sha256  87565fca189b70f2e119b2a99e5e92a7aaab9f2eb05228b56b88e6c2e2f98bcd  luajson/LICENSE
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 81a9f8113..3fe346c45 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.4-1
+LUAJSON_VERSION = 1.3.5-1
 LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
