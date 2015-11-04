From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Nov 2015 20:40:42 +0100
Subject: [Buildroot] [PATCH] core/printvars: allow dumping a set of variables
Message-ID: <1446666042-6051-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dumping our 176164 variables can take quite some time (~12s here). What
takes the most time is sorting the variables (~9s), followed by the
parsing of our Makefiles (~3s), with the actual printing in the noise.

However, sometimes only one or a few variables are needed. For example,
one may want to retrieve the Linux build dir from a post-build hook (to
get the Linux' actual .config after our fixups and check for various
features).

Add the possibility to only dump the variables listed in $(VAR) which
must be passed as a make argument, like so:

    $ make -s printvars VARS="LINUX_DIR TOPDIR O"
    LINUX_DIR=/home/ymorin/dev/buildroot/O/build/linux-4.3 ($(BUILD_DIR)/$(LINUX_BASE_NAME))
    O=/home/ymorin/dev/buildroot/O/. (/home/ymorin/dev/buildroot/O/.)
    TOPDIR=/home/ymorin/dev/buildroot/buildroot (/home/ymorin/dev/buildroot/buildroot)

This is much faster (the time is just about the time it takes to parse
our Makefiles, 3s here) and easier to parse.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6d34ee2..7b152c7 100644
--- a/Makefile
+++ b/Makefile
@@ -832,9 +832,10 @@ ifeq ($(NEED_WRAPPER),y)
 endif
 
 # printvars prints all the variables currently defined in our Makefiles
+# or only the variables specified in $(VARS)
 printvars:
 	@$(foreach V, \
-		$(sort $(.VARIABLES)), \
+		$(sort $(if $(VARS),$(VARS),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
 		$(info $V=$($V) ($(value $V)))))
-- 
1.9.1
