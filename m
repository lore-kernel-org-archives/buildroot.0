From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 08:44:31 +0100
Subject: [Buildroot] [git commit] busybox: 1.22.1: add upstream date fix
Message-ID: <20140121074524.426B99C54B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e385c1fa2b25a381c4492ae756f7dfd94373239a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../busybox/1.22.1/0003-busybox-1.22.1-date.patch  |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/busybox/1.22.1/0003-busybox-1.22.1-date.patch b/package/busybox/1.22.1/0003-busybox-1.22.1-date.patch
new file mode 100644
index 0000000..6380d87
--- /dev/null
+++ b/package/busybox/1.22.1/0003-busybox-1.22.1-date.patch
@@ -0,0 +1,30 @@
+--- busybox-1.22.1/libbb/time.c
++++ busybox-1.22.1-date/libbb/time.c
+@@ -68,15 +68,23 @@ void FAST_FUNC parse_datestr(const char
+ 			/* else end != NUL and we error out */
+ 		}
+ 	} else
+-	/* yyyy-mm-dd HH */
+-	if (sscanf(date_str, "%u-%u-%u %u%c", &ptm->tm_year,
++	if (strchr(date_str, '-')
++	    /* Why strchr('-') check?
++	     * sscanf below will trash ptm->tm_year, this breaks
++	     * if parse_str is "10101010" (iow, "MMddhhmm" form)
++	     * because we destroy year. Do these sscanf
++	     * only if we saw a dash in parse_str.
++	     */
++		/* yyyy-mm-dd HH */
++	 && (sscanf(date_str, "%u-%u-%u %u%c", &ptm->tm_year,
+ 				&ptm->tm_mon, &ptm->tm_mday,
+ 				&ptm->tm_hour,
+ 				&end) >= 4
+-	/* yyyy-mm-dd */
+-	 || sscanf(date_str, "%u-%u-%u%c", &ptm->tm_year,
++		/* yyyy-mm-dd */
++	     || sscanf(date_str, "%u-%u-%u%c", &ptm->tm_year,
+ 				&ptm->tm_mon, &ptm->tm_mday,
+ 				&end) >= 3
++	    )
+ 	) {
+ 		ptm->tm_year -= 1900; /* Adjust years */
+ 		ptm->tm_mon -= 1; /* Adjust month from 1-12 to 0-11 */
