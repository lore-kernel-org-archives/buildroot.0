Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733FCA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1355B605E8;
	Mon,  5 Oct 2026 15:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8GVGBnIPwaO; Mon,  5 Oct 2026 15:51:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2566360722
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791215487;
	b=WiaVSC/EW0xSK5B+ndaqkJsZ8sceRE4bJA7OY3ROAECQ5sRRgHynN9+57KaUNmXRiAHR
	 h75nd9RCvJj/TNtp7rQgyHuK1e6KYRLN515Tbj79RG09M82UEGl9unQx3y1xUs6nz+Evr
	 vVXkPKNV0oONnYNjbVeS77xIWctMJh1FE/pK4Rk4xYrnbUByui+s6ZqOzXbgA2Vz+a/tI
	 gN+KrfpqqR8Yh+7QRJzvH6/sSFSSgCQmSr8s1fkyCnXR3ayVnmYP6Ei4j9gvvmtc12qg6
	 Sss0/z8J70bQMl/G1lwsMIGfFuKh19l9tUFEdOQbd2WnKx4cpuhSNPmHHCgKIvh5oHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791215487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=srtNASFd4BE/FjXN308Cw7ZiekDX9t+lBabqbAW8Ot4=;
	b=dW6WUIKcdsnqAc0k8Exc/Hn6av1zsUdCJ9G3O2W+fdo0OagZZX3Ms5gpcpSjkXOFc7wP
	 wx0slWPDdLNQrxkOW/QuqH+w3+Dvgfz40MXyDPZ0+QP/9tXVkEuHZi/R/hh7r7C7pZSMZ
	 /i9w4WwbyS76Fzw+VMr7OWM315pw97xXvvq0HUrdKTm7FXhuY+vVS5NMrg5OeqI/kVXO6
	 wAhqt9afGzCiPMpg6aW0YohhKK8OxlJET7Y2vqzDOWgz4kLFOstW8cRNQ2CmXlZlKPfDo
	 eheVTzjQYGALtdfYLoOOhMptMa+WPgX1YcJK7ISd+j56sWO6vjCwKGHPj2hEW/vZLyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791215487;
	bh=srtNASFd4BE/FjXN308Cw7ZiekDX9t+lBabqbAW8Ot4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oTkt0w+vegwcPUu956+PN7RrNGNdGDdwApYMMUepRt+iBvNBBoPX/YRq/84+e3aiy
	 /cKiWPmUkqGcCwG4r7pGIx1iZToYw8K4hnK9OdcRFU7qPhcsRY0CdduoJDG7PoOWvW
	 o8iXizpP4dxW3nYTrqiCguPcJfa9wrxKFXhy6q1lp6RoCiPjKwpDV9d8mDTJrot79E
	 mXoIPTXyap8/rVDLE405y1jDFcNtWs9UmOOmHxz8qKfUYhUSQI83FQqEZR7vO5gpT1
	 kjqVoiP1kFjJtHLB5BlM8qmB+HK+4o4zaoDHbB0OvZyXAY7MGJaTRNnj3dECYKafRE
	 TGJik1pSMUSgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2566360722;
	Mon,  5 Oct 2026 15:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E1EA13
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ED8940211
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEOzf9FunJPA for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EA58D40204
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791215120;
 b=U1BV4GTDQzW+3QBag/nk9sIVCgk9cejeUhbPFw7FcGh3bvBMp8AuCT7mlMJ13jSp7Mgo
 2drsyzrvZDzxIJF05GbEHsxU3FmmQwK1hhDaysgmcmMxyOJ2F2dRAtI1nj53AgQCFUB95
 Q4qX4/+zz9T2NBmll1kgg1dH5HkcLIYbTgYqQHIJkVUtKsMi3ZDOUVHWF/1T66R2rz2c5
 QQWs4OHtKtLLqc10B05BTX45qOwTkuuEF22/3DkhCS9EqD/pxhKeO2yALvPkQJQiMCFSF
 sTMrqz3SmAdpfXhCsICEPRMEv4rv3qZOY5yMOtizUznrOVmK3MFODGf7pOhcqi6DwQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791215120;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=5cGfjfWVnW8yD4xw8SDB+oxi37RguZObR8s0MiqXBrw=;
 b=jzyq1diOvmSYnCDUmcWT5Oo5HBbZsmEk+D0WHH0zXQQsJrCpyZohQEdA3NlDNpBwtt25
 BHnLL0wLuM14fb6PLlLzZY2AST3SleGcS7Cmbw9Ek2Bm2skJSu5LsnWNsE6pnUqn+N/1Y
 HGBeg2cC+diLRHIJrBS3S361btqTVk7LX9QN0uGy3TyxKIUQwBT8TDAJ/emUwVtlBah+Q
 d2Y7k/U87b+85+rSCVAHjDRD+06iOKX+IVbVACh0S5pt49xeItBudsHOZ+036Bgb/3dk4
 XKVi8yj3z7A0O38QVD2u1EAgP0VlPyqlOkA14/x9D5zscMg9APvIoIdI0tSWHxGRJAA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=duIkDkB5; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA58D40204
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:45:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EF3AE60152;
 Mon,  5 Oct 2026 17:45:14 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41742])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Oct 2026 17:45:14 +0200
MIME-Version: 1.0
Date: Mon, 05 Oct 2026 17:45:14 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <245d803e1ed4a6146dbd00789edc02d982bd6329.1791178950.git.yann.morin@orange.com>
References: <245d803e1ed4a6146dbd00789edc02d982bd6329.1791178950.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c17edf604de1363f28dbbdd62ea5e3f0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gpsd: backport security fixes for
 CVE-2026-58459
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

Hi Yann,

On 05/10/2026 07:42, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...f.py.in-Quote-double-quotes-in-title.patch | 46 +++++++++++++++
>  ...prof.py.in-Quote-back-ticks-in-title.patch | 44 +++++++++++++++
>  ...prof.py.in-Quote-back-ticks-in-title.patch | 56 +++++++++++++++++++
>  package/gpsd/gpsd.mk                          |  6 ++
>  4 files changed, 152 insertions(+)
>  create mode 100644 
> package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
>  create mode 100644 
> package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
>  create mode 100644 
> package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> 
> diff --git 
> a/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch 
> b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> new file mode 100644
> index 0000000000..ecc2eb6116
> --- /dev/null
> +++ 
> b/package/gpsd/0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> @@ -0,0 +1,46 @@
> +From 5581ba196d826a984fbfaf792b7d58535f9911ce Mon Sep 17 00:00:00 2001
> +Message-ID: 
> <5581ba196d826a984fbfaf792b7d58535f9911ce.1791178679.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Wed, 1 Jul 2026 17:55:57 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote double quotes in title.
> +
> +Someone could use the double quote to break out of the
> +string and add gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>

The command "utils/docker-run make check-package" reports 7 warnings
with this patch.

Could you add in each package patch files the following tags:

CVE: CVE-2026-58459
Upstream: ...
Signed-off-by: ...

> +---
> + clients/gpsprof.py.in | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 5c18f50ff..261e72665 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -198,6 +198,10 @@ class plotter(object):
> +         if 'subtype' in self.device:
> +             desc += "\\n%s" % self.device['subtype']
> +
> ++        # escape ", and \n, for gnuplot, to not break strings
> ++        desc = desc.replace('"', '\\042')
> ++        desc = desc.replace('\n', '')
> ++
> +         return desc
> +
> +     def collect(self, verb, log_fp=None):
> +@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
> +         # Ship the plot to standard output
> +         if not options.title:
> +             options.title = plot.whatami()
> +-            # escape " for gnuplot
> +-            options.title = options.title.replace('"', '\\"')
> +         if options.subtitle:
> +             options.title += '\\n' + options.subtitle
> ++        # escape " for gnuplot, to not break strings
> ++        options.title = options.title.replace('"', '\\042')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +--
> +2.43.0
> +
> diff --git 
> a/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch 
> b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> new file mode 100644
> index 0000000000..d252c9809b
> --- /dev/null
> +++ 
> b/package/gpsd/0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> @@ -0,0 +1,44 @@
> +From 1a6bb7bcbdf58aa940132e630870af061dc88537 Mon Sep 17 00:00:00 2001
> +Message-ID: 
> <1a6bb7bcbdf58aa940132e630870af061dc88537.1791178680.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Tue, 7 Jul 2026 13:41:54 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
> +
> +Someone could use the back tick to break out of the string and add
> +gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
> +---
> + clients/gpsprof.py.in | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 261e72665..202214769 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -198,8 +198,9 @@ class plotter(object):
> +         if 'subtype' in self.device:
> +             desc += "\\n%s" % self.device['subtype']
> +
> +-        # escape ", and \n, for gnuplot, to not break strings
> ++        # escape ", `, and \n, for gnuplot, to not break strings
> +         desc = desc.replace('"', '\\042')
> ++        desc = desc.replace('`', '\\140')
> +         desc = desc.replace('\n', '')
> +
> +         return desc
> +@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
> +             options.title = plot.whatami()
> +         if options.subtitle:
> +             options.title += '\\n' + options.subtitle
> +-        # escape " for gnuplot, to not break strings
> ++        # escape ",  and`, for gnuplot, to not break strings
> +         options.title = options.title.replace('"', '\\042')
> ++        options.title = options.title.replace('"', '\\140')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +--
> +2.43.0
> +
> diff --git 
> a/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch 
> b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> new file mode 100644
> index 0000000000..ed5007e4eb
> --- /dev/null
> +++ 
> b/package/gpsd/0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> @@ -0,0 +1,56 @@
> +From 4c06658e988f4ced1a7a574ce082a22ef625df56 Mon Sep 17 00:00:00 2001
> +Message-ID: 
> <4c06658e988f4ced1a7a574ce082a22ef625df56.1791178681.git.yann.morin@orange.com>
> +From: "Gary E. Miller" <gem@rellim.com>
> +Date: Tue, 7 Jul 2026 14:23:56 -0700
> +Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
> +
> +Second try.  Also quote "terminal".
> +
> +Someone could use the back tick to break out of the string and add
> +gnuplot commnds.
> +
> +For issue 404.
> +Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
> +---
> + clients/gpsprof.py.in | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
> +index 202214769..e91367ee3 100644
> +--- a/clients/gpsprof.py.in
> ++++ b/clients/gpsprof.py.in
> +@@ -200,7 +200,7 @@ class plotter(object):
> +
> +         # escape ", `, and \n, for gnuplot, to not break strings
> +         desc = desc.replace('"', '\\042')
> +-        desc = desc.replace('`', '\\140')
> ++        desc = desc.replace("\x60", '\\140')
> +         desc = desc.replace('\n', '')
> +
> +         return desc
> +@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
> +             options.title += '\\n' + options.subtitle
> +         # escape ",  and`, for gnuplot, to not break strings
> +         options.title = options.title.replace('"', '\\042')
> +-        options.title = options.title.replace('"', '\\140')
> ++        options.title = options.title.replace("\x60", '\\140')
> +         term_opts = ""
> +         truecolor_terms = ['png', 'sixelgd', 'wxt']
> +         if options.terminal in truecolor_terms:
> +             term_opts = 'truecolor'
> +-        sys.stdout.write("set terminal %s size 800,950 %s\n"
> +-                         "set termoption enhanced\n"
> ++
> ++        # escape ", `, and \n, for gnuplot, to not break strings
> ++        options.terminal = options.terminal.replace('"', '\\042')
> ++        options.terminal = options.terminal.replace("\x60", '\\140')
> ++        options.terminal = options.terminal.replace('\n', '')
> ++
> ++        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
> ++                         'set termoption enhanced\n'
> +                          % (options.terminal, term_opts))
> +         # double quotes on title so \n is parsed by gnuplot
> +         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % 
> options.title)
> +--
> +2.43.0
> +
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 7fd8cec8ab..b23bc4c065 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -9,6 +9,12 @@ GPSD_SITE = 
> http://download-mirror.savannah.gnu.org/releases/gpsd
>  GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
>  GPSD_CPE_ID_VALID = YES
> +
> +# 0001-clients-gpsprof.py.in-Quote-double-quotes-in-title.patch
> +# 0002-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> +# 0003-clients-gpsprof.py.in-Quote-back-ticks-in-title.patch
> +GPSD_IGNORE_CVES = CVE-2026-58459
> +
>  GPSD_SELINUX_MODULES = gpsd
>  GPSD_INSTALL_STAGING = YES
> 
> --
> 2.43.0
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations 
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez 
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les 
> messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme 
> ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged 
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and 
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have 
> been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
