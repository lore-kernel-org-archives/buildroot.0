From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 19:04:53 +0100
Subject: [Buildroot] [git commit] core/printvars: allow dumping a set of
	variables
Message-ID: <20151201232124.B87A9821FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=376fda8f99cd0511c03be4b937e9684a565745da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

It is also possible to use make-appterns, like:

    $ make -s printvars VARS="BUSYBOX_%"

This is much faster (the time is just about the time it takes to parse
our Makefiles, 3s here) and easier to parse.

[Thomas: improve comment above the printvars target.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9950a26..641aeff 100644
--- a/Makefile
+++ b/Makefile
@@ -823,10 +823,13 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
-# printvars prints all the variables currently defined in our Makefiles
+# printvars prints all the variables currently defined in our
+# Makefiles. Alternatively, if a non-empty VARS variable is passed,
+# only the variables matching the make pattern passed in VARS are
+# displayed.
 printvars:
 	@$(foreach V, \
-		$(sort $(.VARIABLES)), \
+		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
 		$(info $V=$($V) ($(value $V)))))
