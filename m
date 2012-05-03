From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 21:58:02 +0200
Subject: [Buildroot] [git commit] mrouted: fix bcopy patch oops
Message-ID: <20120503200242.4742696C68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3b66fb8deb3f2fce02e268212fa53924c39e487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bcopy patch just changes bcopy for memmove which is incorrect since
bcopy and memmove use reversed src and dest parameters between them.
Oops!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mrouted/mrouted-3.9.4-bcopy.patch |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/mrouted/mrouted-3.9.4-bcopy.patch b/package/mrouted/mrouted-3.9.4-bcopy.patch
index 73f8acc..ea8f6db 100644
--- a/package/mrouted/mrouted-3.9.4-bcopy.patch
+++ b/package/mrouted/mrouted-3.9.4-bcopy.patch
@@ -1,17 +1,12 @@
----
- mtrace.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: mrouted-3.9.4/mtrace.c
-===================================================================
---- mrouted-3.9.4.orig/mtrace.c
-+++ mrouted-3.9.4/mtrace.c
+diff -Nura mrouted-3.9.4/mtrace.c mrouted-3.9.4-memmove/mtrace.c
+--- mrouted-3.9.4/mtrace.c	2010-11-19 20:53:19.000000000 -0300
++++ mrouted-3.9.4-memmove/mtrace.c	2012-05-03 08:27:33.895422455 -0300
 @@ -556,7 +556,7 @@
  		save->rtime = ((tr.tv_sec + JAN_1970) << 16) +
  		    (tr.tv_usec << 10) / 15625;
  		save->len = len;
 -		bcopy((char *)igmp, (char *)&save->igmp, ipdatalen);
-+		memmove((char *)igmp, (char *)&save->igmp, ipdatalen);
++		memmove((char *)&save->igmp, (char *)igmp, ipdatalen);
  	    }
  	    return recvlen;
  	}
@@ -20,7 +15,7 @@ Index: mrouted-3.9.4/mtrace.c
  	    (tr.tv_usec << 10) / 15625;
  	base.len = len;
 -	bcopy((char *)igmp, (char *)&base.igmp, ipdatalen);
-+	memmove((char *)igmp, (char *)&base.igmp, ipdatalen);
++	memmove((char *)&base.igmp, (char *)igmp, ipdatalen);
  	/*
  	 * If the user specified which traces to monitor,
  	 * only accept traces that correspond to the
