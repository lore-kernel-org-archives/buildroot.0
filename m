Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84A1C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B74160604;
	Sun, 13 Sep 2026 16:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3-q80qVjPFZ; Sun, 13 Sep 2026 16:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 67671605FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316603;
	b=bngTDA5h5jTmig5lCXRYJDb4RWvELsTfj+KtSXtKeuAoSFP1bB7U8mKt1ckT6GIWvIhE
	 Il5Mqc/wAWgPbmUh1t7/3l/Vi1c2fWDD8VZ/fDfBH9Ah8hMJuJnLJ37uUgdaWQAPOqg3t
	 Zl8ECuB6LPqJgidyA14mUOrW/XvTxTcB5ZeOW/wEViKPICI1RN0Qui5+Y54SvGZnlCIhh
	 gC3cdoFQn3BITOcpxARu4ueCkw8nQZ/pyDwQSIwtKGCBM82liH9R2uA/PpRA0wfqZ0hZx
	 g/iDucb+CpbFWn19lzrymXaXB1PzLwLFVMJGKfVu43MMatGmS6j30U2Ion2fY5ip71g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5FKKlJet0IfYjq8YnJtFEd2ZdezyCev+uiXg0cQu3uI=;
	b=deoH4xGz2/bySpo9pfDRXmLGSGms6fe5phdJHqz+GHtbLFcno454lI1Xq3kIhUPHO1JK
	 +4MIql7eTioTsngMwXRio7Fhof8yVz6mI68OTmHbcyvz8QZowNAFRiwcq4CJruO99Z0Sm
	 mX6I5YbYOQZKnKEOAlZjPTQI25HOFPud0+7T97lHmtnY29FXFJ7ciUVPjsDqnkFzbFi9M
	 ck3jtEoYdZKmbJbWg6IXMjpqLfRFpUyKwNUt7AenOA6UbyUY6J+3y00ngDUXUd3HAeng1
	 dbBs8FIMpyxvFFI83InG4EG22QMltBPO8tFUM7F1obhySW+Q20ocYNsnoBrPMs459ZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316603;
	bh=5FKKlJet0IfYjq8YnJtFEd2ZdezyCev+uiXg0cQu3uI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z4njpaLC8F/wPYWr/705i1dcS51tHvHxIrATiqQLOk5KzIeIo8ZGkYrClxE9KfExg
	 XDVNnMVghH2YcTfl7x1zVEp1YRySbOGrj2v4aF3jVKquJFAXZPz5Ihjsf8DPMOH2zz
	 xIXSyzgU74hYHXOOoNPft5YWJjh+FON0BCbnjsaFN0zYyJkaQzLbYcRr+MzVhwDL1J
	 R9BCYncVo51W8CXd/tSM8zJOWrQBwc5fVhj3Rqq3+Z28nhhS4IfhTkXQ12BJTpqXd3
	 Ca5KaC6zw/05tB6RCutZ/9zXu7Unwld2HsQeelsSxVREqkSWjBLOgS1EkidmzrAx4M
	 qY7HnLEhIFL1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67671605FD;
	Sun, 13 Sep 2026 16:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD343AF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FC604054E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apkQS6wf400b for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC34E4053F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316600;
 b=OypTwIN8DxtZI+E9lj3WMWf2QEi2oN2wH1sJb9NbmcN514EBcJJDr2AdXu9JVd31n68s
 zvpZcRlL2hUgqz8/RnlHxV0RiRl5hgtOG9qrsQoCaGBAosg861Ug55WzDR5Rh/vbfqr6L
 WSAAbRfX6cG2+X/qLgGSNzLZEeFFDMlDwMB3GJTDOSZ+Qaj6VXox1XlmBN2/HY7gVg+oh
 hP3SVBI6w+jsw6EQbiQOO13GSaUKfiylqh5duPMihfntE3rykOmUstCHiaauEO7SXhqqb
 sA/Tak4dD02koFXMhrMOYNwB2RlC3fR7Zw4fJxShX7mSislPMXnpOxyq0ccM4kjzf3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316600;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Fe+Swkln5RFsNEnOoKE8WC6B+NWc2oDuyqlXNurZDtw=;
 b=bJA0/dbod4qow4Nnp5f69nJDga05q8oGQkrzaMqvwJA3etlyHcXqqOn8827waTQDuAPh
 ajRGRRfrvS1+qMwywkkkTCPiUdUnYj6hHETzQm1ad3O7aoCXfBc6IclrDPW9axat2UwA6
 /F8PeanZWJJ+n/cs+YXFENy7MA6zL4/+g7sFanV0lEtQTzK+s1jZL9dNu02ERrnxLQGxB
 lU6VqnlLCbwwgNTcmdx6kHl+ceay8BRzes+rtC7YL1UKiTf5X/KXkoSuJzjKYu6xUEtak
 yaAA4Iv+qcBSlD//Iqqlv++g6aHlHvXQc3iAciS8pJe+n9xVm7sd5LIMdPPRoDy3KFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DC1KpyRf; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC34E4053F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:23:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D085F19F54D;
 Sun, 13 Sep 2026 18:23:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 18:23:15 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 18:23:15 +0200
To: Viacheslav Bocharov <v@baodeep.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260909182653.1968270-1-v@baodeep.com>
References: <20260909182653.1968270-1-v@baodeep.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <fc7f68730071a7dc306603a79dc30002@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs: bump driver version to
 latest with support kernel 7.2+
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/09/2026 20:26, Viacheslav Bocharov via buildroot wrote:
> Update rtl8822cs driver to latest of the jethome-iot/rtl88x2cs.
> 
> Fixes:
>   
> http://autobuild.buildroot.org/results/d4705d1a933528bad1f4afdf8f621c71bda8eada
> 
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
