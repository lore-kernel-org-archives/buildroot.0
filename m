From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 29 Mar 2016 12:11:40 +0200
Subject: [Buildroot] [PATCH v2 0/2] core/pkg-kconfig: Fix .config generation
Message-ID: <1459246302-21837-1-git-send-email-romain.izard.pro@gmail.com>
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

Romain Izard (2):
  core/pkg-kconfig: fix .config rule for silent mode
  core/pkg-kconfig: Use oldnoconfig when possible

 package/pkg-kconfig.mk | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.5.0
