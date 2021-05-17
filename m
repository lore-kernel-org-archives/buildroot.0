From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 May 2021 06:13:19 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-HiRoJq5DMR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

--- Comment #5 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
I've downloaded the patch you suggested (attached) and rebuilt.  The patch
appears to have been applied:

make[1]: Entering directory '/home/ian/projects/hiwire-linux/source/buildroot'
glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz: OK (sha256:
f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4)
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Extracting
gzip -d -c
/home/ian/build/download/glibc/glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
| tar --strip-components=1 -C
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
  -xf -
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Patching

Applying 0001-HACK-only-build-and-install-localedef.patch using patch: 
patching file Rules
Hunk #1 succeeded at 212 (offset 22 lines).
patching file locale/Makefile
Hunk #1 succeeded at 33 (offset 1 line).

Applying 0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch using
patch: 
patching file configure
Hunk #1 succeeded at 4566 (offset -35 lines).
Hunk #2 succeeded at 4696 (offset -35 lines).
Hunk #3 succeeded at 5105 (offset -35 lines).

Applying 0004.patch using patch: 
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Patching libtool
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Configuring
mkdir -p
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/build

But I am still seeing an error:

make[1]: Entering directory '/home/ian/projects/hiwire-linux/source/buildroot'
glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz: OK (sha256:
f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4)
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Extracting
gzip -d -c
/home/ian/build/download/glibc/glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
| tar --strip-components=1 -C
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
  -xf -
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Patching

Applying 0001-HACK-only-build-and-install-localedef.patch using patch: 
patching file Rules
Hunk #1 succeeded at 212 (offset 22 lines).
patching file locale/Makefile
Hunk #1 succeeded at 33 (offset 1 line).

Applying 0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch using
patch: 
patching file configure
Hunk #1 succeeded at 4566 (offset -35 lines).
Hunk #2 succeeded at 4696 (offset -35 lines).
Hunk #3 succeeded at 5105 (offset -35 lines).

Applying 0004.patch using patch: 
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0003-Fix-GCC-11-Warray-parameter-warning-for-__sigsetjmp-.patch
patching file
package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0004-Avoid-Wstringop-overflow-warning-in-pthread_cleanup_.patch
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Patching libtool
>>> host-localedef 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 Configuring
mkdir -p
/home/ian/build/hiwire-linux-5c671c59-x86_64/buildroot/build/host-localedef-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/build

-- 
You are receiving this mail because:
You are on the CC list for the bug.
