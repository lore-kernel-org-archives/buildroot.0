From: Markus Mayer <code@mmayer.net>
Date: Fri, 24 Nov 2017 16:24:07 -0800
Subject: [Buildroot] [RFC] bzip2: introduce make variable LIBDIR
In-Reply-To: <20171124233507.4f398629@windsurf.lan>
References: <20171124220554.24261-1-code@mmayer.net>
 <20171124233507.4f398629@windsurf.lan>
Message-ID: <CANEuBv7XopfU-g35S=1NrPwr59AtvLspQkFUdt1_iUdumHXH8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 November 2017 at 14:35, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 24 Nov 2017 14:05:54 -0800, Markus Mayer wrote:
>> From: Markus Mayer <mmayer@broadcom.com>
>>
>> In order to allow us to install libz2 into a location other than
>> /usr/lib, we introduce a variable called LIBDIR that can be set by
>> the build system to an alternate location.
>>
>> LIBDIR defaults to /usr/lib, so the behaviour doesn't change if
>> LIBDIR is never set.
>>
>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>> ---
>>
>> Most package in buildroot seem to offer the flexibility to install
>> libraries into directories specified by the user (build system) rather
>> than hard-coding the destination in the way bzip2 does.
>
> We don't support customizing on a per-package basis, or even globally,
> where libraries are installed. Where have you seen that we offer the
> flexibility to choose where libraries are installed ?

I haven't seen that anywhere, but many packages I looked at do provide
the option to specify the library directory somehow (if they are
autoconf packages, it's --libdir=$somepath, other packages use make
variables).

>> My question is whether patches 2-4 should be combined into a single
>> patch or if it is preferable to keep them separate.
>
> The whole point of patch 2 is to allow cross-compilation, not to allow
> customizing the directory where libraries are installed.
>
> What are you trying to do?

I have to make 32-bit ARM binaries work on a 64-bit ARM rootfs. I
don't have much of a choice at this time, because there are some
applications that we receive binary-only from other teams and they
come in 32-bit format only for now. As far as I know, the reason for
that is that the applications haven't been made 64-bit safe, so it
isn't a matter of asking for the apps to be compiled as 64-bit
binaries. They wouldn't work correctly. Or more likely, they wouldn't
even build in the first place.

The consequence of this is that I need to stick 32-bit libraries in
/lib and 64-bit libraries in /lib64 and /usr/lib64. To make this work,
one has to specify a path to a 32-bit sys-root (via a new BR
configuration setting), which will then be used to populate /lib. Of
course, there can't be lib64 -> lib type sym-links, either.

All shared libraries that are being built by buildroot go in
/usr/lib64 rather than /usr/lib. bzip2 is the only package I came
across that I couldn't tell that its library directory should be
/usr/lib64.

It took some doing, but this approach is working for me at this point.
I can successfully run the 32-bit binaries from a 64-bit rootfs.

I can certainly share what I have done so far. Of course, I have only
tested this with our toolchains (which are external to build root). I
am sure there are issues when you try other toolchains. It would
probably take some work to make this behave properly in all scenarios,
so I've been a bit hesitant to post the changes here. I am also still
cleaning up the modifications I made. There are five commits and the
bzip2 change here to make this work. So, maybe it isn't that bad after
all. :-)

Here's the result with my changes:

$ ls -la target/lib
total 2736
drwxr-xr-x  4 mmayer mmayer   4096 Nov 24 14:37 .
drwxr-xr-x 18 mmayer mmayer   4096 Nov 24 14:38 ..
drwxr-xr-x  3 mmayer mmayer   4096 Nov 24 14:37 dhcpcd
-rwxr-xr-x  1 mmayer mmayer 122884 Nov 24 14:37 ld-2.24.so
lrwxrwxrwx  1 mmayer mmayer     19 Nov 24 14:22 ld-linux-aarch64.so.1
-> ../lib64/ld-2.24.so
lrwxrwxrwx  1 mmayer mmayer     10 Nov 24 14:22 ld-linux-armhf.so.3 ->
ld-2.24.so
-rwxr-xr-x  1 mmayer mmayer  14036 Nov 24 14:37 libanl-2.24.so
lrwxrwxrwx  1 mmayer mmayer     14 Nov 24 14:22 libanl.so.1 -> libanl-2.24.so
lrwxrwxrwx  1 mmayer mmayer     18 Nov 24 14:22 libatomic.so.1 ->
libatomic.so.1.2.0
-rwxr-xr-x  1 mmayer mmayer  10640 Nov 24 14:37 libatomic.so.1.2.0
-rwxr-xr-x  1 mmayer mmayer 898732 Nov 24 14:37 libc-2.24.so
-rwxr-xr-x  1 mmayer mmayer  30248 Nov 24 14:37 libcrypt-2.24.so
lrwxrwxrwx  1 mmayer mmayer     16 Nov 24 14:22 libcrypt.so.1 ->
libcrypt-2.24.so
lrwxrwxrwx  1 mmayer mmayer     12 Nov 24 14:22 libc.so.6 -> libc-2.24.so
-rwxr-xr-x  1 mmayer mmayer   9640 Nov 24 14:37 libdl-2.24.so
lrwxrwxrwx  1 mmayer mmayer     13 Nov 24 14:22 libdl.so.2 -> libdl-2.24.so
-rwxr-xr-x  1 mmayer mmayer  94220 Nov 24 14:37 libgcc_s.so.1
-rwxr-xr-x  1 mmayer mmayer 423316 Nov 24 14:37 libm-2.24.so
lrwxrwxrwx  1 mmayer mmayer     12 Nov 24 14:22 libm.so.6 -> libm-2.24.so
-rwxr-xr-x  1 mmayer mmayer  55060 Nov 24 14:37 libnsl-2.24.so
lrwxrwxrwx  1 mmayer mmayer     14 Nov 24 14:22 libnsl.so.1 -> libnsl-2.24.so
-rwxr-xr-x  1 mmayer mmayer  13756 Nov 24 14:37 libnss_dns-2.24.so
lrwxrwxrwx  1 mmayer mmayer     18 Nov 24 14:22 libnss_dns.so.2 ->
libnss_dns-2.24.so
-rwxr-xr-x  1 mmayer mmayer  30208 Nov 24 14:37 libnss_files-2.24.so
lrwxrwxrwx  1 mmayer mmayer     20 Nov 24 14:22 libnss_files.so.2 ->
libnss_files-2.24.so
-rwxr-xr-x  1 mmayer mmayer 106868 Nov 24 14:37 libpthread-2.24.so
lrwxrwxrwx  1 mmayer mmayer     18 Nov 24 14:22 libpthread.so.0 ->
libpthread-2.24.so
-rwxr-xr-x  1 mmayer mmayer  54968 Nov 24 14:37 libresolv-2.24.so
lrwxrwxrwx  1 mmayer mmayer     17 Nov 24 14:22 libresolv.so.2 ->
libresolv-2.24.so
-rwxr-xr-x  1 mmayer mmayer  22372 Nov 24 14:37 librt-2.24.so
lrwxrwxrwx  1 mmayer mmayer     13 Nov 24 14:22 librt.so.1 -> librt-2.24.so
lrwxrwxrwx  1 mmayer mmayer     19 Nov 24 14:22 libstdc++.so.6 ->
libstdc++.so.6.0.22
-rwxr-xr-x  1 mmayer mmayer 841260 Nov 24 14:37 libstdc++.so.6.0.22
-rwxr-xr-x  1 mmayer mmayer   2498 Nov 24 14:22 libstdc++.so.6.0.22-gdb.py
-rwxr-xr-x  1 mmayer mmayer   9676 Nov 24 14:37 libutil-2.24.so
lrwxrwxrwx  1 mmayer mmayer     15 Nov 24 14:22 libutil.so.1 -> libutil-2.24.so
drwxr-xr-x  3 mmayer mmayer   4096 Nov 24 14:37 modules

$ ls -la target/lib64
total 6920
drwxr-xr-x  4 mmayer mmayer    4096 Nov 24 14:37 .
drwxr-xr-x 18 mmayer mmayer    4096 Nov 24 14:38 ..
drwxr-xr-x  2 mmayer mmayer    4096 Nov 24 14:37 bash
-rwxr-xr-x  1 mmayer mmayer 1196544 Nov 24 14:22 ld-2.24.so
-rwxr-xr-x  1 mmayer mmayer   14616 Nov 24 14:37 libanl-2.24.so
lrwxrwxrwx  1 mmayer mmayer      14 Nov 24 14:22 libanl.so.1 -> libanl-2.24.so
lrwxrwxrwx  1 mmayer mmayer      18 Nov 24 14:22 libatomic.so.1 ->
libatomic.so.1.2.0
-rwxr-xr-x  1 mmayer mmayer   15744 Nov 24 14:37 libatomic.so.1.2.0
-rwxr-xr-x  1 mmayer mmayer 1267264 Nov 24 14:37 libc-2.24.so
-rwxr-xr-x  1 mmayer mmayer   30720 Nov 24 14:37 libcrypt-2.24.so
lrwxrwxrwx  1 mmayer mmayer      16 Nov 24 14:22 libcrypt.so.1 ->
libcrypt-2.24.so
lrwxrwxrwx  1 mmayer mmayer      12 Nov 24 14:22 libc.so.6 -> libc-2.24.so
-rwxr-xr-x  1 mmayer mmayer   10216 Nov 24 14:37 libdl-2.24.so
lrwxrwxrwx  1 mmayer mmayer      13 Nov 24 14:22 libdl.so.2 -> libdl-2.24.so
-rwxr-xr-x  1 mmayer mmayer   61896 Nov 24 14:37 libgcc_s.so.1
lrwxrwxrwx  1 mmayer mmayer      18 Nov 24 14:34 libhandle.so.1 ->
libhandle.so.1.0.3
-rwxr-xr-x  1 mmayer mmayer    9096 Nov 24 14:37 libhandle.so.1.0.3
-rwxr-xr-x  1 mmayer mmayer  641632 Nov 24 14:37 libm-2.24.so
lrwxrwxrwx  1 mmayer mmayer      12 Nov 24 14:22 libm.so.6 -> libm-2.24.so
-rwxr-xr-x  1 mmayer mmayer   76448 Nov 24 14:37 libnsl-2.24.so
lrwxrwxrwx  1 mmayer mmayer      14 Nov 24 14:22 libnsl.so.1 -> libnsl-2.24.so
-rwxr-xr-x  1 mmayer mmayer   18472 Nov 24 14:37 libnss_dns-2.24.so
lrwxrwxrwx  1 mmayer mmayer      18 Nov 24 14:22 libnss_dns.so.2 ->
libnss_dns-2.24.so
-rwxr-xr-x  1 mmayer mmayer   39088 Nov 24 14:37 libnss_files-2.24.so
lrwxrwxrwx  1 mmayer mmayer      20 Nov 24 14:22 libnss_files.so.2 ->
libnss_files-2.24.so
-rwxr-xr-x  1 mmayer mmayer 2218840 Nov 24 14:22 libpthread-2.24.so
lrwxrwxrwx  1 mmayer mmayer      18 Nov 24 14:22 libpthread.so.0 ->
libpthread-2.24.so
-rwxr-xr-x  1 mmayer mmayer   76280 Nov 24 14:37 libresolv-2.24.so
lrwxrwxrwx  1 mmayer mmayer      17 Nov 24 14:22 libresolv.so.2 ->
libresolv-2.24.so
-rwxr-xr-x  1 mmayer mmayer   27304 Nov 24 14:37 librt-2.24.so
lrwxrwxrwx  1 mmayer mmayer      13 Nov 24 14:22 librt.so.1 -> librt-2.24.so
lrwxrwxrwx  1 mmayer mmayer      19 Nov 24 14:22 libstdc++.so.6 ->
libstdc++.so.6.0.22
-rwxr-xr-x  1 mmayer mmayer 1317416 Nov 24 14:37 libstdc++.so.6.0.22
-rwxr-xr-x  1 mmayer mmayer    2509 Nov 24 14:22 libstdc++.so.6.0.22-gdb.py
-rwxr-xr-x  1 mmayer mmayer   10344 Nov 24 14:37 libutil-2.24.so
lrwxrwxrwx  1 mmayer mmayer      15 Nov 24 14:22 libutil.so.1 -> libutil-2.24.so
drwxr-xr-x  2 mmayer mmayer    4096 Nov 24 14:25 pkgconfig

$ file target/lib/librt-2.24.so target/lib64/librt-2.24.so
target/lib/librt-2.24.so:   ELF 32-bit LSB shared object, ARM, EABI5
version 1 (GNU/Linux), dynamically linked, for GNU/Linux 3.2.0,
stripped
target/lib64/librt-2.24.so: ELF 64-bit LSB shared object, ARM aarch64,
version 1 (SYSV), dynamically linked, for GNU/Linux 3.7.0, stripped

$ ls -la target/usr/lib64
total 4072
drwxr-xr-x 5 mmayer mmayer   4096 Nov 24 14:37 .
drwxr-xr-x 9 mmayer mmayer   4096 Nov 24 14:37 ..
-rwxr-xr-x 1 mmayer mmayer 977080 Nov 24 14:37 libbfd-2.28.1.so
-rwxr-xr-x 1 mmayer mmayer   1116 Nov 24 14:25 libbfd.la
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:25 libbfd.so -> libbfd-2.28.1.so
-rwxr-xr-x 1 mmayer mmayer    990 Nov 24 14:27 libblkid.la
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:27 libblkid.so -> libblkid.so.1.1.0
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:27 libblkid.so.1 ->
libblkid.so.1.1.0
-rwxr-xr-x 1 mmayer mmayer 236632 Nov 24 14:37 libblkid.so.1.1.0
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:27 libcom_err.so -> libcom_err.so.2
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:27 libcom_err.so.2 ->
libcom_err.so.2.1
-rwxr-xr-x 1 mmayer mmayer  10992 Nov 24 14:37 libcom_err.so.2.1
-rw-r--r-- 1 mmayer mmayer  21288 Nov 24 14:26 libcpufreq.a
lrwxrwxrwx 1 mmayer mmayer     19 Nov 24 14:26 libcpufreq.so ->
libcpufreq.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     19 Nov 24 14:26 libcpufreq.so.0 ->
libcpufreq.so.0.0.0
-rwxr-xr-x 1 mmayer mmayer  16448 Nov 24 14:37 libcpufreq.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     20 Nov 24 14:31 libcpupower.so ->
libcpupower.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     20 Nov 24 14:31 libcpupower.so.0 ->
libcpupower.so.0.0.0
-rwxr-xr-x 1 mmayer mmayer  13448 Nov 24 14:37 libcpupower.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:24 libcurses.so -> libncurses.so.6.0
-rwxr-xr-x 1 mmayer mmayer  50576 Nov 24 14:37 libdmalloc.so
-rwxr-xr-x 1 mmayer mmayer  51480 Nov 24 14:37 libdmallocthcxx.so
-rwxr-xr-x 1 mmayer mmayer  51048 Nov 24 14:37 libdmallocth.so
-rwxr-xr-x 1 mmayer mmayer  51008 Nov 24 14:37 libdmallocxx.so
lrwxrwxrwx 1 mmayer mmayer     11 Nov 24 14:27 libe2p.so -> libe2p.so.2
lrwxrwxrwx 1 mmayer mmayer     13 Nov 24 14:27 libe2p.so.2 -> libe2p.so.2.3
-rwxr-xr-x 1 mmayer mmayer  28808 Nov 24 14:37 libe2p.so.2.3
lrwxrwxrwx 1 mmayer mmayer     14 Nov 24 14:27 libext2fs.so -> libext2fs.so.2
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:27 libext2fs.so.2 ->
libext2fs.so.2.4
-rwxr-xr-x 1 mmayer mmayer 250152 Nov 24 14:37 libext2fs.so.2.4
lrwxrwxrwx 1 mmayer mmayer     12 Nov 24 14:24 libform.so -> libform.so.6
lrwxrwxrwx 1 mmayer mmayer     14 Nov 24 14:24 libform.so.6 -> libform.so.6.0
-rwxr-xr-x 1 mmayer mmayer  49984 Nov 24 14:37 libform.so.6.0
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:24 libhistory.so -> libhistory.so.7
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:24 libhistory.so.7 ->
libhistory.so.7.0
-rwxr-xr-x 1 mmayer mmayer  29784 Nov 24 14:37 libhistory.so.7.0
-rwxr-xr-x 1 mmayer mmayer    928 Nov 24 14:28 libip4tc.la
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:28 libip4tc.so -> libip4tc.so.0.1.0
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:28 libip4tc.so.0 ->
libip4tc.so.0.1.0
-rwxr-xr-x 1 mmayer mmayer  22144 Nov 24 14:37 libip4tc.so.0.1.0
-rwxr-xr-x 1 mmayer mmayer    928 Nov 24 14:28 libip6tc.la
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:28 libip6tc.so -> libip6tc.so.0.1.0
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:28 libip6tc.so.0 ->
libip6tc.so.0.1.0
-rwxr-xr-x 1 mmayer mmayer  23856 Nov 24 14:37 libip6tc.so.0.1.0
-rwxr-xr-x 1 mmayer mmayer   1100 Nov 24 14:28 libiptc.la
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:28 libiptc.so -> libiptc.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:28 libiptc.so.0 -> libiptc.so.0.0.0
-rwxr-xr-x 1 mmayer mmayer   4016 Nov 24 14:37 libiptc.so.0.0.0
-rwxr-xr-x 1 mmayer mmayer    923 Nov 24 14:32 liblxc.la
lrwxrwxrwx 1 mmayer mmayer     11 Nov 24 14:32 liblxc.so -> liblxc.so.1
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:32 liblxc.so.1 -> liblxc.so.1.3.0
-rwxr-xr-x 1 mmayer mmayer 647048 Nov 24 14:37 liblxc.so.1.3.0
-rwxr-xr-x 1 mmayer mmayer    912 Nov 24 14:31 liblzma.la
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:31 liblzma.so -> liblzma.so.5.2.3
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:31 liblzma.so.5 -> liblzma.so.5.2.3
-rwxr-xr-x 1 mmayer mmayer 116232 Nov 24 14:37 liblzma.so.5.2.3
lrwxrwxrwx 1 mmayer mmayer     12 Nov 24 14:24 libmenu.so -> libmenu.so.6
lrwxrwxrwx 1 mmayer mmayer     14 Nov 24 14:24 libmenu.so.6 -> libmenu.so.6.0
-rwxr-xr-x 1 mmayer mmayer  23600 Nov 24 14:37 libmenu.so.6.0
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:24 libncurses.so -> libncurses.so.6
lrwxrwxrwx 1 mmayer mmayer     17 Nov 24 14:24 libncurses.so.6 ->
libncurses.so.6.0
-rwxr-xr-x 1 mmayer mmayer 239352 Nov 24 14:37 libncurses.so.6.0
lrwxrwxrwx 1 mmayer mmayer     13 Nov 24 14:24 libpanel.so -> libpanel.so.6
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:24 libpanel.so.6 -> libpanel.so.6.0
-rwxr-xr-x 1 mmayer mmayer  10480 Nov 24 14:37 libpanel.so.6.0
-rw-r--r-- 1 mmayer mmayer 330644 Nov 24 14:31 libpcap.a
lrwxrwxrwx 1 mmayer mmayer     12 Nov 24 14:31 libpcap.so -> libpcap.so.1
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:31 libpcap.so.1 -> libpcap.so.1.8.1
-rwxr-xr-x 1 mmayer mmayer 204776 Nov 24 14:37 libpcap.so.1.8.1
lrwxrwxrwx 1 mmayer mmayer     11 Nov 24 14:31 libpci.so -> libpci.so.3
lrwxrwxrwx 1 mmayer mmayer     15 Nov 24 14:31 libpci.so.3 -> libpci.so.3.5.5
-rw-r--r-- 1 mmayer mmayer  32000 Nov 24 14:37 libpci.so.3.5.5
-rwxr-xr-x 1 mmayer mmayer    903 Nov 24 14:32 libpopt.la
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:32 libpopt.so -> libpopt.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:32 libpopt.so.0 -> libpopt.so.0.0.0
-rwxr-xr-x 1 mmayer mmayer  36344 Nov 24 14:37 libpopt.so.0.0.0
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:24 libreadline.so ->
libreadline.so.7
lrwxrwxrwx 1 mmayer mmayer     18 Nov 24 14:24 libreadline.so.7 ->
libreadline.so.7.0
-rwxr-xr-x 1 mmayer mmayer 257648 Nov 24 14:37 libreadline.so.7.0
lrwxrwxrwx 1 mmayer mmayer     10 Nov 24 14:27 libss.so -> libss.so.2
lrwxrwxrwx 1 mmayer mmayer     12 Nov 24 14:27 libss.so.2 -> libss.so.2.0
-rwxr-xr-x 1 mmayer mmayer  21112 Nov 24 14:37 libss.so.2.0
-rwxr-xr-x 1 mmayer mmayer    903 Nov 24 14:27 libuuid.la
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:27 libuuid.so -> libuuid.so.1.3.0
lrwxrwxrwx 1 mmayer mmayer     16 Nov 24 14:27 libuuid.so.1 -> libuuid.so.1.3.0
-rwxr-xr-x 1 mmayer mmayer  21336 Nov 24 14:37 libuuid.so.1.3.0
-rwxr-xr-x 1 mmayer mmayer    949 Nov 24 14:28 libxtables.la
lrwxrwxrwx 1 mmayer mmayer     20 Nov 24 14:28 libxtables.so ->
libxtables.so.12.0.0
lrwxrwxrwx 1 mmayer mmayer     20 Nov 24 14:28 libxtables.so.12 ->
libxtables.so.12.0.0
-rwxr-xr-x 1 mmayer mmayer  41536 Nov 24 14:37 libxtables.so.12.0.0
-rw-r--r-- 1 mmayer mmayer  99442 Nov 24 14:25 libz.a
lrwxrwxrwx 1 mmayer mmayer     14 Nov 24 14:25 libz.so -> libz.so.1.2.11
lrwxrwxrwx 1 mmayer mmayer     14 Nov 24 14:25 libz.so.1 -> libz.so.1.2.11
-rwxr-xr-x 1 mmayer mmayer  72744 Nov 24 14:37 libz.so.1.2.11

Regards,
-Markus
