Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6C1C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A898241931;
	Thu,  7 Mar 2024 11:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pE_BeFBcQQpu; Thu,  7 Mar 2024 11:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE3F4193D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE3F4193D;
	Thu,  7 Mar 2024 11:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 606831BF4D6
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 11:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CF3881E8E
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 11:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoyjzxmPBg_J for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 11:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5107C81E87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5107C81E87
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 11:43:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27D5188197; Thu,  7 Mar 2024 11:43:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Mar 2024 12:08:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2824aa8a23a765b660219c129d4980f1b7c7691c
X-Git-Newrev: 5fb79cad04d73f18a5a1316152573ac1abc2b06d
X-Patchwork-Hint: ignore
Message-Id: <20240307114318.27D5188197@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: fix uclibc build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5fb79cad04d73f18a5a1316152573ac1abc2b06d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version
3.506 in commit 57008d384bc1f2e42d6add6cd73203e11a75d6c9:

/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: iozone_linux-noaio.o: in function `read_perf_test':
iozone.c:(.text+0x11a74): undefined reference to `end_async'

Fixes:
 - http://autobuild.buildroot.org/results/31a4f0ac9eeb71df5d2f40ffe9f1f256cb58e399

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/0002-fix-build-without-aio.patch | 176 ++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
