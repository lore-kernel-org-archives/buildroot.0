From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 22:35:54 +0100
Subject: [Buildroot] [git commit] iproute2: bump to version 3.1.0
Message-ID: <20111207213758.DA6C98F713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c9a74836aef0c0a6e7e8aee614982225a89d5cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2-xt-v6.patch |   39 ---------------------------------
 package/iproute2/iproute2.mk          |    4 +-
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/iproute2/iproute2-xt-v6.patch b/package/iproute2/iproute2-xt-v6.patch
deleted file mode 100644
index 4856e36..0000000
--- a/package/iproute2/iproute2-xt-v6.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From: Andreas Henriksson <andreas@fatal.se>
-Forwarded: yes
-Subject: [PATCH] iproute2: Fix building xt module against xtables version 6
-
-
-diff --git a/tc/m_xt.c b/tc/m_xt.c
-index 651a59e..13bf19f 100644
---- a/tc/m_xt.c
-+++ b/tc/m_xt.c
-@@ -160,9 +160,13 @@ static int parse_ipt(struct action_util *a,int *argc_p,
- 					return -1;
- 				}
- 				tcipt_globals.opts =
--				    xtables_merge_options(tcipt_globals.opts,
--				                          m->extra_opts,
--				                          &m->option_offset);
-+				    xtables_merge_options(
-+#if (XTABLES_VERSION_CODE >= 6)
-+				        tcipt_globals.orig_opts,
-+#endif
-+				        tcipt_globals.opts,
-+				        m->extra_opts,
-+				        &m->option_offset);
- 			} else {
- 				fprintf(stderr," failed to find target %s\n\n", optarg);
- 				return -1;
-@@ -305,7 +309,11 @@ print_ipt(struct action_util *au,FILE * f, struct rtattr *arg)
- 			}
- 
- 			tcipt_globals.opts =
--			    xtables_merge_options(tcipt_globals.opts,
-+			    xtables_merge_options(
-+#if (XTABLES_VERSION_CODE >= 6)
-+				                  tcipt_globals.orig_opts,
-+#endif
-+				                  tcipt_globals.opts,
- 			                          m->extra_opts,
- 			                          &m->option_offset);
- 		} else {
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index dd2506c..100f20a 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.39
-IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
+IPROUTE2_VERSION = 3.1.0
+IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
 # If both iproute2 and busybox are selected, make certain we win
