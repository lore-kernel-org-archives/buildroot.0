Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DBCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BC84064A;
	Sun, 11 Oct 2026 13:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH_-VHww700O; Sun, 11 Oct 2026 13:33:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB28A40566
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725635;
	b=tJ9LEBcQn4UNBQBBGQpH96OQye2r2ohDkyfCo2MlxeQeDtpPHUeDCArrdQ3diBIOWwkM
	 Nxyk+wJWmo98KcOibSDC2srjh4JwAmHQ5ykbgaDqFP+H60AGdWc3VDkOZLLTp1V+MLPfn
	 z4KLJiIi7HfHIQb83d+zmhDKP0JrgKQbpBqQnAIPTuxSN0dXs4xaNmDGjBMKAxw/hqMz+
	 CboMvolZjDtoVOjuIUxIoFMTtZcRHCH9IJLfniXCrIvsBAyuD30TG3c9w0Pppbt+S4Lp9
	 gC+wJKzTtavpkIO4hQt7noX11iX6E6zto3NPttxDvT5Rh76eyHN3DAkFT+PHz6slgSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZryleLSIpNlaIPY+NlwHXfx7Wfew9A60YdErzRgtLls=;
	b=Ui/G87PpTqtLoX5f5Var3OreTcbYf8cScrvA6A1dB1HWIjKhSjaUA4MuyFTJUzNBNk6j
	 R7d/so0ZrjaF1KX6dkef/JI1PJKvnIgTdJrWG/TT8q399FUzIRCXdQ0CEmNOb4/zCPjpq
	 glmPHgE2bfGTVWqBqrzuaoXVb9VXpSoeZgzHNYB8q+3BCdg5CUJ9VEZs0hYhH+lfeSN6y
	 L/bIoQh+uRASvbqOrsz9vA/zDJbP81G0IhsV4BKtKqR7qU3ht9S6XqKgUWt+TybbkNyM+
	 O2T5aYc4ar+OxHAjCgC+8444E2H0099pj30PmbgA5omr9wRfemiGYms/V1TNJYCANxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725634;
	bh=ZryleLSIpNlaIPY+NlwHXfx7Wfew9A60YdErzRgtLls=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=C5G7amQ+jcE/5KJ25v02N3zUtnSCv7q9PRt2n6ektryBcw6zTEWnv5paA2oSBH21q
	 HWqAHHMzvf3zqNtjK1dVTGy1JOxEoQ2vu+8wFCI+umQ2yecM5vpTSsr/SqJLw+NTZD
	 956GqBmToUTrR70L9Xa95OJoqZaGw5Vx6A1xjw91FqkE23yueniamSc7BEyzguKmw/
	 7rZRnUWUQxudiyAWU5VwEZjs4uTDkNgNaFMZWuf4Om/4R2CxI/CSH/twoiPWxosnVg
	 Dtpgzei8iw+lsuAxx3rDKfMVGgI1SrbQ/Jib3PAI2bD1mElNBHHRQkTrBZCaZT2Zn3
	 IpyyHQXvLBHjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB28A40566;
	Sun, 11 Oct 2026 13:33:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 969CE1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CACB605D7
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rf206q1v0eMp for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26069605D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725632;
 b=XU9/dG2rM3xNLPkazgz7XP5X2GTsSyshjGi4ZfEmWjz9MaThQnH/rylmoszvhSGyMNiJ
 fwfbIAoXSW2gsE60RI0JsdHe5j/1IVdykaEvOF+r8P5pPCGLulHdOxirHpzJPQobB8j3/
 mcsTt+YyUs28eAS7MD2iLikXCA+oseqUDHfbK6iHGNF+cu1hJSf1H2rvIzZqrPzKDEjOg
 mr6ogpoWaLmtG87qwHvCtbBY6M0VsoP1ZjBcIL5Cq6Lx4rDYAFECDQI1fxsH72hQztZ0h
 285WPmQf/WAh7vxJc2ByO/74P/786nTFCXCmIM4hcqc5BCy6mmOKHphxDtEjqEpq/Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725632;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=uC8BR42D6whBNC8if1oL6isPJG48PH1AX4OHA0RcMeE=;
 b=s8c5VatW0gjPTQV5UXJ8fDCATHymf2PrrkLy8P3tJ6K7IZKh5cOkzMyDrKJ94KzmijO+
 7IPepRfQ27dPscG+NTSSnxKisdJZnoLmevxtQWII5LlIKA1cv+fid0yH3KKUkkPwAOKF8
 5d46uBjx7S6vii/8F53nloZHTB8SrouAtXoWzpIy3wac6WpRqYB5SSzdyTaXB7Y9xagQb
 00RJUtstRvxE2p4urQBsifqb1/+mkd6zdHEDUgVrPbO+9xaJPTCg4GJXxKGkYJY/OF4q6
 PFeDQsyd64q9CjDRaFhq90FCH9tOfP2Rc+0kfmRE+GFVFF0HDhh4qDQeWjngqDdXkeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hd7BXK0x; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26069605D4
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:33:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so11196545e9.2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791725629; x=1792330429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uC8BR42D6whBNC8if1oL6isPJG48PH1AX4OHA0RcMeE=;
 b=IAiOEvLthxyYvW3o0bFDceOdssYSIsHAQWoNSNK6EdTc90R1lpr/+gNP0ekINlnFDS
 iekQjCkCFIGmoCMBaz5y0QT6EHqWNMS4dfXELLsgeA65vtpSAJoPogk3DSJOnRSGMWix
 OsAiPwuOvJLwy2mw9R9omoO/Oh2fiGDomQrp2YWj/PBh62754F7kqZOrrU8wyd+NiLjC
 RileALbmQ9dhzOXKtbr1wT8A/w1CcavHXhyTsVy6d9bG8orqmGY8JmF/fzwQcGF3uMZ6
 wPDpXrXSxdWaduOJWiUstIf3smqaJtqIQWuryrZqP13MnxgGvI4FLAeahFcgMiTSQT8z
 W/Ag==
X-Gm-Message-State: AFq9FYJct7V22/h/TeIvQafVElDMAnVdUgC5nM1Wdo4QuJ4hRz7AzClV
 fDUxZBWs7A0k5FpAqcW320rAZM3rL4jQE+O8lQN1HKzKqMTZ1y7fyuWvxdjm6eixMqtfNggA/f5
 ssf1JMVA=
X-Gm-Gg: AYBFou0G7by/LQUsK5HKExAkpDZOOffJFeMt07ggT3UFQAvSHCGWbUEE2iDkOcwuLnF
 3WrOLXhvIIK50AhdstpSifGKVmMF8+Z2+27LNvwVC0Ggm3LsBX5wyy8kA9Q/NPuH8GDRDYfRxWY
 sTdxB10P6F6OjiG6I7moItPQa/HCPzp4+j+UlGyTkobQhUSjfhgoqKBW5aYbSkFiXAHuCbk5plD
 7gROkCBGi0uAx8YBbt9uX+f8y1H981GJnVwDBRtN8ghnFmUHYgyT2DBS7D+mN73Se+a4Xmo3/mq
 P1YECewfj5ZoKopFZ64e+VXyWGAEns6rARzUd6Q4jVQd9J/+CdNgNwNvQzJE9sItYbLRIsb1mp5
 xl6dL92NjjOV0O4kAy0W7TtRYItg7H7P67KwdeRVHYdjn2uRjRXTjD6I/kBDySJn0eFLmmSLUg+
 RHcQjNMT/rUG2jLCTHaI0nX2O4WFfwIMZyoY/TJiuIR5a311Nndu4r0cE7JT1yi4JpCY/2kOqO1
 r0kUk+c2N9VU4ZxdKVft93F2uu1o6/kIFDL5rrx4hmxAHt+aeRAv9g/+meohmi2wy4=
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id
 5b1f17b1804b1-4a18e4c3600mr126267855e9.33.1791725629252; 
 Sun, 11 Oct 2026 06:33:49 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a19c71a1d7sm40576025e9.5.2026.10.11.06.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 06:33:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 15:33:48 +0200
Message-ID: <20261011133348.713816-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: adding myself in packages with
 LTS policies
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

To better track the version of a package before a Buildroot LTS release
is made I'm adding myself to DEVELOPERS file for those one so I receive
alerts for this subset of packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 01d98f8698..4324774a49 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3239,10 +3239,28 @@ F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
-F:	package/go/
-F:	utils/generate-cyclonedx
+F:	package/asterisk/
+F:	package/bind/
+F:	package/clamav/
+F:	package/containerd/
+F:	package/dpdk/
+F:	package/gnupg2/
+F:	package/haproxy/
+F:	package/libopenssl/
+F:	package/lxc/
+F:	package/mariadb/
+F:	package/mbedtls/
+F:	package/nodejs/
+F:	package/openjdk/
+F:	package/php/
+F:	package/python-django/
+F:	package/suricata/
+F:	package/subversion/
+F:	package/tor/
+F:	package/zabbix/
 F:	support/scripts/cve-check
 F:	support/scripts/cve.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
