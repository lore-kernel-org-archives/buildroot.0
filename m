From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 02 Apr 2017 12:38:24 +0200
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME
 hidden config option
References: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170320222656.38163a70@free-electrons.com>
Message-ID: <0u07rdxu5j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 20 Mar 2017 22:26:56 +0100 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sun, 19 Mar 2017 14:07:51 +0100, Thomas Petazzoni wrote:
>> This config option corresponds to the string returned by readelf for
>> the "Machine" field of the ELF header. It will be used to check if the
>> architecture of binaries built by Buildroot match the target
>> architecture.
>> 
>> Signed-off-by: Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com>
>> ---
>> Changes since v3:
>>  - None
> 
> I've applied both patches to master. Let's see if the autobuilders blow
> up now :)
> 
> Best regards,
> 
> Thomas

Hi Thomas,

Sparc v8 sees some build errors:

http://autobuild.buildroot.net/results/de7/
de7079b89fda1dd47e52619a644f23c4f4986b2c//

ERROR: architecture for "/usr/lib/libmpeg2convert.so.0.0.0" is "Sparc v8
+", should be "Sparc"
ERROR: architecture for "/usr/lib/libmpeg2.so.0.1.0" is "Sparc v8+", 
should be "Sparc"

http://autobuild.buildroot.net/results/f96/
f96c30c5c398db1ba561740ae64e922cd4f8a524//

ERROR: architecture for "/usr/lib/libopenblas_sparcp-r0.2.19.dev.so" is 
"Sparc v8+", should be "Sparc"

Patching arch/Config.in.sparc like this

@@ -30,5 +30,6 @@ config BR2_GCC_TARGET_CPU
        default "ultrasparc"    if BR2_sparc_v9
 
 config BR2_READELF_ARCH_NAME
+       default "Sparc v8+"     if BR2_sparc_v8
        default "Sparc"         if BR2_sparc
        default "Sparc v9"      if BR2_sparc64

does not fix the problem however:

>>> toolchain-external-custom  Copying external toolchain libraries to 
target...
ERROR: architecture for "/lib/libgcc_s.so.1" is "Sparc", should be "Sparc 
v8+"
ERROR: architecture for "/lib/libuClibc-1.0.22.so" is "Sparc", should be 
"Sparc v8+"
ERROR: architecture for "/lib/ld-uClibc-1.0.22.so" is "Sparc", should be 
"Sparc v8+"
ERROR: architecture for "/usr/lib/libstdc++.so.6.0.21" is "Sparc", should 
be "Sparc v8+"
ERROR: architecture for "/lib/libatomic.so.1.1.0" is "Sparc", should be 
"Sparc v8+"

Tested with http://autobuild.buildroot.net/results/de7/
de7079b89fda1dd47e52619a644f23c4f4986b2c/defconfig

Regards, Bernd
