Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DAFEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C6C84714;
	Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsfOyC6EB5Wh; Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBD684719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011462;
	bh=Zuk//UqN3Js4kxZ0aIidtJQbNatbpXxEZ/XILuNR6KQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AJtVkKmTHq8dwJzvKHD1goFtA0z8OMI2/hBNkjId966i1nEv7BbFTdM+Jeq3Qtz9i
	 tMQ4TgqJIt/OihFYZrBuI+Ta+dzjauStlVoYmMSvykO/GLiQdv5kBbT50pSoXIte1C
	 KUVYoHyw3Rt6cxyGBSSs2Z80gu+BiVrwJ+QcmZfX9xcZ0abuXL+DWh/972wi3LTGLh
	 uMQNZhq3Yq7IL4j992xf5hULj7erTuiifDntqEsaOGfoW3CChpFRrC62K1hFAfViTV
	 18za9owvbNnQmhs+AHayILqBGl4uHye0coUZnNSizRTZ061R9X3zB5Pe0AY/h+ChCt
	 ZWwhAFus9fBWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBD684719;
	Fri, 13 Feb 2026 19:37:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F3A283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0B8C412E7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n__Od6RqXNma for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6567341298
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6567341298
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A13483593; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:18:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5746e771d402a9334bf220713a79551770cc74ef
X-Git-Newrev: 18223bc071eec1f87cc267fff37950a075376a67
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.5A13483593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/netsniff-ng: fix
 compilation with >= gcc-15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3166123999881101543=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3166123999881101543==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18223bc071eec1f87cc267fff37950a075376a67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Build error was not yet recorded by autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eed531873019f695437f1252c16a8e5b5393835f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...1-mausezahn-fixed-compilation-with-gcc-15.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch b/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch
new file mode 100644
index 0000000000..5eaaa91f10
--- /dev/null
+++ b/package/netsniff-ng/0001-mausezahn-fixed-compilation-with-gcc-15.patch
@@ -0,0 +1,39 @@
+From 1af7ae33e3e8178ab5c649c3a52838d4375c4228 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Tue, 10 Jun 2025 14:47:54 +0200
+Subject: [PATCH] mausezahn: fixed compilation with gcc-15
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc-15 by default uses C23 standard which is more strict on forward
+declarations.
+
+Original report: https://bugzilla.redhat.com/show_bug.cgi?id=2340924
+
+Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
+
+Upstream: https://github.com/netsniff-ng/netsniff-ng/commit/1af7ae33e3e8178ab5c649c3a52838d4375c4228
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ staging/mops.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/staging/mops.h b/staging/mops.h
+index cf19f098..ae3769a7 100644
+--- a/staging/mops.h
++++ b/staging/mops.h
+@@ -940,9 +940,9 @@ int mops_direct(char* dev, int mops_type, char* argstring);
+ 
+ 
+ struct automops * automops_init(void);
+-struct automops * automops_alloc_protocol();
+-struct automops * automops_delete_protocol();
+-struct automops * automops_search_protocol();
++struct automops * automops_alloc_protocol(struct automops *cur);
++struct automops * automops_delete_protocol(struct automops *cur);
++struct automops * automops_search_protocol(struct automops *list, char *name);
+ int               automops_dump_all (struct automops* list);
+ void              automops_set_defaults(struct automops * cur);
+ struct fields *   automops_add_field (struct automops *amp);

--===============3166123999881101543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3166123999881101543==--
