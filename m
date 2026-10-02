Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B3CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501D840DFE;
	Fri,  2 Oct 2026 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9VsA_LWd8iI; Fri,  2 Oct 2026 19:26:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 52AFE40DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969186;
	b=Zj/pObWmr3jSmfcAhRNBXPQuy8xBkRdkH8yH86L2putEbo9YBQOcUoqEF7IqK5mNWJOK
	 8AhXSSG6LFsIjZ+a7CTcQ8w1YfOscq39SCTRmTf8qZbn6krKwYe+4gTZZw+AQDVMybwyK
	 PuViRbTpoQXbuvbuB3pNJ6ZwCwsVBX00oYeAnSWmgLy1sdJoRAtMa1emFYJZdqYsSP/2B
	 ltHIxhGzi5dtqOuUDGkzTDYONBQLOemyqXAql4UZY1uffc2DogbIqrDWZn7sUJI1NBxc+
	 KnDMzya9NUvUyjsOK1XbsB7NMLLRC6oKmAKl3WSrYBzWvldmQLBjh8gBE2Ug3wvTlTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EftFJoUEoM+p6mwlXralHRcp+dkZDDM7kXtpCtOrBMY=;
	b=E6pZq0UNpzMXlTddmm3eo7o6O7zK2YSK2REaqfLcBcNjfupKalf+vSxGU6xrJncmCjeh
	 x7tqWaca/LuJ82Nq8IRGt2Rug7Azy92f6Xh3QEHmJyb9X0vWKe2Z1zNbc+VLDbp5hbSSv
	 z3qEN4Ec36cAd0Rgl6efCqOF+5KAEVY9YKxJeVc7kUsyRnpD23icwcjzExs3AKU/jd1E9
	 X2N/ZPK/GcJRLGQ6KRO1hoWGBcSqt51BFdsQDoJG2wqQ1NlBfcHUDdTlwLQKj7Lu9w2Hb
	 pdFylMnQRunR2o9HRcODzWkXU+ZoBeOTk4m8PTaWG2tXtYCVOFNMz/WwYDJpbYXMmHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969186;
	bh=EftFJoUEoM+p6mwlXralHRcp+dkZDDM7kXtpCtOrBMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sc79Pr2FBJdO4cgPmyX0gsp4uvrIEue7JoD8Z0vj5Hi3kj2IrwmPBWSdbM5ZIaqmX
	 3Fy7twZZcBnJLhxILOUXWvtJVsFPS//dJONt05f+xKf3TNp5s3KzbuCei1OCNkZF0G
	 U9ALif1svHdPO3/HQSHn3WfHnmhbjBSEXBPoErLJH7SMmXBctL+j7MaDCi0TrFheXK
	 7Ul+XLr9Gajhe/3oYAfMzGAmWvsjYu8YJviz9TBxuftrQ5c25YCnLkTzzY408QYP0D
	 OQZ5MC0zrmCPgE61dit+9skrIzHy5PFgWI8owXJ3CgEbGQW20//RmIpyhrz7A4TF2X
	 zuLbsXVFk3lkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AFE40DC6;
	Fri,  2 Oct 2026 19:26:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C097282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D49681183
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBwqEtfq3lPd for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BD7B580F2F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969183;
 b=opYxEum8aHzbqSjeejQy4/H13rWXInI/S7WgP9bI+m0/jtmcyEiemrCGylDFR6nsOT2p
 iTfyH3rqMOPASuUVUrCoGOVH2wpMW1SLAKC7cQ/dHp+AnJWdSAgWeZqHFJpkFVaNosb+q
 sK+02uC79J955tuNSJzX+d8jQgF9uyPXzIqN3/lbJQ/SsWyH4O9tdUfOJmbj2wsX34Mt+
 UnPscxfYoo+6K6Hmhta/Kq/xoPF9BOjUk4KkudNn0Y7cSa//XR6gK019+EERg5SwyXKpn
 rnQvMoETjmWuSzgwAy45OVcoMhSqZNikhSl4MGPcjvXF8IINZDZPJODRQo4CkN6MFxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969183;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fn9HtJqiFsx/uw1+msH+4sklKOWb73YlWoi/6xcL8Rw=;
 b=KyOLJu1i8tQqqBfxxI+UdgPrHLlwiv9U5gCxsrgG9XnfTgSD6hKzXxwPto7j7PPA7WI9
 0rqQy+2js45YesidiknVo+r5ntxOlum0Wg0Lfjob8JyiwA4TqHvnY7Ai3xEI7DNSbkIzp
 mF3P9aFCoDWSExVWwbGN4hww2TqdySXUeM7bJmH1KqKJbSWIL4R0EiBLcdeg0hqxV8Uzk
 skgWwICmj9i9zcw5AqjgafptKmviq27yXboDmBLECbbdbe5hTfr1vzw9uiAoMQG7cfun2
 tAlTqI2ipxY8pzVtojpbWJ2Bp2mKLiP19BhSHHiPuaXsMqyrTvvVuSbyJS+sjnHLK6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD7B580F2F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D6E6886BE; Fri,  2 Oct 2026 19:25:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:24:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa3db5b4e15c8dd67914d58c8d03ae2df3c92cab
X-Git-Newrev: f38b58850b0d6a4198cc656946f1304fa2fcff59
X-Patchwork-Hint: ignore
Message-Id: <20261002192509.6D6E6886BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.42.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f38b58850b0d6a4198cc656946f1304fa2fcff59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 0ddc8ced77..cde34582bc 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  168e97e1b790f6e9d1e43685019efecc4ee473d6b9f8c421b49c195336c0b725  janet-1.41.2.tar.gz
+sha256  2391f8c6565742dad1c5e8872ad1d570b64a239d5d1ef11a188fc6b400457a04  janet-1.42.1.tar.gz
 
 # Locally calculated
 sha256  16e31703a3ab5c4d3e35aa8bd607551911a9d981fbf0b5fbd832fe6eed4b70ca  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index bca7ff0500..d8264b1d4c 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.41.2
+JANET_VERSION = 1.42.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
