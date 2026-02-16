Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BC1E83827
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C1C81516;
	Mon, 16 Feb 2026 19:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j2I-PeY22Wd; Mon, 16 Feb 2026 19:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97EEA812FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771271701;
	bh=uA9PENrK6ZwhuAWuPguVGq8wnq2iKHLeMVyrAC8DxL0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1OlpwdVKW9UYh9XnF8a6XnLDvmk1vEO2NsX6u2jW09oR0sWdgIgZA7T9QfolD7vH
	 qLuKfT8vojKyXE6EX+ptRM2xjZOyuLvMD0mEkWM78CbST0S8H9uTIiLp/Y3CntYMlb
	 Ie5q3oBEsJFoc26AJ8OXvkNXU+YKq9ViQyYON6MWW46UeMl3fXLEBqGuRjgqReDz6y
	 NpWGk6fF82qa8V1fGUz0cRi3Z+vJDdMfuex9RQyq9EmJkQuDlSqlzwglnpT0sV+Z/R
	 MfKywhr0R7yEeypDc8Ppxk8i0pu/eW/K92shhZcZ8lwAvgj2kG/PIGpjlqNdXV7sHv
	 dsOJzNd91hmBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97EEA812FC;
	Mon, 16 Feb 2026 19:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 030CF35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F224D40B35
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqmGQeSd7iZn for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CD1240AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD1240AFF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD1240AFF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:54:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 763307903; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Feb 2026 19:54:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vs4gG-0000000AsBF-3gfx;
 Mon, 16 Feb 2026 20:54:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <7dc79f5eca72bc099e12f92a0a471ff5@free.fr> (Julien Olivain's
 message of "Mon, 16 Feb 2026 20:49:25 +0100")
References: <20260215105358.2089856-1-peter@korsgaard.com>
 <7dc79f5eca72bc099e12f92a0a471ff5@free.fr>
Date: Mon, 16 Feb 2026 20:54:52 +0100
Message-ID: <87ecmkjwfn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FOE8btVkgzgycs0ggDrPq1DCSTmFdnsVm51YWwGCeN9w4uBZqiVOoJ+35n0ywvW6ErOwD8Lhj1ZPvwUi9uXWjbVv07MAi3I6/5bmGkpmPPoQKShvMs2otoh0af69SaOBNrq7A4t2EibR5cTt5vHZsd7zVSXDfow/tx8KE7dggS48HKMTzWWt1MuwH+bunYbfBZj/ezC3x0GbeijplUL/Xk4OmvFAkYjw7VTlZG05/jbsBmuaOLV0QsO90PaSeIoFRccWXIeIer3nc4ZEd7ElXRJ5lsEzZES34prssKeZBDCWUJS+G38G4gtuYJK2DcI3ws/J525arqpeuNXA0vZKDA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=khNKPK0QpjExtSLfLI1X3l/wSy1x3ltX+62x9qo4kkw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FOE8btVk
Subject: Re: [Buildroot] [PATCH 1/3] linux: make license option visible for
 _CUSTOM_VERSION as well
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

Hi,

 > Applied to master. For info,  I added the missing
 > BR2_LINUX_KERNEL_LICENSE_FILES in openblocks_a6_defconfig.

Argh, seems like I forgot to save after editing. Thanks for fixing it!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
