Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2060BCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05FD613EB;
	Fri, 16 Oct 2026 13:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zf9HUjI5aZBu; Fri, 16 Oct 2026 13:13:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A846F613CA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156429;
	b=j1U2lOEzQe86H2t20n0p9+LfyAIJn6PboGx9PBnfb2zTxN/EWx2kG8HTH9WAQW3B3Rv3
	 CdmNnsFxUdlJ/FvPdb9OzDvGBnjdNitVYihZeuKeQMydJYW97xuyWaG4rNb1TpbtHUU4B
	 6O5/wAxI3vf1lnlxfFRlTMho957ke1BlJF2lRAciOo6Sl1z9sFDgk4/YgHsyPIAm276n3
	 swPx1UoNuTGh2nX/+kmE1X4MxYUlGiui8YiZFW6/wZXoQPlItklzkTvDqA8SZVpkKkmr4
	 +T9cs0nYq8PCXF+rX1/4mzme/bNQU7/g//IHBFqaslksHfp2k1qu9TTkRYfdYSJD36A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=w/gTXGjVmNYcEv7hH+J1p7EI7IjRynXuqLKJ7nELK6E=;
	b=OFnBU+SOxCz4C4CtYjOwYKvH6GKxTMmyEf/LR5kP0jcMti59ZxVCOzWpf2wgt83qNBT/
	 B3YJCyWDSJan5vlkawF04qEKPIJKYAcHheew+wAz60rUj+LFih4st5h7rsfG6ndfZ/iU5
	 xCrECMwNvWBNfjZ6ofRyYzxGfqh6wr/3ixExrnCbyZpsWgbtxElHyfpAkDAOqTAGrmOyZ
	 OsOEkaCMxkFgbsYv/Vv/5lTuGh+zyW/aNzgzrEL14ootOsUee5W6Th8/IEnvB376ufDqs
	 ESowSI++9524GQU4fwJfz1jUJapmkyuSxI0dtUjAR87GnG4d5THvywxwNGPMWsM7Rng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156429;
	bh=w/gTXGjVmNYcEv7hH+J1p7EI7IjRynXuqLKJ7nELK6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dSCQzxjE0fTJaiafv1Vq79ryVybnSRehoaEJ9FNxnk5eQ+iK0Fe5qBPmVlHOETNj+
	 0l9aGEBFyIGeMnsvMPVsaSzPgzPhGVucDzJrYdz+u7wA3+U/BGVsSYisvO6GobhgfU
	 yAzTi6ggHDlMZl/l/vw7HOjJlhjW5cEVZ/4gcOtGYa7QB9h+qvNklVsUJAN0HtsAhn
	 X0vlGgApofUAzmjapPK6Lv75zEwQk+/zeDd4ZJXfn6PvH9IhziRUU3Qhx7Agr/ni3Y
	 JwHm+muBlMmZDbyfQnPe0NsAib4j+W3cqWKMkuctjRYPW6ianJJucjdmZPQtiGkQgs
	 vtov8zvDsttrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A846F613CA;
	Fri, 16 Oct 2026 13:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C46105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D834D60F21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oC-7Qm-6HqQv for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F371E60F4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=QimPSbtBosasFLVl5kSP1vDNKO4j6j+cTdyfJPh+M5IHfMgLdqYG6Ngjkicwy5TLabap
 nAx1LHUZcMQKsIzhJNhd5unVhD0FpmMbHj7Y/UK7Zpg4qIkqSPbrmAyJ7FO2Qe0J6S+/l
 9G9SXsrNsRdcyEaAp8MQ5OZyo4NoqJqwAQdNl+7TRU19f0lHH0ZO+oqJLpFwf0Agltbr8
 DVG9X7DbiQcO+X+UmOLeVwiF0Wux5Ql73ldcDv8sOdDU/IbcUEGDesgILppoLBcGcNwXU
 r8q5CKRlBEa/cXhEGdUsTFdbUMPjdmFTtOlKhHy+PLemEqHtMvZiWbH9d68p7gdXMOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ocARJu9KnNdX6YueBWh6VnlUDmssy9pN0oefeDgQ3+Y=;
 b=XYQasef5B7rDsbbsObmyK0zW8NQNGps3Y9VRUncUxhdPK+0Cp3ZgagQ51wsvBItaf2IY
 oGn49ujUvvyc+8BufZz0eYj6X94xly2ERXZJ3owCJBp0NMaGpBXWrd945zkvkLW0fCp8w
 GpuvPtx7GJbJYgQk4fwBgOuhsEuao6k3dZihzXVg1LQikAONzw+sn1Vqp8aI/Wxa3OdCK
 sFmtUUESPvEJ8LNylW3cZbV0fqwI71Lp26JMiul9Icz0C2FvTWobDBfRjsqHTjEWkyw6F
 l1b4rBRMXtcwQRGHbIvkYImhLtujY2tu4RzVVgUqAJYjS+focr1JE02mju3g28sWVmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F371E60F4D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3499960D0; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:45:53 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 576f2979fe6a84748307385616b601958a7359dc
X-Git-Newrev: 682dac6c387f9f2846a72425cef88af59dfc86bb
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.E3499960D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/docker/Dockerfile: make $HOME folder read-only
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2678474776911995813=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2678474776911995813==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/682dac6c387f9f2846a72425cef88af59dfc86bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit fac6d92a27925192b3cb8107449e7abfe01e2cf3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============2678474776911995813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2678474776911995813==--
