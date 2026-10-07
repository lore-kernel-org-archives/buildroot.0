Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF61CA6007
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 16:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A648080CEE;
	Wed,  7 Oct 2026 16:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dW_veSvIVhlH; Wed,  7 Oct 2026 16:22:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D3FA180D21
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791390136;
	b=pNm+atZgIGOKEai1MTqaUt8T28VPagls78P8veNjfoSUE9svYQcobPyqxaxdjIHmUGbi
	 tKWBeHzOO5SszvkM3nGoXmBKF8c1kBQ9VRmT25gzt16tAgBBiNv1qag26si8Sk3oVjPbN
	 bWFeZrvXRLWDc+skg1EHu6jSDYFDZywsSbe5XHG7rWXMY30sPOo5DTWLnwoAn8bgW52d1
	 a2mmWbT0izbB+iI0yuskJontjSHVF29qR3AVHncb88iCQMjj+qoy3SZrY9HncJEPSpq98
	 ZwR9w18cEF0PZUkcEd4MynMw2kpVQNn8GtwgoyYPQDLznzLS/cwyz1qcIg1rFPZrlmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791390136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	b=qeiSlvBlUX6vz4gaKy9AUz2iAgxPfJU6I5CeQPBbk7Y3KJTKXvEd1eihX2yNnITx262o
	 OxWkFErV5WbZ3XzYQFqV3Ui1ym9M2EOBQB4QEcB5xqu2fndbDjvi7hOFwyJ/dfHcSmlwc
	 qx/9NSfLKhuUIheAa2vwVObpVzWyGXMCI7vxTNCquTA+LhvIKMef/vClEPG5BMEWYpijG
	 bvJkg3Klw7RecsQMwEoaicST7hMmosKvTjLrw/9hTY7VJSKGl8b+YBJ7tpnJqlVmS0n3o
	 YXXwVNDoppfDiEDsL3Tm/Jg/tIMnuPmgVeseoySJVbh74hYs1XVVxLQdQmBmOASDoyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=YxBEOEY1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791390135;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwgViv0Une4MkT5F0sOE8y7pPw7TuKYuEWNGIqyRWv0g6bO8eLm6KM7o91nNILy1/
	 /I8dSXYgtZCv6m3mmanHQ0G8QPFwIUXXD6r1qiRjWmykVMTyrfDdBWF/XeB6oAHxxn
	 cA5L6Fb1bz/SBYaiueJa7RqOzbdq/gHXPFdsnnofENi8GleNNrP8WexDHHzliFGIuG
	 rQOO3yOUYn3eu/9t9r1pYOANC9yL+UBIo6ZuumU2DFPcbWp60xX2/fcymPfPpqCD19
	 AoxIM+dtD7OM+kUCkqpjHE4raje+s30K1Z16kHliekhPclJeZa/ECe3+eYX/ZMIl96
	 fwx/o5xjUDU8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3FA180D21;
	Wed,  7 Oct 2026 16:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 801CB317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 654E180ECD
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VROJXdHSFgHx for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 15:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6895280A53
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791387290;
 b=M40SBRkA/KtCK1V4kZVK9RBxRjrGKUsE8v6zwAcR5BjlAxMz5g3/Qvw/znjTPGxnm6Y3
 3aXU3h575fViHFc6jAsJ67Z5f3wNwwwpDnoR+C8gYOWYCAv5PlUjc8IZxv2ukymOihNvD
 L8xz/jS8Lm5KnLMX0UOzwT9NxNJxtcWW+T0wkQY9ee96SVQiZlUqXuVi7Sc6PQb0w958H
 24NiMijeJ+v7iFCeIvPv7dJdvbUPu3wmx+JRBNvZAF8H4qFMJOBTfJsu7pM3rn1py7jJo
 I6fmU5j8hy+LdsjBLUMSGobzBBchi8xFe7aeRNlSYEJUIULfJUv6kgdxKB1UrOVx8DA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791387290;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=KeCemcWmkB4bQd7H4LuPjhST6aOtrWvCL3n6mEC2Oq8=;
 b=shGaqDRysrfcwr3PcLiax6SddmRqnSVLtsKySivgXCO7Pw2+Kb4TlMPR7DMdD/VS2PBe
 r/HuRv9+4uCWMX3+GnuRpbTz/KEVlFZ2Ri9aD7QBP+1j3xOc/yfpV+0ougW8XEHkyWAVk
 6r1W3bTcaL4WF/DCfW2j0PNMq6GzVWmWhdE1GgYfZHgW33MGxvIaoMsTXEWATztL/gh8R
 TF9lWnA5uKAFjB8FIxeZaDLBz+ckaXcmcpFsS1WFCnc4R1lt7k5Dds1jPAFtEgxpL2cU1
 J0OvVrUIQsASHZo30l35eACuuA8F1PSaBQcssrlNYbZxZugFj7qvMWro1kaHmOe4tLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=YxBEOEY1; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YxBEOEY1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6895280A53
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:34:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=YxBEOEY1PKEBmus4vwaGNyb281BdwjVHHTvtVDzJm4Xfyg0EFEt49EXXgG3xNg16WPHEZfcOYmTQamRJp+JUKP/iFQi76PAa6hY2BqiRr0TteWFoCHopzn+Xv5GkfTbTNhX8yqNPMOftmwD89S+Tmdac50NednhbX3l8XjOqEMzFJcahyqe7+hpm8ac6IfeFYkPIwW8iyWWtLtcShSsnUecDvvDsxNduiOJl5HeimnjjhqzWXBxAyGGmRYtS6ArKs970plnxldR3b5xhjpFqkPS7FKt34Bty9YmHZmZ80dP9Ov64SU1qqrE6rqrIhXHaSZzOSn2vC6u3wNGPLO+RwQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Kmz+hOngAUUbpHdxhXJdIXUjBaPYR+6mGlUq6irGqOo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2087527202; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:34:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xETfJ-0000000F8oB-2FuC;
 Wed, 07 Oct 2026 17:34:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261003232911.749403-2-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 3 Oct 2026 17:29:11 -0600")
References: <20261003232911.749403-1-james.hilliard1@gmail.com>
 <20261003232911.749403-2-james.hilliard1@gmail.com>
Date: Wed, 07 Oct 2026 17:34:45 +0200
Message-ID: <87jyntle22.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-boto3: bump to version
 1.43.108
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
