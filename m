From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 31 Mar 2016 10:57:50 +0200
Subject: [Buildroot] [PATCH v3 0/3] core/pkg-kconfig: Fix .config generation
Message-ID: <1459414674-30753-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To use an existing file as .config for a project, it needs to be
validated with 'make oldconfig'. If the file does not match all the
configuration entries of the project, the user will be prompted to
select the values for the new entries.

Historically, 'yes "" | make oldconfig' was used to silently select the
default values for new entries. But this does not work well with the
Linux kernel, as it will not select the correct option when configuring
tristate choice entries.

The Linux kernel has added a 'oldnoconfig' target, since renamed
'olddefconfig', that will work correctly, but this target does not exist
in all projects that rely on the kconfig workflow.

Update buildroot to use 'oldnoconfig' when available, and fallback to
the default method otherwise.

Changelog:
v1: creation as a package option
v2: try 'make oldnoconfig' before 'yes "" | make oldconfig' and remove
    the option
v3: Remove useless $(call ...), and factorize the make command

Romain Izard (3):
  core/pkg-kconfig: Factorize make commands
  core/pkg-kconfig: Do not use $(call ...) without parameters
  core/pkg-kconfig: Use oldnoconfig when possible

 package/pkg-kconfig.mk | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

-- 
2.5.0
