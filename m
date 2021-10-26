Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7CFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FB660295
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7FB660295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74542400BE;
	Tue, 26 Oct 2021 16:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtsxxOEW0nOg; Tue, 26 Oct 2021 16:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7E640176;
	Tue, 26 Oct 2021 16:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 869691BF4D5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 830726068B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG8SlJGJhBsR for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A7CD60628
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:47:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v17so19104647wrv.9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2fnSwK509aWx5Xp8ZmNLkVQQjEmk5wLe+a3dtipk34=;
 b=S7Z6sPI6z4EcT+xEVADI3MmA9ZqO1ylMB4Rm8qBCqznJyZtZOfCmbfWD5i40lO0mtK
 I2zGZSLGReeY0ZeQHrMoKEr1qcJyTWhNCsxTnGdzixni/zJm0gBRVgzttWpDorBg82kY
 GfJLsCDT3pLi0iUiNoQg2Wq6vflGpDR19huWk+5JucWP8SN0Cus6svk5qxbYl3ZkPNhS
 OkWQpOZ1nOdXUdin6t1MXvWmnlK3eVrplQJevdsrLeYw3Xi91pU+DqBYsUAxu04PlueP
 tON/1HMz+EGOcYzh60K6xZr866QG9JHFs4hR8D6a+WZJi0EAwuwVACet/JfJQlX1qxdZ
 SS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2fnSwK509aWx5Xp8ZmNLkVQQjEmk5wLe+a3dtipk34=;
 b=mZpvqNt/l9oT++hq0VxtL8rSxG0e2mIDWwecpItWuKJoPAQnO+6fA9y+tyeborzkl/
 a1V6lQ8ZrsMd5mHRP+Ra5JhmlJOu/xpkpQPDmgTrlc0YCyslEa24MxxfsF0mKllASSaE
 5lWrs5+snqXlNunOFOWyPX4SIU10HMxeXvtFm/U2J1AiEh7kbk6vmPllDgghOxWpkbui
 +x1PVt6zF+77AW1MVUMsbrjAw84o7Zlj2hSVS+SNz2PW0paz96srJ+cTe2rqUG/k0i/J
 VaQhDNEU1b4DW8ZKEFjZgOa9+PKqC7pq+uVXBLrPoV/+8SkU2ccDTMMXFSzwkqrAOCQK
 23RQ==
X-Gm-Message-State: AOAM533L2JnPDalMcriRD7S5N9qofrcs3zaRXFScZ1IKcBohMiYlczzZ
 9pcvFveTRVXdOqf5tFuTmuSfPYmkqfE=
X-Google-Smtp-Source: ABdhPJz/yH4mbIacrJ6ILHQPKZNL3KtRS67r0YCaIizwY/dM/iH3GDju5cYU2LaA9JR9rJIlHuWINw==
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr34174173wrv.225.1635266827645; 
 Tue, 26 Oct 2021 09:47:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r11sm7805957wrt.42.2021.10.26.09.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:47:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:45:34 +0200
Message-Id: <20211026164534.4014337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: fix build on musl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on musl raised since bump to version
1.4.60 in commit d62b7f54f00291a50274409fb5510527fd725ffe:

In file included from buffer.h:404,
                 from array.h:5,
                 from array.c:3:
ck.h:24:14: error: expected ';' before 'typedef'
   24 | __BEGIN_DECLS
      |              ^
      |              ;
......
   29 | typedef size_t rsize_t;
      | ~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0d56a44449e89773499051b35f21ec83bfab4ca6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-__BEGIN_DECLS-__END_DECLS-if-needed.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch

diff --git a/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch b/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
new file mode 100644
index 0000000000..cd64f18794
--- /dev/null
+++ b/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
@@ -0,0 +1,39 @@
+From cf4dfbe15ef8ead3a7eda974af7d804d447f00db Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Mon, 4 Oct 2021 09:51:22 -0400
+Subject: [PATCH] [core] define __BEGIN_DECLS, __END_DECLS if needed
+
+[Retrieved from:
+https://github.com/lighttpd/lighttpd1.4/commit/cf4dfbe15ef8ead3a7eda974af7d804d447f00db]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/first.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/first.h b/src/first.h
+index df747ba46..9d0428ae6 100644
+--- a/src/first.h
++++ b/src/first.h
+@@ -39,6 +39,22 @@
+ #include <sys/types.h>
+ #include <stddef.h>
+ 
++#ifndef __BEGIN_DECLS
++#ifdef __cplusplus
++#define __BEGIN_DECLS extern "C" {
++#else
++#define __BEGIN_DECLS
++#endif
++#endif
++
++#ifndef __END_DECLS
++#ifdef __cplusplus
++#define __END_DECLS }
++#else
++#define __END_DECLS
++#endif
++#endif
++
+ #if defined HAVE_STDINT_H
+ # include <stdint.h>
+ #elif defined HAVE_INTTYPES_H
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
