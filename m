Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92BCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D460C42E26;
	Sat, 30 May 2026 09:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ol4GPgUYMBJ; Sat, 30 May 2026 09:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53FA142E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131649;
	bh=xrw4rxo2Ug34kHWHhz7AIrR01BsYNLXtCeD7FkFoW4s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cu+v89QCtA0X0o8Rp7F65GcvzXRv2p/B8Yi4y8Wpa8QDwurrWS0VCpDk4JvI0AbnC
	 aqO9CgZDulf3nxNTSD7siH4S58I+hzPclJdIPCTLqnbrf6pz63OEVkztMEemrVv2wg
	 0Mr8ZqJHLx9DwN7pTeJ4QfmObf3Hr0fZYGa4IjBQVh/KOQru/X/808KAHEJ8en3c97
	 bQO9KXVkPNrjz+s/l61JRw3fGQ1hfM9ity65ZtMjosGNYtQ5IRuUDDKhKTp8QXVp71
	 s1e68j5tbUN/lHuUZkmEDHJok7wzwW0eCGci59kyg96DYEhrZIEs4rD04FEe/RKVue
	 g4AdJMBOYqWPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53FA142E02;
	Sat, 30 May 2026 09:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F264F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C8666F48C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQ-wUY8nwcEc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D35460649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D35460649
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D35460649
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:00:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -461843908; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 09:00:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFYg-00000004jcQ-0M59;
 Sat, 30 May 2026 11:00:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-6-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:13 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-6-thomas.perale@mind.be>
Date: Sat, 30 May 2026 11:00:42 +0200
Message-ID: <8733z98e6d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cLI7U7nLy+qx0Qud80dtZJqfbqueFvWINi1e8I0Zgn+0BBqSlV4ql4awl2OxMp9jQZN+0Q8nzhovE/PBTht11wImjzaZmtjKPdv426OFcNIssS0OuhVvXiHC8m9KprM1H9sbJ4wRLQpyYzkJQZFEu1JInz0hUA26j49mcDHl1e4q4n7lgt2/KrbJgnTU9fGpZ7k/Akl7xmgm1SScjKxsPt+CNle9mzJB4HJnZRKoWGz4ah13lz8ilxPSrsaPMi+PjtPYKEhRl0BOCIXUbW5DUtBQi/Qrqb9EcudJFngx/pRf2B2Wy6D8HMI+1g4H0aioRAbX3e/99p+ImVPmzcBBHg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=SW4rci5CkmgQtc7xJkIff9cfkmO2P+t67oEXWj0ekUc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=cLI7U7nL
Subject: Re: [Buildroot] [PATCH] package/libgit2: update CPE vendor
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
 > package.

 > The previous CPE hasn't been used since 2016 while the new one has 10
 > new CVEs assigned to it.

 > See the GHSA [1] and the associated CVE [2].

 > [1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
 > [2] https://nvd.nist.gov/vuln/detail/cve-2024-24577

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
