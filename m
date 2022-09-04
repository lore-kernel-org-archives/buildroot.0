Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF0C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC7C813EC;
	Sun,  4 Sep 2022 19:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC7C813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upERJLRS4Zex; Sun,  4 Sep 2022 19:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A585813AA;
	Sun,  4 Sep 2022 19:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A585813AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7AEF1BF574
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABA034024B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA034024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQvfDU7zWEWj for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEAD1401A3
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEAD1401A3
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:02:22 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id q9so6347764pgq.6
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QhuWePsLKTXjtdsAvNzxSumygAzaP8ThQRTN8n6ONYE=;
 b=o3hfzyTa+d3Z7q0lEk4TWj9a2y6IKsvXxC1pVcOGfTtSDEBEHofiaHwtOJOCCOJBrN
 DCeMcnndwopJzStloQSo97ECrEqteYd3Jz60gEeI3h0izIEKd/PufK/bQZFPVkl6NjIo
 Yz02EXkvNqV/6zBy+TmMD4yauJx7Z+yCBANM5K+8KnomAwwaxW0TRHVxwU7bxb3pmoue
 qz00iglog/EnNgPo1Ncf/q+Cv/kU4YVLhpa9sj3EDI6JVkrO85GtmfrdEvuEqZ4QPybm
 Sj2TpLHDEmr31LNkJlRq8lr/NsqQAkn641RtXD4ctIfXxFS2+P+Ob+p9y5a4C6SiGY4z
 yc/g==
X-Gm-Message-State: ACgBeo2cYtE47rnc4Y2RJsJdhNMk7HmFZUQqkw1y4Tu/AHux18U3/f8k
 o8Bi0uuPPZKoWM5RwmngRTlDXTUY4ZjYmQ==
X-Google-Smtp-Source: AA6agR5qFhTa0LGOcX13LjsCUVQMoCBoHC7B8MzFAEmY6SquCqIyaCs+SCFCCou2Ct1qV9OXl8oF1A==
X-Received: by 2002:a65:6d19:0:b0:42a:37d7:90da with SMTP id
 bf25-20020a656d19000000b0042a37d790damr38918794pgb.16.1662318141816; 
 Sun, 04 Sep 2022 12:02:21 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x19-20020aa78f13000000b00537b11ccfafsm5970989pfr.127.2022.09.04.12.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 12:02:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 12:02:17 -0700
Message-Id: <20220904190218.198854-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/2] package/libyaml: add host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a Config.in.host to enable the host-libyaml package.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host         | 1 +
 package/libyaml/Config.in.host | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/libyaml/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 99edeafece..66b64fd7c6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -47,6 +47,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
+	source "package/libyaml/Config.in.host"
 	source "package/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
diff --git a/package/libyaml/Config.in.host b/package/libyaml/Config.in.host
new file mode 100644
index 0000000000..fd47362a91
--- /dev/null
+++ b/package/libyaml/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_LIBYAML
+	bool "host libyaml"
+	help
+	  LibYAML is a YAML 1.1 parser and emitter written in C.
+	  Host package.
+
+	  http://pyyaml.org/wiki/LibYAML
\ No newline at end of file
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
