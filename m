Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451D7C87FCB
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 07:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F169C60B01;
	Fri,  8 Aug 2025 07:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_npb68NDjxT; Fri,  8 Aug 2025 07:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E2D60A96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39E2D60A96;
	Fri,  8 Aug 2025 07:17:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0059A9CF
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 07:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C1340A78
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 07:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdTroRpRE9Iq for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 07:17:54 +0000 (UTC)
X-Greylist: delayed 674 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 08 Aug 2025 07:17:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F9C440288
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9C440288
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F9C440288
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 07:17:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2133774446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 08 Aug 2025 07:06:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ukHBS-0031c4-2r;
 Fri, 08 Aug 2025 09:06:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250805110636.3514105-1-peter@korsgaard.com>
 <44e904ca6a5335b912f3f93f331e27a9@free.fr>
Date: Fri, 08 Aug 2025 09:06:34 +0200
In-Reply-To: <44e904ca6a5335b912f3f93f331e27a9@free.fr> (Julien Olivain's
 message of "Fri, 08 Aug 2025 00:01:07 +0200")
Message-ID: <87ectmgumd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nAI/iXSXIWiGX6UQk2SJ6QHy1LxK/cpeKwofxTEv8rFsqvMSVgsTkaSqGrGISCVAWC85nRlMSXaWSPi3C38mT+omGVbzWwHMX5qHkbwHPvOo1jM0XB0GB8I4uWYRwW8nooT74JjVpE97L6DC8/cnfNl4Oa34xHv7Om5mzDRjkhFX5Xoq4NM4vQb/qxAVza+7UjSOmqbCr7WGO6XrXbtUdVG2+QtvKLmkizdQvfaM6RqLqPkZTQGQgURHqclzcO1WJtj9cy4Qyn8g7oVZbqNV5JkZqR1z9WyAamXBDjNzmm9zvbj4RAN0FAiuJB4waCddN2rtMCREFrV0etwzMukblA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mf3cKd3254KpuyrrJonj63ZH4fqweb24MkhxBqPBBOE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=nAI/iXSX
Subject: Re: [Buildroot] [PATCH] package/glibc: security bump to version
 2.41-70
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

 > Applied to master, thanks.

 > For info, I also added a note in the commit log that power10 is
 > currently
 > not supported in Buildroot. See:
 > https://gitlab.com/buildroot.org/buildroot/-/commit/feaf53585a12d97802a67fd557ffc7340bbe6e13

Ahh yes, true - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
