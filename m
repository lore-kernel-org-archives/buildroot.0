From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 09:32:29 +0100
Subject: [Buildroot] Use Pigz instead of gzip for filesystem compression
In-Reply-To: <bfb188d5-2d07-e7aa-bf3c-c221ddf372ff@xes-inc.com> (Vincent
 Fazio's message of "Fri, 6 Mar 2020 10:48:23 -0600")
References: <ea-mime-5e627db0-4568-363416cc@www-5.netcourrier.com>
 <bfb188d5-2d07-e7aa-bf3c-c221ddf372ff@xes-inc.com>
Message-ID: <87mu8ruu02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Fazio <vfazio@xes-inc.com> writes:

 > Louis-Paul,
 > On 3/6/20 10:43 AM, lpdev at cordier.org wrote:
 >> Hi all,
 >> 
 >> I have an improvement suggestion for filesystem compression. I have
 >> done some benchmark with pigz program (see https://zlib.net/pigz/).
 >> 
 >> Calling make after the target has been built the first time,
 >> buildroot has to compress a 850MB filesystem (build machine is
 >> i7-6700K CPU @ 4.00GHz):
 >> 
 >> gzip: 2m23s
 >> pigz: 46s
 >> 
 >> It's almost 3 times faster.
 >> 
 >> In the main Config.in, I suggest to add to Build options -> Command
 >> menu a BR2_GZIP command that would allow to specify the gzip program
 >> we want to use. Or better would be to set pigz as an host package.
 >> Then updating fs/common.mk:
 >> 
 >> ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 >> ROOTFS_$(2)_COMPRESS_EXT = .gz
 >> ROOTFS_$(2)_COMPRESS_CMD = $(BR2_GZIP) -9 -c -n
 >> endif
 > If the commandline parameters are the same, this could likely be done
 > within support/dependencies/check-host-gzip.sh ?

We have to be careful to only use pigz where we are not interested in
bit-identical output (like we are for the tarballs of git repos). For
details, see:

commit 2218dc85bef9bb1c9d27788e5ac69593144fe268
Author: Yann E. MORIN <yann.morin.1998@free.fr>
Date:   Sat Nov 17 18:15:51 2018 +0100

    support/dependencies: add a check for a suitable gzip

-- 
Bye, Peter Korsgaard
