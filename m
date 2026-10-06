Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F235CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 05:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 073BD605E1;
	Tue,  6 Oct 2026 05:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbpNsNhRmNKn; Tue,  6 Oct 2026 05:55:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5E62605E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791266155;
	b=J/PU511Edx42TEkWF8ZaA+f4qnQBecEYpiQn14hRUG+v4CeEdz0gQHrh++VVoAOTirjw
	 i+p31kchiFOMpoHFBLW0Yvn+BvJNS4C2dEQDRpPV7ShjaixXMlQogRE2t/NhDnEtIa8Im
	 Hf5enfZliJJfnjZZA/Iv6rIMmjSgbHhmOnzfJsYs+6HgM5AE9Bo876Bn4BAqyU6sk+I6G
	 ucCXVpeTuUetjJcW8qZKHDt5m3GHHcoEQMS2t+frE9Q+G8z1PgAkaCH9XDz17RNinxSlr
	 hmQHaPkTiVIQQDtmMKB9NvaqADWK3/d3U2ZG3/c47R8JzNUze7Vri7KwEZahF/63saA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791266155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LygssXTyvUoq4Rk7ph7ZcM8fhF79LHI8cFiBpv9Vqj8=;
	b=jnqXhDaCa5wbOZuKYwfzG/+o3sBofZsMPst1mO2w5h9X6ICZb/MxUVLZFbPkgYp219FK
	 j61X1iENxgZgZ5tsEy9st3+JxHfMm4wmKAOnn83gFdnHAMcEOMg425XdCGEPNTOG1LS2H
	 Zy973Ju3GhT8YEIZi3PA+liJXjzbqCavVAx6JP0VRNhr0leYrC4NJBvZKaOGqykbMCwCl
	 ICvUe8D//O4fPuBQyzWqxLKvLxGjGo/o5lM9iB1wRMqF4X2xVuH7auTcCmtAh6YJF1l1i
	 p20X7JDACCX4y0lV5t35fQjEnKcswrzWZHP/s/1VqceCt1Z5lFx5vBDXI559I1jeqrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791266155;
	bh=LygssXTyvUoq4Rk7ph7ZcM8fhF79LHI8cFiBpv9Vqj8=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fiuKdwZT7PXHuemKWuxOBZ8DB3H2IHUQB5sOhkiI4TWhIAtt3JWXg3XKfW5Tvs8n3
	 7weL7OpTX5oXkwT24dV4VIaKoykengiHigdpCXAlCzVq9IDIh1Pa1scETHRXbMx67M
	 aAzazYOyYA0jt2pjzYneJcWcy0c974mcxKTlLgBVTJlNNViSaOb/fqNCojf2JQTRB5
	 KkizPG7pxGeJ09YIcJsbqw/h6i93mmXi2npIMc7HMseFpOjg5D7vSjQH2pOlJ5ihTq
	 eo632g2b2nRe6FrjPjqfAjKzuiYUF00izgrN2R7KWu7mz3m/rWk6+CEOCTY9Bq9e2I
	 Aw1YvdwSzjckw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5E62605E8;
	Tue,  6 Oct 2026 05:55:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C63641D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7BD7403F8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aML9X_AUs4PP for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 05:16:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58AB4403BD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.210.121
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791263785;
 b=EMVPbhT3A4H9UL/6j1WLQ1a082f4ASBCYu3mhOkqkpkg0EyMzUL4mkbyEZbjgVRqRg4U
 W7CJqb1bXeRYlGNYkJ8TvWTjJmRUkHh7+uF2kJSfRntrTKwT/QYW2koIBFXMi4jZNw1uU
 3YO7H4MQ62KSmtC3Bb3K6FejEvHs30iuseW6Lk0u/bW9a/a5pbfcFWeR4nyF6/dqjZHYd
 m9d6NcRWGaskk/FFr4VHBPfPv/eRu3ICgi9sxo1FpqTdHWeh322g1mpkFecVmHTV+wfkI
 2jC1riE6IzXqL9ZY5T4Z96obQ4uOi/fqB3gzAmAm2h7vcMTfM8TrCOG53ffI9WxNz+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791263785;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Originating-IP:X-ClientProxiedBy:
 Content-Type:Content-Transfer-Encoding;
 bh=6w1Mh9h6WAaa1sTzHoxPXqR3dH7sh4YDH/goZ3LtGV0=;
 b=sCdyzCtyftsuncRKv5z/JGwsC8JPK5Cn6jeDnwPJGDP8FnEaMnt4xTriF3Ebs6P4ugoA
 Yoy3/smroVuac6mwZVlqk1rMK4QQDWYol+CX8cOfKvDyN+EJIqboRWEn06C2LwFUGthDy
 oMCMzERCdxK5cQRMQ4xM1nPXDJUPelWSZjK3tNOEaQKw2TTVubwuUFGkRrhS3qVckZGMh
 gf1Z690ByQm0EBBxaigLNjPSehTlU7dOaKxCaTypG38tVCbdN/13Dfdnedyr37/eisTAw
 DfKvIGcs2/yGEIvniR7plIJI1KFqOQaibby1pdb5N0+K5c1KODAN5BDEWFc6IwjgIvA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Zx6voPjU; 
 arc=none smtp.remote-ip=80.12.210.121
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Zx6voPjU
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58AB4403BD
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1791263785; x=1822799785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6w1Mh9h6WAaa1sTzHoxPXqR3dH7sh4YDH/goZ3LtGV0=;
 b=Zx6voPjUuQPr1N4tIL9UZV23FbFIC1aCus9DEqVxqONuM2Pq0akx6LvW
 npqe4WwfAfd2003Tr3IZ9eolTZlmoUv+P5e94O9EGiPhihAD8JPuo2lkp
 s2F5KwMh0WBbM9ea4D7dB8ERncjtGOUOcLkumUt/YnN+Qo/sZ82UPKkEF
 ncbUj8YKnDp+DDhnq9Y0TSIX5BEgICjqA8U0IJhZCzt2aSJLfB/5bccZd
 JmtCH4ioQ6rZPQV1wFgJYu8TF+JkowTz/wQuUqc2+3u82DG4nQKKv4exC
 nzPprpP5d4JZ9cokOd5kgUquHoE5brNbbb5uHkHFDlWMnAp4tFZbGdFyR g==;
X-CSE-ConnectionGUID: c/okMV95Qd2k1RiWDvQ0rA==
X-CSE-MsgGUID: 0va3pGaWQXiTWOuMptpGig==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 06 Oct 2026 07:16:20 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 07:16:19 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Tue, 6 Oct 2026 07:16:18 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 06 Oct 2026 07:16:17 +0200
X-CSE-ConnectionGUID: CLvtbFfdQWaNJ0vBJQ52fw==
X-CSE-MsgGUID: yOk2bROvSg2rbEKAk1q4rg==
X-IronPort-AV: E=Sophos;i="6.27,143,1787004000"; d="scan'208";a="483394235"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 6 Oct 2026 07:16:17 +0200
Message-ID: <2948b55509525f0a19b4bd9ad26757d53261cc00.1791263777.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH v2] package/gpsd: backport security fixes for
 CVE-2026-58459
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
Cc: Bernd Kuhls <bernd@kuhls.net>

---
Changes v1 -> v2:
  - add proper metadata to patches  (Julien)
---
 ...f.py.in-Quote-double-quotes-in-title.patch | 50 ++++++++++++++++
 ...prof.py.in-Quote-back-ticks-in-title.patch | 48 +++++++++++++++
 ...prof.py.in-Quote-back-ticks-in-title.patch | 60 +++++++++++++++++++
 package/gpsd/gpsd.mk                          |  6 ++
 4 files changed, 164 insertions(+)
 create mode 100644 package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
 create mode 100644 package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
 create mode 100644 package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch

diff --git a/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
new file mode 100644
index 0000000000..8be7040fa5
--- /dev/null
+++ b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
@@ -0,0 +1,50 @@
+From 5581ba196d826a984fbfaf792b7d58535f9911ce Mon Sep 17 00:00:00 2001
+Message-ID: <5581ba196d826a984fbfaf792b7d58535f9911ce.1791178679.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 1 Jul 2026 17:55:57 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote double quotes in title.
+
+Someone could use the double quote to break out of the
+string and add gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/5581ba196d826a984fbfaf792b7d58535f9911ce
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 5c18f50ff..261e72665 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,6 +198,10 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
++        # escape ", and \n, for gnuplot, to not break strings
++        desc = desc.replace('"', '\\042')
++        desc = desc.replace('\n', '')
++
+         return desc
+ 
+     def collect(self, verb, log_fp=None):
+@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
+         # Ship the plot to standard output
+         if not options.title:
+             options.title = plot.whatami()
+-            # escape " for gnuplot
+-            options.title = options.title.replace('"', '\\"')
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
++        # escape " for gnuplot, to not break strings
++        options.title = options.title.replace('"', '\\042')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+-- 
+2.43.0
+
diff --git a/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
new file mode 100644
index 0000000000..53e1cac1cc
--- /dev/null
+++ b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,48 @@
+From 1a6bb7bcbdf58aa940132e630870af061dc88537 Mon Sep 17 00:00:00 2001
+Message-ID: <1a6bb7bcbdf58aa940132e630870af061dc88537.1791178680.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 13:41:54 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/1a6bb7bcbdf58aa940132e630870af061dc88537
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 261e72665..202214769 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,8 +198,9 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
+-        # escape ", and \n, for gnuplot, to not break strings
++        # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
++        desc = desc.replace('`', '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
+             options.title = plot.whatami()
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
+-        # escape " for gnuplot, to not break strings
++        # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
++        options.title = options.title.replace('"', '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+-- 
+2.43.0
+
diff --git a/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
new file mode 100644
index 0000000000..f2e875bb02
--- /dev/null
+++ b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,60 @@
+From 4c06658e988f4ced1a7a574ce082a22ef625df56 Mon Sep 17 00:00:00 2001
+Message-ID: <4c06658e988f4ced1a7a574ce082a22ef625df56.1791178681.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 14:23:56 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Second try.  Also quote "terminal".
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/4c06658e988f4ced1a7a574ce082a22ef625df56
+CVE: CVE-2026-58459
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+
+---
+ clients/gpsprof.py.in | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 202214769..e91367ee3 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -200,7 +200,7 @@ class plotter(object):
+ 
+         # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
+-        desc = desc.replace('`', '\\140')
++        desc = desc.replace("\x60", '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
+             options.title += '\\n' + options.subtitle
+         # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
+-        options.title = options.title.replace('"', '\\140')
++        options.title = options.title.replace("\x60", '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+             term_opts = 'truecolor'
+-        sys.stdout.write("set terminal %s size 800,950 %s\n"
+-                         "set termoption enhanced\n"
++
++        # escape ", `, and \n, for gnuplot, to not break strings
++        options.terminal = options.terminal.replace('"', '\\042')
++        options.terminal = options.terminal.replace("\x60", '\\140')
++        options.terminal = options.terminal.replace('\n', '')
++
++        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
++                         'set termoption enhanced\n'
+                          % (options.terminal, term_opts))
+         # double quotes on title so \n is parsed by gnuplot
+         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % options.title)
+-- 
+2.43.0
+
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7fd8cec8ab..b23bc4c065 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,6 +9,12 @@ GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_CPE_ID_VALID = YES
+
+# 0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
+# 0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
+# 0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
+GPSD_IGNORE_CVES = CVE-2026-58459
+
 GPSD_SELINUX_MODULES = gpsd
 GPSD_INSTALL_STAGING = YES
 
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
