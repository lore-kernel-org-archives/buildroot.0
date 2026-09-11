Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE70C88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA2D80EC2;
	Fri, 11 Sep 2026 21:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UO67gvSXEAE; Fri, 11 Sep 2026 21:29:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 40AF780EB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789162179;
	b=HRFUaIOfFJ4FYNenxPFpgpOe5Lt4Ulr+t/P0B7EdCFs2mNcyicktQjQGWx/qLlRdVRiE
	 pq91f1kP4QBr/rTviQhxN5aK37tzUtGN1huB+dKv9zVAT00kDmpLaouMi39q1+UFXb8gw
	 ZlPAOszhEohxsItG2Q2oCKzZX+pE/kNhMS4HRPBaicfuD1PIcF9OZLj3DfV9e/+TcIr0J
	 BVNj6R9ZxmDwX6UcHOKoLPcsABSk6DERfh4OeTeJYDGPtoqyudMMqYU0nf4q+vsnsKb7j
	 Vz2TtE+TuJFJYzxirZLdsU7gQZkUplpJQpUi8VcpB8dmFYp2Xb0tTtLlYTZGEQcmtLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789162179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9KhhSLjeppUXZMUdk79PoOM6mNNNHeM1TNO6/TJ/Bv8=;
	b=kCeqTYAUHe4Gmxot/D9arOqurWMRAR52b+8O2rcoYygRk2h4GEc3tnj6EueNQi0JPTut
	 sVnjzeqvjUWY4guBnH7QNOWWKRGz4jk5Sik2S4DSRwThXFEcwVlv4ZGc7/3ee2hux5brE
	 I5vuVFVDL8fVylEYb79dmdKc01eyt/cfCd1G3o625NMrHux7wIgHqMzrTwY4dUmAJk7zc
	 zvqohEML9CvlT6gRVvIFeLr6Tgi4nCyyV5km7HflnvnFAo2qTNJ3GvI/MkUCg1QeuZ6vx
	 iQYmPTS65MYFqwq5KJzeg8j3ENR0GNLyi0+rDjNJv1B+2iHWCgZC/xlCw/sqV45stog==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b="C7HaQ/EG";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789162179;
	bh=9KhhSLjeppUXZMUdk79PoOM6mNNNHeM1TNO6/TJ/Bv8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCDqL7qVP3afzKymD2lNSMto4Zo27UoDLR7CvBoscnmT6ZoJV6575SiPgQlXs2gtE
	 V24kCbaxLBxfLInLjporQAONPQqwfrq7NFHHEav8/OyJF6hIV1y+7vNKcaw1kpUStl
	 UI1CEASx2OWTOqDxQslOIW+2atWci60bsO+uKw07IijyRycRkWveDRIFsl3A8S3JMT
	 EIEl6j0aacekHkbXFuxI+SoGxbnqgtBk2ZYm6iDcd7P+MpnX1CsBF/o10oap2F/i+K
	 Z691Uil7KIUZf4jxIeB820MNxZF9kRdVEgkpDarnuMVB9g7grWcrfhrtKaRfAsTiKP
	 Ib4l2Gr/b6/Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40AF780EB5;
	Fri, 11 Sep 2026 21:29:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2E0032F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C8380EAD
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FT0oQ5k7ZvAF for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 21:29:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C9FB580EB0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789162176;
 b=olWEm3IM5qi6qQ5+hAE2izXIaABGpOSeBh1i0TzlB8JK0zvXrdoZlppqraVvgdyDOL1t
 oOiNVxF/ckbsTiuPt4HkPGGbjXS6i8o5uh7xnx5KOnj9Y/jxmDcspRpeo383JE8vGrCZ5
 q60B3w4uhTuuyDoCd7kxURdt0xHiSqmTFRerm+mBct8D2zXRmWO+yxxWALfvpuFG54aMJ
 3IMh7taYWOjJaubBDx+foUTTfIHg0qCWw0/3NQPlRur5Yq/rtnt2N4OZLEecnlSBfdkry
 I079uIh/OPVWTj8+Fx47veyBAggNyqN1gFpnB5CYmC217iLHJ/a8z+0Bfsa6kfrpI+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789162176;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=yX70pYaswBO+v/M/igL0sHzJNWM7DaF2n5/z2tm9CP0=;
 b=jba5xK8WzlMEGUpsWvEgSnHeZDXUadQjSuNgUmYJoDa7mVqU+0xC7MiDQpggxFHa+f+p
 N4D3TdkviYieX9U69245ZsNUJpiroSDOGHzrt61CM5gwJYEK0lHR58bX2C1UKqXHcU+65
 rZ3Tt8CQ538ju1AoF3n/Y53tpwI3loe3757m3ShFgDciX0Hqq0V++VG8CSlAmbWLALDpJ
 bAZjmSGpnNY0y6A19SAeyVJ4CUMwoJVtZb7t7lvO4L/xpUO/0dKFMkG0hITF5JNa7cKkZ
 Hb8awtGMO7PaiDWQseTP+MvryWblVi7D9KB140Y/2KzJZkdvLwNaifrJ5sUUqeDnD0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="C7HaQ/EG"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=C7HaQ/EG
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9FB580EB0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:29:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=C7HaQ/EG5eGUgGfAEOOpuhANcBy10dVRggxIjbRcL87yGi89OUTwoXy2UR5mmPzXlLlkFUnUtGY+o/M29bcm7jijcFTxLRzsZXM/MsMjguCqqfWHFeIDRhltvxFpug5o4g9cdzDal+y8spCqnQJy5gpHZuS+ySmCptJoI4umRbf/j/CD5JavICHbsSzpZ4lbK9EcpNjvRgQvfKehx6t5XUOrG1dymnrCHMJ5ug6Y6f1fX9UTJQJFWVzSo9RHI6R3ub8TPibhUCtdsKBimdijd9yiUzFaUchN+oLhp1hZEbol+YbWEJn51RXBPiErnTwa3Ue9P2Qt5+AnoSqS1PIulQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=b5NFgrFm1DJ50izToslq5o8bWrTkJJXO9tl3FG9lBNk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1908001461; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 21:29:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x58o8-0000000F73K-3q7K;
 Fri, 11 Sep 2026 23:29:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260906125857.BDA9295438@busybox.osuosl.org> (Julien Olivain
 via buildroot's message of "Sun, 6 Sep 2026 14:51:12 +0200")
References: <20260906125857.BDA9295438@busybox.osuosl.org>
Date: Fri, 11 Sep 2026 23:29:16 +0200
Message-ID: <877bkreatv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/igh-ethercat: remove stale
 patch 0002
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0718179694b407cb93f1603cdf845997dac7345
 > branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

 > igh-ethercat is failing while attempting to apply patches,
 > with error:

 >     Applying 0002-Linux-6.19.0-support.patch using patch:
 >     patching file devices/generic.c
 >     Reversed (or previously applied) patch detected!  Skipping patch.
 >     1 out of 1 hunk ignored -- saving rejects to file devices/generic.c.rej

 > The package patch 0002 was added in [1] in branch "master" while it
 > was in release client cycle. It was cherry-picked in [2] in branch
 > "next" to apply the bump [3] (which removes the package patches 0001
 > and 0002). When the branch "next" was merged in "master" in commit [4],
 > the patch 0002 was kept.

 > This commit removes this stale patch.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/e4cf512c394f218cc71eb6b496ce4cb004c917bb
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/8a5fc970b48a432f5df3be1f1e7667095e712b3d
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/0a91e760f467a90b0f0acf00ec76aac011b241f1
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/5f2687795595c9af579312c1d504373ece56f43f

 > Fixes:
 > - https://autobuild.buildroot.org/results/4f509f1f788c1b8dc5a840ffa2e435c5ed7b6eea/

Ups, thanks for fixing it!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
