Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3885CCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD75A608D1;
	Sat, 10 Oct 2026 12:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHUkJdMJUcJ4; Sat, 10 Oct 2026 12:40:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E896260697
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636031;
	b=TB7YyRsbPV5t0t3u06tsyVTG8SG1/8+PqdxcvNXOHeSq3K6B5C66dz7Mqhfo+zMsUuz4
	 tq0S3X6dz02+wrTldQBs0vf04POf3oOovAJMdeRq39RuTg6FiKS3IiKnSXZFl/+7ZChua
	 yN+JVw5CnUhutFm7K9nQeOdpVsOA7Odm+y6H/dVCWR8i9Agm5IryyWRjduWNG773QXuvA
	 hBPTuXdbolKsDVDGRzOuVbmVA9PEr4fpYfUjXb1wYuia2kUtRwBw3AR/ZrjhkYHd0ixrS
	 xKZE/Cb8xfzjCLMSebj8eDy6GZVodA12P5WbuiI25tDIb7L8VV1toupnS+pxPVYd4wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=6Xt1Qx1x9lBAKTZPbPqolZIHnO0yTla0+RjnfS6lQms=;
	b=fbWaTQrSW4cg+Ai16kpoyI9eHFpjFhqMBnkPd8BT/Hxywuht6U19LQr43sYrZa3vdrPC
	 qEm+ylziAXWvLuIjpqlAOscTT2hw2rsYaW4VX5TKaDWU6cXM9+DvnnSF5DF2rCs4o3xnd
	 /8bnOetR7JUYc4FGi/RMQoaVkwqvBXd+RvbW+ld3/sKBw2mGPQEK5zNdSGrppnV+ohuPk
	 IQfYIRjKRzHR+1XlGH+CyPpzP7M4jI9tb+lkfV2eLPYj+ac7JesCxn0nPno+Ell8DIlWE
	 YdqjvZWngwTt0gjnjGH6D0Quou5N7T9FCpVjkawVmgAA5SqH0R8S0knCKpYnT1bBqDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636031;
	bh=6Xt1Qx1x9lBAKTZPbPqolZIHnO0yTla0+RjnfS6lQms=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T11dsOYjlPaN2fnycnGC5dTD7kAAJn99q4uMe+gEoF5xbL9bySIdP97GCFnqx4cb5
	 rrV1BTF1lvb8yQg307F3hLZ6yCHHGwxHOX/8FqftjWomKMzcjDhKstXFu4HXVB834l
	 RlXqAR8EYCaUNLmQbfiHk+cewtkjG2ohikhcezvUL1cFBIwmrTF/HAG0NOxFMJi7a1
	 mTkKHJ7slOpsaoLzulZt05h1m2GwVGgXoiWlJKWE3WcZJlt3k53c8piWBXf2xFblTh
	 MTin2b6BirAFSc2xsz8EKT5DlVwGabeZYTaKTmwxPN78xI/XmDSSggGjSZ+SZ3lsCm
	 RZQbijJLaXh0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E896260697;
	Sat, 10 Oct 2026 12:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8EBC317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF7860680
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrG5jPJUf202 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F28C60672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636028;
 b=qtu23FVigZY20ZbypBCOST4pWSc1hF0Xc41+EDEm6XAPcOpl2cEBG4SQdP62Qlexvscg
 EkwD+dHV5QCcG0xXtZIFNB8+Po3vgOLSHb7iEre1/Ag3PAzC+7b2LWvQTzhQSCqYrqoXi
 ZXw2WjjKi6GPbqiE4SXMAPlOzqslLoc8re4ftEE9usMZ0OyUrQlCiMvOLN1IjTJjSv1sL
 SAB59zBN0JFjbgFhJ04mQ/eqEr2eT9LG5D3G0+WN4emwNbAsDTLNtaDIKkmlFCYPSDmoc
 eVAeOmZUfKQ/XIismZPCXvXlaaE6xaTKK/j4a3/jXQU3IxOdGBYfmHLzZ/W6a1YL6Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636028;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Q8c6QoXAIplhrF0lAfTv5Vobe2NE+K7G6wk0MhTnJwI=;
 b=JsOQsEJbw+7LxEZ4mWXPn695gqNwrtfqDSmKM17+jazIFTqb8Nrp1QtLtVsJFqefRm7h
 0coAr0ChK6Iq6ODybQWOoM++v/PhXnMSSB6ZQcr8WoEqWEJ1lWf3LmWYb3PGTXnVlPfO8
 o6rksQCENXWViXOzmWEAr49T8izZGf8ycZD7gqL0Tu0wN/PMFs4E/fJ0cQ1seQhLnzGTa
 ochWiwH8ydeYwR9B3457CReMYB8NUgYl4ung8xERDIOl8qXy3Rob4x5jkns48f+aq1ZMO
 MaA/lvUQbUQ5fLLx/WdwYsszJCNy3gK1thgLeZQbnnG1twEetGfc/EhZ28QuQNhNWUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=YEbxsvZI; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F28C60672
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B883CB978F6F; Sat, 10 Oct 2026 14:40:22 +0200 (CEST)
Message-ID: <12161f22-9c9c-4112-a536-4c542816178c@rnout.be>
Date: Sat, 10 Oct 2026 14:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@gmail.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
References: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] docs/manual/writing-rules: align use of
 genimage partition types
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/11/2024 22:00, Brandon Maier wrote:
> Buildroot boards use a mixture of the GPT Partition Type "L" (generic
> Linux filesystem) and "root-x86", "root-arm", etc (UAPI Root
> Filesystem) for root filesystem partitions.
> 
> To have consistent guidance on building disk images with genimage,
> update the docs to recommend using the UAPI Root Filesystem types. The
> UAPI Root Filesystem types are part of the UAPI Discoverable Partitions
> Specification (DPS) which helps set a wider standard for system boot.
> 
> See https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

  *Finally* applied to master, thanks.

  I included Niklas' feedback as well as some more changes of my own.

  Regards,
  Arnout

> ---
> Changes in v2:
> - Update docs to call out root-* partition type [Niklas, Thomas]
> - Drop GUID board updates for a later patch series
> - Link to v1: https://lore.kernel.org/r/20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com
> ---
>   docs/manual/writing-rules.adoc | 37 ++++++++++++++++++++++++++-----------
>   1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
> index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..3964deca867494ca4df70f3c0d92f9982ec6deec 100644
> --- a/docs/manual/writing-rules.adoc
> +++ b/docs/manual/writing-rules.adoc
> @@ -198,17 +198,32 @@ image sdimage.img {
>     chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
>     (not +kb+) in place of +G+, +M+, +K+.
>   
> -* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
> -  the EFI System Partition (expanded to
> -  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
> -  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
> -  _genimage_) or +L+ for the root filesystem or other filesystems
> -  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
> -  _genimage_). Even though +L+ is the default value of _genimage_, we
> -  prefer to have it explicitly specified in our +genimage.cfg+
> -  files. Finally, these shortcuts should be used without double
> -  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
> -  specified, lower-case letters should be used.
> +* Every +partition+ of a GPT image (e.g. +partition-table-type = gpt+) must
> +  explicitly set +partition-type-uuid+.
> +
> +** Every +partition-type-uuid+ value must not be double quoted
> +
> +** Every +partition-type-uuid+ value must be written with _genimage_ GUID
> +   shortcuts (for example, use +U+ instead of +c12a7328-...+). For a list of
> +   GUID shortcuts, see
> +   https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section
> +   If a GUID shortcut is not supported by _genimage_, the full GUID must be
> +   written in lower-case letters.
> +
> +** Every +partition-type-uuid+ must use a GUID from the
> +   https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[UAPI
> +   Discoverable Partitions Specification] when possible. Some common partition
> +   types are as follows.
> +
> +*** +U+ for the EFI System Partition (expanded to
> +    +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
> +
> +*** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
> +    system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
> +    +root-arm64+)
> +
> +*** +L+ for other Linux filesystem partitions (expanded to
> +    +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).
>   
>   The +genimage.cfg+ files are the input for the genimage tool used in
>   Buildroot to generate the final image file(i.e. sdcard.img). For further
> 
> ---
> base-commit: 0df7dfb804457a62c7751eec6555ad75158e3e3d
> change-id: 20241109-genimage-partition-type-uuid-8e4c62ee041f
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
