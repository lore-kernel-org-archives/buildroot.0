Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B1CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E57D4065D;
	Tue, 13 Oct 2026 08:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgpprVP0kgaK; Tue, 13 Oct 2026 08:00:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0E9B4066C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878443;
	b=JMVKM6pguyQXEsx1u9aq5P+fo3WPWPk+EQjbQMyC3g7EmjKpDnZb/4thterfme218uqn
	 HcxAB7qihAtKInwNUQcRWjeBvWtbr3O0C+SG/2852DTjMe2p+HiVFD9AtPAJUzzyVBRCp
	 s31lQ1T8IlVdS6WPM5giKKzUCPS3pm1tqf4Iz7sONhcA+rGMcHJJ1FC7ItdfEUAoxy1Iu
	 wpzVCQ8rmPcpAUos6RYb8JPJaaoB9AWrAzHgdRXeBO5FjOvPZlQ0xQuHF1KZOkmHNXgUn
	 Mc1SQYhU9vs3go7IQ0+GCwCrBgo8f8lC8g9P7Tl6rfJGylODA5M8aybYKVGKZsJX12g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lPVuwG1c0nRnEBjAl68cebDYRW13j4qzLb79FnhLABw=;
	b=OcIkpm6hVmhGneB35AmmcSlLI/ucSoqSOTIdxtA1mxcOe824XN1ss1Mu7iBp/JpXT8pc
	 JEvniBeh1NirrmFPqeZ8IHUCs5FFsouiLS5BMBzuAT6x1N/P3TIMEUFEASbN04dWkvKMk
	 ogx9rmoGbs3csLsNhyvzDXPD8nLbOMm5qLfbMEQzL0RPSpc7eegK/qtXOcbZ6YXZhD0KR
	 FK6cEfYNK7HmRH0fxI0nlMPvcyiRMXv7zuJipn5o3tyLexygRvG4/r2QnJMFXD/K0QGz5
	 TAFgxvCFIJ5l91/D7945NwTJQpTUyzgn0p2pwwoddrH9CuHFz7eETNf4fdnrzEwHP/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878443;
	bh=lPVuwG1c0nRnEBjAl68cebDYRW13j4qzLb79FnhLABw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GeV6XxS8dwqQNJitWaYlhvrdhaXTIPnAVwLpbiukd/mlF8ymjq7SGNngCWQLrV19R
	 rRbXp3IKyhdY/Z2M1h4SuMyTSveZBNS9aATFkFz6PvFSwK6P92FkN09NvrPbYLitnA
	 6C7jDHmBvctb1sYZWEegspWjKca5tX7aQcmMSuT9iC6e0Tiuoep9PGNGVtMYM6Flut
	 JCJDLFnO2ouPu6NrN+7NeEgaVXFgsYeeIteOXFxbP3KhxjL7cXEAL5e1kOB/XtWCjA
	 bifmAlDzlj5wKOVxAOrZgOXcOIY9BdE7WeQJo85JE6EwlGUvaUWy3hu4MbYsPdXZbk
	 VIUG3d5xqQmyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E9B4066C;
	Tue, 13 Oct 2026 08:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21BC8DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13D8F401EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlqFVjyqP-K4 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5EF8B40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878437;
 b=gOWdJL0kiNwjY2Ud6sWTQav+1Y6CxFwuv8CSDmYhnhGOiFssMsu9OGhq+wrCDq/5cYpe
 Ke3Sb52a8w5gI44Mi80VoGQ4pprX3TY2mTZMZzrgvmCDPgp9QoiQt7diVvssBu4symhHu
 DGsfiKe05Ht6sMobukW0GJ16THt++DOqxnkKV4dmsQUTsaaE7gRpoMqAAetVhdKnAuVrX
 nDMUL2tsUpyGD6iHIj/AlTnn8PVoKTeJDzizrkw9ynm222JDzxImhKIUJlYyuuQsFAkzo
 l3LCuy+Jm7dBZzCncpS3Xmn5tkcnxALDeEaVlLskLvgtrv2zsVxQPap4SjoX/HvH+UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878437;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u5uQRAhr41vcLJVWPcH+BIGxdWQif2Sb9Q77IkqY2iI=;
 b=HWI6mAx9u9bGnX1uQZU/LaUdzJXl4+2xkKNTccqK+avYMynoCcKhSc4XuIBp6w4MSXJy
 s1cIzmiuhtqj0vsVAlsRPc8wCc90qXuOL8yWPzuRfxZh9qkYFW7UkobMPFphEA+Tuntxi
 kxfYx/QPZICGb+U6bRxo0DxigYQsfKoCP6BN6Ifmx5WFa6ht7yKuVGCvPmO4ZJ0tfhRDn
 eH32kh1q2IBZEf2/i1/uN4GASPFQL5leuc0KK/qXNd7e9NaPYONPQgOlIV+LdffATbV32
 RtufKPlJdZMwei5Lpm7NdJNcyiag7jmVu54kqr+rO7KmYeDtLb60iogjOGbLT6uBgjw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF8B40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C47C4953A2; Tue, 13 Oct 2026 07:59:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:00:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a10a7f174d530326f78ac3f8713e1a0d0454bd
X-Git-Newrev: a498c7cbf61089f154e9f53a033e77bb25089340
X-Patchwork-Hint: ignore
Message-Id: <20261013075917.C47C4953A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: move aichat to maintainer entry
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a498c7cbf61089f154e9f53a033e77bb25089340
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4324774a49..d731d5a0ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/aichat/
 F:	package/broot/
 F:	package/kibi/
 F:	package/nnn/
@@ -131,9 +132,6 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
-N:	Alexander Shirokov <shirokovalexs@gmail.com>
-F:	package/aichat/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
