Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE6BC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D8960A64;
	Tue, 22 Nov 2022 14:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D8960A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDrQLbvyjhrZ; Tue, 22 Nov 2022 14:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586336079E;
	Tue, 22 Nov 2022 14:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 586336079E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C52F1BF475
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37FD58175E
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 14:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FD58175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6L2kTqHA6bsE for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 14:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEFCA81EFD
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEFCA81EFD
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 14:50:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n21so36281000ejb.9
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 06:50:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZ/FR9Nt+G2LVIz+dnDHTQeC0Yl6PdijmDCc0h2O7Wk=;
 b=BT9m7M1EtmAzzBmRlipS3PPPxsqLsEejO0C+169793nwMg9JMbbR8r/cczMMaMR10J
 EOKMc760qGInJGhQOugLPKJpZxE9uBDM18haHJmrssZotpj4XeWL6YcebbOrgAlhX5TM
 PVV1z90YTKqqOvK29OS0fhB6iydJmRreS25yovG1+ZDQJcDFWKkp4ZS7QMNkRF6S0n0I
 3SstnsSB8hqLWpN9sGAvLHtzFNp9/HAE8DdPRm1jq3rQnTXn1I83jrorjiTQ77ETssMm
 akmC3mqVJ9d+8OEc1LpbTROXfnmDrQsghRR/ryH/me19/171Lnfbt4kqRfyuH0gbQyRN
 apDQ==
X-Gm-Message-State: ANoB5pnzbxLK+mAtyv4dczhvVs8AbOEzxFCDiyv6iOYmruEI6P3SWC29
 QMExPzbbyPNWXAmVsOBeuZyIdNZfhMM=
X-Google-Smtp-Source: AA0mqf4mxWsErN+tbkWC3RnEBHuT/BjM0l6TIvlpiocpmL6zGxqf9DPu7xa6xZSkl8qDx4jlmOC7Dw==
X-Received: by 2002:a17:906:3ad8:b0:7a8:dddc:7ec6 with SMTP id
 z24-20020a1709063ad800b007a8dddc7ec6mr19844202ejd.734.1669128624416; 
 Tue, 22 Nov 2022 06:50:24 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 q7-20020a170906b28700b0073de0506745sm6081361ejz.197.2022.11.22.06.50.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Nov 2022 06:50:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 15:50:17 +0100
Message-Id: <20221122145017.6250-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZ/FR9Nt+G2LVIz+dnDHTQeC0Yl6PdijmDCc0h2O7Wk=;
 b=pM65U7EIUqvxcxu7tMRbax6patnYhlp96IKOa/4oN0TwwRwp2Z9SN9QzzJA+lHFJPk
 mDlKi7KeUuYqij1cASfVAOj6b6Xk8A3YHVmLlLyDHefUWrvjHQgJaYlDlz8kRD9sELTp
 Uf/jbCI5ukoeHkOwBtFcS/fOBcWFrBR7hCZGKpwAt+f875fZIH4ap6pIHIspg+SD5arJ
 N9lyWIoJC+PuOms44YQMQqPObrKgDIjQDY7qgcq2M0AQXu3cJhViSgYzTiqPdbtBYR5P
 14x0ICYSBx5Blxgl5TCTFNV+ZWRjwx6x5e/n274IP7+PAyFefaklaSNOB7bYOaYTZd1i
 JICA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pM65U7EI
Subject: [Buildroot] [PATCH] utils/scanpypi: add LICENCE.TXT to the list of
 the license files
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 452b4a3fc3..3c98bb4bcc 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -487,7 +487,7 @@ class BuildrootPackage():
         lines = []
 
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
-                     'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
+                     'LICENCE.TXT', 'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
         self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
         lines.append(self.__get_license_names(self.license_files))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
