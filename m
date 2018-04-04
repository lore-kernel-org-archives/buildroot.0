From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  4 Apr 2018 20:09:33 +0200
Subject: [Buildroot] [PATCH 0/2] Add /dev/std{in, out,
 err} symlinks to inittabs
Message-ID: <20180404180935.15185-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some applications, e.g. bashs process subsitution feature, rely on the
convention of `/dev/fd` being a symbolic link to `/proc/self/fd`.

This symbolic link and his companions `/dev/std*` are created by (e)udev [1],
but not by mdev, resulting in the following error when using the following
expression:
   
```
bash: /dev/fd/62: No such file or directory
```
    
For the sake of simplicity, lets fix this by creating the symlinks in busybox'
and sysvinits inittab file. It is only really needed if eudev isn't used, but
it doesn't really hurt to create them even if eudev will recreate them
afterwards.

Note, that we do not create the symlink `/dev/core` as `/proc/kcore` is
not available on all platforms, e.g. ARM, and the feature is not much
appreciated [2].

[1] https://github.com/gentoo/eudev/blob/8943501993322c59a6eb5be456b0d716aafff21e/src/shared/dev-setup.c#L35-L40
[2] https://lwn.net/Articles/45315/

J?rg Krause (2):
  busybox: add /dev/std{in,out,err} symlinks to inittab
  sysvinit: add /dev/std{in,out,err} symlinks to inittab

 package/busybox/inittab  | 4 ++++
 package/sysvinit/inittab | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.16.3
