Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E0EC54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188BD608C4;
	Sun, 25 Feb 2024 22:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsZpje73Amqh; Sun, 25 Feb 2024 22:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BD1607FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BD1607FD;
	Sun, 25 Feb 2024 22:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DBAB1BF3E9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9576081B
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8qFORxoGoc1 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:05:55 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=64.142.111.80;
 helo=c.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97901607FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97901607FD
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97901607FD
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:05:55 +0000 (UTC)
Received: from localhost.localdomain (141-126-093-001.res.spectrum.com
 [141.126.93.1]) (authenticated bits=0)
 by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 41PM5qQ0018269
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 25 Feb 2024 14:05:53 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 14:05:44 -0800
Message-Id: <20240225220544.754965-1-sen@hastings.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVbZzwp8UvaT7/mgt81SH5B9IH+fVJ7mpEa+aK7lCDMED0FWachPxVF06ULeybA91Z+eCtlpNWbEXoKgypjZJ4z5
X-Sonic-ID: C;dMicCirU7hGFZi5nR+6Zsg== M;HnrcCirU7hGFZi5nR+6Zsg==
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix bug when
 sorting by hashfile
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Because the div_class variable was not reassigned a value,
cells in the latest_version column were still being assigned
hash_file classes and so were being picked up as elements in
the hash_file sort. This lead to execessive grid gap elements
stacking up and creating huge blank spaces at the top of the page.
This is very noticable on pages with a large number of packages,
like the ones the autobuilder creates.

original behaviour(click the "Hash file" column label twice):
http://autobuild.buildroot.org/stats/master.html

demo of fixed behaviour:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-bug-when-sorting-by-hash-file.html

Signed-off-by: Sen Hastings <sen@hastings.org>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9307992d29..9ba356cb7c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -977,6 +977,7 @@ def dump_html_pkg(f, pkg):
 
     # Latest version
     data_field_id = f'latest_version__{pkg_css_class}'
+    div_class = ["centered"]
     div_class.append(f'_{pkg_css_class}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
