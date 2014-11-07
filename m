From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:33 -0300
Subject: [Buildroot] [PATCH v2 0/5] target permissions
In-Reply-To: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trying again to make the target's permissions well-defined. Differences
with respect to the previous RFC are:

- previous patch splitted into two for clarity

- packages with OVERRIDE_SRCIDR get chmoded so the build doesn't depend
  on the permissions of the source directory

- fixed two packages (matchbox-keyboard and linux-fusion) which copy
  files from the BR directory (for which we don't control permissions)
  with 'cp -p'. Change that to 'install -m' so we don't depend on the
  current status

There is no change for the toolchain, as I think it doesn't has any
issues. The libs are copied to the target via several installs which
set the mode explicitely. As long as toolchain installation is done via
'install', we won't have any problem. However, it's possible that I
missed something :).

Comments are _very_ welcome.

Guido Mart?nez (5):
  Makefile: don't depend on the umask
  Makefile: don't depend on current skeleton/overlay permissions
  pkg-generic.mk: don't depend on external package permissions
  package: matchbox-keyboard: use install instead of cp
  package: linux-fusion: use install instead of cp

 Makefile                                                | 7 ++++---
 package/linux-fusion/linux-fusion.mk                    | 2 +-
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
 package/pkg-generic.mk                                  | 2 +-
 support/scripts/shell-wrapper.sh                        | 5 +++++
 5 files changed, 12 insertions(+), 6 deletions(-)
 create mode 100755 support/scripts/shell-wrapper.sh

-- 
2.1.1
