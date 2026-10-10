Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837A8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B99240945;
	Sat, 10 Oct 2026 06:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8RBfRHtFJMp; Sat, 10 Oct 2026 06:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 324C140935
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791612342;
	b=MCvmUQtSkWc8H1/yp/a9GTPOPkYbcrUxOmIZJbi5+dw7fDlJsG5CIuUS8XFPj51x+Ww9
	 L/FABUq3oWavsbpjfBNr2jIM+IZA30eH6uiWg2DFooo01l6dImJ9NdxRrex6jcyqbG1Bi
	 Z9vRR0Tm55XV+VgyD8xdvYlWBUVr4N85sqMDYvk65RxBH1XIrXtEYBjQrCJakTSTqLaGN
	 w28+YmmBUpiHl9GIhaejLM7t/J/Tkl9CeGOtWUESF2URvD3X3LUr/6X4Xkv8BXwwICFrm
	 onjykUpJ+Qp1GBLy/jvSX9CpEZVwJhbgYyMM94ccY0abLI2eqLFveK37yXzXOC8rBxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791612342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	b=AeD7hNtg7JsMSDWKVLQ9vjLvF5m9Uhyx1l5nOMVwQQVKHP3G+uTX5NJoSC/ln9DR+RjV
	 kFkCjJyrAEJNIjFy2wOwV5207wE9ilp6ZZf1UK5+7dxrMcHQQB2UPcjlB06w0oApVbr0w
	 8fbyPlIHJ7YnNd4lmpOXqSOidlsprqaF8GP8yIFuwAi5J+K35hK5sWKvp5dNtiNkOYQxL
	 OntzGEdCnSabZhOfeR6Yetsjssa1Y5sawjwIfFxVNHLXFRPxmRKFEKUkp97bu15Cfg4OR
	 LuzF+0ZpiNwMKQdpWOSJP+fZssMEaeIEW1HBLkcd30hw8zu8mgOtMLJs2clOpCpUJag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=YTH9WkNR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791612342;
	bh=5FWwt7W6z8PW2vFOQhR2xy+t7+6X+ufnX+iDN4f3Llg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpIalBsa1IYXEgpP7BfusJA8408RuzV2fXH5Xlmi8OdL0wGCuUZZJHvFBi4cK7sk5
	 w9/EMgC6qzYVXgEGYYWfnaa95Am7LudrB49PPciVOK5HyIEfcEkYTPntZ72zRM+5oC
	 aU3XAXy56Ri9kqaK7uv+200d6mu+rKBkpWx0a5WYUC+MT4enCQDwmKpnjwIA3jmpPq
	 M9dLwEQGDJjdCfoUD0NiMFA4554Siaq0kQLZ8dusYrlF7bdZaJYjL7q0+GH8/OeJcv
	 sq1N2YhK24yt6YkfuG21OGrLgJY0m/H2SBOsLJKQlkcl6YKd1udWu7AmDaFUu+GsTz
	 vJSxnY+o4y3DQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 324C140935;
	Sat, 10 Oct 2026 06:05:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B6A1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A208D40931
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxR7LGLflXiP for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:05:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7AEDD40762
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791612336;
 b=WI3nYKpJI6VQJ638jI2XFckUJ54OFOPt4ppFo+9B+axzzf9CkngTTJqnVOv3Co4K8kvR
 3slfdM3K1a0ccUtjfEPbbvbRr7E34TLwedwYbdGl8w+gDjoAOFzc78/YkUOO1roOZmMXG
 u6TgIfa4cT7Xw3kq2XKldRXla2mmJVL7DY4sz1F2nN5G3r5OKMm72ytutphD6rd1AQ1GP
 DW5bpbccoR0ua+HuCMuCm+if91wFDPaa0QzcBM4Q/esUyJk1Zg73SyLTTmT+s0gkNjkZg
 S1pwOfWqRoWd3F6JIQyGoN9g+br7H13/SDZhEOhgEKguAGlWKhtTUBgcse40dl/mUXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791612336;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=KeCemcWmkB4bQd7H4LuPjhST6aOtrWvCL3n6mEC2Oq8=;
 b=lW7kxofd+Q/OI2/6l93zaW4XTYPieWG06y9ul7YcRwCvA30UH6IhOY9XnKBGWozgvmCL
 J4vVin3eLQvC6ZYKMp8ixsK70chX2T5aOS9sVBpjE6yi15MfXIcvUFZ1NjwD1O4ChWo4o
 tF+kzby+2vZG3yML5r+DZsh/9YOxnKRrz4uiR5SnUjEyYDd0oNHNHngonO5FYsLhUWqUh
 /rewtAIwwTdgJs8+fpYw61UGQSl7DQclSOkKVz5LwM51/dptWzqQEtP9hYCowsWnXIzuC
 xRBVwq6+uKnDg8XCI0K0qJ4JZe+oV/I8vkV++QTx1uI9QU+UEAOpOU/B3tdY7fsl58A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=YTH9WkNR; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=YTH9WkNR
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AEDD40762
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:05:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=YTH9WkNRf8fTcckXHyhQaKjEz+UIBVwhhP5OHelD8EWX+QkgAym2DSCV3QYjd6o7ODRBItlPKruPFEMoPUDUnBlV5UBtJGbMja2B8O0uPwxaKOIwR8wECj7tHfeoLB723ig5EhI/XMo/CTF9EqFEM0lw0mGBam5AwL/DEij0nN05afZIC4wn6nJRcLf5TTBvZbOCdGYnyHWHjXC7eVjGqMuBMgr+U+qzoOOWGXrd7fx+pimXQZ1fSigUa5dg2ny3byO7PxNagRSNlgTXmxkq0cql+llFbHozttdHADYzvboffXeRkotnXBi0jIQV+km2DfuMs1PE2R11DC2QmAPqNg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Kmz+hOngAUUbpHdxhXJdIXUjBaPYR+6mGlUq6irGqOo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2088003955; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 06:05:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFQD3-0000000Fznd-3Lnf;
 Sat, 10 Oct 2026 08:05:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org,  Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20261003210833.735937-22-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 3 Oct 2026 15:08:12 -0600")
References: <20261003210833.735937-22-james.hilliard1@gmail.com>
Date: Sat, 10 Oct 2026 08:05:29 +0200
Message-ID: <87ld86um3a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-websockets: bump to
 version 17.2
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
