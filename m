From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:59:47 +0100
Subject: [Buildroot] [git commit] package/openjdk: use official
 hg.openjdk.java.net repository
Message-ID: <20191205210350.28F03880AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c55fe54d8ad44369147e7467fe7c38949b962ed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Java 11 (and possibly earlier), OpenJDK now has its own official
repository at hg.openjdk.java.net which is referenced in all OpenJDK
documentation.  This patch brings buildroot into line with that
source, reducing the opportunity for code injection, and allowing
consistent patching both across projects and for patches specific to
buildroot environments.

diff -ru shows that the only changes between the downstream and upstream files at
this point in time is the addition of a .hg_archive.txt file,  containing:

repo: fd16c54261b32be1aaedd863b7e856801b7f8543
node: 7b6accc7c009304dd2979ea16c1cb15bf749a1fc
branch: default
tag: jdk-12.0.2+10
tag: jdk-12.0.2-ga

This does, however, change the hash for the tar.gz file (but not for the license).

With respect to the concern regarding upstream hash consistency, we have now been
using these archives for just over a year (since OpenJDK 11) and we haven't seen an
archive hash change in that time.  This was a vast improvement on the previous
Mercurial forest.  /archive is exactly as is sounds.  It's an archive that doesn't
change, which is why it effectively negates the need for a "downstream" mirror.

Tests completed successfully (which is not surprising since there are no code changes here):

$ ./support/testing/run-tests -d ./dl/ -k -o test_dir tests.package.test_openjdk.TestOpenJdk
14:35:25 TestOpenJdk                              Starting
['Hello, World']
['Test: Get JNI Version passed', 'Test: Read Native String Constant passed', 'Test: Write Java String to Native Library passed', 'Test: Write Java Char Array to Native Library passed', 'Test: Write String Member to Native Library passed', 'Test: Set String Member from Native Library passed', 'Test: Execeute Java Function from Native Library passed', 'Test: Instantiate Java Class passed', 'Test: Call Native Library to Set System Time passed']
14:35:46 TestOpenJdk                              Cleaning up
