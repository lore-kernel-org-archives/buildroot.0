Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3AACA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B24798087B;
	Tue,  6 Oct 2026 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJDJ6NgdyRxg; Tue,  6 Oct 2026 15:02:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B03FE808A6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791298968;
	b=kuWlNw9nrlUTSn1QV8lzm13ijFPEqnPfuVdM5TeqF3w2/ksA6SA0c1AH+7RdXB193WrL
	 PcZlPYRV4Cy0RrCWoRXCnk1sMO3T9Ut7wlI+nZLzYNn2+rXoB8nx+rfsEQkMfKbASNcbD
	 fuIGoGtRq/cyllhI1ixuldvki9d7+citEQedtQbAqF8IiBwAVrCrkVOpD+1GygqtVPfVP
	 BQORvjgSfVbue02I2DMLY8+bfftAeiwLcwFEnkKnR1523LlkAEnbvaAsWY5cO0Mfvy/Eu
	 bH8+pFNgVYK4xcSLf3cVe9i1XQ2NjLMvnV4w6ya6pSSyCTk/g8vWLPFTa+FPu7dYoCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791298968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pvsnGoCt2ycY/KyKmmYpcBE8JoRg//YYBYSBv4WDKrc=;
	b=MqXRmLC43vyDzgdSp1GPtLuQt+lE52QUUYzfDjjfRN5Q6j/EyN/bGqyXqkaeHZUorRkT
	 zaRX/j2jAQx+LtU9bixxz9nqpfCru1mqhxDgmXRGx7/jMP9RSaZ0M/zeFKxHTYWzu7NX8
	 cEs8sQXlwH7VMGdONab9UCY0i9BJbCCFxy7GSu6oejw+TQM669qk9sjwrG7dg9/+l+q4B
	 T+lt1axoz3mofyAvVE3LYFgjFaMFVu+6x5dqodpms4zdPVz8h/3jSVkL2r3j9xIGmHgxH
	 hwliPywrJczce6LixGD53psiEbaE6M79Dg3QgicgV29QFNfFdbA/+Q4VOakHfiX984g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791298968;
	bh=pvsnGoCt2ycY/KyKmmYpcBE8JoRg//YYBYSBv4WDKrc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rG0DMAcrhDCPMR5LfzISyytgfnhT/6d+7YwVsSnzyUTW7PUkwQdltmLv4v+Sgc3LV
	 pz3eNNUDNvx1dasEMMclOVsspb/hjhYbn9ZBKgPMYEv0xgfGLw1GvqrqS4DfoVvWKz
	 qKvpfNX9BvZYuMaEgZI133GBUtbz53g7TMzDqJ0ONshJygNtwgFZo/cFjkJrkVmaR6
	 BjmxpH8lQ8DB4rf5eQjUX0VrxxtPmBvMX0AqOWGB1Dj0TqpWWCBuzMYTNwUJUBZe2q
	 GjV53suOh3/zRzkiU9bOo1HFQye34T23xMsPkRb50KV5rx/Nu+hWrI+yTmiUvXOzlA
	 R2p5713Rr6Gkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B03FE808A6;
	Tue,  6 Oct 2026 15:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0315C1D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC732404C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ja7pfVSxleWr for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BAFCB404A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791298357;
 b=Pva3fRIdWG+CbAhan3pr4BRGXE/FbevJ/BthL+/qWVnI7aa28rVvqAlZbZzXg9NmdpuD
 /t4Zh+Yk0bnThHMyOFu1cJy7BoqA3WiAHnYpAPvTIyoBYVSf4uZ+quzwlqjvPv59oeh2F
 XzZdtFc9NhJv9uHYm02w/zYudILjUrHtraJcIw/e1lKe6EI95hLlhcj3Ahyxdk3xCUHZA
 +TmPi18pdxqrXcCDj7cnSOXsG0yuw9ej1bqmZ28rK1gdX0SvskDSLIMRaNWUsenMlbssN
 6Konz0BAv8qrhMJN8zzYwSQLUsogXneATK/Qs1FBJRp/FaPRV7/1/8OHWHysN0a7+Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791298357;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3n0YiUdbvh8zA/mFoTCfdB2MYZ1MgQ8HwWaiJQwkoNw=;
 b=lTnk7uEGHtawFOPsVCLkbpublwJ33xQtYgHyGL2+E684m3MGdJuSwbUPUK9VpGa7BtqZ
 Rl7dw149+YEAfNshHXigtFYaP3RiZwDyZJikiNjFMRnITTmp4RwpT+SMQVSxMVlthS4Nt
 IsFgI1UcB0YzmJ23Bgmv6VnDOvzJA6xRmEcDuiBndUc6WEGCO8fQXEpGw0WsXQown5SXX
 lSn/Dg3eCX6huxQIkaMuhxWzl9XIgZJgPUswtf5aCE8BAVWc+Gv+bMHKJOa0Ey7QsWnIA
 8xswTqFr1YKnjMaf4FY5rDeLRPSIGxiNK0Ro17WoGyLNC43eo6qdQpLBLSKr6evKAQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFCB404A8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64D5D8D760; Tue,  6 Oct 2026 14:51:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:31:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5df4e2d841df404014fafee0a62061c7cddac279
X-Git-Newrev: 9ae470b3aead2b34e88c834a8b0ed8a023b59d61
X-Patchwork-Hint: ignore
Message-Id: <20261006145121.64D5D8D760@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cifs-utils: bump version to 7.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ae470b3aead2b34e88c834a8b0ed8a023b59d61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.samba.org/archive/samba-technical/2026-September/141109.html

Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index bc90ae98bf..fe2b181327 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2f8aae9aa5ddd73fbaf4d61e2e5e19ef54124cbf2810b626820050e7bd2f6606  cifs-utils-7.7.tar.bz2
+sha256  b5321d3ff848d361c129aeec4ec8431642582b7036cb8a2a403667d5909d4172  cifs-utils-7.8.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 7ff3531117..5c7a134b17 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.7
+CIFS_UTILS_VERSION = 7.8
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
-CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
+CIFS_UTILS_SITE = https://download.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
 CIFS_UTILS_CPE_ID_VENDOR = samba
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
