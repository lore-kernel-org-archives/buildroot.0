Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF16C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C32E40A04;
	Tue, 23 Aug 2022 21:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C32E40A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42W6FgB173Dq; Tue, 23 Aug 2022 21:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E23B409DD;
	Tue, 23 Aug 2022 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E23B409DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48DF61BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3127280E48
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3127280E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OI8P1hBKYkdF for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:23:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C48BC80E3B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C48BC80E3B
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:23:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b5so14186500wrr.5
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 14:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Cna7GxHlFp2QTtAIcL48OvACD0o7dxphFpiaagtG1ag=;
 b=vl8ocEmpAvCWV2eEaO0mPh0HZE1zL2Z2VXLQiraIA/C3AkGoNf4+GsxALB62H1hGUp
 DiYu1T+B4WWg8YI95BbjU9Ywo8NoJrrEXhNb11kujRhtIMgO+2I0yADlvNPN8urIzSiw
 L5tMYNUWqX6gsVkjxMdfK7UI7PJ1MKcTwHbXQrnKH8BOsygRPdkzoziaGhtIhGXXeXTR
 St/cygav9a9hhv1Tx3ysy0h44i63a6Y8Lokco1jqmsYFXT8JxKlAPFTPPYX5+zmK68TX
 RU/GrQAWQ8y/msaI8trhiorfHOiKC+UL4HPlrXt7gJlxmdzY1WpO4PqdPsBeEDFXXfRv
 +w5w==
X-Gm-Message-State: ACgBeo060caGoojgtJW8vdNGQygGESub1g0uhJWCeQPd22UaDRFKvgy9
 hW0I8MCRzvUjENc1+6gmBiiSkdyJzug=
X-Google-Smtp-Source: AA6agR7adwxkt8eFkEn/S8smcIg+VU5hFX6rJ/trEfQrWRd+9IVYnRYEDbayTbEhArnmdWWilP8nwg==
X-Received: by 2002:a05:6000:381:b0:221:7542:61bb with SMTP id
 u1-20020a056000038100b00221754261bbmr14353567wrf.305.1661289830637; 
 Tue, 23 Aug 2022 14:23:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o14-20020adfcf0e000000b0021f1ec8776fsm15446352wrj.61.2022.08.23.14.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:23:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:23:46 +0200
Message-Id: <20220823212346.7415-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Cna7GxHlFp2QTtAIcL48OvACD0o7dxphFpiaagtG1ag=;
 b=LqchAkkQo3VmUXWh/0LLbUswWRs3fJb/BxM9gCsWRP3TBzp7KEiCb4GPhc24TwzDB4
 e+ZC/f2nZxS6ya042JKLxkbeNwaJZA4VejZK5hkDCslqRsU7ybsvH4Rx0K4ohpmPZGgE
 20HNyGTTUnE6JG9GYXslPPRlde2QRCV12wzfVovlNBreZVB1AhrwJc5ho1qBbOQMJsIb
 /Zqy8A1iYFQ9LJCZjY3hRXiQsAMYlpmoEu93M+NC+Fk4com2RINol1y3kyx6fG2KU7x9
 e5HmjCtMKmlXXrufFqDemR9+zXFalPr5Ho30j6zqGIM/2izhZdSOYeS4gMomBGGXXvKi
 DgVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LqchAkkQ
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add aufs-util handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a custom case to make sure that a random configuration with an empty
version for aufs-util doesn't fail.

Fixes:
 - http://autobuild.buildroot.org/results/e242cf66a02983bcf6e95b37f8e458bd18aee683

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4c00d67691..6e144a792a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -296,6 +296,9 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
+    if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
+       'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
        'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
