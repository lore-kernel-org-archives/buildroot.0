From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 6 May 2018 18:46:37 +0900
Subject: [Buildroot] Automatic module loading with mdev is broken?
Message-ID: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to get automatic module loading with mdev and it looks like
it was broken with this commit
b4fc5a180c81689a982d5c595844331684c14f51
(https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c595844331684c14f51)
or has maybe regressed?

Anyhow the previous version of the line that the commit changed works
(the modules I expect to get loaded get loaded).
The changed version results in nothing being loaded.

I think it's to do with this part "xargs -0 sort -u -z". Sort is
taking in the big list of files correctly and sorting them but the
result
seems to still have new lines in it. So when that is passed to xargs
(which is expecting the items to be null terminated) again
to run modprobe the module aliases don't match and thus nothing gets loaded.

This *works* for me but I'm not sure if it's right:

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 63ca955b1c..71693e7a9d 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -9,7 +9,7 @@ case "$1" in
       echo /sbin/mdev >/proc/sys/kernel/hotplug
       /sbin/mdev -s
       # coldplug modules
-       find /sys/ -name modalias -print0 | xargs -0 sort -u -z |
xargs -0 modprobe -abq
+       find /sys/ -name modalias -print0 | xargs -0 sort -u -z | tr
-d '\n' | xargs -0 modprobe -abq
       ;;
  stop)
       ;;

Cheers,

Daniel
