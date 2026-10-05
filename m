Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA63CA5FE2
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 05:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9F580C33;
	Mon,  5 Oct 2026 05:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXQWr1OfVzjI; Mon,  5 Oct 2026 05:44:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E8C6580AAD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791179046;
	b=c61FCN2ZWta+CSiWp/dlSzIkvWntKl1x5Ze1AaA2EdV4cUgG4lzoJtvEzmRbH01w98mV
	 OXylQlUYaqvY+5/yqwLTnuLnOzDnOrjSaz6+QYU1k9JcT6pQWoZvTrVZjK0fh70EAutHC
	 hDR4e3QQnuBqBvWqzh4vdVSza1LRS7NUlh9xLzyEqDmYXGOaLT5fAIlAdgNKltzUyMEsQ
	 jK29XXkIEIQsnlpNXKDa3RXqfiNehb1RPPq3c+kQ+lwpEjIl9SAginX9qcTwoY5gGIiUt
	 wKv37HQ5JA6YVcRiwaNlylBFdV9t1DcC1ODUN3+0X/MFgJGAUAtk7mJHwhazDPHi2Vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791179046;
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
	bh=0WYGnZLdKQe9no6/BgYWAC07fPQD6Uk/80iW8hkR17g=;
	b=YLyTQCCI/r3TDEr70Ovn4hCZ4e+EQFPtjLan2/k1z4YP74hzsaPWNAxIAu8JW56Imkld
	 HcLYk4QIZSANY+HPAkyZObILqlXEmdSfZEKFyD/2NbKJcdFoOYa8BNGMzNc8Zo/63IlEK
	 0pRH1IEkvENcRSZhL5ET4Z7dfeJGJar+3fZSuhc9qGy4qdrT11Q8YFvC2reLudw368qd2
	 wwZsY6l2P/opIBI/9Zb9eChTkSePXmDXr5BqvInu6aE8uqOZrOI9MHdD9iS3P+sjDEI4J
	 Wp35M06/HVKjgRaFPYHU7snLKXCbxUmYbPlu+684H+day2aBLVjjYMfHHwWQjSqrk/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791179046;
	bh=0WYGnZLdKQe9no6/BgYWAC07fPQD6Uk/80iW8hkR17g=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OVpTF7WZ2as1FQqz+vmBrahvFa4rhGj5uZgtHg5ckDb95qu9X5p/TR9r+z/X8NOMC
	 6aHyc2zIkkHF4VKzcCJmxYVBy+ZC/99WHClycBoA+t+Jwt3uGLw3Cq20qHh6E1MLoV
	 QbwR8TEIrYVPdxRVzI/ceU03YprbyhI5aTtswY/jFkRWHfE75UwduDraXeAUoac8+o
	 u4hjgnn71Hr9ONlyk7dtPCtAyiHPJwr6mOPb5CXd6/rCK0TJN4a7pVFuy7rpJSxkIM
	 vbUYCA/YUYdXz6AjoTVD/txTxire8sFw2Bh6ABl5rer0wQbyu36BtOT2lp49w6N75d
	 5BlXyDXE0WVtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C6580AAD;
	Mon,  5 Oct 2026 05:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA4A1A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 05:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27B440068
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 05:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8CeAMw4jyBz for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 05:42:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2782E40051
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.210.121
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791178956;
 b=LYmMcmV89ZlOoRmEkKtOAeuwnF88gb7WpC0LyiKlDbHhLVg1JjEe81MworamSZBS1AC7
 Ke3la/FBUg7xzBm6l+kqccGyonDj25k102a0M4jQor3LUV+mP8EdM01NzIlgmXYGcFQUU
 f70gq3fiv45UvZoAGeIuyd4IcLG3WqzG3ZWS2K0fAqYmQvAJ0JZWUV7S7AF3eoPqpYFuq
 QEuZaqhu7EBry45GSIojXFoAdupeXV3NZcYHf2h1+JO/zTPNH17tyKrw8BPY+LIc06c8P
 YJIrHjxmI0zzy0mO+DCIcwbgyP2xrJ/SEQPg83fIo2FR3ZEYa+k6VuCmEUu192TG/mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791178956;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Originating-IP:X-ClientProxiedBy:
 Content-Type:Content-Transfer-Encoding;
 bh=JavGXfGB8IuH7KzHvvDKdeAJRUCYiN+x5iHnDivsFm4=;
 b=LOGlcEmBgVa7kw4nYWyD8vETpQ88SwbSlKpO7KLM//1O4OaomoOeFBYay5q2djbYcNtN
 Z4Jo7hxKKh9rMi0dIXJPErYCONYcj8VStZeGJUzhXKbfWVA3wqDzkb6e4HAZQ7y52v7zc
 eQt9413sGKqjeul+spnB4OQwJA0Qw3OSn/kzjZh00twIy8mPHMhLu4ujXrOZsrPz9Xa1a
 oO0jb8PwAP6nay8jxkVATZ6SwRahRRZR6shvbsNFCc813f2JT4qkU3uBU9w933kmeuLFy
 Uoqxaxf+ayhI69rnJMyMe5yHac2KwxynpdVbwC9Q32NmJEENJSOPxklr7y/LePOlBPA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b="o6/B7hxF"; 
 arc=none smtp.remote-ip=80.12.210.121
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=o6/B7hxF
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2782E40051
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 05:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1791178956; x=1822714956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JavGXfGB8IuH7KzHvvDKdeAJRUCYiN+x5iHnDivsFm4=;
 b=o6/B7hxFKuuNWiq1qcA/+nbeyg4490gMqNLjiMv5RiUSz396PyseZXb6
 mrZlPzN9GkyqjwghEOh4oUIS4yrXrUyX8DdSzLHpju44WQQye03SMFeIj
 nSsZqqLAo3mqMwt1vzRTATZrG4uCg1LSM2HTGHyx+quSdd9fiXgWC+jSQ
 UXusIRX99rNNpf3JLHdy/1ZNyOqjQDYCoMZe6URJuapM/74JQBL8DXy+O
 Ipz7w4YaioWQlJKddnBJIG06mrStoMQgDMaqMsonE8uKn9dhwJKwa+YXH
 9GcPiI6+dc/bX7ZtBiycqrY4nWRyX/XUYvsIN6qt+Xr6IDHTI62DN5+z+ Q==;
X-CSE-ConnectionGUID: XFr8LTzlRRe3tjhR5SBh8A==
X-CSE-MsgGUID: 6nkyeMZNR42kY+vH3AXV/g==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 05 Oct 2026 07:42:32 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:42:33 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Mon, 5 Oct 2026 07:42:31 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 05 Oct 2026 07:42:30 +0200
X-CSE-ConnectionGUID: QoVD//ODQfajZTsExSA1dw==
X-CSE-MsgGUID: SijgfYn6Q4GRrRvesqP89g==
X-IronPort-AV: E=Sophos;i="6.27,141,1787004000"; d="scan'208";a="475791892"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 5 Oct 2026 07:42:30 +0200
Message-ID: <245d803e1ed4a6146dbd00789edc02d982bd6329.1791178950.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH] package/gpsd: backport security fixes for
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
 ...f.py.in-Quote-double-quotes-in-title.patch | 46 +++++++++++++++
 ...prof.py.in-Quote-back-ticks-in-title.patch | 44 +++++++++++++++
 ...prof.py.in-Quote-back-ticks-in-title.patch | 56 +++++++++++++++++++
 package/gpsd/gpsd.mk                          |  6 ++
 4 files changed, 152 insertions(+)
 create mode 100644 package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
 create mode 100644 package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
 create mode 100644 package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch

diff --git a/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
new file mode 100644
index 0000000000..ecc2eb6116
--- /dev/null
+++ b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
@@ -0,0 +1,46 @@
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
index 0000000000..d252c9809b
--- /dev/null
+++ b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,44 @@
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
index 0000000000..ed5007e4eb
--- /dev/null
+++ b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
@@ -0,0 +1,56 @@
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
