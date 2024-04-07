Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A3BCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 498CC40B75;
	Sun,  7 Apr 2024 19:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwsJ0NXnvPgG; Sun,  7 Apr 2024 19:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ACEC40B9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ACEC40B9F;
	Sun,  7 Apr 2024 19:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 466241BF954
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A0BB4078E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vnk98hPJDwRO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6C6406FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6C6406FE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB8985C1D; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:37:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b526b2aa1546c42384ba1af21afea1a0f08073d7
X-Git-Newrev: c8df468c7b192dec02440436767eccd51f5a4c3f
X-Patchwork-Hint: ignore
Message-Id: <20240407193903.BEB8985C1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: fix build with kernel
 >= 6.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850046433486983050=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1850046433486983050==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c8df468c7b192dec02440436767eccd51f5a4c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 6.8:

/home/autobuild/autobuild/instance-8/output-1/build/dahdi-linux-3.3.0/drivers/dahdi/xpp/card_global.c: In function ‘parse_chip_command’:
/home/autobuild/autobuild/instance-8/output-1/build/dahdi-linux-3.3.0/drivers/dahdi/xpp/card_global.c:345:9: error: implicit declaration of function ‘strlcpy’; did you mean ‘strscpy’? [-Werror=implicit-function-declaration]
  345 |         strlcpy(buf, cmdline, MAX_PROC_WRITE);  /* Save a copy */
      |         ^~~~~~~
      |         strscpy

Fixes:
 - http://autobuild.buildroot.org/results/a0d2dcd10af9bf465ded2da83eccf2d137187477

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...-compilation-issue-for-6-8-y-6-9-y-kernel.patch | 230 +++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch b/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch
new file mode 100644
index 0000000000..776d74218e
--- /dev/null
+++ b/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch
@@ -0,0 +1,230 @@
+From 497f11466688d9e76a7b68ffdd2c3859279f5fce Mon Sep 17 00:00:00 2001
+From: Pushkar Singh <psingh@sangoma.com>
+Date: Thu, 4 Apr 2024 01:15:01 +0530
+Subject: [PATCH] Fix compilation issue for 6.8.y/6.9.y kernel
+
+Upstream: https://github.com/asterisk/dahdi-linux/commit/497f11466688d9e76a7b68ffdd2c3859279f5fce
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ drivers/dahdi/dahdi-base.c          | 40 ++++++++++++++---------------
+ drivers/dahdi/dahdi_dynamic.c       |  4 +--
+ drivers/dahdi/dahdi_dynamic_eth.c   |  4 +--
+ drivers/dahdi/dahdi_dynamic_ethmf.c |  2 +-
+ drivers/dahdi/dahdi_transcode.c     |  2 +-
+ drivers/dahdi/xpp/card_global.c     |  2 +-
+ 6 files changed, 27 insertions(+), 27 deletions(-)
+
+diff --git a/drivers/dahdi/dahdi-base.c b/drivers/dahdi/dahdi-base.c
+index b96f72b1..87177a69 100644
+--- a/drivers/dahdi/dahdi-base.c
++++ b/drivers/dahdi/dahdi-base.c
+@@ -4359,7 +4359,7 @@ static int dahdi_ioctl_getparams(struct file *file, unsigned long data)
+ 	param.pulsebreaktime = chan->pulsebreaktime;
+ 	param.pulseaftertime = chan->pulseaftertime;
+ 	param.spanno = (chan->span) ? chan->span->spanno : 0;
+-	strlcpy(param.name, chan->name, sizeof(param.name));
++	strscpy(param.name, chan->name, sizeof(param.name));
+ 	param.chanpos = chan->chanpos;
+ 	param.sigcap = chan->sigcap;
+ 	/* Return current law */
+@@ -4447,8 +4447,8 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
+ 
+ 	spaninfo.spanno = s->spanno; /* put the span # in here */
+ 	spaninfo.totalspans = span_count();
+-	strlcpy(spaninfo.desc, s->desc, sizeof(spaninfo.desc));
+-	strlcpy(spaninfo.name, s->name, sizeof(spaninfo.name));
++	strscpy(spaninfo.desc, s->desc, sizeof(spaninfo.desc));
++	strscpy(spaninfo.name, s->name, sizeof(spaninfo.name));
+ 	spaninfo.alarms = s->alarms;		/* get alarm status */
+ 	spaninfo.rxlevel = s->rxlevel;	/* get rx level */
+ 	spaninfo.txlevel = s->txlevel;	/* get tx level */
+@@ -4475,18 +4475,18 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
+ 	spaninfo.lineconfig = s->lineconfig;
+ 	spaninfo.irq = 0;
+ 	spaninfo.linecompat = s->linecompat;
+-	strlcpy(spaninfo.lboname, dahdi_lboname(s->lbo),
++	strscpy(spaninfo.lboname, dahdi_lboname(s->lbo),
+ 			  sizeof(spaninfo.lboname));
+ 	if (s->parent->manufacturer) {
+-		strlcpy(spaninfo.manufacturer, s->parent->manufacturer,
++		strscpy(spaninfo.manufacturer, s->parent->manufacturer,
+ 			sizeof(spaninfo.manufacturer));
+ 	}
+ 	if (s->parent->devicetype) {
+-		strlcpy(spaninfo.devicetype, s->parent->devicetype,
++		strscpy(spaninfo.devicetype, s->parent->devicetype,
+ 			sizeof(spaninfo.devicetype));
+ 	}
+ 	if (s->parent->location) {
+-		strlcpy(spaninfo.location, s->parent->location,
++		strscpy(spaninfo.location, s->parent->location,
+ 			sizeof(spaninfo.location));
+ 	}
+ 	if (s->spantype) {
+@@ -4505,11 +4505,11 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
+ 		const char *st = dahdi_spantype2str(s->spantype);
+ 		switch (s->spantype) {
+ 		case SPANTYPE_DIGITAL_BRI_NT:
+-			strlcpy(spaninfo.spantype, "NT",
++			strscpy(spaninfo.spantype, "NT",
+ 					sizeof(spaninfo.spantype));
+ 			break;
+ 		case SPANTYPE_DIGITAL_BRI_TE:
+-			strlcpy(spaninfo.spantype, "TE",
++			strscpy(spaninfo.spantype, "TE",
+ 					sizeof(spaninfo.spantype));
+ 			break;
+ 		default:
+@@ -4519,7 +4519,7 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
+ 			 * so no backward compatibility for this
+ 			 * broken interface.
+ 			 */
+-			strlcpy(spaninfo.spantype, st,
++			strscpy(spaninfo.spantype, st,
+ 					sizeof(spaninfo.spantype));
+ 			break;
+ 		}
+@@ -4568,10 +4568,10 @@ static int dahdi_ioctl_spanstat_v1(struct file *file, unsigned long data)
+ 	spaninfo_v1.spanno = s->spanno; /* put the span # in here */
+ 	spaninfo_v1.totalspans = 0;
+ 	spaninfo_v1.totalspans = span_count();
+-	strlcpy(spaninfo_v1.desc,
++	strscpy(spaninfo_v1.desc,
+ 			  s->desc,
+ 			  sizeof(spaninfo_v1.desc));
+-	strlcpy(spaninfo_v1.name,
++	strscpy(spaninfo_v1.name,
+ 			  s->name,
+ 			  sizeof(spaninfo_v1.name));
+ 	spaninfo_v1.alarms = s->alarms;
+@@ -4593,25 +4593,25 @@ static int dahdi_ioctl_spanstat_v1(struct file *file, unsigned long data)
+ 	spaninfo_v1.lineconfig = s->lineconfig;
+ 	spaninfo_v1.irq = 0;
+ 	spaninfo_v1.linecompat = s->linecompat;
+-	strlcpy(spaninfo_v1.lboname,
++	strscpy(spaninfo_v1.lboname,
+ 			  dahdi_lboname(s->lbo),
+ 			  sizeof(spaninfo_v1.lboname));
+ 
+ 	if (s->parent->manufacturer) {
+-		strlcpy(spaninfo_v1.manufacturer, s->parent->manufacturer,
++		strscpy(spaninfo_v1.manufacturer, s->parent->manufacturer,
+ 			sizeof(spaninfo_v1.manufacturer));
+ 	}
+ 
+ 	if (s->parent->devicetype) {
+-		strlcpy(spaninfo_v1.devicetype, s->parent->devicetype,
++		strscpy(spaninfo_v1.devicetype, s->parent->devicetype,
+ 			sizeof(spaninfo_v1.devicetype));
+ 	}
+ 
+-	strlcpy(spaninfo_v1.location, s->parent->location,
++	strscpy(spaninfo_v1.location, s->parent->location,
+ 		sizeof(spaninfo_v1.location));
+ 
+ 	if (s->spantype) {
+-		strlcpy(spaninfo_v1.spantype,
++		strscpy(spaninfo_v1.spantype,
+ 				  dahdi_spantype2str(s->spantype),
+ 				  sizeof(spaninfo_v1.spantype));
+ 	}
+@@ -5285,7 +5285,7 @@ static int dahdi_ioctl_attach_echocan(unsigned long data)
+ 			 * always use it instead of any configured software
+ 			 * echocan. This matches the behavior in dahdi 2.4.1.2
+ 			 * and earlier releases. */
+-			strlcpy(ae.echocan, hwec_def_name, sizeof(ae.echocan));
++			strscpy(ae.echocan, hwec_def_name, sizeof(ae.echocan));
+ 
+ 		} else if (strcasecmp(ae.echocan, hwec_def_name) != 0) {
+ 			chan_dbg(GENERAL, chan,
+@@ -5384,7 +5384,7 @@ static int dahdi_ioctl_get_version(unsigned long data)
+ 	bool have_hwec = dahdi_any_hwec_available();
+ 
+ 	memset(&vi, 0, sizeof(vi));
+-	strlcpy(vi.version, dahdi_version, sizeof(vi.version));
++	strscpy(vi.version, dahdi_version, sizeof(vi.version));
+ 	spin_lock(&ecfactory_list_lock);
+ 	list_for_each_entry(cur, &ecfactory_list, list) {
+ 		const char * const ec_name = cur->ec->get_name(NULL);
+@@ -5640,7 +5640,7 @@ static int ioctl_dahdi_dial(struct dahdi_chan *chan, unsigned long data)
+ 			rv = -EBUSY;
+ 			break;
+ 		}
+-		strlcpy(chan->txdialbuf + strlen(chan->txdialbuf), tdo->dialstr,
++		strscpy(chan->txdialbuf + strlen(chan->txdialbuf), tdo->dialstr,
+ 			DAHDI_MAX_DTMF_BUF - strlen(chan->txdialbuf));
+ 		if (!chan->dialing) {
+ 			chan->dialing = 1;
+diff --git a/drivers/dahdi/dahdi_dynamic.c b/drivers/dahdi/dahdi_dynamic.c
+index b1df408d..be58aff8 100644
+--- a/drivers/dahdi/dahdi_dynamic.c
++++ b/drivers/dahdi/dahdi_dynamic.c
+@@ -622,8 +622,8 @@ static int _create_dynamic(struct dahdi_dynamic_span *dds)
+ 	}
+ 	
+ 	/* Setup parameters properly assuming we're going to be okay. */
+-	strlcpy(d->dname, dds->driver, sizeof(d->dname));
+-	strlcpy(d->addr, dds->addr, sizeof(d->addr));
++	strscpy(d->dname, dds->driver, sizeof(d->dname));
++	strscpy(d->addr, dds->addr, sizeof(d->addr));
+ 	d->timing = dds->timing;
+ 	snprintf(d->span.name, sizeof(d->span.name), "DYN/%s/%s",
+ 		 dds->driver, dds->addr);
+diff --git a/drivers/dahdi/dahdi_dynamic_eth.c b/drivers/dahdi/dahdi_dynamic_eth.c
+index 0209489b..c7a293dd 100644
+--- a/drivers/dahdi/dahdi_dynamic_eth.c
++++ b/drivers/dahdi/dahdi_dynamic_eth.c
+@@ -292,12 +292,12 @@ static int ztdeth_create(struct dahdi_dynamic *dyn, const char *addr)
+ 		memset(z, 0, sizeof(struct ztdeth));
+ 
+ 		/* Address should be <dev>/<macaddr>[/subaddr] */
+-		strlcpy(tmp, addr, sizeof(tmp));
++		strscpy(tmp, addr, sizeof(tmp));
+ 		tmp2 = strchr(tmp, '/');
+ 		if (tmp2) {
+ 			*tmp2 = '\0';
+ 			tmp2++;
+-			strlcpy(z->ethdev, tmp, sizeof(z->ethdev));
++			strscpy(z->ethdev, tmp, sizeof(z->ethdev));
+ 		} else {
+ 			printk(KERN_NOTICE "Invalid TDMoE address (no device) '%s'\n", addr);
+ 			kfree(z);
+diff --git a/drivers/dahdi/dahdi_dynamic_ethmf.c b/drivers/dahdi/dahdi_dynamic_ethmf.c
+index 73290d8d..f7c067fb 100644
+--- a/drivers/dahdi/dahdi_dynamic_ethmf.c
++++ b/drivers/dahdi/dahdi_dynamic_ethmf.c
+@@ -573,7 +573,7 @@ static int ztdethmf_create(struct dahdi_dynamic *dyn, const char *addr)
+ 	z->rcvbuf = kmalloc(bufsize, GFP_KERNEL);
+ 
+ 	/* Address should be <dev>/<macaddr>/subaddr */
+-	strlcpy(src, addr, sizeof(src));
++	strscpy(src, addr, sizeof(src));
+ 	/* replace all / with space; otherwise kernel sscanf does not work */
+ 	src_ptr = src;
+ 	while (*src_ptr) {
+diff --git a/drivers/dahdi/dahdi_transcode.c b/drivers/dahdi/dahdi_transcode.c
+index 6021aac2..7645e2f1 100644
+--- a/drivers/dahdi/dahdi_transcode.c
++++ b/drivers/dahdi/dahdi_transcode.c
+@@ -329,7 +329,7 @@ static long dahdi_tc_getinfo(unsigned long data)
+ 		return -ENOSYS;
+ 	}
+ 
+-	strlcpy(info.name, tc->name, sizeof(info.name));
++	strscpy(info.name, tc->name, sizeof(info.name));
+ 	info.numchannels = tc->numchannels;
+ 	info.srcfmts = tc->srcfmts;
+ 	info.dstfmts = tc->dstfmts;
+diff --git a/drivers/dahdi/xpp/card_global.c b/drivers/dahdi/xpp/card_global.c
+index 9e679bbc..064edbb3 100644
+--- a/drivers/dahdi/xpp/card_global.c
++++ b/drivers/dahdi/xpp/card_global.c
+@@ -342,7 +342,7 @@ int parse_chip_command(xpd_t *xpd, char *cmdline)
+ 		XBUS_DBG(GENERAL, xbus, "Dropped packet. Disconnected.\n");
+ 		return -EBUSY;
+ 	}
+-	strlcpy(buf, cmdline, MAX_PROC_WRITE);	/* Save a copy */
++	strscpy(buf, cmdline, MAX_PROC_WRITE);	/* Save a copy */
+ 	if (buf[0] == '#' || buf[0] == ';')
+ 		XPD_DBG(REGS, xpd, "Note: '%s'\n", buf);
+ 	if ((p = strchr(buf, '#')) != NULL)	/* Truncate comments */

--===============1850046433486983050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1850046433486983050==--
