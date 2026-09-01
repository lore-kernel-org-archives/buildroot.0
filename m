Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E5BC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9316740A2B;
	Tue,  1 Sep 2026 21:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYAmgunjSWuk; Tue,  1 Sep 2026 21:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788297127;
	bh=HLLulpEj58wzQrSVU13IhvJnLD2BHBgiT0rlzkaLxJQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pH0lk38eDfopnkdeEUuY6zdRJ0kXlw3HG4k5dXyfbZqPCRf0FNkRHiw12qC5mDKqn
	 KXkzW/RN0+Vz9HPNnGoZ2VLez2FalQO9DlW9lLcXdX2usiLuc34AxKPA1I3T1Gmmyu
	 iPOoKfoNjTbotxzCm4fWdQQkrpWLkvug2ztRbgsOOvniAieSEHi08eyOo93OtG9NFo
	 sFLAun7BWnnzxFrvtVBeZtzWq4y/nQLBSBzePgfJk9VqAACjO9XJTrzFofwHc2fkQk
	 +xyrJU9GZOwpqBxgGKMfrz0vwV8Hn8ySgKppyf4SrcYXwkU3aJ0FqfPETOVL31+iJN
	 BPHUbr096hscw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060B640831;
	Tue,  1 Sep 2026 21:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D9E1127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBBFA80780
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asO6dUVO3mV0 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=eRR/xXag
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0635380EBC
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:12:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=eRR/xXagMYmUC/sUPU1rB9TIzxBdMHEV18ges8u62sio8jD0umW571TyO9iZS941dC6I7Irq2yZmP7PKFqKXKITc0gLPJy6qKiJD2XNJavUUJIiPGjnI4EFN15/d5HG6pf/O733lPlug91DCgsljxftQgLlrnqE2UoYkLJqTn0PBbG0ssX2gqS2OOZufWyBjqZoQffzL7x1bsD+skpHLAJklxgLLFEpMU3F5Xsn7+cgX2jLAjgIh4S/14taUJ9ak1GXx0bD4jlMkfIaXOU/X2dwkWRxtC3yoBhdCyCz4di00xNHnyHgqwIrl2I91YfCHtBsreoKwd1LQjp21PjiYKg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=evtj9KgPFy3DCa31XpPQkoLJTJ2VSK+FN8Gw0K81weo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1262445133; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 21:12:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1Vlu-00000004VF6-477X;
 Tue, 01 Sep 2026 23:11:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <ec4ac307d4302d02182457be822cfb6c@free.fr> (Julien Olivain's
 message of "Tue, 01 Sep 2026 22:48:12 +0200")
References: <20260901192724.1021544-1-peter@korsgaard.com>
 <ec4ac307d4302d02182457be822cfb6c@free.fr>
Date: Tue, 01 Sep 2026 23:11:58 +0200
Message-ID: <87y0dkwuap.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: bump version to 1.2.3
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Hi Peter,
 > The commit title says "1.2.3" but should rather be "1.12.3".

Ups, indeed ;)

 > On 01/09/2026 21:27, Peter Korsgaard wrote:
 >> Release notes:
 >> https://lists.gnu.org/archive/html/info-gnu/2026-08/msg00007.html
 >> Contains a number of bugfixes, some of which may have (low severity)
 >> security impact.  As stated by Werner Koch:
 >> All in all we received 26 reports alone from ANSSI but as even the
 >> reporter
 >> mentioned, the real world attack severity is not critical.  Thus we
 >> don't
 >> consider 1.12.3 a security fix release.  There are some bugs which
 >> should
 >> be fixed to avoid crashes, and thus may lead to DoS.  However,
 >> 16384 bit
 >> RSA keys can also be used for a practical DoS; it all depends on
 >> your use
 >> case.
 >> https://www.openwall.com/lists/oss-security/2026/08/31/11
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 > [...]
 >> diff --git a/package/libgcrypt/libgcrypt.mk
 >> b/package/libgcrypt/libgcrypt.mk
 >> index 0bc281da42..a49897fd4f 100644
 >> --- a/package/libgcrypt/libgcrypt.mk
 >> +++ b/package/libgcrypt/libgcrypt.mk
 >> @@ -4,7 +4,7 @@
 >> #
 >> ################################################################################
 >> -LIBGCRYPT_VERSION = 1.12.2
 >> +LIBGCRYPT_VERSION = 1.12.3

 > Also, this new version introduces build failures:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/2810830147

 > For reference, the previous version 1.12.2 passes test-pkg:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/2810888453

 > Since those fixes are described as low severity, we should probably
 > fix those before merging this bump.

Yes, I will take a look - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
