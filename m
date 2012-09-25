From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Sep 2012 01:55:15 +0200
Subject: [Buildroot] Host xmllint dynamic link failure
Message-ID: <50624463.1000200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  During one of my test builds, I ran into a dynamic linker failure when running
xmllint:

/usr/bin/xmllint: relocation error: /usr/bin/xmllint: symbol xmlShell, version LIBXML2_2.4.30 not defined in file 
libxml2.so.2 with link time reference

  The problem is that we compile with LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:",
so that our host-libxml2 is used instead of the one in /usr/lib.  Or,
the problem is that /usr/bin/xmllint is used instead of
$(HOST_DIR)/usr/bin/xmllint.  The path is hardcoded in xmlto...

  Possible solutions:

- Build host-xmlto.  This will require updating all packages using xmlto
to add host-xmlto to the dependencies.

- Remove LD_LIBRARY_PATH and rely on rpath to find the libraries.  This may
require patching some of the host packages.  At first sight, it doesn't look
too bad, however.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
