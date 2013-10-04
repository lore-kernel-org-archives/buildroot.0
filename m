From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 4 Oct 2013 11:19:17 +0200 (CEST)
Subject: [Buildroot] [PATCH v2 1/1] openpowerlink: new package
In-Reply-To: <87y56bnym4.fsf@dell.be.48ers.dk>
Message-ID: <107504174.7985997.1380878357121.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

----- Mail original -----
| De: "Peter Korsgaard" <jacmet@uclibc.org>
| ?: "Romain Naour" <romain.naour@openwide.fr>
| Cc: buildroot at busybox.net
| Envoy?: Mercredi 2 Octobre 2013 23:37:07
| Objet: Re: [PATCH v2 1/1] openpowerlink: new package
| 
| >>>>> "R" == Romain Naour <romain.naour@openwide.fr> writes:
| 
| Hi,
| 
|  R> +++ b/package/openpowerlink/Config.in
|  R> @@ -0,0 +1,107 @@
|  R> +comment "openpowerlink requires thread support in toolchain"
|  R> +        depends on !BR2_TOOLCHAIN_HAS_THREADS
| 
| It also needs C++ support. From CMakeLists.txt:
| 
| PROJECT (openPOWERLINK C CXX)

Indedd, but C++ support is currently only needded for qt demo which is not always selected.
I'll fix that, thanks.

| 
|  R> +
|  R> +config BR2_PACKAGE_OPENPOWERLINK
|  R> +        bool "openpowerlink"
|  R> +        depends on BR2_TOOLCHAIN_HAS_THREADS
|  R> +        depends on BR2_i386 || BR2_x86_64
|  R> +        help
| 
| Your indentation is wrong. Config.in files should be indented with
| <tab>
| (and help lines with <tab><space><space>).

Sory for that, it's my webmail... 

| 
|  R> +          openPOWERLINK is an Open Source Industrial Ethernet
|  R> +          stack implementing the POWERLINK protocol for Managing
|  Node
|  R> +          (MN, POWERLINK Master) and Controlled Node (CN,
|  POWERLINK Slave).
|  R> +
|  R> +          It is provided by SYSTEC electronic
|  (http://www.systec-electronic.com),
| 
| Too long line, please wrap after 'provided by'.
| 
Ok

| Besides this, it looks good. I did a quick test build with everything
| kept to their default and got:
| 
| [100%] Built target powerlink
| make[2]: Leaving directory
| `/home/peko/source/buildroot/output/build/openpowerlink-V1.08.3'
| make[1]: Leaving directory
| `/home/peko/source/buildroot/output/build/openpowerlink-V1.08.3'
| >>> openpowerlink V1.08.3 Installing to staging directory
| PATH="/home/peko/source/buildroot/output/host/bin:/home/peko/source/buildroot/output/host/usr/bin:/home/peko/source/buildroot/output/host/usr/sbin/:/home/peko/bin:/home/peko/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/barco/current/usr/bin:/opt/barco/current/usr/bin"
| PERLLIB="/home/peko/source/buildroot/output/host/usr/lib/perl"
|  /usr/bin/make -j5
|  DESTDIR=/home/peko/source/buildroot/output/host/usr/i686-buildroot-linux-uclibc/sysroot
| install -C
| /home/peko/source/buildroot/output/build/openpowerlink-V1.08.3/
| make[1]: Entering directory
| `/home/peko/source/buildroot/output/build/openpowerlink-V1.08.3'
| make[1]: *** No rule to make target `install'.  Stop.
| make[1]: Leaving directory
| `/home/peko/source/buildroot/output/build/openpowerlink-V1.08.3'
| make: ***
| [/home/peko/source/buildroot/output/build/openpowerlink-V1.08.3/.stamp_staging_installed]
| Error 2
| 
| So I guess you're missing something?

I see, the user space stack is selected but no demo is build.
So, there is no INSTALL rules for libpowerlink.a
I'll fix that.

Furthermore, if the kernel space is sectected the build may break with latest kernels since openpowerlink stack is not mainline.
openpowerlink 1.8.3 break with kernels >= 3.5.
I'll backport a patch from devel branch for that.

| 
| Please fix and resubmit, thanks.

Thanks, for testing.
I'll resubmit as soon as possible.

Best regards,
Romain Naour

| 
| --
| Bye, Peter Korsgaard
| 
