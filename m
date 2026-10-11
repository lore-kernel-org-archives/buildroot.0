Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB5CA9EC9
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 06:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F6480D10;
	Sun, 11 Oct 2026 06:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9uhm0Yjq1Ei; Sun, 11 Oct 2026 06:13:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 321EF80ED9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791699216;
	b=FpYubxHPssevHzqKrKQbOSOHqsNtOEjj+nTf81/0gaCugKKy0ZsOE5gVOo2EpvGy/E8T
	 7LqH9O11YOMoJ/CtIiEavrR5uWws27LUnfLdBQbch4kvrIF1WTbHf/8pFoxwAnUrQcjcU
	 r/5YZKjlR+yegnWtCkFkjwaQUPqoXKwrKrMA1UA/ky4L/uaCnxHbcC6UYQ6NSZ5Y6uhxS
	 V850/jC+GBvxY6xOz9sbCIkcb85iKB+2S0mdHq8GGSYkvqJHBwYXsguYSr4R+8evDuR39
	 9pZNoYqAxlKQOCTzLLvEr8upWoK0aJpKQGz47Ql/5XZ2Z9ZeNKgp/QOWdyhb7eiq7Aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791699216;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=UM3yxY09f/AqRNXtOMJx13nvBmWcpn2aeeET0kzL2PU=;
	b=C5UE61P5D9QpLjXE37WYa+gyWpK6hYEkZWD0FhnMayZHx63LMSZ4y72tD+UMDXXyO4So
	 IQNABMrLSaJhlXvrq21vMp5PtKLZiGXYrzjkI9JqkrQssfq+gdmcZwVmFycvpU7fa2iFM
	 e/ifc9jmHNujIAv9AjBgSoWJVzblV1DS7e/TrqiTZgtgDUgWcXpm+J3nbHH7FPvC/IltA
	 EtkEkiBLCcv7uEVbQ4qY3tEwIHQZJB3WLgnpPZWg72aa//pqprWqiK9ycPBh9vw3FYi/v
	 gcG66+JQvTxb5K4VKBPGpI6jOIbawZK0VkZBOmbi7axZK6Vy2PfwCtoDQnG/uNQaqvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791699216;
	bh=UM3yxY09f/AqRNXtOMJx13nvBmWcpn2aeeET0kzL2PU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LXaKyEChM64Z9RUHvBn4m7T9W8FvSg/qoOVgIeE2mIFag3LozN/fjCPVBOhj5tjTD
	 kpqoHfdaCETVXyhYeVe4Y9TFy8OW79qpYlTmRUBgU8+vjDvT0CfSiIrcMpNvTLBgnm
	 QqrVoXlOAOmWNg3uenKMYAvg+WLBM/lVPIhImVVDuZbcPtKkCYfgHwBMmcnDftrMB0
	 Y36OkNJQbk0v+m5mAioN6aJIlBcD+3zBTLyRZzruBJ9yKik2hkvg2WWkfQx/Ri1q1C
	 paHpHtvUoXXwqtCQSobno7XhMGO11QOtwiG4AXL58BITZd5E+hY8uCnYyys245Mb3Z
	 9damgERuoAgYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321EF80ED9;
	Sun, 11 Oct 2026 06:13:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13201317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2FC740050
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpRonVXe7W6K for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 06:13:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2A81D40042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791699211;
 b=l73mEeTYCjPfP0BZry/6FvsZuNYewtpBs4wz6Hdd02lYK3bOS9aCSVlgmHGmxjTPCJ8c
 DZ2bXUu1OXM39yTLF0jsAJZ8ecrO9PJ7IUOFIh9aY3JPIyKNxgH+P8jgiJXaqt0g5wg88
 eN6gkxYtFmcMycaY7aGRlO8+1R5W2QBBhDhmfgoDI8P1mb5jWQp1e2H7B1P4LaomD4yPK
 1MX0e+gvBdAMBuqhcHgX9DoPomoTXg9z2j2kR9ZLWsa1RPJ71wrGROb5NLIGZWoTkrzvr
 nxL28QcwCud3GMeECgWsRKTSh+LfDnzYSC0Rc91slcN/QWINK3b22moeAGxKO6hLAFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791699211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dfRzLtPpFoBtzy4ThZm5YuxcobUDPf8wAFyPnyXGX8g=;
 b=cGTmaV4O8XaTbOYFiRF42/HKy4A0qLdazSs5ggmX1FEPslxtYTOPri6L3uY1a1q9N+zc
 iIeii6A0DvmvZbzjeYKgykCZKSsQ+7VPxHoZi2QAgaLq4+HLOGwFGIOj2W097wcs94SyY
 hgTzahHc2ML3yYyzVUlqaOcq7U64ib6xZTswA5m8Rw61S2ilin+uG6xbpTBsTzYAtkXU3
 SNgYd86BqdSZ6ls31TNB27w0G/VtZGuDIvCH1EWA5mZh12DrVh9OnlxVIx4UQT9kFdUv1
 PBzgkxFf+CICwXoiCFUVDfDSNjy3t4GCOI3fIZrrzMia/J84ospCXl2cgHAcXH947Tw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A81D40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:13:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 920739354D; Sun, 11 Oct 2026 06:12:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 08:04:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56992f78258bf6f494c7d5ea6cc8c90038b53038
X-Git-Newrev: fac6d92a27925192b3cb8107449e7abfe01e2cf3
X-Patchwork-Hint: ignore
Message-Id: <20261011061212.920739354D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker/Dockerfile: make $HOME
 folder read-only
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fac6d92a27925192b3cb8107449e7abfe01e2cf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The $HOME folder of the br-user inside the container is currently
read-write for the br-user. However, practically speaking, it is only
read-write when the UID of the user running the container from the
host machine is 1000, equal to the UID of the br-user inside the
container. For any other UID on the host machine, the $HOME folder is
in fact already read-only.

Because we do not expect Buildroot to write into $HOME, and in order
to have a consistent behavior regardless of the UID of the user on the
host machine, we change our Docker image to make the $HOME folder of
the br-user entirely non-writable.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 687eee8110..75ff73f65c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -95,6 +95,10 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
 RUN useradd -ms /bin/bash br-user && \
     chown -R br-user:br-user /home/br-user
 
+# Make the br-user home directory not writable, even for br-user
+# itself, to catch builds writing into $HOME
+RUN chmod 555 /home/br-user
+
 USER br-user
 WORKDIR /home/br-user
 ENV HOME=/home/br-user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
