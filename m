Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F16AC88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 09:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACC76075D;
	Tue, 15 Sep 2026 09:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XdNuboqr3kt; Tue, 15 Sep 2026 09:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ACCF16073F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789466223;
	b=Ocdq4zj/eAKfsJ+3yVJyMd3GBuB6zLo8nYDIc30EpiUtxPiH0BfCCQgkWy74Kfi9F10Y
	 fXGGYeZkSHoIVGzI6acjazDLmqmVsBJIy50pm+rO6L+jBFza8+UDme6UXhxtxdgXIAjA6
	 HPUL1Qb6BcN4zm/d018RZr70MUMTFfZE7trueNf+I8YWR62ARpkrVeEbJa/Heys5/p3Ud
	 Zy+JyHoJh5L5xxQ1KMtthmyH/KWD7WUa95ZcZbTv2ChuL5KV7h+wNr/WO/4Ji3EoWWU0z
	 Dg63YfJrLuW1BBRNVgWSdSdyHMB5BXRF3SnOa5Py4jgl/jrkBKxq7dRY092IJNTxFhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789466223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qSAdYCezSqsXWmsNZ6vUiu4t/aCJD7DztiRzbeNEwyE=;
	b=ipPS3nBS/iOGM28s2wDdqShfm4T1GTZBKPE09DqsWJu7khOhtn4OvGMNfg1btk0H97l0
	 9zVEpCLPZBRFkX8iMi+zvXhPax3k3hJMF81Smt+TJNENYwJzIqcrlNOciVP92qLG0X7va
	 C/sp7FF0mZYq2qFefKmmHTpy9XgtnEGDZAuVK66oKM7y2VDFt+zTsBYkAhACq/00b0dCU
	 mUNvuhVHqEPzhZ20sNT31IZFVOHy9+4CGP9YseH605ik7a04pI0ZPX1cquG/QmX9rQ22f
	 K2YCrPVwCeZjoFQaqQ1Hl8bZtUU9so1w0/jIFYf1etukqQv5ohTIcraUjUCAM0yEt8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789466223;
	bh=qSAdYCezSqsXWmsNZ6vUiu4t/aCJD7DztiRzbeNEwyE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W7wrXcLfeB2SM0qEX7YnSqNnMeiXkDVaDU3zgKfDVAX9HXGk3+oX7rbqkIoKA/4EF
	 Oq3vsjg+GK1Cf1y9CKr7ac+IXSzP1edRQMv9KBjFKdKwuR8ffzfhgsvs0VCtmEwcvO
	 75e91oGtNkfsMOXd75shtrwvPWAAjQd/ZzaG0+BBNnDzYeIoTQdYXgMK9Ke5rWAHAi
	 lp/ydvV32akjbUXKyfB/MoOflJeBsmNikekwEz/DqARUvlXQbHI1abrO/uCI9Ly5Ac
	 pekqc1aQaQhRBGWcAOcG2lEj4yinCuF1Zp2wm/L0Uv3MlfrYK08hH0ItZ/jqCS50Gv
	 NuwKdGK/vjtOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACCF16073F;
	Tue, 15 Sep 2026 09:57:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E97B7259
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFB74401B0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCZnnLlo9zuI for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 09:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DB894401A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789466218;
 b=mZJbinImzInQXvwTx6nkNF9alpSlK7MUY1E6G6HR5QOGy74KOXnZ9TGKnf0MBrKzp8jI
 TVxBr/yP/h6ZFq3Ikw0H6dhtc1JJBIH4WJ2NTzT8DB7rW5ktDylEiu0iaujHZD0kxOJBn
 9Po05BxcdrgzxfYw5hqv6uaP61XiZ1h20bQFUbHbZ8YQqGALFwZ+8/xfqYpxibCEAS/42
 13pueYKUc74WZU0MWTP5PgThJv7qNXRyyJRSn+Oej6bcHmNqSFrPW8OwMcMmgFtAqxYB6
 A/Yc1Ro4dx5KYsYeO1xorzIRS5Tf2xL9mlb8MQpX0rsa26YTyIiT4fg/PZqCVP2i6PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789466218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=HNcV3K+jUGh8r2Rc+0HTXi70WcmJuh/T05n8eAdhpmE=;
 b=TTUcPTOmnWS0HR1FfL3XTd/HcgAI9JgmCMZntaPJWt0J065lH+yJXw8F9hNJCnDLuD4v
 SulMo7hrlglXC4vIXZJlbgrKRgzQijzf5TNJQK4VcyHAGdOiFxQqOvuValfvBo0ANdRtI
 ofFaKnLkswQX2fp/C0bmYNh8Um1wZhKFouUJ+p9swwoiFmMpYj3okd8YzR65zutMzdwkO
 Kxvuv+bCcj3UKITgm7uEszVCvNWrRTkFZLbk4xrMI6iuLwnQF1JJpJDdQnL/XzX2PSP0d
 mgjj/cUoeKHMYy7Bf3Cz6UI+6Zyi1rGsqZ+gjddlotqu5zsRhPnNgOy9xW4XkD1r0gg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Dr28hYS6; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB894401A2
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 09:56:57 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6351831so1617986f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789466215; x=1790071015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HNcV3K+jUGh8r2Rc+0HTXi70WcmJuh/T05n8eAdhpmE=;
 b=DxktO6lW7OFlriP3JgFbF7szW+DGGG74tUN6KhHTlYBdxYofpZB931SIX+byFeEvHe
 JeYJamRQdBcT4l/1zokvbtjPKkrCeQqJTFmoDXRlSYPWEzG7pyM/dqPh78jtoD2e9WcO
 M3apEBDikGclD9OzAV/HrpuM5FqQxfwBps3RkMYZahh6TQ/ZLDcqQlivrh/iQfXVcJ+t
 dDHlE7ppiwT35DWOjbsokYiaw+9fEsnZ4b4vsdq5L6DxfSwE5bqe0+/O+E5+Q6n/QuAF
 AK2ZHnuDjlncuz7bAgGQR1JxtGffqUPLJ9fCqt+CM/ZP3t5elmWr8bgmf+G5Z3dpGkFh
 hlTA==
X-Gm-Message-State: AFuF++kgYTnYvH9zjehCr3JlKhVj8mVZFdDd3yu/UmhGLc7ClfieHyxk
 3v+V55C/1RC8+s+itr4eVVNFJ02TL4MZbbKnkUjpfKBjfaFrVqOuRd2S1nKZMn0Hkzza9QEbTL7
 07ML8
X-Gm-Gg: AYBFou1xThDt08sYUcaYuBFozag3fxl9SBoQHAWyySy6X7H3V1K+svuvYyESGGbCmAe
 8GgvZLxGw410/uM+pO3noqyfmn9/VYlOhugPyxyAJOXdzjv6LkM80Rq7cx15EeohSvIzunr15fn
 NuSIMgohfjdSINDcxHhSP7BeFxBtatN//1p1yqTI9dTDSsIyrk24uFXAcYooUQ5CCNZ+GdbrGzc
 d8iAGI7RTJUXwR4m9o8oMGnQKBh5PBjmnq7H7JEthIeQFuaGkhT49TKBZ1AitiEE6yTfr+q9e5v
 OlXctHLK9+E0MNLY7axvDZpjldWh706ZJHVRc20CHcApNFZsJP6rRrJ1xAvJhOZ3/9l03YupPAu
 BcIlWCcc5GIpop17hjBc+l+0tZPxSP4NdK/cB7ueRwWFkW/oAymHIZuBRkDeLMrUgoHueBhDiN8
 5f1Kx6QHf7zN6gW2/c3P/BUfleM4TuP+fW1hxIP5MbwHLNDULVuYBFMBDYK67LYIL0
X-Received: by 2002:a05:6000:4024:b0:485:8a47:5b91 with SMTP id
 ffacd0b85a97d-48702b1fa63mr7676057f8f.46.1789466215077; 
 Tue, 15 Sep 2026 02:56:55 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecfc3sm31841411f8f.4.2026.09.15.02.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 02:56:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Tue, 15 Sep 2026 11:56:52 +0200
Message-ID: <20260915095653.279455-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915095653.279455-1-thomas.perale@mind.be>
References: <20260915095653.279455-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zabbix 7.2 is EOL since December 2025 [1]

For more info on the version bump, see:
 - https://www.zabbix.com/rn/rn7.2.14
 - https://www.zabbix.com/rn/rn7.2.15

This fixes the following vulnerabilties:

- CVE-2026-23920:
    Host and event action script input is validated with a regex (set by
    the administrator), but the validation runs in multiline mode. If ^
    and $ anchors are used in user input validation, an injected newline
    lets authenticated users bypass the check and inject shell commands.
    https://www.cve.org/CVERecord?id=CVE-2026-23920

- CVE-2026-23921:
    A low privilege Zabbix user with API access can exploit a blind SQL
    injection vulnerability in include/classes/api/CApiService.php to
    execute arbitrary SQL selects via the sortfield parameter. Although
    query results are not returned directly, an attacker can exfiltrate
    arbitrary database data through time-based techniques, potentially
    leading to session identifier disclosure and administrator account
    compromise.
    https://www.cve.org/CVERecord?id=CVE-2026-23921

[1] https://endoflife.date/zabbix

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zabbix/zabbix.hash | 4 ++--
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 787a0acfe9..f312dd4a49 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
-# Locally computed
-sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
+# https://cdn.zabbix.com/zabbix/sources/oldstable/7.2/zabbix-7.2.15.tar.gz.sha256
+sha256  b7013063b9c6256a185f6e6001eff7d43b831b183aa39133d6ee524d0570e85c  zabbix-7.2.15.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 50bdfed609..09673d43c9 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).15
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
