From: Julien <julien.news@free.fr>
Date: Mon, 27 May 2013 18:32:42 +0200
Subject: [Buildroot] Shared libraries permissions prevent stripping
Message-ID: <51A38AAA.6090504@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Some packages (at least acl, attr, bind, gettext and nettle) install 
shared libraries with permission 644. It prevents them to be stripped 
during final stage, command line is:
find [...]/output/target -type f -perm +111 -not \( -name 
'libpthread*.so*' \) -print | xargs 
[...]/output/host/usr/bin/[...]-strip --remove-section=.comment 
--remove-section=.note 2>/dev/null || true
(in /Makefile, STRIP_FIND_CMD += -type f -perm +111)

I suggest to patch packages Makefiles (or Makefiles.in) of these 
packages, here are the patches.

There is maybe better ways to handle this.

Regards
-------------- next part --------------
A non-text attachment was scrubbed...
Name: acl-makefile-libs-install-perms.patch
Type: text/x-patch
Size: 1037 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/715fbcfd/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: attr-makefile-libs-install-perms.patch
Type: text/x-patch
Size: 1037 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/715fbcfd/attachment-0001.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bind-makefile-libs-install-perms.patch
Type: text/x-patch
Size: 2633 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/715fbcfd/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gettext-makefile-libs-install-perms.patch
Type: text/x-patch
Size: 1295 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/715fbcfd/attachment-0003.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: nettle-makefile-libs-install-perms.patch
Type: text/x-patch
Size: 944 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130527/715fbcfd/attachment-0004.bin>
