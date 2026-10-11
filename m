Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCDCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 12:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F5760601;
	Sun, 11 Oct 2026 12:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8v5mzrE5XLOs; Sun, 11 Oct 2026 12:30:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2B83C6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791721850;
	b=iFhab1XWaxiWIbijt8pA7r5wPwRfvg9PX1rleb/VwtSLN8ZsA9LPFjjeWAIsiHyqXSOG
	 CQTwJCnfxQYHFRmjrwEUDY3azoIXLR0Bz1OuBKZm2HaNCP9zGrQrIgWk1mpqRSmde63+g
	 lAJtLUOka5Z8tsT995290Vk/8GVV+VxSxwyYqHTNzGCde7eHdrrAglrgMnqE4IA2Jt94M
	 2bUarQlbPF16MeRhsMW7aNjnwgf+8Kd1JqUCMqZ/Fsph8uHEjPvnOvaRQUnj30jkQYN3X
	 G85CHDJqb5RaQ9QSMc8PhNUhcOqRwe/lV0/nMnCbi+jZYC9daOMY9NCSgjd5xLrRnLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791721850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qNjwXvzx8rKRs4bs/xLB861BC8HMq94ISnnQo/iPKd0=;
	b=I0BbMqpLdgDsoGp2oagGmK7UhDUV5wJMaNqn4Q8MzbRt0pqmBXWd+l7sKiWuaom4kkaY
	 G4eFY5SYzVnAPk0MIKrWuI9pLZ/IDxtUsOslR7ePDWkCjA0KwwuRKCPq/2DuF6j73U3AI
	 +TBilg10CcFOf52QJNvO5YOe8orOyfgs0KwBU6tssLsC0ap+ESXeE14whFIqQpterpMoL
	 OOuXw0Xjomo0GIg0IJ/4UH33Pnri2n+OZUEXlvgHF9bUtcsH+Rm07JESX/9vFMDkZtK/U
	 oClx+OR723uIhUCcsGsT0K47Xn+owYg49CdBVTyONiqt7r6YGVCSh0JMCVGm2PVrJQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791721850;
	bh=qNjwXvzx8rKRs4bs/xLB861BC8HMq94ISnnQo/iPKd0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJOGe9Ilkidda8okkY6xLMkeKnWS3RAbWSLspeqYrrvez8VjxnETi4iMHa3EyYI9R
	 vK2YWA0SdGKVo+hvF3e16NIlDvp09qgbjfeJ6DYAAuUQpWOxqM/OuTh6H1sZNN9DZi
	 S9rIg44gvfXzciotNiZ9FFn/hPceGJPbp5430uOEENmr2XsypR2EeFSD1AZNy8/zC0
	 ATEZ9fpsLB3GDU0UWyC+u2YV/CHjFpSCu74iclDw7NRcRXESk3gUKjPf5kcsB2SuT9
	 CmWH4Wi3eCiXqxV1jPf/lFlh8RqDyk0yvsgLKlRpWA1nhLgKcjeoV+zPaPD38AQB7d
	 r33yxWEYl+2XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B83C6060B;
	Sun, 11 Oct 2026 12:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FF1111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B0080E87
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrAxiQzk42Kr for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 12:30:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 683E780B33
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791721847;
 b=UnlW6tN8gd4C+91BfbA7Zhtu8HcMp7K1UGpuq/xBwFrkMpwOPV6R8DEAtupNBWETDTKx
 0IqXgwKSb7gYgwkqw5H6NEuLyHuryPsarpDuWpfmz08M3m6jWANFB0Caj6qG7nTgXF+fz
 8f/vKMgGa0f+0Uf4eRxh+X6G25oHmruBy4V0bZkx/EcuRnGZyiHd4QLLKCX3sgJQQe95+
 PBr+f3j+5X6u+fC988CGyRafrLokRoBxcSuxinWfKiMuCWjjiZ/PkbsE/Egn65GQzFYmB
 I9wmA7fnYYjGtbCHVgnQrf7YlCVJOeoAS+p6xghhZfKiczaREEB82Kw6FDPAS9VVUhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791721847;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=qdgfwPLb2vb8oaA7zwWm0lvU/uu+vhELv2HIWgCmROg=;
 b=hcIgHVDdcJW7VpttO0x4I+1EO4HGQ+oFmdG250tpFDxMVRM+Tb3HVaoKrkGWqQcqqktt
 Lcqy63zgi4I793rScODpeocQ7LrkmR8n6THMd3R/Plh8eUW0msHytBs4ghwapI32EWafv
 UXzvhoX6IrFN/8LzDzHDR4Vsnhr/ylj0joq7auXu14isGKUEk3cMkYoV34S8ZLtCZn2Hh
 6oI/Rt+FFA3al9QbF730Q2iChSCS5hvSVjNbzJrGJM+XSLqXsPc9WA+3neyfMrYSG9JRS
 phrhoN/GBoavgJE3irYzqvXnkE/HLmcdlBmhn9hLUf0kGx1SxS49JJ4wQ9h3o8yXffw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=FLLdWRX5; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FLLdWRX5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 683E780B33
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:30:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FLLdWRX5SaxMyqGOVSapqvt9BSMPOEZo4HQT9LJ29zDQdO6zbaLv4HxvA5EbfbyG+ZoGrBxlYtVJ3puFb6AQB69Wpw2tNVw88yeB2NYRDwK3AFMZ11ktyBJxFKkqPO4GYFZcHgKnEe1mAMc4idO2UjrGjBJqH+ikATqeaW5C/CTjpfb/1asd542Vdd5r6fFD+dp7OQXDbpRu3BPTKGaduIFzAdDBPn8nCj8Ox4vkO45o33Kd7EDMGW95OzrkI9GGTpSD1ycEUdZN7mTq157oAWBb/dltkEA5fWeL/E8VxVo1qB5I3hd3WLfJIU4SLECalIJEHDtGutPUl+Ykd0DvaQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=x+bR99xMyksylpI6P3bOMBrXjvYrR+9ojTiLXAAA2tE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -69415130; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 12:30:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFshM-0000000902E-1wJD;
 Sun, 11 Oct 2026 14:30:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  git@jdknight.me,
 thomas.petazzoni@bootlin.com,  arnout@rnout.be,  thomas.perale@mind.be,
 ju.o@free.fr
In-Reply-To: <20261010201508.963412-2-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Sat, 10 Oct 2026 22:15:06 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-2-titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 14:30:40 +0200
Message-ID: <875wz8e7wv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] linux: always select host-uboot-tools
 for mips
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

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
 > for the latest Linux kernel. This change is intended for autobuilders, and
 > was introduced in Buildroot while the latest kernel was 6.12.

 > However, further investigation seem to indicate that itb images were
 > generated for mips for a much longer time. Linux commit eed0eabd12 [2]
 > seem to enable that image format, and was released in Linux 4.9.

 > This version being EOL for quite some time, we can therefore assume
 > any "not so old" Linux for mips will need host-uboot-tools to finalize
 > this image, and therefore we should select it when building Linux.

 > [1] linux: select host-uboot-tools with FIT on mips
 >     https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
 > [2] MIPS: generic: Introduce generic DT-based board support
 >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
