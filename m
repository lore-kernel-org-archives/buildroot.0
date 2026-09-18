Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6EC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 11:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 596E860D68;
	Fri, 18 Sep 2026 11:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msjFPNIQckF9; Fri, 18 Sep 2026 11:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0947460D5B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789731771;
	b=W+4+bVFcA7UDpb9hBU7xQIiZgkGb9UUwWt2kJ44yD8A98lFaHPR0ID5LKoXLT26Bvg03
	 6bZ2LnLM7Kz6NtYXDikeSQbPOKxWFnsgsWE/Iw+RpJ/auh36zmpTF/L2icOBfYbS03UqW
	 oLM0Tn1WIQXeZGny1Dk/vYbHakJdkcwCGJmQUKO/4wVHL4Yzg3bju1sqHs6/dkDgyu9tf
	 hB4haAaja9+DN4nHofMj3Scm8lsKRcYZxNqBe2v4jjONbxrzAWJTeLBkbIPcrBe7MbZIe
	 ej+3tzaGtm2mCgqdSoLQdirwiL2ZvPRT0Ust3YeMirsqmVPan9zJ5nfsfVrWicwetxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789731771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=o5r1G74hOnUcUEaeqhkWmkC8AgQXPQk4pfEDDQdDHSE=;
	b=A8zPPdc/wslBv4OkMtLoV+i9I0cLoBRMfXg+NION2x3xJwGAIu7AI9IDM5No9pd7MQaq
	 4Dlf6zmFwrMTu06RymD66DWMwBb3x/0imGvjXf248+R97+Ckylmk9AEZLhz+EFotM0STS
	 5Yg7scbp3DRNBbOdfZdS3HbbT9fQVvOtBNgupkSg5W5e0R6XkYl09ncPmH98WPFMTTNPe
	 Z3t9WIZOFI4aHw+RxhxTInQz4ZICPoJxp0KMp1o0HThvuLxJ7MGBpwLeWn0oq/JXsPMsi
	 8ElTQCspPDsCZuqejS9w3dwScPb2RQbde162bOeCAcsCdd69JeMKEGzABxiyOOh0qcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789731771;
	bh=o5r1G74hOnUcUEaeqhkWmkC8AgQXPQk4pfEDDQdDHSE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FfDDWJWUkiG3ifr1nvnHf/WxsB7AC875Nyut9ubcUROQd2K1w0TAnY0hxQCZO88E5
	 RkJqbyZU5h9wCYLrSUMi0M8n/QyEFUEg5DeNeMOp2dykekL8HxhpG3xEVzaESX7ED2
	 Cb/bo2L75PMh9gLTmykud/Tzfgew/94uQCVPFCe3M5J3sOweFLH9saaSg1kRAR+ys8
	 P+wTdNq3Rzl5ynTaT82lWIYOODAVnfEFEtd2TE7aASVoWwu3C6vZeqJ470XhgtKiAM
	 fdXhwjZGlZDKEKCpuYQLrBzxPXkxwaBI0LPQpCu62c+LSmWjvvg3oq7XJ4rLWDjWnq
	 6QwzPvfnHF59Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0947460D5B;
	Fri, 18 Sep 2026 11:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E3D23F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A9960D5B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o470ynJ3RUUj for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 11:42:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E19F60C23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789731768;
 b=fUPR4rhP4LnYD/kyaZx8veKbFd90RaY56XY+YF5G2cH5XZJw1KJAvWnAu/h8MJEhl/z1
 Gfe5Cxw4TGSG3KkwOr8fEqUcxW0WkeZcyPLR3qwhBdNwRXI33zYgDoMhZBBU8D87iAOye
 Z+CHkABQKkSE+lTWlCKrpzVa98YA4PtkMDIGmtOBzGYqoSdzYt9Dmcne0a5zI9PC0FIOH
 VFaCBWxPD6wpbCJECeUm3QJI5jeMNmQQcT064KaS9wIAtKVKVXruITHSTbYb6t9Ce/P/n
 Kg1KK7LaAj4YGaY8SYG519qWPVVRyk7wllQkC6OMQ8gtePXWCjrSdvQSwlBdQvjDBWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789731768;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=4BF9qAtgUKqxe3Thefw1/fjrA1utm4w+IxXofRL91Co=;
 b=j5IpnL9MAWIyUJswpwKBINlLH542B6yvb9GQ+A+cAA2NQTXxok3978ndogNRsRNGnCbV
 CeGiE0YhfBkw/Qw8G0EylXKD4+dUdlcOX7WB3O5QG0Mig39+GMfl3QicPs/9MIrJbN32S
 7Fp0/GjYwGjJ4QsmnC1bG3qLNYJnRq9w1M1mbtj2dluKsXCspLnPLpbkto1djIfqSSwCe
 QYxvW11Rwiygx9O8cmiwVuQwY3jLDjHLhCXEjASw/Ez+5SO2+oC36AzG8x7VhN+8Fdtld
 KtgXXqE3PZHRG8sEvwos4QqRMInXA0CMtzk8BNbbkGywBDY161QyicJ6RukAsoMgJ4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GslANHMe; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E19F60C23
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:42:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2E770780371;
 Fri, 18 Sep 2026 13:42:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 13:42:43 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 13:42:43 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260918093659.85791-1-thomas.perale@mind.be>
References: <20260918093659.85791-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <56e44f65f5a960bcc21185ac794b26b7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] docs/website: add Texas Instrument as a
 gold sponsor
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

On 18/09/2026 11:36, Thomas Perale via buildroot wrote:
> Texas Instrument is a semiconductor company that designs, manufactures
> and sells analog and embedded processing chips for markets such as
> industrial, automotive, personal electronics, enterprise systems and
> communications equipment [1][2].
> 
> Thank you for sponsoring LTS maintenance !
> 
> [1] https://www.ti.com/
> [2] https://www.linkedin.com/company/texas-instruments
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
