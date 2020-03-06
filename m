From: lpdev at cordier.org <lpdev@cordier.org>
Date: Fri,  6 Mar 2020 17:43:28 +0100 (CET)
Subject: [Buildroot] Use Pigz instead of gzip for filesystem compression
Message-ID: <ea-mime-5e627db0-4568-363416cc@www-5.netcourrier.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have an improvement suggestion for filesystem compression. I have done some benchmark with pigz program (see https://zlib.net/pigz/).

Calling make after the target has been built the first time, buildroot has to compress a 850MB filesystem (build machine is i7-6700K CPU @ 4.00GHz):

gzip: 2m23s
pigz: 46s

It's almost 3 times faster.

In the main Config.in, I suggest to add to Build options -> Command menu a BR2_GZIP command that would allow to specify the gzip program we want to use. Or better would be to set pigz as an host package.
Then updating fs/common.mk:

ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
ROOTFS_$(2)_COMPRESS_EXT = .gz
ROOTFS_$(2)_COMPRESS_CMD = $(BR2_GZIP) -9 -c -n
endif

More generally I think it would be useful to specify the compression command, as bzip2 seems to have pbzib2.
