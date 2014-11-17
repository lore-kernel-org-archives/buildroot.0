From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 17 Nov 2014 14:19:05 -0300
Subject: [Buildroot] [PATCH v3 0/5] Target permissions
Message-ID: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

this patchset fixes the target permissions problem we observed, meaning,
it makes the target permissions not depend on the user's umask and the
current permissions of the source files on the repo. This is a problem,
since the build is not exactly reproducible unless we take all those
modes into account.

The way we accomplish this is by using the --chmod option when using
rsync -a, and by setting a fixed umask in the Makefile (previously done
by wrapping all shell calls, new in this v3 is that it's done with phony
rules only once a top level, I consider it a lot better but I'm open for
discussion, of course)

Another way to not depend on "volatile" modes would be to add a 'chmod
-R' call on the fakeroot script created in fs/common.mk, and just
expect that packages that care about their permissions set them via
$(PKG)_PERMISSIONS. However, some packages (at least: at, ssh [for
ssh-keysign], sudo and ngircd) set the correct permissions they want in
their INSTALL_CMDs, so we'd have to check each one and write the correct
permission set.

By clearing the umask, we remove the variability, while also allowing
packages to do whatever they want.

The last two patches fix two packages that used 'cp -p' from their BR
directory, so the mode on the target would depend on the those files
(for which we don't track nor care about permissions). As such, these
last two patches are independent from the others.

Only difference from v2 is that I removed the shell wrapper script and
used phony Makefile rules to set the umask, which is then inherited by
the whole build process. I believe this is better, since we don't add
any measurable work to the build and it's functionally equivalent.

Guido Mart?nez (5):
  Makefile: don't depend on the umask
  Makefile: don't depend on current skeleton/overlay permissions
  pkg-generic.mk: don't depend on external package permissions
  package: matchbox-keyboard: use install instead of cp
  package: linux-fusion: use install instead of cp

 Makefile                                              | 19 +++++++++++++++++--
 package/linux-fusion/linux-fusion.mk                  |  4 ++--
 .../matchbox/matchbox-keyboard/matchbox-keyboard.mk   |  2 +-
 package/pkg-generic.mk                                |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)

-- 
2.1.3
