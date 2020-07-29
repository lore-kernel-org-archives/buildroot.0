From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Jul 2020 21:56:10 +0000
Subject: [Buildroot] [Bug 13121] New: wpa_supplicant fails to build without
 libopenssl enabled
Message-ID: <bug-13121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13121

            Bug ID: 13121
           Summary: wpa_supplicant fails to build without libopenssl
                    enabled
           Product: buildroot
           Version: 2020.05.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mstarr at hedonline.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am building with the ARM 2019.12 external toolchain for an ARM cortex-A7
processor.  When trying to build wpa_supplicant without libopenssl enabled, the
build failed with the following errors:

/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_peer/eap_teap.o: in function `eap_teap_decrypt':
eap_teap.c:(.text+0x1af8): undefined reference to `tls_get_tls_unique'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_peer/eap_teap.o: in function `eap_teap_process':
eap_teap.c:(.text+0x2624): undefined reference to
`tls_connection_get_cipher_suite'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o: in function `eap_teap_derive_eap_msk':
eap_teap_common.c:(.text+0x1a0): undefined reference to `tls_prf_sha256'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o: in function `eap_teap_derive_eap_emsk':
eap_teap_common.c:(.text+0x20c): undefined reference to `tls_prf_sha256'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o: in function
`eap_teap_derive_cmk_basic_pw_auth':
eap_teap_common.c:(.text+0x290): undefined reference to `tls_prf_sha256'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o: in function `eap_teap_derive_imck':
eap_teap_common.c:(.text+0x3b8): undefined reference to `tls_prf_sha256'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
eap_teap_common.c:(.text+0x4f4): undefined reference to `tls_prf_sha256'
/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabihf/9.2.1/../../../../arm-none-linux-gnueabihf/bin/ld:
../src/eap_common/eap_teap_common.o:eap_teap_common.c:(.text+0x544): more
undefined references to `tls_prf_sha256' follow
collect2: error: ld returned 1 exit status
Makefile:1903: recipe for target 'wpa_supplicant' failed
make[3]: *** [wpa_supplicant] Error 1
package/pkg-generic.mk:266: recipe for target
'/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/build/wpa_supplicant-2.9/.stamp_built'
failed
make[2]: ***
[/home/workspace/PM-04H-Display_buildroot-update/mfgtool-build/build/wpa_supplicant-2.9/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make[1]: *** [_all] Error 2
make[1]: Leaving directory
'/home/workspace/PM-04H-Display_buildroot-update/buildroot-2020.05.1'
heldk-4/Makefile:334: recipe for target 'mfgtool' failed
make: *** [mfgtool] Error 1


When the build is tried again with libopenssl enabled, the build completes
successfully.  I attached the buildroot configuration that does not have
libopenssl enabled that resulted in a failure.  There are several custom
external options added that will need to be removed to test building.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
