From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 22:00:47 +0100
Subject: [Buildroot] [PATCH] support/download: make the svn backend more
 reproducible
In-Reply-To: <20210310225937.3155075-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 10 Mar 2021 23:59:37 +0100")
References: <20210310225937.3155075-1-yann.morin.1998@free.fr>
Message-ID: <871rcavoxs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since c043ecb20ce6 (support/download: change format of archives
 > generated from svn), the svn backend uses the generic helper to
 > create reproducible archives.

 > That helper really does its job as expected, but he svn backend
 > is flawed in two ways:

 >   - the first, most obvious breakage happens with versions older
 >     than 1.9, as they do not support the '--show-item' option
 >     for the 'info' action;

 >   - the second is more involved, in that svn will by default
 >     expand the old, legacy, deprecated, cumbersome CVS-stylw
 >     keywords, in the form of revision marks like '$Date$' in a
 >     C-style comment in a source file. These replacements are
 >     done on checkout as well as on export, and they use local
 >     settings, like the local locale and timezone.

 >     This means that two people with different settings, will get
 >     different sources when the svn-checkout or svn-export the same
 >     revision from the same tree...

 >     Needless to say that this is not very reproducible...

 > While the first is easily solved, the second is more involved.

 > We need to ensure that what source is used initially to compute
 > the hash, will also be the source that are used to check the hash.

 > There are basically two solutions:

 >  1. we ensure the same environment, by forcing the timezone and
 >     the locale to arbitrary values

 >  2. we disable keyword expansion

 > For the first solution, this still leaves the possibility that we
 > miss some environment settings that have an impact on the keyword
 > expansion. It would mean that Yann's settings be used, as he did
 > introduce the hash for the only svn-downloaded package we have,
 > avrdude, settings which are:
 >     TZ=Europe/Paris
 >     LC_TIME="en_US.UTF-8"
 >     LC_COLLATE="en_GB.UTF-8"
 >     LC_MONETARY="fr_FR.utf8"
 >     LC_NUMERIC="fr_FR.utf8"

 > The second option means that the generated archives change. That
 > means we'd have to bump the archive version for svn downloads, and
 > that we update the hashes for all the svn-downloaded packages.

 > We chose to go with the second option, because this is what reallt
 > makes more sense, rather than hard-coding arbitrary values in the
 > environment. And we also have only one svn-downloaded package,
 > avrdude.

 > And thus, we're reaching the trigger for this change: avrdude is
 > impacted by the CVS-keyword expansion issue:

 >     https://svn.savannah.gnu.org/viewvc/avrdude/trunk/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js?revision=1396&view=markup

 > which would give two different files when checked out on different
 > machines:

 >     diff -durN foo/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js bar/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js
 >     --- foo/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js 2020-09-22 09:36:45.000000000 +0200
 >     +++ bar/avrdude-r1450/avrdude/atmel-docs/EDBG/common/jquery/layout/jquery.layout.js 2020-09-22 09:36:45.000000000 +0200
 >     @@ -1,6 +1,6 @@
 >      /**
 >       * @preserve jquery.layout 1.3.0 - Release Candidate 30.51
 >     - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
 >     + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
 >       * $Rev: 303005 $
 >       *
 >       * Copyright (c) 2012
 >     @@ -4718,7 +4718,7 @@

 >      /**
 >       * jquery.layout.state 1.0
 >     - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
 >     + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
 >       *
 >       * Copyright (c) 2010
 >       *   Kevin Dalman (http://allpro.net)
 >     @@ -5074,7 +5074,7 @@

 >      /**
 >       * jquery.layout.buttons 1.0
 >     - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
 >     + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
 >       *
 >       * Copyright (c) 2010
 >       *   Kevin Dalman (http://allpro.net)
 >     @@ -5356,7 +5356,7 @@

 >      /**
 >       * jquery.layout.browserZoom 1.0
 >     - * $Date: 2015-11-02 22:13:28 +0100 (Mon, 02 Nov 2015) $
 >     + * $Date: 2015-11-02 21:13:28 +0000 (Mon, 02 Nov 2015) $
 >       *
 >       * Copyright (c) 2012
 >       *   Kevin Dalman (http://allpro.net)

 > So we also update the hash for avrdude.

 > Fixes:
 >     http://autobuild.buildroot.org/results/e3b/e3b0508047f32008ebfa83c5255ec5994b6af120/ (time issue)
 >     http://autobuild.buildroot.org/results/48e/48e78e84b425e79cdb98c16ab40247a0fa7e9676/ (keyword expansion issue)

 > Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Vincent Fazio <vfazio@xes-inc.com>
 > Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
