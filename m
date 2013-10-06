From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 18:54:41 +0200
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
Message-ID: <20131006185441.0d5c2397@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, Chris, Alvaro, Spenser,

You are amongst the four persons who contributed Microblaze related
changes to Buildroot. We are currently having various build problems in
our autobuilders caused by the Microblaze support, and it would be nice
if you could help us fixing those issues and generally maintain the
Microblaze support in a good shape in Buildroot.

At the moment, here are the latest autobuilder issues we have on
Microblaze:

 * libglib2 fails to build
   http://autobuild.buildroot.org/results/32f/32fca009984ca0de4b4026ff6b4029104d0396c5/build-end.log

   undefined reference to `__sync_fetch_and_or_4'

   probably caused by the compiler not providing the right intrinsics,
   or libglib2 not falling back to other solutions when  the intrinsics
   are not available.

 * nettle fails to build
   http://autobuild.buildroot.org/results/20b/20b2e2573985a687be29220a7df3b11a32894ba2/build-end.log

   sha512-compress.c: In function '_nettle_sha512_compress':
   sha512-compress.c:180:1: internal compiler error: in reload, at reload1.c:1059
   Please submit a full bug report,

   compiler bug, apparently.

 * openssl fails to build
   http://autobuild.buildroot.org/results/a050faaabbf89f9d3f324b821da84f8991a5aebb/build-end.log

   sha512.c: In function 'sha512_block_data_order':
   sha512.c:585:2: internal compiler error: in reload, at reload1.c:1059
   Please submit a full bug report,
   with preprocessed source if appropriate.

   looks pretty much the same compiler bug as the one triggered by the
   nettle build.

 * cairo fails to build
   http://autobuild.buildroot.org/results/7054d168729c4e257000db93ab5137af1e1583cc/build-end.log

   dragon.c: In function 'do_dragon':
   dragon.c:162:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:862
   Please submit a full bug report,
   with preprocessed source if appropriate.

   another compiler error.

Maybe those problems can be solved by using another Microblaze external
toolchain, but I couldn't find any other available on the Web. Or maybe
we should remove the external Microblaze toolchains and instead support
Microblaze in the internal Buildroot toolchain backend?

Thanks for your help,

Thomas

For reference, the last 30 Microblaze build failures were:

+---------------------+----------------------------------------------------------------------------------+-----------------+
| 2013-10-06 05:31:03 | http://autobuild.buildroot.org/results/e570445aafab51ce497da9e0d864157f50ff75d7/ | libglib2-2.36.3 |
| 2013-10-05 22:37:36 | http://autobuild.buildroot.org/results/20b2e2573985a687be29220a7df3b11a32894ba2/ | nettle-2.7.1    |
| 2013-10-05 21:59:39 | http://autobuild.buildroot.org/results/32fca009984ca0de4b4026ff6b4029104d0396c5/ | libglib2-2.36.3 |
| 2013-10-05 19:32:44 | http://autobuild.buildroot.org/results/166ab2a8c2efffa0b518f07d7f1dcdfe8c85614f/ | nettle-2.7.1    |
| 2013-10-05 17:39:45 | http://autobuild.buildroot.org/results/4ec0f495f4ff77bb35e7b1ab8446671c8d260cd6/ | libglib2-2.36.3 |
| 2013-10-05 09:44:38 | http://autobuild.buildroot.org/results/ce1c9a2ca389c2fb1c8955c75212737c7d57a803/ | cairo-1.12.10   |
| 2013-10-05 07:21:48 | http://autobuild.buildroot.org/results/b1d6d56d2c8bcd3df47e2685ed8e7de8742a7c73/ | nettle-2.7.1    |
| 2013-10-05 01:45:57 | http://autobuild.buildroot.org/results/a050faaabbf89f9d3f324b821da84f8991a5aebb/ | openssl-1.0.1e  |
| 2013-10-04 23:20:14 | http://autobuild.buildroot.org/results/ac8992a75b97f0baab55fe6e93ed0a8eeca08bcf/ | openssl-1.0.1e  |
| 2013-10-04 18:15:46 | http://autobuild.buildroot.org/results/80a0d575d2afac933c8cb2fb596a0347c50e4912/ | libglib2-2.36.3 |
| 2013-10-04 15:36:19 | http://autobuild.buildroot.org/results/9a3027a69dac63b4e621529eff18035530796e7e/ | nettle-2.7.1    |
| 2013-10-04 12:14:21 | http://autobuild.buildroot.org/results/4611c835d904fb5728ae5531bcc41ed33e1f5de6/ | nettle-2.7.1    |
| 2013-10-04 10:34:37 | http://autobuild.buildroot.org/results/c1332dd02817e25ab8ecd0ceab8c4953b65c9f50/ | pcsc-lite-1.8.6 |
| 2013-10-04 09:39:00 | http://autobuild.buildroot.org/results/517e2754256d39864d38befeeccd54c153e28971/ | libglib2-2.36.3 |
| 2013-10-03 14:04:25 | http://autobuild.buildroot.org/results/7054d168729c4e257000db93ab5137af1e1583cc/ | cairo-1.12.10   |
| 2013-10-02 05:50:46 | http://autobuild.buildroot.org/results/0a26b484f1cc01d6c150f6f855b2b8c7b03d585b/ | libglib2-2.36.3 |
| 2013-10-02 00:53:35 | http://autobuild.buildroot.org/results/2b10358b3540f9a12fc777bc37afbfb6072d2a47/ | binutils-2.21   |
| 2013-10-01 22:25:57 | http://autobuild.buildroot.org/results/5f691a60ffed41f0f4099179a07d7fc6c0251823/ | openssl-1.0.1e  |
| 2013-10-01 19:14:35 | http://autobuild.buildroot.org/results/d9115507421d121b0c317a2d1b52ef33199e913f/ | libglib2-2.36.3 |
| 2013-10-01 11:35:25 | http://autobuild.buildroot.org/results/0ad3e345fe1a9666bc18562549621aa28987b846/ | libglib2-2.36.3 |
| 2013-10-01 06:48:37 | http://autobuild.buildroot.org/results/1a373593d5f9d55f2e7e9113ecdb4adb8e6baaa7/ | libglib2-2.36.3 |
| 2013-09-30 18:09:09 | http://autobuild.buildroot.org/results/a44af8dee49fea322824f99da31b82c828728476/ | libglib2-2.36.3 |
| 2013-09-30 11:54:37 | http://autobuild.buildroot.org/results/74284d1087fc5677787882681c7f38a8f19e4402/ | openssl-1.0.1e  |
| 2013-09-29 14:55:24 | http://autobuild.buildroot.org/results/af53648189dd9ea40ea20d3e173e6ff391d73279/ | nettle-2.7.1    |
| 2013-09-29 13:47:53 | http://autobuild.buildroot.org/results/7cb55407f7f3e156cc04fd66da284a6c4178c776/ | libglib2-2.36.3 |
| 2013-09-29 12:54:59 | http://autobuild.buildroot.org/results/5031115f6e2c8e6c32309bab3d982b9e55e69fc3/ | libglib2-2.36.3 |
| 2013-09-29 10:57:54 | http://autobuild.buildroot.org/results/f12f692a4cf24e93d71f511362704e57766e2127/ | libglib2-2.36.3 |
| 2013-09-29 07:56:39 | http://autobuild.buildroot.org/results/c486ba7eebd2bbbef69b3a68323e0329cc65f79d/ | openssl-1.0.1e  |
| 2013-09-29 07:31:02 | http://autobuild.buildroot.org/results/f0dd5afd1e49e967d60c7ec7e62a924942e9a3ea/ | libglib2-2.36.3 |
| 2013-09-29 00:39:25 | http://autobuild.buildroot.org/results/767177028f4d0b53a3b9898f293526b234394463/ | libglib2-2.36.3 |
+---------------------+----------------------------------------------------------------------------------+-----------------+

-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
