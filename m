From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 22:37:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/exim: add
 upstream security fix for CVE-2019-10149
Message-ID: <20190606203704.2FC568F14B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc5213f7df41209f12ff4f52338b9a2a91a96884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

A flaw was found in Exim versions 4.87 to 4.91 (inclusive).  Improper
validation of recipient address in deliver_message() function in
src/deliver.c may lead to remote command execution.

For more details, see the advisory:

https://www.exim.org/static/doc/security/CVE-2019-10149.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 83967ef53d78422c5a9e1a9fb4771a8e87d40e2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/0007-Fix-CVE-2019-10149.patch | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/exim/0007-Fix-CVE-2019-10149.patch b/package/exim/0007-Fix-CVE-2019-10149.patch
new file mode 100644
index 0000000000..f8b5338b57
--- /dev/null
+++ b/package/exim/0007-Fix-CVE-2019-10149.patch
@@ -0,0 +1,51 @@
+From d740d2111f189760593a303124ff6b9b1f83453d Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Mon, 27 May 2019 21:57:31 +0100
+Subject: [PATCH] Fix CVE-2019-10149
+
+[Peter: drop documentation update, fix path]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/deliver.c          | 22 ++++++++++++++--------
+ 1 files changed, 52 insertions(+), 8 deletions(-)
+ create mode 100644 doc/doc-txt/cve-2019-10149
+
+diff --git a/src/deliver.c b/src/deliver.c
+index 59256ac2..45cc0723 100644
+--- a/src/deliver.c
++++ b/src/deliver.c
+@@ -6227,17 +6227,23 @@ if (process_recipients != RECIP_IGNORE)
+ 	{
+ 	uschar * save_local =  deliver_localpart;
+ 	const uschar * save_domain = deliver_domain;
++	uschar * addr = new->address, * errmsg = NULL;
++	int start, end, dom;
+ 
+-	deliver_localpart = expand_string(
+-		      string_sprintf("${local_part:%s}", new->address));
+-	deliver_domain =    expand_string(
+-		      string_sprintf("${domain:%s}", new->address));
++	if (!parse_extract_address(addr, &errmsg, &start, &end, &dom, TRUE))
++	  log_write(0, LOG_MAIN|LOG_PANIC,
++                "failed to parse address '%.100s': %s\n", addr, errmsg);
++	else
++	  {
++	  deliver_localpart =
++	    string_copyn(addr+start, dom ? (dom-1) - start : end - start);
++	  deliver_domain = dom ? CUS string_copyn(addr+dom, end - dom) : CUS"";
+ 
+-	(void) event_raise(event_action,
+-		      US"msg:fail:internal", new->message);
++	  event_raise(event_action, US"msg:fail:internal", new->message);
+ 
+-	deliver_localpart = save_local;
+-	deliver_domain =    save_domain;
++	  deliver_localpart = save_local;
++	  deliver_domain = save_domain;
++	  }
+ 	}
+ #endif
+       }
+-- 
+2.11.0
+
