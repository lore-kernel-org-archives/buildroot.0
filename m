From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 14 Aug 2007 13:07:59 +0200
Subject: [Buildroot] fakeroot reinstalling 'at' (and others) everytime make
	is run.
Message-ID: <1187089679.27205.18.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (like 'at') install themselves as owned by root 
through "fakeroot".

AFAIK; the procedure is that:

"at.mk" creates "$(STAGING_DIR)/.fakeroot.at" containing the commands
fakeroot needs to run during the installation.

The makefiles for a file system (ext2, jffs2 etc.) will each do the
installation by copying "$(STAGING_DIR)/.fakeroot.*" to 
"$(STAGING_DIR)/.fakeroot.$(notdir $(<FILESYSTEM>)"
and will then add some stuff they need.


PROBLEM:
There seems to be nothing that removes the "$(STAGING_DIR)/.fakeroot.at"

SYMPTOM:
After 'at' has been built once, each time a file system is created, its
makefile will find "$(STAGING_DIR)/.fakeroot.at"
and 'at' will be reinstalled by 'fakeroot'.

SIMPLE FIX?:
A simple fix would be to delete all ".fakeroot.*' files after all file
systems have been generated (See below).

If a package like 'at' is built from fresh,then every file system which
is built will reinstall 'at', but at the end of the build, the
"$(STAGING_DIR)/.fakeroot.at" is removed so the next time 'make' is run,
there will be no reinstallation of 'at'.

ADVANCED FIX:

A more advanced fix would let each file system delete all the fakeroot
files under the assumption, that they only need to be run once.

*******************************************************************


Will there be any problems if the ".fakeroot.*" files are deleted?

Thoughts?


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DIFF FOR SIMPLE FIX:

Index: Makefile
===================================================================
--- Makefile	(revision 19502)
+++ Makefile	(arbetskopia)
@@ -199,6 +199,8 @@
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
+TARGETS+=erase-fakeroots
+
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
@@ -255,6 +257,8 @@
 	fi;
 	touch	$@
 
+erase-fakeroots:
+	rm -f $(STAGING_DIR)/.fakeroot*
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
---------------------------------------------------------------------


Best Regards
Ulf Samuelsson
