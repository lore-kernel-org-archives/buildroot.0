Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34089C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 484084082A;
	Thu, 10 Sep 2026 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVaKfRnWIidI; Thu, 10 Sep 2026 19:49:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4944E40A06
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069792;
	b=kzp04CtsozAw2ObdpomwUFhI8jTti2bamDlMUeUMbshYOxtp7/d8xuZdEi/uCtrCLfRO
	 99krCf6kvwb2lRqbY1hZNT++CHCtZY8olU0kR4Wbp8zOh49bWfZZOvtljRzzXzrOLHo+7
	 /yLDUbL3vBrd1kiy/3oK5Qqx/Flvi2SYzGbOWk3asDNUNl7gBDByPox7TFOyT6fNP7sqz
	 GFCzGT/YRSXmhVVU7wAtWX/Egu2iYBYXnszTbl3/SNXH34HU6zZu3WYmH1rPebp6cblHp
	 ihcPdWbIcgjp4TcEna1iFlOcOR0gZL5CpRtN8mPkHXnrm2sNHeDaCMxRHMSQezruj/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hMMwOukOdMAUfT26HhYX94KKUTnMTlb4lwsmT/Liaok=;
	b=mT6LFQMzIxsNJ4mkJfRiKjFhTd5D9AkW/paGF2MkqPQ9J4zTJmVebFBRG1GeOkjtgJfm
	 T7ThJp9N3ExQA7Yxb0Unz4Js7gZC9EELh8LngOukXzgHiBjqcEaQsj8kowCI8Acq0QPo/
	 ivWElVlh65Z8EzCoiE2aRkip8mAEHN7nCnLJqL9pmz0wo5juBR/vOpEAwywkK3SGtp0NB
	 Nx9QGlfAVoCaTR6ppZb7QqxV585Wm/xwBTbkt+SEq/w+I0Frp+H+dxYyYx0NSQy+ujsft
	 /xTe1rC/aSV4hQCJnJcvQbFmgjjY965WTCV8WRd/2y/Uj1NfH2VV64tuKKT8WF4kF/Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069792;
	bh=hMMwOukOdMAUfT26HhYX94KKUTnMTlb4lwsmT/Liaok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LB0W7S1kcRLw09qOOfl5bjI952Z8g74sM7WFVPqSCqqbgHC5KwS6l3qNtHyzm6WOL
	 T7k1rR0QjCj+zNPFbjRYj/I3u7jZMpV83zKMYT+0dwNtEEiZKVgS+5hREIn/yz4uez
	 V43uvi1ZOVoc2SHLiwKtRf5UF/WiYN6afAGUM22n0VAuNHt51l8SWP31e/GtHkRw9y
	 vavuTYhevaVKTUXCYUARjRn0FVv6VRPUEmjp/e/izduxMGW14fjxle3paBCRWbVqZc
	 iGxwRpKnfbT2yWeTEPhURXpP26EjmLBjgRoQRlS9U2GBlUN0TgnUKKb09I+RZmahFU
	 kx/aGz3GptEdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4944E40A06;
	Thu, 10 Sep 2026 19:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBC6786
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91FB24082A
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ORh6cIRDo3c for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:49:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D2713407FB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069788;
 b=n+RFZaZ0HmxUiT8CwVuFY6ZcM+lCA4DBYuKr4KAha4GCyDEQMzhVvf1bijFsfZJBu0n3
 40Z/m1Mxpe4o5jwsUa/K71CeDQ+qKjSwdVZoEap8MhyxAh3Akk6wClz6ORBL6EW7pWHK2
 bMqUINQJkBZbJ0S8HeZiaA4bb/iCwPvZ6cYQtrgd4lRr7uyXlHHRFrRb4Bh4dxhmgFaw8
 ifiKSnCI9pLnopXeDiPnW5o6wjheiM5FWlWoxXZCCFscNYcC4RzPgXgt7nNd5v3NpT6qT
 sVt//kZBRXbO9cNrtVyaY/s8Hwb/Xp9Sn041SVOg10ZlfOTw6z7CbHyzvT+xNB9WXWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069788;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4mD7z4CCAPEZ9fdUyazkCnYcjYG76+SW+J2macQoNuM=;
 b=pgIaaKeVll/oADi20Dk4jbILeUSTaBKMTdNe3VuvbEb1IbfmDuUMgFUtSNtcGMNXYbWM
 9DLy778AuJuQH72FPqt09K8Nwt3DNfWgb2B/wjzg1YTexXQGzUCYfwWJex8pWePglOc14
 buxKiPuHkVCZnrp2bMw2fr5J3GTuze1BYG3E/Cd8gbVx+ZsGnpoX443VYmBAZ/V3A4T6P
 VFGj5wIrvZOjE+tTVfYtabUSX1YBb09kyH8luHHdw+t4bPcr2FGp6BJ7pnodvNozudAMA
 25hJMXpmLFBrTPBIhOl+JnsbU/g1Ttz2fNQlcJLE6ZFFMfr8MxT1zmCHbB+Y27m6xMg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2713407FB
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41DD595549; Thu, 10 Sep 2026 19:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:48:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2603561b12b8c7d8f4737147182d6c487eba077c
X-Git-Newrev: 8067813e99e4bbdbaceae44459cc3074c8258abf
X-Patchwork-Hint: ignore
Message-Id: <20260910194845.41DD595549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 3.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8067813e99e4bbdbaceae44459cc3074c8258abf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08972cd035..3c33ad0536 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  f508595cc0951a77b70c07100df1b4ff  cython-3.1.3.tar.gz
-sha256  10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089  cython-3.1.3.tar.gz
+md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
+sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 50e2e6e1cc..f99dddc310 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.1.3
+PYTHON_CYTHON_VERSION = 3.2.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
