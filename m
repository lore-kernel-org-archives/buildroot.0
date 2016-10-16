From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Oct 2016 13:54:23 +0200
Subject: [Buildroot] [PATCH v11 4/4] core: only remove O from MAKEOVERRIDES
In-Reply-To: <20161016115423.17881-1-s.martin49@gmail.com>
References: <20161016115423.17881-1-s.martin49@gmail.com>
Message-ID: <20161016115423.17881-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For no apparent reason, MAKEOVERRIDES is not treated the same way
depending on whether O is set or not on the command line:
* when O is set on the command line (i.e. out-of-tree build): all
  variables were stripped away from MAKEOVERRIDES;
* when O is not set on the command line (i.e. in-Buildroot-source-tree
  build): all variables are kept and forwarded to the sub-make call.

This change cleans things up by only removing the relevant variables
from MAKEOVERRIDES when appropriate (i.e. removing O from MAKEOVERRIDES
when O is set on the command line) keeping all other variables as-is in the
sub-make call; O is set on the sub-make call anyway.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v9->v10:
- new patch
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index dcf8552..dc0a6d8 100644
--- a/Makefile
+++ b/Makefile
@@ -38,8 +38,9 @@ else
 # Other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
 # forwards command line variable definitions those packages get very
-# confused. Fix this by telling make to not do so.
-MAKEOVERRIDES :=
+# confused. Fix this by telling make to not do so, only for O=..., but
+# keep all others (such as BR2_EXTERNAL, BR2_DL_DIR, etc).
+MAKEOVERRIDES := $(filter-out O=%,$(MAKEOVERRIDES))
 # Strangely enough O is still passed to submakes with MAKEOVERRIDES
 # (with make 3.81 atleast), the only thing that changes is the output
 # of the origin function (command line -> environment).
-- 
2.10.0
