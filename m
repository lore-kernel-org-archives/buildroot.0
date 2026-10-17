Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E4ACCF2C4
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D5D64092B;
	Sat, 17 Oct 2026 19:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COV8kQCu1u7H; Sat, 17 Oct 2026 19:44:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 431AD4091C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792266255;
	b=ZbH5fYcRtje8BI70VZzZmXrzn0YA4xWjDGWba/KrcHZvGBP/k0g9CCtsv/vr9xq3Y52v
	 1vg0ZZ/gG681TZLGGhwiyoCt09ctFdq2ljnf6p4vc2UW2zFLZqg0gEn+ejX7CIfapv2uy
	 JQ+xmkMdyagYI2RCr7B0yXfSbLwbFnLwk+blBY9bLPDM81AUYqQuu7y1l93A0Jwk6K2Z+
	 rvIxlRoX+VHT/Rc6CNhjlS5bv2KXwZhp1UXIcGh6uCJH+JCVbR2bzx/mw8Zt9ycIj4Rek
	 rmpQz8Rm5oRN4/IjO3YG1ge8DQCS+TWF1WUOtiziVf5sp1lM/CLgiDyNcY7mfTMtoUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792266255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ILDNEcx81tlk7SkoKMulmRCH5HPSqyxNBdpkf9gfiUw=;
	b=Q+reDz9bxrTg1fxvWHlodg71DwBzm8kj4M6vs/KfDLnKNunp4n/I/ofLX8mf+CAGQmdu
	 Q2+EhkLpmEP+L6ZBUCxZZEonS9dEBNk8UGfNJjE1m3zzBKBq4U0bm939a1BQHSfW8jaID
	 iiqpfS01JNW3WMajSTlnKTsFKIO55MyuoJZDnfh2dOtcem+X0MDko/bRAsDrVmvLXE3po
	 3DVJOdOCI7dAErTNV3plDx980BQWzy3gWVGG/lCM+YXmR+JfY3Hn4ak/nueb3Q8nFQfid
	 2SQM4NUt6eqQLIw82hq9hRIF/5K3s3F8RM+KvTypXWUh7H0c8odph2pD6N/szEdjosQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792266255;
	bh=ILDNEcx81tlk7SkoKMulmRCH5HPSqyxNBdpkf9gfiUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XxJ/llOn2hKv/h+UmFDtePgxAXuZR3EhSYdmLegNWzayr1Ky0c5qjeVkpTj03VaiJ
	 2V4tTM/MCKkWFhq3RYqGZ3rX2s1wD6xCOUNsTAusLz/GYJ1wmcI0Jyvbw4rUeOVtMT
	 27SwCM9HYycXrX8qvZLZT4odPlAmT/ukTepLeRefJrIuIUbF8nhLAvJsG/j+Z7OiF8
	 m2Wp7TmebQdK7kV0VfCLtC70vMC8yUcIo6fFBcEfPYmqOZxyIqw4ktLlZuCjFliYOq
	 tHoln7XT2Kj4lHFtr+s6YCz6nb8isOWrIRCdBQ1Ng8OGYF1gj7EKdjRKUItd91ikNe
	 3Afyl6MovFd+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 431AD4091C;
	Sat, 17 Oct 2026 19:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAB2DCF
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E32781114
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPMyi-j8ATAJ for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEA4981105
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792266247;
 b=gwbOW0gokq2OMwLwt3xnN9Wpr0FMqg64f3dkBDQiz7avfI72y59pWGyAjnWh79jZPQLq
 rR9Fz9SIp5hndj7QpRTUlWAZsm4jqGovLKB1Md14UyN66+hjYEy5guxhdptht/BNefTv4
 KZENTjnsmBnnldXeW10rivBTKCtHkH8G1GVhtv37RX3lITl43CvMnSF1YwCgPtOAVCqsN
 3vcdPSW/Nn+21yzxAGLcqGv/FjmtKg0XPEOxFmR/uly9S6xaMhlB/3owL4SSQzhDD3IJk
 AvG+L5Hl6xRvISB/m7QftZVW4gSUyyzAEkzHI9DDJPf3/xIFwdpObJBrhIgOc4qoRlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792266247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LzFuYUpA65f2afDEFqx9BKQSR2S8CphGDO9p9q+X35c=;
 b=gsl7j4OltCfw0O8xpLzizb8Re6QNXTRoCMhjW0WT40P9qSB/RrYo8KX5YefLrcC7y6fW
 8ygoYk3AfSbWzIzqZDUm6ceIQUDieVuAUnbg5WQo715wwSV0e3dq0U5L61pB9ONf1UqAR
 iIr7+9ABNtlN6X5BF8rqKX1N6PaVHbp/IojJ6wQZEW+Vb8YNcO6SeO9FjS8HdJ6D9UDl3
 zf9k9gWLGkecq+BqBpVlD5hD742Oxn58SusfJ08tr2MazNTCyZFRVUFYCCekpR5vQO9qP
 aZTCuZc0GqkLGU6A+rkGzC8pEjCuuf8tk1KM0uDi4HaWVCnDMZZ3cO/FWwd7E8l9I4g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA4981105
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 194C6959FA; Sat, 17 Oct 2026 19:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 21:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 437e7be84309782f322526a636526caa962ca784
X-Git-Newrev: d6243220d771684129a8db85add129fee4a61712
X-Patchwork-Hint: ignore
Message-Id: <20261017194246.194C6959FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/librecomputer/lafrite/readme.txt:
 document UART pinout
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6243220d771684129a8db85add129fee4a61712
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The lafrite board exposes the console UART on the GPIO header.  Document the
pinout for ease of use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/librecomputer/lafrite/readme.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index c439c5e91d..86afa855e6 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -32,3 +32,10 @@ How to boot
 
 Insert flash drive to the USB connector furthest away from the IR
 receiver and power up board. The system will boot automatically.
+
+A serial console is available on the GPIO header with the following
+pinout:
+
+- TX: pin 3
+- RX: pin 5
+- Ground: pin 6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
