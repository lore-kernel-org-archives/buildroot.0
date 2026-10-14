Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83835C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220834070C;
	Wed, 14 Oct 2026 16:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fe6DqeWAxB2b; Wed, 14 Oct 2026 16:44:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B929A405BF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791996256;
	b=W/x4n2GCEVXZ3VCL7qMSmp8m8Gbs+JVy23f5VEMNEhdd6TuWWFQpDQOuMORjxqiW4HZo
	 tBC19akmwon0/k0kwoUUhJSBcqsoSMqnDAHNkxdvT+X7MsRzd+8E/apdlK04k6FRZuSmJ
	 WUFHxNCUYZ2vRLrWlA4pfSZ14p6kB56GOdP6y3MVaYb1z8+vpnkWRaWujGvDi7Srfrp7G
	 ex0QRAELG3jBVHgMfSxg6Q1PIto++4lCMGPOvrvVP2hqRWS0dyc9Vl+W/ZXCCr/lLcJ3u
	 Lz6I/GRerhaUk8zgpGWpgg6V8ww1DLDGzUbKdEoP8U4W++IIaBh9Sn9mzJVLwq2Nnjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791996256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IGGW0TXDTSoNlqP/EOIe5M341dw35/MZeR/rSF+VZfE=;
	b=q/4eNmjQaYE/d8WkSYAydesZwrpfdQcLmp2RDRYnmuWEWpzHQNkKu1XrN6jTo+O8RAMO
	 WlbMlXJB+aoidlqHbaA/tQcsqnLvCmfesClFOEFIj3UyZY3Xe0sAghmhkR0H3RLMIDhpN
	 wVGUZExd8KAqEQ08NfVeKXMD+SOKkPJdLa4m7Ec9n8lqskIub1gajlRBhn6vctRrpWeJC
	 mJ980/uT1e40OxIKpkia9YnBjebL9h+n6knNxHfJzSB34DberlOrxDJaTOy80qZRM8A+w
	 1WLFAw9ksAtYIPVixkSNyxhDgR6rtfjxsR4+ZF1MruWY8HZb1m/OvtdwSmxEnMbLM6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791996256;
	bh=IGGW0TXDTSoNlqP/EOIe5M341dw35/MZeR/rSF+VZfE=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oL62BXBTkQFEj/Rbs2Lis/xV31QdFCLMhitXNMrnRIKAnQifWlzTr4b2xuIGWaO3W
	 dsos8ksC+SbraXv/HJAajFoyAFatMhPzT7W9vgDk1BP86ioQzrkUvRwmsBCf3tgMQr
	 ckNRQewUUrBaVzQiZu7AnQSuEGJms1vjO1HoSRk9NBM4fcO8UFfmWeujUuu2TdZpbj
	 V5Ef9JbBjOOHU+IH0qBKttDitNUVwuHXEcknLpd/kAJzW6MC10imboCoKg0c6gcrv7
	 hgz8M9VFI1CiuEhHKX1tWYIpNJrBYAYFeGTYapqVFWwYhCZaVJtDlH/sztXhzjiJIQ
	 Pmd0I1dOzEz9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B929A405BF;
	Wed, 14 Oct 2026 16:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0471DE
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEF99401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCdTIzJOHF-U for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:44:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 49AE14036E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791996254;
 b=iqFH9zFNceSJONDdmbPmJVeuRIFidbBBUeikhP523HcP3v3bc/l2PaooRSVB9VXGxSOy
 W+Bfp2hKMc3SXctAAbHFy+0aa4NHpJfb6N3b4z4UnxMG4jgKwULXqE0fjacyzlPzJkfZW
 D4MuKzkkaMeEmGfkN2IQta/oXUQRCvg/cYebE5L66SgM4oKSgrcz6L6tX5eIejaED1Oeu
 fJdEzDlAukLrVfA17kY/R3MvL6KMonECFhjZLIEhOGoR7xA5sAM4brhQFCGitC4bdCZ7j
 Wgyi7cLE/fM9NkuW7FHzvDfBJjSsSpdqOnfLr2j2rk6BfBrOntlFqcy526PTqSgbkog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791996254;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=RChzYLy5+QJJkDyvUc/Y5m+mK1ql4qt30MuoXY/sjPo=;
 b=EZm/N00i/5GShmwHLvBGD7PH4lRCnVvW5cUgBa7EQh6c8kvrkosLvTAdrKH97PfX8gL/
 AtT1JtyyYtvf9ATqlhuNPl+LqQSO1Fa4RH4WfHCC8/zte7xNYCBEUSsS1V3q7VZhAyn9f
 BqtTVhou29/H8KKKsgj9xggetjZhO+/hMD3KvyZPpSmmqqMhMi8HudsH/PEmW9cj5bM0H
 XMPekBm69fCy5KdO/cMSH+8+Vu+EMeUTj6HHp7vO9YipE/ZbNMqGcb7W1NaeF8XIfc8tj
 rM74b7mJEw5ehVjADs2BXWnFdfRh3AvrJgBpUN6xeTHRdh/ZKKbk64jTFAxAe88lXAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=bXcGuemE; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=bXcGuemE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49AE14036E
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:44:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=bXcGuemE1dao0bWA+5Nh63oiC16YxMR4lrPT2u2lPpupA/1HFunhtDmPC/Ub6uU0G91hoQSKDwziWOILXdYdX8sk+ZRaE2ta5On4Xr2Phw55fnMN3F29tFDony4s+zXUzRdH4ffq7GoYNWd7TrXkyw22mJvaHLktN3wUgvJAZB2WHdLYgFeOvJs5jWMsxywK0bGBO3TFxfBUH45CJtN5eHIAgeOCrqn48Tnm/3OSFC1jUoqyqbt6yU3Kz79700T6VnxjxZ6a/08prUPV37yneep8lR2JuTi/tJEOBFFJDr2vTf48O0MNAxxYMISEclxKy1iXOtlB5HJnk3LLyGElig==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Y73AcuL5HvO8bq9oeB6kiOz5fwC4Nteq5se0wNPhhuk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -138135477; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 16:44:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xH25J-0000000DGAE-0hAW;
 Wed, 14 Oct 2026 18:44:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
In-Reply-To: <20261013185348.7666-1-flaviu.nistor@gmail.com> (Flaviu Nistor's
 message of "Tue, 13 Oct 2026 21:53:48 +0300")
References: <878q44h7gd.fsf@dell.be.48ers.dk>
 <20261013185348.7666-1-flaviu.nistor@gmail.com>
Date: Wed, 14 Oct 2026 18:44:09 +0200
Message-ID: <87h5ios04m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 2/3] package/python-snappy: bump
 version to 0.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Flaviu" == Flaviu Nistor <flaviu.nistor@gmail.com> writes:

 > On Sun, Oct 11, 2026 at 1:12 PM, Peter Korsgaard wrote:
 >>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
 >>> on the project homepage, hence the bump to 0.7.2.
 >> 
 >> How about contacting the author about the 0.7.3 tag?

 > I will try to contact. In previous situations when I send out a bump
 > it was indicated that I should use a Pypi release only if the tag is
 > released also on the repo. I think also in this case is better to have
 > the bump to 0.7.2 until 0.7.3 is released in the maintainer repo. 

Sure, but we can do both, E.G. use 0.7.2 for now but also make 0.7.3
available for the future.

 >> It is good that you add yourself to DEVELOPERS, but the
 >> click/rich/smmap2 additions belong in a separate commit.
 >> 

 > I just wanted to avoid some "noise" caused by separate patch, but yes,
 > you are right this would be the better approach. I will change this in v5.

Great!

 >>> -PYTHON_SNAPPY_VERSION = 0.6.1
 >>> -PYTHON_SNAPPY_SITE =
 >>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
 >>> +PYTHON_SNAPPY_VERSION = 0.7.2
 >>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
 >>> +PYTHON_SNAPPY_SITE =
 >>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 >>> PYTHON_SNAPPY_SETUP_TYPE = setuptools
 >>> PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 >>> PYTHON_SNAPPY_LICENSE_FILES = LICENSE
 >>> -PYTHON_SNAPPY_DEPENDENCIES = snappy
 >>> +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam
 >> 
 >> Why do we need host-python-cramjam? Please describe that in the commit message.

 > This is a setup_requires in the setup.py (cramjam>=2.6.0). There is a build fail without it.

OK, why is this? Is something generated at build time?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
