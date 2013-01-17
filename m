From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 17 Jan 2013 12:04:04 +0100
Subject: [Buildroot] Target rebuilding
Message-ID: <4486164.oLnzyGq5cK@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

It is handy to do tests directly in target/. But after some time, it is 
necessary to make a new fresh target/ directory. The current procedure to do 
this is:

* remove build/.root (or remove target/ if you want to throw all your work)
* remove build/*/.stamp_target_installed
* depending of you toolchain:
  # remove stamps/ext-toolchain-installed (external)
  # remove stamps/ct-ng-toolchain-installed (ctng)
  # remove target/lib/libc.so.0 (buildroot)
* launch make

I think this process lacks of consistency. Idealy, this process should be:
  rm -r target (depending if want to throw all your work)
  rm build/*/.stamp_target_installed
  make

I suggest following changes:

 1. Move build/.root to stamps/. Since it is hidden, many user forget this 
file exist.

 2. All stamps files are in subdirectories of build/. I suggest to move 
stamps/ to build/stamps/

 3. Buildroot toolchain should create a stamp files to be uniform with other 
toolchains. In add, target/lib/libc.so.0 never exists when PREFER_STATIC_LIB 
is enable.

 4. To be consistent stamps/*-toolchain-installed may be renamed 
stamps/.stamp_target_installed or stamps/.stamp_toolchain_target_installed or 
toolchain/.stamp_target_installed. We may add a README file to explain what is 
purpose of this apparently empty directory.

  5. stamps/ext-toolchain-installed currently copy libc in staging/ and in 
target/. It may be splited in two rules: stamps/ext-toolchain-target-installed 
and stamps/ext-toolchain-staging-installed.


What do you think about it?


Regards,

-- 
J?r?me Pouiller
