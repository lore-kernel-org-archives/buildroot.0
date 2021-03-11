From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Mar 2021 21:54:00 +0100
Subject: [Buildroot] [git commit] support/download: make the svn backend
 more reproducible
Message-ID: <20210311203215.83909876D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c92be85e3a291e4e54ba8eaf54effcf1c86ce402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since c043ecb20ce6 (support/download: change format of archives
generated from svn), the svn backend uses the generic helper to
create reproducible archives.

That helper really does its job as expected, but the svn backend
is flawed in two ways:

  - the first, most obvious breakage happens with versions older
    than 1.9, as they do not support the '--show-item' option
    for the 'info' action;

  - the second is more involved, in that svn will by default
    expand the old, legacy, deprecated, cumbersome CVS-style
    keywords, in the form of revision marks like '$Date$' in a
    C-style comment in a source file. These replacements are
    done on checkout as well as on export, and they use local
    settings, like the local locale and timezone.

    This means that two people with different settings, will get
    different sources when the svn-checkout or svn-export the same
    revision from the same tree...

    Needless to say that this is not very reproducible...

While the first is easily solved, the second is more involved.

We need to ensure that what source is used initially to compute
the hash, will also be the source that are used to check the hash.

There are basically two solutions:

 1. we ensure the same environment, by forcing the timezone and
    the locale to arbitrary values

 2. we disable keyword expansion

For the first solution, this still leaves the possibility that we
miss some environment settings that have an impact on the keyword
expansion. It would mean that Yann's settings be used, as he did
introduce the hash for the only svn-downloaded package we have,
avrdude, settings which are:
    TZ=Europe/Paris
    LC_TIME="en_US.UTF-8"
    LC_COLLATE="en_GB.UTF-8"
    LC_MONETARY="fr_FR.utf8"
    LC_NUMERIC="fr_FR.utf8"

The second option means that the generated archives change. That
means we'd have to bump the archive version for svn downloads, and
that we update the hashes for all the svn-downloaded packages.

We chose to go with the second option, because this is what really
makes more sense, rather than hard-coding arbitrary values in the
environment. And we also have only one svn-downloaded package,
avrdude.

And thus, we're reaching the trigger for this change: avrdude is
impacted by the CVS-keyword expansion issue:

    https://svn.savannah.gnu.org/viewvc/avrdude/trunk/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js?revision=1396&view=markup

which would give two different files when checked out on different
machines:

    diff -durN foo/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js bar/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js
    --- foo/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js 2020-09-22 09:36:45.000000000 +0200
    +++ bar/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js 2020-09-22 09:36:45.000000000 +0200
    @@ -1,6 +1,6 @@
     /**
      * @preserve jquery.layout 1.3.0 - Release Candidate 30.51
    - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
    + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
      * $Rev: 303005 $
      *
      * Copyright (c) 2012
    @@ -4718,7 +4718,7 @@

     /**
      * jquery.layout.state 1.0
    - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
    + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
      *
      * Copyright (c) 2010
      *   Kevin Dalman (http://allpro.net)
    @@ -5074,7 +5074,7 @@

     /**
      * jquery.layout.buttons 1.0
    - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
    + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
      *
      * Copyright (c) 2010
      *   Kevin Dalman (http://allpro.net)
    @@ -5356,7 +5356,7 @@

     /**
      * jquery.layout.browserZoom 1.0
    - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
    + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
      *
      * Copyright (c) 2012
      *   Kevin Dalman (http://allpro.net)

So we also update the hash for avrdude.

Fixes:
    http://autobuild.buildroot.org/results/e3b/e3b0508047f32008ebfa83c5255ec5994b6af120/ (time issue)
    http://autobuild.buildroot.org/results/48e/48e78e84b425e79cdb98c16ab40247a0fa7e9676/ (keyword expansion issue)

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avrdude/avrdude.hash | 2 +-
 package/pkg-download.mk      | 2 +-
 support/download/svn         | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index c7b4bf85bc..ec43355451 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a74532a61d07e43fc598ade4202e9a8c8697bce3e6031c5be6f51da651595f99  avrdude-r1450-br1.tar.gz
+sha256  2a09913450c6457c3fe8d43d5141de579d4e57d67e593e7399a4cd3768cc60f9  avrdude-r1450-br2.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index c0fb810205..4d97ef9a31 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,7 +20,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # Version of the format of the archives we generate in the corresponding
 # download backend:
 BR_FMT_VERSION_git = -br1
-BR_FMT_VERSION_svn = -br1
+BR_FMT_VERSION_svn = -br2
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/download/svn b/support/download/svn
index 839dccaf62..75bf9ab3b2 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -43,14 +43,16 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
+_svn export --ignore-keywords ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
 # Get the date of the revision, to generate reproducible archives.
 # The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
 # UTC timezone), which we can feed as-is to the --mtime option for tar.
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
-date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
+date="$( _svn info "'${uri}@${rev}'" \
+        |sed -r -e '/^Last Changed Date: /!d; s///'
+       )"
 
 # Generate the archive.
 # We did a 'svn export' above, so it's not a working copy (there is no .svn
