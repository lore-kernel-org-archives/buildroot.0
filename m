From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Sep 2016 15:44:05 +0000
Subject: [Buildroot] [Bug 8916] LDFLAGS pass to openssh
In-Reply-To: <bug-8916-163@https.bugs.busybox.net/>
References: <bug-8916-163@https.bugs.busybox.net/>
Message-ID: <bug-8916-163-Sye9wX88UF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8916

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
It works just fine here, and there is absolutely no need to pass custom LDFLAGS
for this to work. The default dynamic linker path is set by the cross-compiler
and is correct.

I've just tested the following Buildroot defconfig:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OPENSSH=y

ssh has the correct dynamic linker path:

 readelf -a output/target/usr/bin/ssh | grep -i interpreter
      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]

and when I extract the rootfs.tar and chroot into it:

$ sudo chroot rootfs /bin/sh
/ # ssh -l
Couldn't open /dev/null: No such file or directory
/ # mount -t devtmpfs none /dev
/ # ssh -l
option requires an argument -- l
usage: ssh [-1246AaCfGgKkMNnqsTtVvXxYy] [-b bind_address] [-c cipher_spec]
           [-D [bind_address:]port] [-E log_file] [-e escape_char]
           [-F configfile] [-I pkcs11] [-i identity_file]
           [-J [user@]host[:port]] [-L address] [-l login_name] [-m mac_spec]
           [-O ctl_cmd] [-o option] [-p port] [-Q query_option] [-R address]
           [-S ctl_path] [-W host:port] [-w local_tun[:remote_tun]]
           [user@]hostname [command]

So I think you have something in your environment that causes the
cross-compiler to encode a wrong path to the dynamic linker.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
