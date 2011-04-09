From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Sat, 09 Apr 2011 15:43:34 -0600
Subject: [Buildroot] xfonts error in 2011.02
Message-ID: <1302385414.7244.23.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm getting the following while building 2011.02's
xfonts_font-adobe-100dpi package:

/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2011.02.bld/staging//usr/bin/ucs2any: Can't read mapping file '/usr/share/fonts/X11/util/map-ISO8859-1': No such file or directory!

This seems related to this patch:
http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabec72d7637f80f7a55fbba9ce67bf

I've applied the patch but it doesn't appear to fix the problem.  Also,
is this patch correct?  It seems the following:

++ if (pcsysrootdir &&
++ (!strcmp(variable_name, "includedir") ||
++ !strcmp(variable_name, "libdir")))

should actually be this:

++ if (pcsysrootdir &&
++ (!strcmp(variable_name, "includedir") &&
++ !strcmp(variable_name, "libdir")))

Unfortunately, that doesn't fix my problem either.  "map-ISO8859-1" is
installed under the sysroot tree without my change and under the staging
tree with it.  I need to double check that with clean builds (in
progress) to be certain, but I'm pretty sure that's the scenario.

Is the correct location for the map files ucs2any is looking for
STAGING/usr/share/fonts/X11/util?  Should the output of this message
specify that it was trying to look in the staging directory?  At the
moment, it looks like it's looking in the host file system.  So I can't
tell if the problem is that ucs2any is looking in the wrong place or the
map file is installed (by xfonts_font-util) in the wrong place.
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
