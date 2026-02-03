Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6A4E83070
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB270821E1;
	Tue,  3 Feb 2026 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PH3pkAUUcODO; Tue,  3 Feb 2026 10:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEAD682391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770113203;
	bh=FcdW1QLwxpQyxHqFIZFRbibO7z37JeGaYQ+CC9a2hZc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GitX4W4cTpi6CWGIiJnVcxNX6qtDfTENPX9w5UsRHuTn8j5TlYrE0Kj05i1BOP+ME
	 CDI2N/6XzaIjlPiSmHnaoHoNOsi86ckvQz7ZEuC0lmn9rmboyNWLsMDtE2j9J9Y1TN
	 hCUlF44x6KRyeuGXzvUztkxc/eEVpVRDyOn0m55ZS9y96OvUIAWdemqawkRgMB4UQ3
	 7hBAlW27xv5TBF5FbDzxDndKmzTAbJr8zJw11qEvVNkct34JPfFh92H8fMLcZn+OMt
	 OkCyl+NgfXv37L9XKQL8TkA/ILgXvpX6vcu/fHlSzWMVCwuH2e+4lTK2FjqyrqQBDa
	 T/OX2VFJbHbZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAD682391;
	Tue,  3 Feb 2026 10:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C58CDF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B94082391
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFCcl8SaZMi5 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88887821E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88887821E1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88887821E1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:06:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CA959780389;
 Tue,  3 Feb 2026 11:06:31 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:43692])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 11:06:31 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 11:06:31 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20251120123703.1371644-1-buildroot@bubu1.eu>
References: <20251120123703.1371644-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <e9740e0633af25ef343eb988df9a1764@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770113196;
 bh=mqdazr47jaj7jwUYzeo5mRUYITsBe+7JfqHR6t8SUAw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DggGpU5a7BuaP/jRC4NAaWmIzsNmk50DAIOtmpK+Mwd3og7uIWKO7SRM/7+mUhzpw
 0XV+/hpswSJQrAD9vuTUtbQO0Ob5C2AZnVPVavVvMjlifR2nbJiqI5hejG/IYrHKIy
 DTw+vXPPbjSwZ0ymHlv129JeKPj+SKBTqyqwqbwff1Uk4J1l+teYIXAX43yJDuOuNX
 xyIilt8+lWFYY4CK8xI9DtbVuyaxhDMCo/+ZqxFFt4iN6OlpojucZn5S0YbDsfZNtU
 2mCv8rUD1RDww/gKVJD4p2EuAU2xFN3leKZpUQcL/dfITVedvov9OSyVvaAy/6lZZW
 w8qoM5c0TVDvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DggGpU5a
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-sdbus-systemd: new
 package
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

On 20/11/2025 13:37, Marcus Hoffmann wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.

For info, I reworded the commit log of patch #3, to better reflect the 
situation. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/287d06f5d7a99521a6a2ccf0f0c39159d5e5f2ef

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
