Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0589EED615
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 15:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D68D402AD;
	Fri, 15 Sep 2023 15:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D68D402AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cp_gp9kdMOlv; Fri, 15 Sep 2023 15:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372BC4159C;
	Fri, 15 Sep 2023 15:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 372BC4159C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2A8E1BF31E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC522403A5
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC522403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77n9Pqfjl3Zf for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B776E40166
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B776E40166
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFZPle002834; Fri, 15 Sep 2023 15:58:50 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4su6h61c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:50 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFnmss002352; Fri, 15 Sep 2023 15:58:49 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158kvr1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38FFwmmT524884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Sep 2023 15:58:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CADC5803F;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7332C58064;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id DF5F4180F86; Fri, 15 Sep 2023 10:58:47 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:58:34 -0500
Message-Id: <20230915155835.51140-5-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230915155835.51140-1-arbab@linux.ibm.com>
References: <20230915155835.51140-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VX_-vqv16ipJtqWV96GkPGYGlK68L4WI
X-Proofpoint-ORIG-GUID: VX_-vqv16ipJtqWV96GkPGYGlK68L4WI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309150138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nDpx7ATc4sAQ9tC373hV4jcFteNiPt7Q+7hrHyRuEXE=;
 b=UVd4U2f8Ist6pz+ClzJuX5Xi3ItP/mZKIh4vbLL1LtqMekv38yvlJhYm31KgcSvx+g/I
 adKR3jt9Mf0CnvsKqLuJ6fkMbRUT156DChdnoo24/MJw7pvbQa1EmYrOBvu+VBlH4kUA
 oe/LtAF+Lg2m4z/mGXhYfYWg080w1ceKIEkhqs93WuXiV1Vc91Y8GFMA+LtedSmyfKKT
 ZdMZV88zWi5F9e45BCKRIub6kdsubOEnJApsKs2L14wB57sZfIakf/d4j7FvRBgrGrKK
 4HrEjsQgJevKUHIeY4zPg0eH0YiPr/bQ5LZEFEvb4H99wlAtHwM+9VWKCxjCMl0YoGq3 7g== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=UVd4U2f8
Subject: [Buildroot] [PATCH v2 4/5] package/petitboot: enable discovery of
 software RAID devices
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
Cc: Reza Arbab <arbab@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petitboot can support filesystems on software RAID arrays. If mdadm is
selected, install the associated udev rules to assemble the device.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/63-md-raid-arrays.rules | 41 ++++++++++++++
 package/petitboot/65-md-incremental.rules | 69 +++++++++++++++++++++++
 package/petitboot/petitboot.mk            | 10 ++++
 3 files changed, 120 insertions(+)
 create mode 100644 package/petitboot/63-md-raid-arrays.rules
 create mode 100644 package/petitboot/65-md-incremental.rules

diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
new file mode 100644
index 000000000000..92aec36e69d4
--- /dev/null
+++ b/package/petitboot/63-md-raid-arrays.rules
@@ -0,0 +1,41 @@
+# do not edit this file, it will be overwritten on update
+
+SUBSYSTEM!="block", GOTO="md_end"
+
+# handle md arrays
+ACTION!="add|change", GOTO="md_end"
+KERNEL!="md*", GOTO="md_end"
+
+# partitions have no md/{array_state,metadata_version}, but should not
+# for that reason be ignored.
+ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
+
+# container devices have a metadata version of e.g. 'external:ddf' and
+# never leave state 'inactive'
+ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
+TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+LABEL="md_ignore_state"
+
+IMPORT{program}="/sbin/mdadm --detail --export $devnode"
+ENV{DEVTYPE}=="disk", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="disk", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}"
+ENV{DEVTYPE}=="disk", ENV{MD_DEVNAME}=="?*", SYMLINK+="md/$env{MD_DEVNAME}"
+ENV{DEVTYPE}=="partition", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}-part%n", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="partition", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}-part%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[^0-9]", SYMLINK+="md/$env{MD_DEVNAME}%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[0-9]", SYMLINK+="md/$env{MD_DEVNAME}p%n"
+
+IMPORT{builtin}="blkid"
+OPTIONS+="link_priority=100"
+OPTIONS+="watch"
+ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
+ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
+
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
+
+# Tell systemd to run mdmon for our container, if we need it.
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{MD_CONTAINER}=="?*", PROGRAM="/usr/bin/readlink $env{MD_CONTAINER}", ENV{MD_MON_THIS}="%c"
+ENV{MD_MON_THIS}=="?*", PROGRAM="/usr/bin/basename $env{MD_MON_THIS}", ENV{SYSTEMD_WANTS}+="mdmon@%c.service"
+
+LABEL="md_end"
diff --git a/package/petitboot/65-md-incremental.rules b/package/petitboot/65-md-incremental.rules
new file mode 100644
index 000000000000..153d12fe6f7e
--- /dev/null
+++ b/package/petitboot/65-md-incremental.rules
@@ -0,0 +1,69 @@
+# This file causes block devices with Linux RAID (mdadm) signatures to
+# automatically cause mdadm to be run.
+# See udev(8) for syntax
+
+# Don't process any events if anaconda is running as anaconda brings up
+# raid devices manually
+ENV{ANACONDA}=="?*", GOTO="md_end"
+
+# Also don't process disks that are slated to be a multipath device
+ENV{DM_MULTIPATH_DEVICE_PATH}=="?*", GOTO="md_end"
+
+# We process add events on block devices (since they are ready as soon as
+# they are added to the system), but we must process change events as well
+# on any dm devices (like LUKS partitions or LVM logical volumes) and on
+# md devices because both of these first get added, then get brought live
+# and trigger a change event.  The reason we don't process change events
+# on bare hard disks is because if you stop all arrays on a disk, then
+# run fdisk on the disk to change the partitions, when fdisk exits it
+# triggers a change event, and we want to wait until all the fdisks on
+# all member disks are done before we do anything.  Unfortunately, we have
+# no way of knowing that, so we just have to let those arrays be brought
+# up manually after fdisk has been run on all of the disks.
+
+# First, process all add events (md and dm devices will not really do
+# anything here, just regular disks, and this also won't get any imsm
+# array members either)
+SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	RUN+="/sbin/mdadm -I --export $env{DEVNAME}"
+
+# Next, check to make sure the BIOS raid stuff wasn't turned off via cmdline
+IMPORT{cmdline}="noiswmd"
+IMPORT{cmdline}="nodmraid"
+ENV{noiswmd}=="?*", GOTO="md_imsm_inc_end"
+ENV{nodmraid}=="?*", GOTO="md_imsm_inc_end"
+SUBSYSTEM=="block", ACTION=="add", ENV{ID_FS_TYPE}=="isw_raid_member", \
+	RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="md_imsm_inc_end"
+
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}=="?*", \
+	RUN+="/sbin/mdadm -If $name --path $env{ID_PATH}"
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}!="?*", \
+	RUN+="/sbin/mdadm -If $name"
+
+# Next make sure that this isn't a dm device we should skip for some reason
+ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="dm_change_end"
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="dm_change_end"
+ENV{DM_SUSPENDED}=="1", GOTO="dm_change_end"
+KERNEL=="dm-*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="dm_change_end"
+
+# Finally catch any nested md raid arrays.  If we brought up an md raid
+# array that's part of another md raid array, it won't be ready to be used
+# until the change event that occurs when it becomes live
+KERNEL=="md*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+# In case the initramfs only started some of the arrays in our container,
+# run incremental assembly on the container itself.  Note: we ran mdadm
+# on the container in 64-md-raid.rules, and that's how the MD_LEVEL
+# environment variable is already set.  If that disappears from the other
+# file, we will need to add this line into the middle of the next rule:
+#	IMPORT{program}="/sbin/mdadm -D --export $tempnode", \
+
+SUBSYSTEM=="block", ACTION=="add|change", KERNEL=="md*", \
+	ENV{MD_LEVEL}=="container", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+
+LABEL="md_end"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 9326738aa038..596e801b781c 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -46,6 +46,16 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+ifeq ($(BR2_PACKAGE_MDADM),y)
+define PETITBOOT_POST_INSTALL_MDADM
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/63-md-raid-arrays.rules
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/65-md-incremental.rules
+endef
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_MDADM
+endif
+
 define PETITBOOT_POST_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
 		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
