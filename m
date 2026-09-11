Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295AC79FA1
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 06:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71268811B1;
	Fri, 11 Sep 2026 06:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWi14IA6ymtM; Fri, 11 Sep 2026 06:00:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 28D61811BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789106405;
	b=QnDJatp0kkaLwvzKTMS618rG6MIQ7Hh3+D0L9aY78rKMfNNtrH1I3ioI4XNuW/KCGWu1
	 acdZ3JqppI86tK+sTH/mKREdJ9RDemA+nrRyaUxF1FNqWRmyicpmpodAQNi9f1knxkiFn
	 qjASTwBZd5Y+NJ5e0rfsN/E+4aGfl4pHNMy6i/K2BHr+ySSB15wN4soVcWOy5Xf6nJtjk
	 magNVEoRKMH/0ntONUfNrjoy3hgyupnA3IXFozG0xtbvNI1o5TAwgD426osaU+4SAhX+n
	 4YhUWfLTYJ5w3rCaABICfzZ2RMy7dxVvjHek8Be3/fZ+S57Xj4Y1ZRC229pgx8WdVUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789106405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=urzcRFenlgpN94Ufd6k2qwfVYu6o2Aqij8DnAIu6sWs=;
	b=QsXuT6xeUpaL4w7SAOHN2cdobSCIll5YxOGvsrPnR55OUcm8DKhJzV9bQxrIY6aY40Rt
	 t58J5JqE4i90CV9DsQfo9S3tg0s7RE2Ar3NFQwIreDNEVE+casyN9MC49jq9xcz7MGd0m
	 uUNC8uMbPiKPhPXgVzeVqZrgYrST68g/Fu2Gx6KmYJEaCX2xI99LojVs5NyQwWGjoYjJb
	 sXTMRxcoW1ndYiujKcvt8byg9K6Y/aqS7nFmgNQsgCGaWVu7FHQvD7xqGZhCdCcNKMfz6
	 pEuTUXfwS+3y1+ubiRuuEQDps8bDdXwUXtPW9xdPRWckzg11gGUCjXE+XfpU38ays8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789106405;
	bh=urzcRFenlgpN94Ufd6k2qwfVYu6o2Aqij8DnAIu6sWs=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQOzChbBESdORp8ox+q8A8JDF4uyCBgnDcZglPPIaYghpwnZThogoyQxlAaprzSNO
	 /kxLE+Wd21CntRIRc4gRqkFWAxM1bgSAwJx++QLpXy2N+18/LTlR9/n93OKhujcsry
	 KUepPDX8aZLdnTSjib0JgcyIR0oqq7YUy30MqV3M5LCnQEJVQo27EQVXKi4c81g+/d
	 o2ddbZEPwAwfhcz4BfdmR2QCF1MOgcbXD+pSr5HaZBZJiT6czbV0qEO6OaGaJfWAG/
	 tNTB105a7gCywsKYoZKIVSxQ15C8mmK2BRxg+DryMvQvanVU+YcOC2+f0FipQ00pt3
	 vf9e1iR0lMFvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D61811BD;
	Fri, 11 Sep 2026 06:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B842D0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003884043E
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIA61uPuu1rx for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 06:00:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D147340422
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789106402;
 b=Zov6GZKdtf+ULKhabCeRx1rQ00Rnl3pl+GqyF4HAGIy8jNR4sIFmeo5zUQnJ3TsNXn4V
 bqBWx4EEPXVGu8Qp669Su3Tu/JjBcg23fFAZbEfVcCK2vys+1z3ld5+IqPo4laA5bMMGv
 ucEdK7/CToV3C1DAhWChB9+gp+JKDUrX00xnvw1G5w7VmSFNHmX9dWFSxnXsWXK3Rlpss
 2nqjb38yLL0rYGnCYlbg/ak7MTkuR5fVaJRsSPU7fgFviVnhe0pQU99ZjwMBRV8dzcyCa
 kDs/TDw85TJ09zlGzhbcarh1HL5R3h1UQiaWMgShiSELSau2mhhFM4pnl2pyBt1TS0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789106402;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=2JCPYT1mGOytkQcQMQXUhSWyqVNq5KZ9HL5fUlR5BU0=;
 b=bg8NnWts1rnIRmfX7lBTb/4s5uSUdYrB1+mSCn1TEAy2+33OX3IKU9n+ObaQnqnO9Msq
 dXswrcQ/TgYwRRmqtIJ9umWcO5fP/YwLHt7O4KR4ESxCy7gp+GCiP+3I+KarBJ5MZpeL3
 t7rqEi63y7SWB/20mxj9qH2xgfZ1gDiD95F/LUG5CxcYfJ55Yt6CC2eoeBHKQjVlKx40D
 Eeuqa1fgKG96Ik3w0ntHmQ2QzVzGd4oyhtpcKBD3Chct9wq33JY49i3ho+Qn7TCzr0yXj
 8lgCPjbLE3OxFL6VQIC/L0oLrzNgPK19xXEaTuIay2BLTnXQODPs9/puJrH8dXDobng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=MDekZegX; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=MDekZegX
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D147340422
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 06:00:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=MDekZegX21V7PkEMPJSlFQUB15vFSncWGqP1spiuG63zvRqi+RNPDsJOJ3myMlelhIDKKlkghFSmve13L4ZWj6qXMqYIrTHxE3hRw9zYbFSz3Dwi8HqiZpDhGCFR04yXOG1gVpJFMPZHntifNESwT/TQGlkxQqXMZnEUchrLcrlG6hbAVV4j12EPuZJ83NXObVgeg1Tx5DPzWpwL1QR/KHk7FFcVOt2RHRDbhNE4SW2CkIyF4ojldCFp+RKBMtUp9PJE79NsJebxC/w3L87cbsjhkh30+Kt04W2kAYzNWe2lxhicDDrTfsRql8KVOT6dGmnsIVfuVYeBpTJBTgCQ5w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=EbjfmGXYLuSGDsGrbSU27163qSAu5RuP2gp2JMA7rQE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1484817334; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 05:59:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x4uIg-0000000Ev4q-0Nwc;
 Fri, 11 Sep 2026 07:59:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
In-Reply-To: <buildroot-2025.02.18-announce-1789067743@buildroot.org> (Arnout
 Vandecappelle via buildroot's message of "Thu,
 10 Sep 2026 21:19:27 +0200")
References: <buildroot-2025.02.18-announce-1789067743@buildroot.org>
Date: Fri, 11 Sep 2026 07:59:49 +0200
Message-ID: <87ecf0l44q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot 2025.02.18 released
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

Hi,

Thanks for doing the release! Some minor comments:

 > Important / security related fixes:
..
 > glibc: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435, CVE-2026-6238,
 >   CVE-2026-6368, CVE-2026-6791, CVE-2026-77117, CVE-2026-80489
..
 > localedef: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435,
 >   CVE-2026-6238, CVE-2026-6368, CVE-2026-6791, CVE-2026-77117,
 >   CVE-2026-80489

I don't think it makes a lot of sense to list the glibc security fixes
twice, just like we wouldn't list mesa3d security fixes for
mesa3d-headers. Maybe adjust your script to filter out packages setting
a custom _DL_SUBDIR?


 > Toolchain:

 > - linux-headers: bump to 5.10.269, 5.15.220, 6.1.187, 6.6.156, 6.12.109
 > - powerpc: correctly track libquadmath

..

 > Updated / fixed packages: avro-c, bind, clamav, collectd, dejavu,
 >   dnsmasq, dpdk, dracut, erlang, exiv2, expat, gcc-bare-metal, gdb,
 >   glibc, go, haproxy, hostapd, libcurl, libde265, libgit2, libheif,
 >   libldns, libopenssl, libssh2, libxkbcommon, libxml-parser-perl,
 >   libxml2, linux, linux-headers, linux-tools, localedef, mongoose,
 >   mosquitto, newt, nodejs, opencv4, openssh, openvpn, perl, powerpc,

We do not have a "powerpc" package, so I guess that was somehow in
relation to the toolchain change?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
