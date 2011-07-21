From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jul 2011 14:54:24 -0300
Subject: [Buildroot] [PATCH 4/4] iproute2: bump to version 2.6.39
In-Reply-To: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
References: <1311270864-5771-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1311270864-5771-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2-xt-v6.patch |   39 +++++++++++++++++++++++++++++++++
 package/iproute2/iproute2.mk          |    3 +-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/iproute2-xt-v6.patch

diff --git a/package/iproute2/iproute2-xt-v6.patch b/package/iproute2/iproute2-xt-v6.patch
new file mode 100644
index 0000000..4856e36
--- /dev/null
+++ b/package/iproute2/iproute2-xt-v6.patch
@@ -0,0 +1,39 @@
+From: Andreas Henriksson <andreas@fatal.se>
+Forwarded: yes
+Subject: [PATCH] iproute2: Fix building xt module against xtables version 6
+
+
+diff --git a/tc/m_xt.c b/tc/m_xt.c
+index 651a59e..13bf19f 100644
+--- a/tc/m_xt.c
++++ b/tc/m_xt.c
+@@ -160,9 +160,13 @@ static int parse_ipt(struct action_util *a,int *argc_p,
+ 					return -1;
+ 				}
+ 				tcipt_globals.opts =
+-				    xtables_merge_options(tcipt_globals.opts,
+-				                          m->extra_opts,
+-				                          &m->option_offset);
++				    xtables_merge_options(
++#if (XTABLES_VERSION_CODE >= 6)
++				        tcipt_globals.orig_opts,
++#endif
++				        tcipt_globals.opts,
++				        m->extra_opts,
++				        &m->option_offset);
+ 			} else {
+ 				fprintf(stderr," failed to find target %s\n\n", optarg);
+ 				return -1;
+@@ -305,7 +309,11 @@ print_ipt(struct action_util *au,FILE * f, struct rtattr *arg)
+ 			}
+ 
+ 			tcipt_globals.opts =
+-			    xtables_merge_options(tcipt_globals.opts,
++			    xtables_merge_options(
++#if (XTABLES_VERSION_CODE >= 6)
++				                  tcipt_globals.orig_opts,
++#endif
++				                  tcipt_globals.opts,
+ 			                          m->extra_opts,
+ 			                          &m->option_offset);
+ 		} else {
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 630fab4..fd78b3c 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,8 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.38
-IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
+IPROUTE2_VERSION = 2.6.39
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 
-- 
1.7.3.4
