Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F7BC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 11:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D7E41766;
	Wed,  6 Mar 2024 11:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdQxmsf_KKCt; Wed,  6 Mar 2024 11:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C25941753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C25941753;
	Wed,  6 Mar 2024 11:47:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4A331BF955
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9188160818
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 11:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsdEbYuY-yud for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 11:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37F8E60752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F8E60752
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37F8E60752
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 11:47:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33de4d3483eso4170247f8f.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 03:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709725633; x=1710330433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eK6MCo2minPDxbrO0whTt4lp/KvgOOeAQDUObNmef74=;
 b=IqLbH4iIcmbFVyIwqbS8QO4MvcsaSf2TyKWnjKavEfQWZ85RWQB4uWcG52SmUr67+v
 XmfJ4E1tojunKc9AHHz5WZUkTflSHa0VUdAvCL7ApukLeYeuoV/XPsyHs8CJ3tsOW/o5
 0SC0QG7DA1zXIZrGWoTAG4J/BxgDER2Tk+c8feNoNLLTNBDezXaAnNEaC9OM8Rn7Hv1m
 v2ngn4J/osUod3p57l9lHJkSEdiMRmv43ozpUAY0f3rorVeWUxRTV4lr//ZIbajfNYqH
 kxQqY8NJmVhQ9h8M3rvpOZXnQTy5GocBXlNz3lpfxQ01DlRNtP+JVb4CdRSf9Vx/JXZC
 I5Mg==
X-Gm-Message-State: AOJu0YwoQP9qAKFNn1Lp2ychw8r+ycVcQwioc1m2VogVWiXcdCAbbm7Q
 dSKRdl5wECYIVpRVXakq4QOmxhrfh4uY8RnkpHtzx/UiuhHUW2t+3bHOKGfz
X-Google-Smtp-Source: AGHT+IHOrToeGEFTShBXeRuKjt4Z5dnh9Q2pkT98B5GFVFrhALvN74NT3oLy5TUGND661vCaj+LT1A==
X-Received: by 2002:a5d:6249:0:b0:33e:1e0:2679 with SMTP id
 m9-20020a5d6249000000b0033e01e02679mr10398815wrv.47.1709725633216; 
 Wed, 06 Mar 2024 03:47:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p6-20020adf9d86000000b0033e0dd83be1sm17406830wre.91.2024.03.06.03.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 03:47:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 12:47:10 +0100
Message-ID: <20240306114710.591983-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709725633; x=1710330433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eK6MCo2minPDxbrO0whTt4lp/KvgOOeAQDUObNmef74=;
 b=WVMlDjYDCN7qalasmiSxuJp8Wibxmme/5YLbRYR+2oKGVI1gUALc/qZhqt19qCJdCM
 Xkro6Y5nwAtm2ueZ71jj9Y7K3KTyw32yZFQOa55U+k9n+wt6HFXXiVB89sRoPvcaXNhF
 noZee+VK9hDpfTiPzSaqSv7CX/B70qzweo5PCFuRpSZSCBDb3G+aLjY9REqOSxvdVe6R
 E7j0jaVj1TDOUsS6wDoaYG31/LZmRyBdakD78n3T5Q5zNUWlTD73+kgUoNiAnlCh9y0k
 P1m4klZzpn6tRojiqHdtcckJL8/rdn3THcXyeJ1wEX6yHA33PhbAaqqM2tT2cU0GrXH9
 SHgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WVMlDjYD
Subject: [Buildroot] [PATCH 1/1] package/iozone: fix uclibc build
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
3.506 in commit 57008d384bc1f2e42d6add6cd73203e11a75d6c9:

/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: iozone_linux-noaio.o: in function `read_perf_test':
iozone.c:(.text+0x11a74): undefined reference to `end_async'

Fixes:
 - http://autobuild.buildroot.org/results/31a4f0ac9eeb71df5d2f40ffe9f1f256cb58e399

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../iozone/0002-fix-build-without-aio.patch   | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 package/iozone/0002-fix-build-without-aio.patch

diff --git a/package/iozone/0002-fix-build-without-aio.patch b/package/iozone/0002-fix-build-without-aio.patch
new file mode 100644
index 0000000000..8b54bef4e1
--- /dev/null
+++ b/package/iozone/0002-fix-build-without-aio.patch
@@ -0,0 +1,176 @@
+Fix build without ASYNC_IO
+
+Fix the following build failure without ASYNC_IO:
+
+/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: iozone_linux-noaio.o: in function `read_perf_test':
+iozone.c:(.text+0x11a74): undefined reference to `end_async'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/31a4f0ac9eeb71df5d2f40ffe9f1f256cb58e399
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: sent to capps@iozone.org
+
+diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/current/iozone.c
+--- iozone3_506.orig/src/current/iozone.c	2024-03-06 12:28:16.734023725 +0100
++++ iozone3_506/src/current/iozone.c	2024-03-06 12:39:14.453991162 +0100
+@@ -9153,6 +9153,7 @@
+ 				}
+ 			  }
+ 			}
++#ifdef ASYNC_IO
+ 			if(async_flag)
+ 			{
+ 				if(no_copy_flag)
+@@ -9160,6 +9161,7 @@
+ 				end_async(gc);
+ 				gc=0;
+ 			}
++#endif
+ 			buffer1=0;
+ 			if(hist_summary)
+ 			{
+@@ -9634,6 +9636,7 @@
+ 				}
+ 			  }
+ 			}
++#ifdef ASYNC_IO
+ 			if(async_flag)
+ 			{
+ 				if(no_copy_flag)
+@@ -9641,6 +9644,7 @@
+ 				end_async(gc);
+ 				gc=0;
+ 			}
++#endif
+ 			if(rlocking)
+ 			{
+ 				lock_offset=I_LSEEK(fd,0,SEEK_CUR);
+@@ -10097,6 +10101,7 @@
+ 				}
+ 			   }
+ 			}
++#ifdef ASYNC_IO
+ 			if(async_flag)
+ 			{
+ 				if(no_copy_flag)
+@@ -10104,6 +10109,7 @@
+ 				end_async(gc);
+ 				gc=0;
+ 			}
++#endif
+ 			if(rlocking)
+ 			{
+ 				mylockr((int) fd, (int) 0, (int)1,
+@@ -10749,6 +10755,7 @@
+ 			   }
+ 			}
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -10756,6 +10763,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 			
+ 		/* This is a bit tricky.  The goal is to read with a stride through
+ 		   the file. The problem is that you need to touch all of the file
+@@ -15485,6 +15493,7 @@
+ 			   }
+ 		   }
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -15492,6 +15501,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		read_so_far+=reclen/1024;
+ 		r_traj_bytes_completed+=reclen;
+ 		r_traj_ops_completed++;
+@@ -16050,6 +16060,7 @@
+ 			   }
+ 		   }
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -16057,6 +16068,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		read_so_far+=reclen/1024;
+ 		r_traj_bytes_completed+=reclen;
+ 		r_traj_ops_completed++;
+@@ -16665,6 +16677,7 @@
+ 			}
+ 		   }
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -16672,6 +16685,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		re_read_so_far+=reclen/1024;
+ 		r_traj_bytes_completed+=reclen;
+ 		r_traj_ops_completed++;
+@@ -17244,6 +17258,7 @@
+ 			  lock_offset, reclen);
+ 		}
+ 		current_position+=reclen;
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -17251,6 +17266,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		t_offset = (off64_t)reclen*2;
+ 		if (!(h_flag || k_flag || mmapflag))
+ 		{
+@@ -17778,6 +17794,7 @@
+ 			}
+ 		   }
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -17785,6 +17802,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		if(current_position + (stride * reclen) >= (numrecs64 * reclen)-reclen) 
+ 		{
+ 			current_position=0;
+@@ -18528,6 +18546,7 @@
+ 			}
+ 		   }
+ 		}
++#ifdef ASYNC_IO
+ 		if(async_flag)
+ 		{
+ 			if(no_copy_flag)
+@@ -18535,6 +18554,7 @@
+ 			end_async(gc);
+ 			gc=0;
+ 		}
++#endif
+ 		ranread_so_far+=reclen/1024;
+ 		if(*stop_flag)
+ 		{
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
