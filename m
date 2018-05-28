From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 15:22:58 +0200
Subject: [Buildroot] [PATCH-NEXT 2/2] chrony: S49chrony: drop
 /etc/chrony.conf check
In-Reply-To: <20180528132258.13860-1-peter@korsgaard.com>
References: <20180528132258.13860-1-peter@korsgaard.com>
Message-ID: <20180528132258.13860-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With CHRONY_ARGS in /etc/default/chrony, chrony may asked to use an
alternative configuration file (with the -f option), so drop the explicit
/etc/chrony.conf check.

In case the configuration file isn't present chrony will anyway loudly
complain which is preferable to this silent failure:

chronyd -f /non/existing/file.conf
Could not open configuration file /non/existing/file.conf : No such file or directory

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/S49chrony | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
index 5abb3b2582..f75233fe5e 100755
--- a/package/chrony/S49chrony
+++ b/package/chrony/S49chrony
@@ -4,8 +4,6 @@
 
 [ -r /etc/default/chrony ] && . /etc/default/chrony
 
-[ -f /etc/chrony.conf ] || exit 0
-
 case "$1" in
   start)
 	printf "Starting chrony: "
-- 
2.11.0
