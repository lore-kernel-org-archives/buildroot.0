Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB715CC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC139608ED;
	Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pEcvRKl1lOS; Tue, 13 Oct 2026 23:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E01D0608DF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934194;
	b=iqzHPJuIIQBWx8P+9c66v1dYqt573/o+rSySCronyeOK0lTwc/MHfSfkn/0BuI9MCo+U
	 OjroyzhsJRtDyJvQPH0ZasorohZ35mFMf117u/U32lX8kaqBIQEheiQvC8qeLmmjz57rX
	 ZK0Rr9/ocUf+Vmnys9Ui2yel1or3YY/raPvIG2J1OicS5k+k6imn6aHfefBjFdGnOSMo2
	 t5Kyvjl/9QtwKC2pirvFfh8nWYCnpsoN7I5x0yJetzSaDi0CSCSJ1USy5WymlGvdeC9Ek
	 ah5pn9n7m9YaiPss1q+3G8zd8YY7zksIhzFAPu95ZfXhleO442Z5Yyby8sb3FN9pqjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	b=YtPl50jfbwqqkj7rXFvV+xNN6L86Dh99OWO5+6eV2AWP4Pb9SWB/mYmuy2aepkGNWcCR
	 YXukUXHSsEC40F0LpZPr51ytIJJcRgQ/ux25pEWqtfRpAV/6/SLsZzi1kFWYzJmF14kgH
	 l/ujXhaJ4fD4ZhfqNAPcpRX2IEs4MKDngekWotdVV88wFO8yyytI+Y5Rli5dQ90aMv0kZ
	 cOjjUkyTinrBCzhKSRaXCGR6kjnzpDJgtjVVFpu+crNNiR0MHteG4Pr2/Bo4E3wsVuNC5
	 9kJihcVHdwUBtGhB6ThEbEQuzhAH9DPfOFPt26rhQR2Lc8mi4dZHftvbg7TJIMHZ2Jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934194;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GMU4Ftl09O6cDWmaTrhzvGdK2/OtTAaDN/UmLdycLnLcmi6IWLU38Wfajsn2WGKbe
	 p+BnQtBGjtpc2cVfE6VaxcGOZA3Dp8Qv5UeBarMozphrxiQ0To1f4i80cKalNSNRfL
	 CswdbEBPHro5VBIlIAhvdqK6w1P83NOcfv1kT1sTigzU7qnSuFMcQ7IvBazpxiamSq
	 XYkbIFDmqJn9u1G/x5GuwqF5BiCAkj+PxjicgWoSm0XCs+B+1vEievaNr44A+lZIbH
	 Zxbz8rlEzccYs0BbUnT5BAsJ/+ODubtSiHgeR4vKDH+e7tFCybUKg1Qq7R2uEwfDrl
	 f8Y21LQZ7PCiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E01D0608DF;
	Tue, 13 Oct 2026 23:29:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B83BB75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5584070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ8qIBBclzT5 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE2A2406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934191;
 b=hrElTCIof0k/FTt68wynqEi/iJ/UABKdervdjvE01alFanCxvyhNdg+3v8J2FOp8/b/D
 lK3wtXcQ1IbfQazNETwsYCxDPgeIDH8vFhYYtx91pCLnaspc3F1rOOL9Rbs/EbOG/7b49
 G7HxcP4sUC418X7JGCbJbNtH/E8kQ1VEwtqQWknsbYC7DSk69DIn+zG+E0v1E/i+iptSN
 m0AqX+gtpMQ1WTYcfPSOPaaGFMy/xTd5qrW2g3dQXkdThDWOMCU7PZbExH/FPu5v6DEDq
 IEr979N8vWsMLl+K0Tn/TfuISbVyN1Q62NcNd+wcDozTFgMmUa0ymbiOXmqFuwyuNvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934191;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=rofgpAs41W6MB7IuHu89+U/mOUq4ajkwAwFL6pINx/Yjd/Vm1U8wD7T/yIoaKlyXw09Z
 9puEP+KJR5t30fg+pHAEgFEt0Dej6ZzAT9tz5gQzOxVJqHmJy7MZ/ob9XryZ8lp81ZrwJ
 au5WnCqnZ71zPDLtUR4ddZ0lBerJL5W1zGebLOl9aLjnBs7VPyxP+ZwEIZfFYgAHo9wyP
 vqoP4854Eco+H2l2eEHfM8WQk/P7Ixgg7CMkIAOyAqFY8uAFoCPWkV/MQYEFNo5BFJd5D
 6zsK4NLl/yl7943OUJYFRmYtwYIUTtqVy4oocUsiyYdwCcGGefpT2G35ONB/J9Vqb1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mpbbn4pS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mpbbn4pS
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE2A2406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:50 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-8256106635eso1778260a34.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934189; x=1792538989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=mpbbn4pS4MQ4GyUdn8XLbXQFmSKbNoYpbgq/3YKj2CXoTn78LJoRRun6GxFz+OWpfM
 YZ0d/XjO8kr9GXLE8WxYFIdt9kQn/Sb3vHazMoVeh1G3q2bauOdEV0fSJh3BG8dWrGXP
 wp+5Kyp9CGfoLUOr9omujPwOm/DrMb8wc5O+84YnPY5IZJPx2msFt9Pj+TbY091DPazV
 GU67OjLdHNCl0nRYNheSwSg2ubJ2RvuO8mx/OcAfxVKVmC/2GVtnksax2r5qYb3wNZdW
 mIXfIY15xnIfccnS5+EQWUw5Z3SASSrzAOq0Sd0ESNlu5Jz97gOvEy6SQ6S+HSk/vO3T
 H/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934189; x=1792538989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=nknww7tbw0q+gfPyZ7MFiZjBTbnuwDIjgP+4O/4uK3b08ECKD6rz+5dQEnc6AsFXcK
 XUvRtxJA4mIhCy43Kuyp1UfyUWl0950GYAecKHUwzZgw5YH5zPX56TBAQn3vSbwdu9QY
 eMAfZWe/nZwWQCoQzSUtWz3S/xWZa/DBFJ0f5Djyvaxugmw7a6sQs8HbXtcw+H2Kse2E
 rftjvzhrd8sNsHJjYCtlFFJTiIDtHiJd05ns5jimoz/4KEdXDmYz7PnxtexPeRvfsQx2
 1FwC3ftGZf+ab1Rab7gmsYqbRKfz3CVSyYbOT6b4Pnh4O1YyDhoGwhEE1eYZLIP35S9P
 PPQw==
X-Gm-Message-State: AFq9FYJRd+uZORfefv9WVcvGOCLJQvnwhzN0K+H+PMCQOInqWOIeMGey
 /QrTzeLnXsawwwnJacNR2T66rXCL6YINr6ohQgaPky1L8+3+DYJJMacQ2cRF4qBJ
X-Gm-Gg: AYBFou2lKtciwa6fnGYrwcdVcByxnYIjPj6tWA8t7uGXTy5hMWXMQi8a276qQSoH7Ku
 m4Oo6zyEGFivVqhTQaePVHm4mJv7DDRzrkMMYPuE1MLTHKln7sABNB9x2h+E1hd+kAkB7Xx6iJz
 sX+bl95D8x5ZqSuS1r5gaUnR9rDXAKcc08lVa8SY2uhs1Vy47f1rS89HEtyE7Ximl+x7n8JUA7b
 metvnJSwX0FBNcQD+7+f4tDuOY25Y/8VYcRgEyNpSNYyz2oCiK8dnsiV+2waDqCapomr5v3m1P2
 Se2NepnI1xCScYXFLIIosYQTS7pf/V++4leX+AdjNyoE8wY3sFPOmTWSKUnv6PLQx3hcJy5Y6Z4
 wi0U028qIsNYRPLMRUp3VAjn2yRpNyXt3uJdqduyvEf9Ss9CZS7tqLRZ5OUR10zBrlAFJKTF1sE
 2Vk4wuehFQYtEQkP1LL/APF4XqnVTcKhswyZUhtdtcm1aQyCZlhw3fvUYxl3EQoXUonw4I233um
 ekUViEhTbGCRcFDpp36V7epwzdHQlXWkY0Lzrt2eyF4Ps1X2h0XlM/HHAAoyQ6IdH9e93cmtfNU
 CMdzqynXxZtf4td/3HWtQ5l7EN8FZ/2W5lZjP7iTpbjDZ8Ugu4Kg5HfTyfNjqhFdVPP1QJdAVBV
 5Y4Wt8LXHEG9xQPcV4Uu8R83oY0/tRiSa0ThMM/RkQ7ut
X-Received: by 2002:a05:6820:4cc2:b0:6dd:61da:7cbd with SMTP id
 006d021491bc7-6ef0ead98d1mr10557548eaf.48.1791934189656; 
 Tue, 13 Oct 2026 16:29:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:35 -0600
Message-ID: <20261013232940.2690456-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/9] package/python-jaraco-context: add host
 variant
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-text and carry over its
build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index f812cec8f1..dff0d21910 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -13,5 +13,9 @@ PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
