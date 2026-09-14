Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACE7C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 12:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B9980D18;
	Mon, 14 Sep 2026 12:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQbKX8jR9HyU; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4A13180CD8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789390134;
	b=inwZcB3PSlVyiHCfHRosOORCw7jV9KuAmEEdose5+yjU2TQ3V+140t1ZKXRM9a0D2Gfm
	 gKtfXl78jL7bFGvpfGfLjIQXT6j58w1AZjg9xCww4m9BKO7uNZ0rGffdcQ6jKtOib4EZO
	 1sQTc9HCtQKhNPbu2fyr7JOhDa0mYIbY3rgo+5hobtTOGn18ZP1hKW/5a8C127UVmGI30
	 Xii6KgUGFxWvHqA4YiQ77uWsMahKhQDdxPReX3ChbbezyTQpbrn8tAnZvSqPsLSPOFlB4
	 JJ8u3KcYmZQnDYClzjx96S5EpupLkWq/wlnZZogeCCFf5rwGZH9DGNB59tP/BhsTTWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789390134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UunsYtEIwfU4DZ48dUrXM6S3eYJu9BMORy2csIUU/Dc=;
	b=SIHAXcgjXPZ7c7WAJEaK1e03QWy6prteGIcTw5dehtHx/pA0PKcaB07/Mvr0F+XH6m/0
	 8AexJRLccyU2epu+vzUP/2auC36z7GIBJFa3Vaa/cW1wqwTrgZII+6mIgBmmkXwbku4Lr
	 dlGM2hnvfl2nxCxpPFIVhpt04uOPG/5wc+qrTguV37pnxZeYqtWhGoEbL3tehv9oueeTC
	 7somequeU1Jkwu1j4wnfhOGoPl7HXmevqRHO4BX/kJBphgdArZn9mUeTeKJxtveAJ5rwB
	 gQ14cJrpiZMrER/tXg2gICm6SYccxt1bVXPmtfkE91YMtlSq2DZGoN/32ioxUAi49eg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789390134;
	bh=UunsYtEIwfU4DZ48dUrXM6S3eYJu9BMORy2csIUU/Dc=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OW7VnidWYleg5DQms9EuTWqqRjRPDcHD9GpR6iBlXJAY4AMEOXDk5jZvJe4C02xg1
	 Rr0GOuGLiAhEoHIqoJfNYjmhMpMGhtb2BSxyIipPsdJOFlIU59UVKBk20BwhL07m14
	 zpRwK1Birn2DjC3y0N1GLFaPdWj7vIvuCzFFxu+wtDdv8tLT2Mnad51yilIB2TDn+q
	 5oil6fizgSZyORMbuy+RALJunzswyW3TC0+YerUKkbycRdHk+QHVqTFuhXALJqQbmx
	 TtTslco0U8IC4iA6yDoMcGZAlYoeR9uKqHnkWfejEaHQU/OdzKHSudaXn7jFskrY9R
	 5b34D28BJtanQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A13180CD8;
	Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C008493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394B0606C1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYzxJ9eDEyoy for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 12:48:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EFC6B606BA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=80.12.126.239
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789390132;
 b=KPW39UHCHGwa4VkPxIqnwXl5wpefN8k0wE2aQnNvncGRbsbOgC5QdH5P6831SYw10fXY
 aziQcra/SEOLoPsgalUHtiXWskvryTEMdfLAP/qg/6gwT4EipfwcDJqLupDhqoS1ZH/Pm
 Bu+9xtqwqCMTA/gRcxpnve+NkosIst+yEoxib/6+DBsZ7cipVnJWIPZVbK8GYB3eGb0bC
 UMA3Ky0brSnRcas1G/R8LH1kf89x4yQZ2qk0mL59bF0wcgVdwVzHYcgGASPPiFjZ7LsUn
 QKCwz2Wovk+jU3b9lB/lhcI8K3OA/D9o7c19t6xggubW7lRYbrVYLLVbljQAH0aLHmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789390132;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=rsfuHxYeTvj05IuBMdL9a2XCkQZbsMMTAmExibZwkZc=;
 b=kZ3PPNIuikcEA19CnMbTeOBkDa8e3jdv3cnj8xh+MRk8buow86ker25ZXIXwvscne7Fj
 s9JD4KvKWQyGyEfcM/9MQ3l2y5kYAMKME/Gw/PHkptoLcPDED6Oof7LyMu+BBEN+I5EfY
 1Wetx1/E/Lcz+xCfNVU+yKlRVSdcahUEsQZyzMySjzRKPPcjFqPXmhde8x0l2oe7AUxWk
 x8TOGlDDeN5T61MvHCe8yEBd7UOq/Y35Ys1zxcVlKKUXjHVtGs52mO2S8YoGpBK+8Iq/M
 rNpLdbCCZp5u2mJpDoaNFgR5VNHTwjwrcFYOHGnLLvJs53kJmnuT5Tevh7s7rjGUqRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=TG9DnczU; 
 arc=none smtp.remote-ip=80.12.126.239
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=TG9DnczU
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFC6B606BA
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789390132; x=1820926132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsfuHxYeTvj05IuBMdL9a2XCkQZbsMMTAmExibZwkZc=;
 b=TG9DnczUz9vizyCKZH0sXDJ9yX9CVfFtnJNM0932OktRVoRRohKv96RV
 1TjYSNDSjL3ubWPHAkRpqA0A+CUjYRoAZKxFkfntFddjhV4O8JfTIbtAu
 FubngLJTPRMbQue/jqNIM/Ma7zyUDpeVMyeqONXAIsuGgSj/r6f9ipT+f
 oD7FMgww9NM5uZyow7KvxY/tyno2og9RCb9ShGkolMTDc2ErgFShOvpBS
 Q3tClgoWIzZAXkgkIwkbNZmhoUMPlaZvOuLQWvmpHW1x2Hjp2A8/dsdgc
 6TKRAvjEFb8f1r8CCzfSWooVN462vt+1056A/wW/izHtalZ+Fo5gBrdbn w==;
X-CSE-ConnectionGUID: 5dTtDblRT6GDjqw9+DoLIw==
X-CSE-MsgGUID: BQQx1JwQSRKrLDEj5i1Hag==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Sep 2026 14:48:48 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 14:48:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46;
 Mon, 14 Sep 2026 14:48:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 14 Sep 2026 14:48:46 +0200
X-CSE-ConnectionGUID: aUyhfZoOQDSW3h+FirSzmQ==
X-CSE-MsgGUID: DeA3KNADSSOEbBAV4pUyOA==
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; d="scan'208";a="467437494"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Vincent Fazio <vfazio@xes-inc.com>
Date: Mon, 14 Sep 2026 14:48:45 +0200
Message-ID: <264230bfb81c6a0018874cbc0f045280f695c3d4.1789390115.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789390115.git.yann.morin@orange.com>
References: <cover.1789390115.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/2 v2] support/scripts/size-stats: prepare for
 more .py associated files
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/scripts/size-stats | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 79c0dc571e..fdcaeaa546 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -54,9 +54,8 @@ class Config:
 # pkg: package to which the file belongs
 #
 def add_file(filesdict, relpath, abspath, pkg):
-    if relpath.endswith(".py"):
-        # also check for compiled .pyc file
-        add_file(filesdict, relpath + "c", abspath + "c", pkg)
+    for relpath2, abspath2 in get_associated_files(relpath, abspath):
+        add_file(filesdict, relpath2, abspath2, pkg)
     if not os.path.exists(abspath):
         return
     if os.path.islink(abspath):
@@ -65,6 +64,22 @@ def add_file(filesdict, relpath, abspath, pkg):
     filesdict[relpath] = (pkg, sz)
 
 
+#
+# Returns an iterator over the files associated with the given one
+# as a 2-tuple of (relpath, abspath).
+#
+# Supported files:
+#  *.py => yields the list of corresponding pre-compiled .pyc files
+#
+# relpath: relative path of the file
+# fullpath: absolute path to the file
+#
+def get_associated_files(relpath, abspath):
+    # also check for compiled .pyc file
+    if relpath.endswith(".py"):
+        yield (relpath + "c", abspath + "c")
+
+
 #
 # This function returns a dict where each key is the path of a file in
 # the root filesystem, and the value is a tuple containing two
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
