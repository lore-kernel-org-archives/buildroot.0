Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A3FCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C41F80DCE;
	Tue,  6 Oct 2026 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1R_1icVQFxJ; Tue,  6 Oct 2026 16:31:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C9DA180D96
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304278;
	b=jC326TFA2kQIQRxV3QmsNmasMIF6SQ1X1GAzLckOC1Thjn1Ab2qYvIes0omQ+0N0Sfg9
	 hoq+xmQyuuZJkfOXidFIAwprqDiIDJE9Dt93KkW1T/Ggc7/dSnE0vrKvzQ/TLG71nf5Z5
	 YmTgw/lwrxEmFTUjmvkj8BDRfOnQYFfz9UQp/Czwm3vlWCaTpnqMuSzDbQtQLaP+DE76p
	 GszWHajupQMFa2L3Ukb+8fIOdq+SRiP17TIpddr6OVwGNfDEUkbpkwa59KqRfX/AA1VWH
	 HalbY7hpJ6JZz7NV0fCWQrY+RE4AP9cachGbos7bkK6xQTyP/lxwkQaGld3RoTCYyvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=NcpT0ll5/e+Ct+KdG+xOAFusJ/3LAl+pw76VdN6/uno=;
	b=In4OtYEh1O/FQW0Thj3cRXvlmVNz4CLJ8z997unCx4JB9PJA2LRlZNOHrPB79mW1hq9w
	 QyHkdtJxy4ER3Zp1IBEUa/+BmouHATzatLvF1VNLiC6EfkxLKL23NF/r9j2PAgvj+B1SS
	 +7aKKiKHJC5Im8DiiWG6hrif51f8VeosLOxzLUYxFNNEWLmyCmleWxUjuhm+BAyyDAX81
	 q18Xfxd/zzRy6Ohp75YFZOgWpijuw5RV3ATQ2wSUr0a8xLhRg7zZs+SID4kSTuNmI1+WI
	 hYfqqKkGl6F7bTVMCMQZamwGSSSqupM8DArNLza4bVIn2Cts5VQB23QIRxrPWQT+6+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=fail header.from=kuhls.net;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304278;
	bh=NcpT0ll5/e+Ct+KdG+xOAFusJ/3LAl+pw76VdN6/uno=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dI0eXGDRrMYMqilnD2BLUpyhjzo8NbiphLhFDJe5R7dU+DyYEXnDC29pzXq3Gay0S
	 v+YagQPU8lye2kDNOsOJH7bTY1reknk+qTK554oaCGeyQUdT6GXcehYkDWcqLHo7as
	 c16HgfGLOPE3NNxXDZg96PeyVKDEXo5gcgLSXSUqx6P9X8DhmQkqepHjubNWFUWwEo
	 iKUJ2G9nKd0aCK/7xt6M2SjVpWqulJ0ZH6P5FIOXphnVUZAGpKqsdj0rIED28o25Jz
	 hxmhFCnVESixeHyIDd0GcOWaNeCRO6Mc+LfdwY1YU0UItU7YRU7rCUID65tOJHuPuI
	 hab20G6rwQXqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9DA180D96;
	Tue,  6 Oct 2026 16:31:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72CCB341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E9B8091C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YCful-d5ekE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B4AD8088A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304090;
 b=bbrh81qvXVnSA3nhT/y7FtJw587zYQaPw9YqNq40BMQ1eOh7btU1FE8dr+1JTVY9exAl
 PF14oWNo7AHi236Y2d3RsKm7qJmj4E/RJetfpscPe8bITYIQ8FuIYnTWVdha8kZVfNAae
 u/wktbPRsbsm1nKToloDZTG5R8aunXX08JgBM7JTa0lBFaiPnRFKgPJGAv5s51Ahu9vEx
 Q12WhDKEbeSSJZLZdeZEof+7RXVBCxxaigIngfzPhoIOETHqMi6sP41LkpH7IqIR+fKFG
 SxmsIdC2BQzb/47w/wbchUj3W1owBTgWfVQbXpy1WGdjn73gA086ObQR1ZncC4dGKig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304090;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent:Cc;
 bh=uOe4EB0hCzRblnVD2qqC7SJesg5ufvniUQwGnBAhrco=;
 b=o9jnz6SzYRgLmjXJlJidTmuJKQ+kkJRVUg7j628yXYNGpLV8YNhc0GwIqqxMmKOYgTZ+
 BlWzcFJJmlIjkqosP45KAEZR5e1FMu2NX6d1FLgfAAvh8t+XmN2qpUw0CesWB0uHgWbZ6
 fZuJ691KC/exCl3oLVh42x7+PPfg/ovhCRpCgTzs7VSKarcLHtKa8MT0LpUQEIYXI5K3B
 K6RrWRAp0lI1fujWXSXUsqCkl5If0qgnCOX8pGXpNndVOOBw5KVhGU7i0RJlB+Scy2bjz
 rP87KIJNgIuNnGDo+chlZthY2Ixv9hvxL0c0XIPU1DYNYlw3s7AVURlTpKStZE6yB2Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=fail header.from=kuhls.net; 
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B4AD8088A
 for <buildroot@busybox.net>; Tue,  6 Oct 2026 16:28:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1xE81P-000957-Nr
 for buildroot@busybox.net; Tue, 06 Oct 2026 18:28:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 06 Oct 2026 18:27:51 +0200
Message-ID: <pan$eb192$e450079b$f7b6e477$9b621272@ID-313208.user.individual.net>
References: <PH1P110MB1603290227FF3E6B8C2942A99F8BA__18800.5890975305$1790798046$gmane$org@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <pan$5deb5$3e2de23f$81e9c858$3d7fd8b0@ID-313208.user.individual.net>
 <PH1P110MB1603E6B34D2017EE9966027A9F95A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
Subject: Re: [Buildroot] Python 3.15 update
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

Am Tue, 6 Oct 2026 11:43:45 +0000 schrieb Vincent Fazio:

> I may start in a few days as I have time. Otherwise, anyone who works on
> this is welcome to utilize that task or to coordinate through it.
> 
> -Vincent

Hi Vincent,

please try this patch series:
https://patchwork.buildroot.org/project/buildroot/list/?series=1112

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
