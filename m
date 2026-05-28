Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A72BCD4F54
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 22:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AAA1608DE;
	Thu, 28 May 2026 22:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmSWIBO7mbhr; Thu, 28 May 2026 22:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3620D608E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780007251;
	bh=lyksY7ZIWOnshVcpu0Ac1Id4LhDLlX/ki6aID50SEzU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rk/fDz5f1HOI04t24ptUVFvsE9LcwScw//xMVjMXhW7PfqWyL/1DTH/ZYM1JPgXjd
	 +/Gl2WL6fse7hmZdgMbj0saQ0OymLOehyJp40fMFIDE/c+4eyaau9aIwFQUVgAfzjq
	 8JyGHcbKizecia4803c06IXF3GqXA2NjKAfXoRj8eidkWp+WwyjaMmp6IYnif1Y0q1
	 SJDJWlEoXUVWE/HIOZUAbVZvguhixQCZBj60A0pwHI7lhJarD7ZIBNZasJKr56+3Cu
	 V0IZWeROorw+uxAFWFeGoTHQFQpXZvqibtMUZXJJ9vEfBwRQSQGnJeCpWf3ifqQAOR
	 RT4hzTvKoXPuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3620D608E3;
	Thu, 28 May 2026 22:27:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9909E28E
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8785F81916
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xo3B_igqUQ7m for <buildroot@buildroot.org>;
 Thu, 28 May 2026 22:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44F5681911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F5681911
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44F5681911
 for <buildroot@buildroot.org>; Thu, 28 May 2026 22:27:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 240492739
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 May 2026 22:27:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSjC4-00000001UMj-0QlE
 for buildroot@buildroot.org; Fri, 29 May 2026 00:27:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 00:27:11 +0200
Message-ID: <8733zbkw5c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RBlIt0hnh7Xa7XPQ3Lv+O6uS4R7NO6uIrupDuqMsGzKApgn2xv6xL11CfIxtuXZMo9iHCsBgBMo37KCeCFzrRQVyEcDtUQmALhSDoOE/7ffRkK03Q8lFMg/GhYl0vONJNxm2VTK1/KxDYISwkI/w7OKTpA/74PfsPiXrwaQn/G1PIVKQGR3mr7ecIenqzsJm321Y298uKDeiuumUATvOhfqIUoAw/4b58+vmmfCHHbNsU6KTF8WiW7vHcq/vjpLI6KRqjf9CGdi66L84N57K/8l/ePcHCmvtgrlySAY6F8UFXIFBqJDONcsuylX+iev3B2139zAscc6QtqRUPKpPYw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=OMglWH9JmnGLwgSkl2ByBtiKbxNL27xuQTOCxg1P6yY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RBlIt0hn
Subject: [Buildroot] Buildroot 2026.05-rc3 released
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

Hi,

Buildroot 2026.05-rc3 is released - Go download it at:

https://buildroot.net/downloads/buildroot-2026.05-rc3.tar.gz

or

https://buildroot.net/downloads/buildroot-2026.05-rc3.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2026.05-rc3 tag)

Another week, another release candidate. For details, see the CHANGES
file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc3/CHANGES

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2026.05-rc2..

    13  Bernd Kuhls
     3  Peter Korsgaard
     1  Andreas Ziegler
     1  Viacheslav Bocharov

Expect the final 2026.05 release within a few days, unless anything big
shows up.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
