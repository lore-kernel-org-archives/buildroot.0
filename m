From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 05:38:17 +0000
Subject: [Buildroot] [Bug 10276] New: BR2_PACKAGE_LINUX_TOOLS_GPIO fails for
 MIPS with "gpio-hammer.o: ABI is incompatible with that of the selected
 emulation"
Message-ID: <bug-10276-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10276

            Bug ID: 10276
           Summary: BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS with
                    "gpio-hammer.o: ABI is incompatible with that of the
                    selected emulation"
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Ubuntu 16.04 host:

```
git checkout bc4f5598dccc191a1e2c6268fdcef1935e2fa212
make qemu_mips64r6_malta_defconfig
echo '
BR2_PACKAGE_LINUX_TOOLS=y
BR2_PACKAGE_LINUX_TOOLS_GPIO=y
' >> .config
env -u LD_LIBRARY_PATH time make BR2_JLEVEL=14
```

error log:

  DESCEND  gpio
mkdir -p include/linux 2>&1 || true
ln -sf
/data/git/buildroot/output/build/linux-4.11.3/tools/gpio/../../include/uapi/linux/gpio.h
include/linux/gpio.h
  CC       gpio-event-mon.o
  CC       gpio-hammer.o
  CC       lsgpio.o
  CC       gpio-utils.o
  CC       gpio-utils.o
  CC       gpio-utils.o
  LD       gpio-event-mon-in.o
gpio-utils.o: file not recognized: File truncated
/data/git/buildroot/output/build/linux-4.11.3/tools/build/Makefile.build:149:
recipe for target 'gpio-event-mon-in.o' failed
make[4]: *** [gpio-event-mon-in.o] Error 1
Makefile:58: recipe for target 'gpio-event-mon-in.o' failed
make[3]: *** [gpio-event-mon-in.o] Error 2
make[3]: *** Waiting for unfinished jobs....
  LD       gpio-hammer-in.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld:
gpio-hammer.o: ABI is incompatible with that of the selected emulation
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: failed to
merge target specific data of file gpio-hammer.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld:
gpio-utils.o: ABI is incompatible with that of the selected emulation
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: failed to
merge target specific data of file gpio-utils.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: Attempt
to do relocatable link with elf64-tradbigmips input and elf32-ntradbigmips
output
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld:
gpio-hammer.o: file class ELFCLASS64 incompatible with ELFCLASS32
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: final
link failed: File in wrong format
/data/git/buildroot/output/build/linux-4.11.3/tools/build/Makefile.build:149:
recipe for target 'gpio-hammer-in.o' failed
make[4]: *** [gpio-hammer-in.o] Error 1
Makefile:49: recipe for target 'gpio-hammer-in.o' failed
make[3]: *** [gpio-hammer-in.o] Error 2
  LD       lsgpio-in.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: lsgpio.o:
ABI is incompatible with that of the selected emulation
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: failed to
merge target specific data of file lsgpio.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld:
gpio-utils.o: ABI is incompatible with that of the selected emulation
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: failed to
merge target specific data of file gpio-utils.o
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: Attempt
to do relocatable link with elf64-tradbigmips input and elf32-ntradbigmips
output
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: lsgpio.o:
file class ELFCLASS64 incompatible with ELFCLASS32
/data/git/buildroot/output/host/bin/mips64-buildroot-linux-uclibc-ld: final
link failed: File in wrong format
/data/git/buildroot/output/build/linux-4.11.3/tools/build/Makefile.build:149:
recipe for target 'lsgpio-in.o' failed
make[4]: *** [lsgpio-in.o] Error 1
Makefile:40: recipe for target 'lsgpio-in.o' failed
make[3]: *** [lsgpio-in.o] Error 2
Makefile:61: recipe for target 'gpio' failed
make[2]: *** [gpio] Error 2
package/pkg-generic.mk:227: recipe for target
'/data/git/buildroot/output/build/linux-tools/.stamp_built' failed
make[1]: *** [/data/git/buildroot/output/build/linux-tools/.stamp_built] Error
2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
