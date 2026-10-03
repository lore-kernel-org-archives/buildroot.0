Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97E4CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F8A60EF5;
	Sat,  3 Oct 2026 15:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nGmfbDkJOXX; Sat,  3 Oct 2026 15:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7FCA261054
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043023;
	b=JeF6AVXjN+N+DvY7qa0JuA5efNJ0RKkx6aXzfTVYr5KUtTz0cUSvf0uijeanRSb7p6cN
	 g1HJEoTxa36FrVJcV/MecqUMpW4vgV5RhkySkk0VeMciKY1GK0+1jKcywkzi04jG39H6Z
	 I3AYmrrTEnkCH5vpF9EERTvRkqd5FqeMbF4XAsngq8DnEBKtgBpOU7CM4+WnfJrjX3qHx
	 7Gp9kqFpwH2q+tYiczP3DxC//K5uyvyv8rhMUHjYlZwqtC8odMe+jc4DUb8/+unzcXrop
	 hvW+S1YaHsrcWwVgeLvhfHjLfLeknswcV9oXnSh1xUhpCunE/oxVAdmzPRcYzmOMcUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043023;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=idY3kdh0o4H8iXzuykwTqYlmrWk/Ya0cxBPGts2/tz4=;
	b=LzMkX0wsKCouglkB506jUrJ0jx5NE4I2VRVHvTkLsJJIX+KxBy1hRyCVfE6k5yzEXpWN
	 QNt8XgbmP+vC7xwlJfRGa7fz3KPN06Fsu6ud+dPuMT/Y3zdGTqylxI0p2nhLrbaWDDG76
	 FHxbMlysdZDRYn3AJR6uecX3uHDeaIM8GGamOnIWUQtdFLdzPZBCFAW3H6mhjgorITPe4
	 jCT/wYp1ja0Iv03BdbxZYyNALp+2U/XGKoMiuVMpCTU+8oGhCmTSV7jlYmX7oGthV+J9F
	 CElJ4XhwcpBM5CcZnbiy2YCZxL3AhgO2J8X+TxJAECevGU6cc3eP6sJAgAhy2HSJ1RA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043023;
	bh=idY3kdh0o4H8iXzuykwTqYlmrWk/Ya0cxBPGts2/tz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pIRG+W3vnD/iHx8n2EDeeCqv1tfMdU2NsBEAgAhADNbdn2Kg3geZvw5RoP6p0vNwY
	 UwmlsIoPzQUDNbiRTFwKhVLnyPRNVNQO4IKvmUl78jzSMoVjiUW5MJpr+MVzZ7Fo2I
	 zuYMVhkVghLO05ovdEDFVV0Ajhe8/PYiUwMzNaOKMxe7qiLIVSnjZlZqx2ajMI9mV2
	 g1a5NWCIJQy8HuObC15phothBhiiIfJA3MWXM0LBvnGWR+9WhnqBRl59Q4geU/ybSK
	 gGT+AsVtnNPBPt9tTDokiGYUgcvq6zjXlpVcsPN10boy5EOe3wThi7bEmXkLpUShm0
	 HMQWwEKKLTZxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCA261054;
	Sat,  3 Oct 2026 15:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69172476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E9760680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKYfyo2bR6OD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 02C90606D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=LgDzv/zz+yfWOYVSJa5fYeWjdC+scJDnGmqc+XkxADpy5y3sbAwdB2LpAuu0AivSjvZ3
 gNxEBNpxzKQXtyruqioCLujaYcFtF0sS6eqp2rfhpQsmC1UqxYhuNW4j7/EslXq/LfpJp
 Kt9wWuMTvvYyFhrOncf3H39nKi+0dO5p+59Ni9MtX+WyfqIlO6HSFHUNmI6VyPsoBLxf0
 uYguylX9kbfBqbAPgQVZyv4a6T/WbAUV+KOEsiDGmzPqTmXzbgAGlWqRbOe4hoLqPoWkY
 2ldHloYfxB7emj3Vp2e3A4W6zJxQ6mKDyZXe+7i8r44HeublCshJQn0sRnEzTWnUnWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ASLWCB419DxIqq8uJqqcxysOGUGWODkmSAzmOP2P7fM=;
 b=XTMHhaLokPJ3m6d9Dj4mAAqemLyi/n5M7dNh9NgT4CeQt0h5gD8QALXCALLBTjRib5Bc
 K1VdsKW9CsTEzQhOGmXjXduxV+dzANxYAKKqUyAnjRTmxK0cxyztASAGxgid+Icc2C86x
 OJwCI0/XzDTEsA/UlYrPX+JU7bvxveyEvY9+wx9vPOVFqc5GNDIlWCeAgTEr1XcnNSrf/
 bXHmNndE6maBAAew5xmNOZE4Ip1IdzI/AdB91yoE0VtYsNoPzEWea+Umcl+qBw9pl3jyZ
 tWGE4bihQb6aN19UXTWB7g079Yz5fILTEdnACtWsoARq4JfHsGB9FF0fY1JqBxTXJxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C90606D6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 429B0886C6; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 034373fb70bfac4b4b65152f4d30704b21cfb2aa
X-Git-Newrev: 3e57b7dd39386bc0bba70460d3e97cb86a85c069
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.429B0886C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: bump version to 1.26.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e57b7dd39386bc0bba70460d3e97cb86a85c069
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 49372996e8..9d317ae5f2 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  9cf85817e3a9553b19d413f9d1ce3687  jc-1.25.7.tar.gz
-sha256  63481e34d92715781e1b094eca7d76d122a14489463d45b7f3e8180f44ea3a10  jc-1.25.7.tar.gz
+md5  7d418aa0fce75da0e5623acd5833165c  jc-1.26.0.tar.gz
+sha256  576b5615b5677c7bf4aacf97dcc6c6b4bf437bbc420c7db77b43ae1785372c9e  jc-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index e07fe671a2..2e82109fdc 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.7
+PYTHON_JC_VERSION = 1.26.0
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a9/da/7827d3389d87fa645556d595a2a437576de83f7a7d4a5fceda9c32208c0b
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/95/5f/9e6e8dc65cb15662fcfc090a52ed4fc4334ab7703b42107bc992777d19a1
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
