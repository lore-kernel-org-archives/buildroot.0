Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DE6EA7940
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A834E818DC;
	Wed,  4 Feb 2026 19:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7aFgdO0fios; Wed,  4 Feb 2026 19:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBDB81916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233340;
	bh=txKQ2aJEAxxjKWEOeBSw9RjBRUSjra8GWnq3s+lLlOc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKbkt6mmMCJGW9kuMjq3IhOGCq5bvEtmCa6Ro9woojApj/tiv0MPmXVZXgXbXPcao
	 IM2oiRKWm2LBGGUC4f2Z/cfe2qwDCTGnoLB81UUs3oBkFvv6iDLWEI8uMb4em91GeY
	 B8ChEQti7UO/xm+9ZGNS9Km6UEQCAdwki1Mho023wfNy3oRiODB0lS+PcH+/z2aVrv
	 USBlE5rVDprnRn8l3wKzkLOlU9LYp6fv5UmP7f4w/qouS0B/sWJMhOW6G6U7GslQCb
	 2zY5jgBFnOiT9LnPF7XnhnvAoYWqZMX7dguqxSlO7O0l+IUnFnR8q5CFGv1paKS8LR
	 2hfIkStTri/zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBDB81916;
	Wed,  4 Feb 2026 19:29:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AABEF173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C96640165
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JScMj3KFkg4Y for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9666E40086
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9666E40086
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9666E40086
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:28:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80129A4C5478;
 Wed,  4 Feb 2026 20:28:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36152)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vniYY-000000001im-3rXa;
 Wed, 04 Feb 2026 19:28:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Feb 2026 20:28:54 +0100
Message-ID: <20260204192854.1471862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770233335;
 bh=YEfffTBfsV9BBkuhbfNlp9tq5utreSVbSW6pZppIKWA=;
 h=From:To:Cc:Subject:Date:From;
 b=mA9TvSm8KuTq8cgU5Oc2vdfst5QJPjaguhTAh8t7nQqw5Gw3yY1PdSs9OZxe60bvw
 GjdX/zg479G7t4l314bFQw0b8dGVp1YoqaY+TdnHvQr4GwkVH+NIh+4KkwuwKjadyl
 hxZ5OBj2Agrl8BRRI2eMVdD9pU9rJAxKut7rVXIzMKPQ3SSw2bFzzKUi3ih9lMAQa7
 LNR5fCqUOPEtvv1FChNG6T0ayq3z+b0umVHPHntUWRVae05mplOv0vGv83bODTkdRn
 S2UMi2SjnA5+skRgbo/HqZJ2j0a8XJFLfIUvwvZYSvG9ibCS8Us/sZFHoISwydYO+i
 i3InviQ4683ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mA9TvSm8
Subject: [Buildroot] [PATCH 1/1] package/ne10: fix cmake 4 compatibility
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

Fixes:
https://autobuild.buildroot.net/results/ec7/ec735e666c11972a766422d592e044afe8829a57/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ne10/0003-Update-CMakeLists.txt.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ne10/0003-Update-CMakeLists.txt.patch

diff --git a/package/ne10/0003-Update-CMakeLists.txt.patch b/package/ne10/0003-Update-CMakeLists.txt.patch
new file mode 100644
index 0000000000..455f09e460
--- /dev/null
+++ b/package/ne10/0003-Update-CMakeLists.txt.patch
@@ -0,0 +1,29 @@
+From 519ceb06707bc71206e3d4a78a5cf5830122eb93 Mon Sep 17 00:00:00 2001
+From: Peter Toft <48215001+peter-toft-greve@users.noreply.github.com>
+Date: Mon, 25 Nov 2024 11:41:19 +0100
+Subject: [PATCH] Update CMakeLists.txt
+
+Upstream: https://github.com/projectNe10/Ne10/pull/296
+
+[Bernd: partially backported to 1.2.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e5c140d..285627a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@
+ #  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ #  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.20)
+ 
+ project(NE10 C ASM)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
