From: John Moon <johncarlmoon@gmail.com>
Date: Fri, 20 Jan 2017 11:20:37 -0800
Subject: [Buildroot] Extra package libraries not resolved on target system
	(Xilinx aarch64)
Message-ID: <CAKuvFvRqf6BomOx5exQHCeC=g61bOD_zJNYF-sw2G9YEr+UtHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the Xilinx SDK aarch64 toolchain with Buildroot, extra packages are
having trouble resolving their libraries on the target system. For example,
openssh requires libcrypto.so.1.0.0, but can't find that library when
running ssh-keygen:



# LD_DEBUG=libs ssh-keygen

      1653:     find library=libcrypto.so.1.0.0 [0]; searching

      1653:      search cache=/etc/ld.so.cache

      1653:      search
path=/lib/aarch64-linux-gnu/tls/aarch64:/lib/aarch64-linux-gnu/tls:/lib/aarch64-linux-gnu/aarch64:/lib/aarch64-linux-gnu:/usr/lib/aarch)

      1653:       trying
file=/lib/aarch64-linux-gnu/tls/aarch64/libcrypto.so.1.0.0

      1653:       trying file=/lib/aarch64-linux-gnu/tls/libcrypto.so.1.0.0

      1653:       trying
file=/lib/aarch64-linux-gnu/aarch64/libcrypto.so.1.0.0

     1653:       trying file=/lib/aarch64-linux-gnu/libcrypto.so.1.0.0

      1653:       trying
file=/usr/lib/aarch64-linux-gnu/tls/aarch64/libcrypto.so.1.0.0

      1653:       trying
file=/usr/lib/aarch64-linux-gnu/tls/libcrypto.so.1.0.0

      1653:       trying
file=/usr/lib/aarch64-linux-gnu/aarch64/libcrypto.so.1.0.0

      1653:       trying file=/usr/lib/aarch64-linux-gnu/libcrypto.so.1.0.0

      1653:

ssh-keygen: error while loading shared libraries: libcrypto.so.1.0.0:
cannot open shared object file: No such file or directory


However, the library *does* exist in /usr/lib. If I create a symlink on the
target (ln -s /usr/lib/* /lib/aarch64-linux-gnu/), then everything resolves
correctly. Why are the binaries looking for their libraries in /lib/<tuple>
and /usr/lib/<tuple> instead of just /lib and /usr/lib?


The toolchain has GCC version 4.9.x, kernel headers 4.4.x, and I'm using
glibc/eglibc.


Thank you - this is my first post to the mailing list - hopefully I'm not
making any faux pas's.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170120/0c2d0c23/attachment.html>
