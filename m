Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE891C02188
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 07:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 774F960ADC;
	Mon, 20 Jan 2025 07:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WWIhFUhBTLr; Mon, 20 Jan 2025 07:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 646D360A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646D360A65;
	Mon, 20 Jan 2025 07:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10682959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1EE940160
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngTR4LCSPkW5 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 07:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53219400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53219400AC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53219400AC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:00 +0000 (UTC)
X-CSE-ConnectionGUID: 1O7TL/C1TfO+jjkHIzHIyg==
X-CSE-MsgGUID: /ZUz8cptQxmOS+AdBpDgvg==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 08:17:58 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jan 2025 08:17:58 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 20 Jan 2025 08:17:57 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Jan 2025 08:17:56 +0100
X-CSE-ConnectionGUID: 2x55Iyx/SUuIGh+YNtfcHw==
X-CSE-MsgGUID: OhR1gBjLRtWkDyj/nI6BIA==
X-IronPort-AV: E=Sophos;i="6.13,218,1732575600"; d="scan'208";a="244551614"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 20 Jan 2025 08:17:55 +0100
Message-ID: <1f3b48c849c42f36b11d9b2ee3da8a7e812e9f47.1737357470.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737357470.git.yann.morin@orange.com>
References: <cover.1737357470.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737357481; x=1768893481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOSqPMzacuqMwDCOH/eZQKZd3Hr9YKdiiIN0w64++z0=;
 b=RWnO1N1UzEflWOavuTA1/7KQjLzh04pG168zFz81xZKqLG6qfJ5OwQ+v
 ti3dpocvlmqXFtzjw8b3/m7Tyn/LC7u2B/j6LzcrTVqhSQAkLonWeJ6XG
 uRm7f45+2K8haYsqJ9FZ9NUQbbSAZeRdcodBsa7GTK6bud5fkKr64pRiv
 cbl7NPZOJialWK8QqA4UBJkXgWJyf2/fVrymmBClS3BfjO5YfBWMh2530
 ntf0x98ezSDjkkwOcgjrTBda27NoNhpKBls6w4VVIdZVP/OAk7zvkxIUs
 muKR92/vILbqbmmlRTalLv+u09/OxQz91ganpyU4W3Mbx6yKvahsuFApn
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=RWnO1N1U
Subject: [Buildroot] [PATCH 1/2] support/testing/utils: fix get-developers
 test without a tty
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

get-developers will check its stdin to decide whether it is a tty or
not, and behave differently whether it is or not. So, when we run the
tests, we need an actual tty.

However, when running in a CI pipeline, like on Gitlab-CI, there is no
tty available on stdin.

Fake one. We don't need anything too fancy, so just a slave pty will
suffice.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671800
Fixes: d10d22221f93 (utils/get-developers: read patch from stdin when
it's not a tty)

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 support/testing/tests/utils/test_get_developers.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 3ec4edeadd..701c3acb1a 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -15,10 +15,16 @@ import infra
 
 def call_script(args, env, cwd):
     """Call a script and return stdout and stderr as lists and the exit code."""
-    proc = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE,
+    # We need stdin to be a tty, not just a pipe or whatever
+    m_tty, s_tty = os.openpty()
+    proc = subprocess.Popen(args, cwd=cwd,
+                            stdin=s_tty,
+                            stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, env=env,
                             universal_newlines=True)
     out, err = proc.communicate()
+    os.close(s_tty)
+    os.close(m_tty)
     return out.splitlines(), err.splitlines(), proc.returncode
 
 
-- 
2.34.1

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
