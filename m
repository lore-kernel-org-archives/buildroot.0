Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E6C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F1240B20;
	Thu, 24 Sep 2026 18:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWsxvWF4JCUL; Thu, 24 Sep 2026 18:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 941E440B1D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276218;
	b=PzsKKWducr6Vv+5SuRdBK1JryExYYmvoBKkPFEEU8RFXHUTHB0IgBeVwbCB5pfptOXT1
	 I0QHX1E5hen1j+gXA2O59XGXkg1J/2EK6WLhcSBAG1D/0K0do4HwKv/q1zzDWGcJCcAs+
	 2qyeSvBb4g1eywdr/uI2kazzzH4613rx273yYY5D4sydR8rTiRBnGaNc+PuQJ7OkXKchO
	 seINinq7szzbutUVoxyckoyJ73HQxA7uEanrWpWqv96n6YnehAvdEeEQfIfART3JBGqOD
	 Hz3yNVZ1zkNcs6yMSj81qYWSsTKGABihZVQ80O4zw8LBQchyC8ocdQtA3r5SH1BxPiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=TwCo9SzeZScPiYYE2ORgBRCvYQ2L6W/HhHWZ76KVVDs=;
	b=GnNKyIM8NYfAHJhF7PFTqIWCJXXIoKoC8qetO0zK5/t9dlpc0C8irAen89vaKH24qT6O
	 zKWzy0DtJ/BxHtFvnvLmSJc8UEGdR+uSqlhW5E0PYl7i9Ba3ZLztGvOprlsDMNLXMGF96
	 s4PHNxVe4ZwnV4NSgZmKPamGftQOdEFwGLEhJRP14b7Qs4pgBabXQDuTxk7/iXXLpyARP
	 MDMmA1oOw5/R64Z+JDDbx6NaE9orhvkJmUQDF4+HF7KQkdkOsvLlianUkL3FuWi9+TGzd
	 LaQCxD/uIJeRaJYD70iqn4F64hTCCNaipy167wo2wxbOmdCRc3SB++ypA26MdIQPYaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276218;
	bh=TwCo9SzeZScPiYYE2ORgBRCvYQ2L6W/HhHWZ76KVVDs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kCMTWP5zKuNHraFnMeau1JXAIo7vvDfUXfEJN5JLBh8hcqsMBKFmocsaD+ZR2i6I2
	 0xcihlgQzVHcHXFE5WdRmAiBkoplkA3gWzGkZxV9dJI+J71n/El/t9ldt2vzrt54ch
	 PwdOahg6ld+fVrdpqy9aV673Hf78ss5eYZZBVCO2eec7LmjbHt0wUqumoDuQ4bUjLP
	 ZFPeY2+nmD9RMrQuqB93MKp1gU+GpBhrULQ+SlfzoIg7a4+iQxPpVKbT05e3iRygBc
	 pHmj59RRP3mjiP587/OQTAYe5ggVlZRWzRmgAcZm3OF1N56hCFwr8SQfUz4oMlk1B0
	 f5WCcqcEl1xMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941E440B1D;
	Thu, 24 Sep 2026 18:56:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D1C5328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E4F540AD4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfIbMNxsLgzI for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4496840AB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=A7t7ON8FvaihpLPBsm2DeSNR2Y40p82iYEBok4pwJgiIulLm5w8MReVjzEv0oTwXjG7c
 8VwkqvGAhDQxI3q6Bp5ACZvYAdGHnKy9kYld5ce1QWapzh8Vav4/D28Atp21Ob/Zs7yRg
 CmOILLHx3a2wiI9atG2Lj9wOtr79CJIK4vwaS0XIj/RzmdDIX61/n43vIhOjy5VbIItP0
 P/wz2YaWNmKWgs13Nb+F04BPztEUQlsvSqGv7XRcSMKjKHSdoeN+lK1STrkhGr7Qc+srf
 V/hMJ0ms+3/UNzAOlhM4/viSKiGnPqeRpP+QY7+MoZtvx4NHivjJ4TbihcgY+0XTjLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1zQjMYO51MAeNTOtJ5LFezTeYRay1Zlm/EobwHfGXxc=;
 b=HEjyHPNCAJOvORGjJrFmULAeRnqHcN34tV7WjtrFUV2oFu9Wy6IIf3tBeX1OK//8OhsO
 d7E00U50zzMSGwQz8jPRdwtEev6CaDXtveOeG51RaKzytpWuSqVO4/PQpynk+OuorXuZV
 7w9kc2F3zygSanRQ5O9lQ43h92FndIFHSsn7DvmOarboMRgaz+IqnQdrLJJoJhKkxPWyZ
 9GZaHMIiQ/O5vEkJfHFu3FwnEi86KkHHYq84u+9d+sy1AVpWraGKxGiD8bEhXqR6sxD0F
 l+izd8vuHdClamzRdc7GNHL3JM4kcBcScgviqEDdZoCf9vZEEX8J9iwHn6TwiOsr1Ew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4496840AB8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC5D098385; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:46:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 029033171c7194f66e526895268694b355a658d9
X-Git-Newrev: 9d2c262030be7eb7d402a389fe8e81832754cab0
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.DC5D098385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/getdeveloperlib.py:
 fix regexp used to find package infra
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
Content-Type: multipart/mixed; boundary="===============2105295574861060200=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2105295574861060200==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d2c262030be7eb7d402a389fe8e81832754cab0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

There's recently been autobuilder failures on
toolchain-external-bootlin, but I wasn't getting notified in the daily
autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
contains:

N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[...]
F:      toolchain/

And indeed, testing:

$ ./utils/get-developers -p toolchain-external-bootlin

returned nothing.

Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
used to find the package infrastructure, and ultimately decide if a
given .mk file contains a package, was a bit too strict:

"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"

This would only allow packages named <something>-package or
host-<something>-package, but the <something> should not contain any
dash ("-"). So this works fine for cmake-package,
host-autotools-package, but not for toolchain-external-package where
<something> is toolchain-external and it contains a dash.

We fix this by relaxing the regexp a bit and allowing any character in
<something>. Consider the rest of the regexp that expects $(eval
$(<host>-<something>-package)), it seems highly unlikely to match
anything else but the line we're interested in.

With this fix:

$ ./utils/get-developers -p toolchain-external-bootlin
Giulio Benetti <giulio.benetti@benettiengineering.com>
Romain Naour <romain.naour@gmail.com>
Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This issue has existed since the toolchain-external-package
infrastructure had been added.

Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: introduce toolchain-external-package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 592d5c517ef6ed003450189cf0c4d7af8801de59)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/getdeveloperlib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b5e7b89e72..4321df8bfe 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -12,7 +12,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
 # Patch parsing functions
 #
 
-FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def analyze_patch(patch):
@@ -35,7 +35,7 @@ def analyze_patch(patch):
     return (files, infras)
 
 
-FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
+FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?(.*)-package\)\)$")
 
 
 def fname_get_package_infra(fname):

--===============2105295574861060200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2105295574861060200==--
