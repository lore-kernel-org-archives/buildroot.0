Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967DCC6B39
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 16:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80340608E8;
	Thu, 15 Oct 2026 16:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdG5UP8xgtVx; Thu, 15 Oct 2026 16:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A608F60888
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792080148;
	b=tCdW14pLAh3+xepXuPczz9/DKKtPitJ0+fDowTTgYh38bP5sqzwrkqtoY7PXI8Tu1iSX
	 k/MjRu9vwGfjW5B679sWC1V+H7GqMOyN08YNdcOHVaQmdH5XcsOFJTmbffFsFv7wmHDw1
	 CU6nusdDO6O1edlaIurvLuyRzha00dIOn3Ye4nJjRfIrkPOCqErGkggfTiySylXw5gf7B
	 HGeDvlIjHZu1lkwOUY2gM5hDlP1QkD2bn4nbTBp03W77Rj7tyxPNJ8ObKRRy7U/w6gG0l
	 TuCNtxUSM+wqmt5POQkXb38apv30ke0Y5qigTWAOe73eaiia/hZOQGCJEb+T3JAp/Yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792080148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QBw8DrZHWmq2vYk09xkVvr0L1sGFhNLdzgZtiul1jlw=;
	b=ai2Qogr3LabiiAQHGj7obZqKTyNG3e799SKuhJ8zOTHcJ5L+mEIxh4Hxk6SIZ4K+7DGC
	 GxWwGEfvl7Y38r0i4HpCypGtXRiYud+rAvWLrMeV2w/nGH3bou9uWRJvd6Gd8VOir3dyG
	 /Wt7BKKGOOORMHfnA6TqT9AZ4VHGIyRMLZKViaatPSI49ZKBsZk1NpUKEkUzFjzJ87aTh
	 GlkualN/JxW2PVBmH844pwh7vYInUAr0f0WkGpDB1/z1TIe3DeAilHSj7Am1HdHVYfH+q
	 ZdJVGmUNaVXqTlMZDjMGr5qoNLKxqj+1kdyHuAOfXlKlc1+qKYnwASq4bVpv1pQc+ow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792080148;
	bh=QBw8DrZHWmq2vYk09xkVvr0L1sGFhNLdzgZtiul1jlw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xp6O5zhZhGrKikrjhjGZYzc/Yt6XYq9/TLMTz59wh2W3JktHJ4WX7O4zTs1Oytymp
	 GOs29dbTve5nUY7Ir1D968QVrKoyJNfomdXdQRynnTJi+AgiUqQltu5wnfvKaclIz0
	 SwNwjJySAHdqwpKw69+d5FAhtkXYVoADYvNn1VUmVzu2L9Sy/Z6sZmTk5B/JWKha9R
	 mg6C/edL73eNYjIRQbZjxmqbAKRakpt5xtC4AfDPQc1iVn5ll89dn3JPuKcRJREqoZ
	 0x4d4M77zq/opYDVXaIH5BwcJfaJeHQnjy2WkKy2PDG/2igU9IE4ou83s4Sz4NWMQv
	 ain5ljXTgQDGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A608F60888;
	Thu, 15 Oct 2026 16:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1344D263
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0571540116
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heavpjWwkLs1 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 16:02:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B618400F3
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792080146;
 b=CoCYo0YXKYS15T3tGMhL8Y1o0NsHGxaWvyOz+4rDz+LrWYov7wyFsWeLn1tD99SbZP3w
 WVfocoh8YahyP5CkFvvx97k5rQZFFPn2SW4NDRnNy9ArsPxs7maxiclXT/KXijDDcKgWw
 Qwa8ZokNPxRlxOU6qv0SSSOgQ/KdCH/85ZWI8Xq/qshi+GViOJnYeXmnh2AJJrvAudYQR
 JKbTVBd78ueeEXXRqM32B/mJPLW4elzIqNzGb3pfxKl9IguQFQYcIyn7qardn1CCqGIVl
 rcWk4Gz6edyQUMSPE77oNxPLBnqbCRx4eD8eLqBkHp6zNrjq1I7afaMY1qJ7gWpDLFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792080146;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=1Q81WBqnqPPzYMweW1P6UCqZcOlKYdOcJqmAARwvjzg=;
 b=DNf6fz5eyi2wXGiCXTsuZCCTAHx1lXj+iP9Wgtp1RvFooZlyTLM2uwBnbWe+FuV0cOfu
 KJpC6VIOxrniWXomAzAXtyXoHmwsnKGcPp9eYtNhHVo6BkfnLBjQqsbL1osr4K2ciQOs4
 oJbcI6YN3EK8aOoNuD67Ew/2HfuAawXV1/lry2lTz56pKlMS/LRisBgxTWSlamnh3+VHx
 TE/Fl7QiwAKMHqDFlGTm23h3YmkZOR7cks59scM2AzAyXgaFST0SHmrhwFD5CdGAjInGc
 5XTb/1T+z8V/SVUiyu5xFo/2uT7BYPrSCkE8WSl5KIFr0KJju3reQF74LQuWTxojUpw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=elzAooLM; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=elzAooLM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B618400F3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 16:02:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=elzAooLMn2tzge72NBpS+51e7AJgffw7401wG8XuLwu6PXIpwNgg2nphkMSM1OwFz/1NsslOCAsT0UFIuK7/HJd6WDQnHnssd4IIVBm+WSOVNgizH/KNd9tCJT4ENf8khOga0c4HcUwAbEnibFaZhCjj4nU6J296R0zXf2ZZsfsfuqYnqcTiylmJVQQBib/vaSxkDO2ugwSSxFIteM2QqSMb/rTUgY+uB1kXazoKs/j5R8bQpDvKgQ1iBRRhLzqxbRh6Itz2rq1o2dpL0vBIxy+Q6YecPKdsALOaJZ4x4W3EhH/zNL+RbSyuJyA5FyInoBwO3hi+LZ5GN03UX7tZvQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=iTt7V1vWE1If9pieUrWzNWGJ5IshGF4Xty0DrZq4QZ4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1968675573; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 Oct 2026 16:02:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xHNuN-00000000TfP-2ngt;
 Thu, 15 Oct 2026 18:02:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>
In-Reply-To: <20261015125356.1917757-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 15 Oct 2026 14:53:56 +0200")
References: <20261015125356.1917757-1-dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 18:02:19 +0200
Message-ID: <87wlrjc5pw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.222
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The patch bumps the Linux kernel to version 5.15.222 and, for the SD
 > configuration, also updates U-Boot to version 2026.10.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
