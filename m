Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C5AC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 20:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FE6580CB5;
	Tue, 22 Apr 2025 20:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxz8QeNyyihe; Tue, 22 Apr 2025 20:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DF682034
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DF682034;
	Tue, 22 Apr 2025 20:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4610F19F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BD8682034
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u35Fz7VbYXAD for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 20:36:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 199B280CB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 199B280CB5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 199B280CB5
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:36:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F3F843226;
 Tue, 22 Apr 2025 20:36:03 +0000 (UTC)
Date: Tue, 22 Apr 2025 22:36:01 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com, ju.o@free.fr,
 fabio.caccamo@amd.com, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
Message-ID: <20250422223601.1ca5077b@windsurf>
In-Reply-To: <20250408114834.733285-1-neal.frager@amd.com>
References: <20250408114834.733285-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefhkeevhefhkefgkedtudejjedufefhleeitdehtdetgffftdffkefgleduteegnecuffhomhgrihhnpegrthhlrghsshhirghnrdhnvghtpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoo
 hhtrdhorhhgpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomhdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepfhgrsghiohdrtggrtggtrghmohesrghmugdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745354164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8+L9koc9twKFZtXb04W7Jv1ws0Va4Cal68fsv8aPxA=;
 b=ca7jNQ0WsUeLkEn4BvD/HecXktsK82Mwd3rutK7SHR0gimDq3c70yflbwcP4RQ7z2/MKn0
 XfxkKpXk7O9oqoY+Q2980t19ZUL0r4an1kBsanLhuC06PnZvBo4WfSbYIWEvHzSXWO1yJO
 ULkwYpbrMZVZgAAUNdviyeNGS0Quy+aGcQGF4lVmI3K0BSofw9WWPx6HmhUoENpzb2/I2o
 CYqKTBlIHnhaiLG3GapEqwx72yv0JjA+lgPSTVA4VtVhlRCCfx3PFCE0hCUOySfNCr6Cof
 4U4mcl8hHCy93NDhbP2Dv655Crnn5cThbDVR+kh0JzYdYKi8xAmZQ9TwqYLWRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ca7jNQ0W
Subject: Re: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 8 Apr 2025 12:48:33 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Add a new package to Buildroot called fpgautil which builds the Xilinx
> fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
> and versal products at run-time.  This is a handy application for loading
> FPGA bitstreams and their corresponding device tree overlays.
> 
> An explanation of how this script can be used for each type of product can be
> found on the wiki pages below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
> 
> In addition, the source code for fpgautil can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
> 
> The fpgautil script can be used hand in hand with the Versal Segmented
> Configuration with the following example command for programming the pld.pdi
> file to the Versal FPGA:
> 
> fpgautil -b /lib/firmware/<design-name>_pld.pdi -o /lib/firmware/<dtbo-name>.dtbo
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thanks for this new package.

I think we should probably name this xilinx-fpgautil, because it's
really very specific to Xilinx platforms if I understand correctly.


> diff --git a/package/fpgautil/Config.in b/package/fpgautil/Config.in
> new file mode 100644
> index 0000000000..8a1f557f7e
> --- /dev/null
> +++ b/package/fpgautil/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FPGAUTIL
> +	bool "fpgautil script"

This should only contain the package name, i.e "fpgautil", or if we
rename it "xilinx-fpgautil".

> +FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> +FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(FPGAUTIL_VERSION))

I was going to suggest that we download only the source file, but that
doesn't work because it doesn't contain the version in its file name.
So we have to download the whole Yocto layer just to grab one source
file. Sigh.

What about using the vendor-agnostic OpenFPGALoader instead, packaged
as package/openfpgaloader/ ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
