From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:21:31 +0100
Subject: [Buildroot] [PATCH] berkeleydb: fix static linking issues
In-Reply-To: <6de82523-7f1b-07d2-f901-abac9eddca3b@mind.be>
References: <20161204173924.GA1647@waldemar-brodkorb.de>
 <20161204215605.680c9070@free-electrons.com>
 <20161205034615.GA8584@waldemar-brodkorb.de>
 <6de82523-7f1b-07d2-f901-abac9eddca3b@mind.be>
Message-ID: <20161205222131.1bce2779@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Dec 2016 19:22:44 +0100, Arnout Vandecappelle wrote:

>  Perhaps libtool patching should be done in $($(PKG)_DIR) instead of
> $($(PKG)_SRCDIR), then we wouldn't have this issue. OTOH, only berkeleydb has
> this problem. 

I like this solution, it's actually the right thing to do. In fact
$(PKG)_SRCDIR is badly named, because the "source directory" really is
$(PKG)_DIR. $(PKG)_SRCDIR merely points to the sub-directory that
contains the configure script.

I've tested changing PKG_SRCDIR to PKG_DIR, and indeed, the libtool
patch gets properly applied to the various ltmain.sh in berkeleydb. I
have not verified if it fixes the build, though.

>>> berkeleydb 5.3.28 Extracting
gzip -d -c /home/thomas/dl/db-5.3.28.NC.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28   -xf -
>>> berkeleydb 5.3.28 Patching
>>> berkeleydb 5.3.28 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28 -name $file); do cp support/gnuconfig/$file $i; done; done
>>> berkeleydb 5.3.28 Patching libtool
patching file /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28/dist/ltmain.sh
Hunk #1 succeeded at 1416 (offset -1 lines).
Hunk #2 succeeded at 2962 (offset -1 lines).
Hunk #3 succeeded at 5167 (offset -12 lines).
Hunk #4 succeeded at 5177 (offset -12 lines).
Hunk #5 succeeded at 5459 (offset -12 lines).
Hunk #6 succeeded at 5740 (offset -13 lines).
Hunk #7 succeeded at 6682 (offset -14 lines).
Hunk #8 succeeded at 9256 (offset -18 lines).
patching file /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28/lang/sql/jdbc/ltmain.sh
Hunk #1 succeeded at 1048 (offset -166 lines).
Hunk #2 succeeded at 2018 (offset -221 lines).
Hunk #3 succeeded at 4117 (offset -315 lines).
Hunk #4 succeeded at 4127 (offset -315 lines).
Hunk #5 succeeded at 4404 (offset -320 lines).
Hunk #6 succeeded at 4669 (offset -325 lines).
Hunk #7 succeeded at 5411 (offset -327 lines).
Hunk #8 succeeded at 5569 (offset -327 lines).
Hunk #9 succeeded at 8057 (offset -321 lines).
patching file /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28/lang/sql/odbc/ltmain.sh
Hunk #1 succeeded at 283 (offset 57 lines).
Hunk #2 succeeded at 419 (offset 171 lines).
Hunk #3 succeeded at 1471 (offset 227 lines).
Hunk #4 succeeded at 2441 with fuzz 2 (offset 288 lines).
Hunk #5 succeeded at 2587 with fuzz 1 (offset 302 lines).
Hunk #6 succeeded at 5654 (offset 472 lines).
Hunk #7 succeeded at 5979 (offset 475 lines).
patching file /home/thomas/projets/buildroot/output/build/berkeleydb-5.3.28/lang/sql/sqlite/ltmain.sh
Hunk #1 succeeded at 1055 (offset -159 lines).
Hunk #2 succeeded at 2025 (offset -214 lines).
Hunk #3 succeeded at 4124 (offset -308 lines).
Hunk #4 succeeded at 4134 (offset -308 lines).
Hunk #5 succeeded at 4411 (offset -313 lines).
Hunk #6 succeeded at 4676 (offset -318 lines).
Hunk #7 succeeded at 5418 (offset -320 lines).
Hunk #8 succeeded at 5576 (offset -320 lines).
Hunk #9 succeeded at 8064 (offset -314 lines).

Waldemar, can you test this solution, and see if it works?

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d1cdb89..7e9eed4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -59,7 +59,7 @@ endef
 #
 define LIBTOOL_PATCH_HOOK
        @$(call MESSAGE,"Patching libtool")
-       $(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+       $(Q)for i in `find $($(PKG)_DIR) -name ltmain.sh`; do \
                ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
                sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e 's/\"//'`; \
                ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
