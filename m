From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Apr 2010 10:47:54 +0200
Subject: [Buildroot] [git commit master] Makefile: out-of-tree fix for
	uclibc 0.9.31
Message-ID: <20100405092239.2A78388D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd61ea772be42338b733ac750ba653be19728e9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Strangely enough O is still passed to submakes with MAKEOVERRIDES
(with make 3.81 atleast), the only thing that changes is the output
of the origin function (command line -> environment).
Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
To really make O go away, we have to override it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index b746934..b47c0b0 100644
--- a/Makefile
+++ b/Makefile
@@ -230,6 +230,12 @@ else
 # forwards command line variable definitions those packages get very
 # confused. Fix this by telling make to not do so
 MAKEOVERRIDES =
+# strangely enough O is still passed to submakes with MAKEOVERRIDES
+# (with make 3.81 atleast), the only thing that changes is the output
+# of the origin function (command line -> environment).
+# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
+# To really make O go away, we have to override it.
+override O:=$(O)
 endif
 
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
-- 
1.6.3.3
