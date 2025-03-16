Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3034BC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 17:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C93DE40BD3;
	Sun, 16 Mar 2025 17:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yss-t6WKiaiX; Sun, 16 Mar 2025 17:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A4B40BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A4B40BEE;
	Sun, 16 Mar 2025 17:47:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C63961
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AAAE40BEE
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_7Y0OKciVEu for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 17:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 393FA40BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393FA40BD3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 393FA40BD3
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:47:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A57C22003CE;
 Sun, 16 Mar 2025 18:47:36 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 18:47:36 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 18:47:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-5-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-5-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <97b018cf657cc67f86699a2e2a5d8380@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742147263;
 bh=7p57fG9k59yJTPPfO36veBSKMwd+etrojLce57FTx7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sTNgIwUGmVq3egPodKOOU5KUYThw9/PlGyzWx1owJnbOzee0HezLh8L5VrODUbk9F
 yT6Rgl3DvIKhqcCtLHTDXcg59bREYmtGwWQR5+V44mQhIKx7B0QX/NbO1925mIhVwZ
 rcolb/nDMtqy8BrM3Eh74AmhSIBd8ggKArRwCQ2DzZPssjUqLD2kH+SHHMbeKhL3Zn
 +A8xANwRYaO8PRqkOLA+8Wqjt1F81dd4sKwnhYVSC5rs6VAk9QCXlwPRwqoI+DLEMe
 8Mi9F4dcIUKjMl07nwp4oPze5Qw/9tBapRXG4XoNTA87mTHeCfK7Ch/trjMfxvOk82
 bD88rYH5rEI0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sTNgIwUG
Subject: Re: [Buildroot] [PATCH 04/15] package/qoriq-ddr-phy-binary: new
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On 02/03/2025 22:52, Vladimir Oltean wrote:
> The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
> as prebuilt binaries by NXP through GitHub.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>

[...]

> diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash 
> b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
> new file mode 100644
> index 000000000000..7357e741fcfa
> --- /dev/null
> +++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> b49cb34f941f7e534ec31d3d14d18d4e565e4875b690ecb0d7e2992b72c64dc7  
> qoriq-ddr-phy-binary-lf-6.6.36-2.1.0.tar.gz
> +sha256  
> 7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  
> NXP-Binary-EULA.txt

With this patch, running the command:

     make qoriq-ddr-phy-binary-legal-info

Fails with output:

     >>> qoriq-ddr-phy-binary lf-6.6.36-2.1.0 Collecting legal info
     ERROR: while checking hashes from 
package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
     ERROR: NXP-Binary-EULA.txt has wrong sha256 hash:
     ERROR: expected: 
7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17
     ERROR: got     : 
e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f
     ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Can you check and fix the legal info hashes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
