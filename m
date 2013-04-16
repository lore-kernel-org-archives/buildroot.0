From: Lars Dunemark <ladu@hms.se>
Date: Tue, 16 Apr 2013 07:24:51 +0000
Subject: [Buildroot] Problem with external toolchain sysroot and eclipse
Message-ID: <6119D107D82B0940B389FAED3F2DDE66158823C4@Ansuz.hms.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

Recently, we discovered that it has become something strange with our external toolchain builds.

We discovered this when we wanted to start using Eclipse integration for buildroot and build applications outside buildroot.

After some investigation we discovered that the ext-toolchain-wrapper had changed and received support for relative paths.
After adding some debug prints:
toolchain/toolchain-external/ext-toolchain-wrapper.c
122         printf("path: %s, sysroot: %s\n", path, sysroot);

I got the the following result:

$ pwd
/media/build/source
$ arm-cortex_a8-linux-gnueabi-gcc
path: /media/build/source/toolchain/bin/arm-cortex_a8-linux-gnueabi-gcc, sysroot: /media/usr/arm-buildroot-linux-gnueabi/sysroot
arm-cortex_a8-linux-gnueabi-gcc: no input files


$ ./buildroot/output/host/usr/bin/arm-cortex_a8-linux-gnueabi-gcc
path: /media/build/source/toolchain/bin/arm-cortex_a8-linux-gnueabi-gcc, sysroot: /media/build/source/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot
arm-cortex_a8-linux-gnueabi-gcc: no input files

As you can see we get wrong sysroot if we using gcc directly from out PATH.
Our toolchain is located beside buildroot directory:
/buildroot
/toolchain

The only workaround that I have found is to add following patch but I think this will break the purpose with the original patch:
Commit: befb9a3ee0c5994162f527d8ef763d57d68ec48e

Is there any other better solution to this problem?

Best regards
Lars Dunemark
