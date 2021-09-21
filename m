Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF87C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC4961178
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFC4961178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 983C440248;
	Tue, 21 Sep 2021 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27tBkYnkjDcT; Tue, 21 Sep 2021 20:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8942400E9;
	Tue, 21 Sep 2021 20:22:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECDA81BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4909F82DDE
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ny4q26VBjza7 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A32A82D75
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255700;
 bh=+YTjyGXnYJ3G3Alt8s4ThMX4ZQoCX9VINMg8g+roBws=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iZUoqy4DblOdmG26PeWXQc7LKy7XGBrT72V8Z/sObeKDmh13cgY9JbbvH6T7rOqud
 0EejknMM44MsckmNLGhyT5UPqIvuD1Kw7uhmJtO4HvTrMfzwxO3nxYcWxdQn4hamVz
 MaKedP+irwJ0PR98FxH5w53g+B+9ekIwdULLTsLM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYNJq-1mNqJF33Z4-00VP4p; Tue, 21 Sep 2021 22:21:39 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:36 +0200
Message-Id: <20210921202137.7092-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uDNqqyOXgjuhUPEF3XjsxhP2fFHMRLAS1gGzXYTpcBKAxyiOL61
 NhD2nN4d4jMni18D2o3thWWUPE52bOmxYEPWvvAlC8ZPpknZqy33sIMcQjIACFyVT+YMtpl
 KK8UsnOorXmqw8B24M1kQaZlZ00l+qXghAG22y9FsYZwNR6CyvK3j5TFYaM+ZMo3e8rIzmX
 lSJjIsHmjunJmNSVn/zlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xHQTq66yAvw=:vtSRf9ZYHZEEBRj+HqV977
 cvYtfjOXy3pfuST22gXBO0hmhYoVg4zacen1BLxTHo7CLFXG+RXN9c5427pEJwb5rX0ZhbcNh
 mmBIVMVRI8BQn1tatrfTDJtuDA5H33wZPHmkFACzQXwcvTndQ4ggm2afWmSr500eQwKA9rT43
 4f3H0WNcYQFEF08a7fvXhl4aBAYAtY7pBeCqDfWszMUD7cennFBVrAURcoGhxL9S9oKPf0Hm5
 ui/qDBcfaggnjQgLmhv54MpyCMp85o7TJHhK33lRxRrVpaxXBIECCOhiPCiAOPkG+nrABzTu1
 OXGGATfkFL/fSYosdihTmJlq3KO+DGYCkfS7a6Vul9HaZRVYwaLMyxBdixIZ2nnpSQe/ytSks
 WQERzFfk30mkZNZVwUdkSI5T4ZwmaJloPHB84HI6O1jnaWaSudcU2/QyvmbT9YLwQjxBvz+AT
 3styKzDCHYYE3tg6DZXQ8dG7Loj6jpvzG6Jluc6L+bCd9uQ10cWXO5NxBMjfTb1X0hy8rQlzI
 PyTjuQGL5NhmnGQEtakk/wzHlxBLnAFFr9sqgxITR9ubN/W/DEDTOctBpxVIkjse96LYcvYGc
 KflE/D9gj/qICkQcbVbmXM509AD80AC7R3MDrBxtEmq66je+8UcFXQYXiEQNJTcxBZf1oek1T
 NQCmKXfJs6wc7+pNHOTGgp99t3TCK+R+RO8g5h5U05LTkZpJ21N62i0pekyR8I9kEfvtCQ2fv
 B8+0LpJMf7n6PmRq7gNbc6sScc5ZcoJwvt+bNMuJ1/Z8Y7gDS5smd/khuiXe6UPZkZedRAAo5
 Zgi9JnloTkKb8IntF9fFiVjf7HySxnNDjIrIbBaLTsCjKpozRvWf2teeujcJRr5Q82y7wJJqu
 IAxi2aZZASNadSHlQUaxC4H850LkkSnRcI9ln74WB8sGKbgdbac34p8SLbcMRxFAQIqYFyUYO
 KzQsJCLYwcsIf3j7npS20T8WXw8i63RA8i2366LZK7AyaPxwnLCOkIyQ0mKtEiqdRfodG1z5r
 MaO/5ej3lVUGVoV2+2r3FgXv+OaxjtO0c8Nn/IuzjV12UEnXux/kP3GO3O+vII4XS8QfSG5Dh
 fTFtkJsr3+rAN8=
Subject: [Buildroot] [PATCH v5 5/6] package/rpi-firmware: convert dtb
 overlay install loop to make-level foreach loop
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch

Changes v3 -> v4:
  - no changes

Changes v4 -> v5:
  - rebased
---
 package/rpi-firmware/rpi-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f9568ba50f..13ca3c23a2 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -43,9 +43,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
-	for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
-		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
-	done
+	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
+		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
+	)
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
