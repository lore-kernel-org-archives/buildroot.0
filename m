From: Kiril Maler <kiril.maler@gmail.com>
Date: Wed, 10 Feb 2021 19:18:26 +0100
Subject: [Buildroot] PATCH package/gettext-tiny install file
 host-cpu-c-abi.m4, needed by gettextsize
Message-ID: <CABJxTWFQKOGik+G-nOExfdVm_9+Y0GCcn1Amca0WHOhZrqArBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext-gnu tool 'gettextsize' included in gettext-tiny, searches
for file host-cpu-c-abi.m4, as shown in gettext-gnu ChangeLog

But gettext-tiny will install only files found in its m4 dir
A workaround: add a link to gettext-gnu file, so it is installed

--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -73,6 +73,11 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
  $(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/po
  $(Q)mkdir -p $(HOST_DIR)/share/gettext-tiny/m4

+ # In gettext-gnu ChangeLog:
+ # 2018-11-11  Bruno Haible  <bruno@clisp.org>
+ # gettextize: Install also host-cpu-c-abi.m4 (needed since 2018-03-24)
+ [ -e $(@D)/m4/host-cpu-c-abi.m4 ] || ln -fs
../gettext-gnu/gettext-tools/gnulib-m4/host-cpu-c-abi.m4 $(@D)/m4
+
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
  $(HOST_CONFIGURE_OPTS) \
  prefix=$(HOST_DIR) \
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210210/332534de/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0014-fix-gettext-tiny.patch
Type: text/x-patch
Size: 861 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210210/332534de/attachment.bin>
