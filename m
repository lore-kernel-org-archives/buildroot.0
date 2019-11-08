From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Fri, 8 Nov 2019 22:01:08 +0200
Subject: [Buildroot] No $(HOST_DIR)/bin/python symlink when building
 host-pyhton3
Message-ID: <CAJX3zAuodCFDg2w-kRrS9knqcxzdkEz0k1rnW57X-cPXn8_v8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build for qemu_x86_64 on a clean installation of Ubuntu 18.04.
Ubuntu 18.04 comes with python3 only. There is no symlink named `python` by
default on the PATH.

The qemu_x86_64_defconfig does not select python nor python3 for the target.
Nonetheless there are still many packages depending on host-python /
host-python3.

Buildroot will only build host-python3 in this case in order to save build
time.
BUT - for a reason I can''t fully understand, python3.mk does not install
the HOST symlink unless pyhton3 is selected for the TARGET.

So to summarize: No python on target, python3 on host, but no symlink
installed on $(HOST_DIR)/bin/python.

When trying to build, packages begin to fail for not finding python.
The first one is host-ninja, but that is an easy one since it requires
python3 specifically, so I explicitly specified $(HOST_DIR)/bin/python3.

But now host-qemu fails to configure because it can't find python and I
don't know what to do.

The way I see it - there has to be SOME python installed to the host
directory at $(HOST_DIR)/bin/python, but if you don't select python for the
target then you don't get the symlink on the host.

What should I do?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191108/2fa18e67/attachment.html>
