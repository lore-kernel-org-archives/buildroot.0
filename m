From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jan 2021 07:45:56 +0000
Subject: [Buildroot] [Bug 13461] New: patchelf tool crashes with
 'std::out_of_range' exception,
 but is probably failing to work in all cases when --make-rpath-relative
 isn't a canonical path
Message-ID: <bug-13461-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13461

            Bug ID: 13461
           Summary: patchelf tool crashes with 'std::out_of_range'
                    exception, but is probably failing to work in all
                    cases when --make-rpath-relative isn't a canonical
                    path
           Product: buildroot
           Version: 2020.08.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: andyg1001 at hotmail.co.uk
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

Building buildroot image causes a number of failures with the patchelf tool,
for example from the output log:

>>>   Sanitizing RPATH in target tree
PER_PACKAGE_DIR=/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/per-package
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath
target
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 27743 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/libexec/lzo/examples/lzopack'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 27750 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/libexec/lzo/examples/lzotest'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 27766 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/libexec/lzo/examples/simple'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 28047 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/lib/libturbojpeg.so.0.2.0'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 28081 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/lib/libjpeg.so.8.2.2'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 28096 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/lib/libhistory.so.8.0'
terminate called after throwing an instance of 'std::out_of_range'
  what():  basic_string::substr: __pos (which is 72) > this->size() (which is
49)
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/support/scripts/fix-rpath:
line 61: 28118 Aborted                 ${PATCHELF} --make-rpath-relative
"${rootdir}" ${sanitize_extra_args[@]} "${file}"
FAILED:
/media/SSD/Toolchains/my-toolchain/build/buildroot-2020.08/host/bin/patchelf
--make-rpath-relative
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target'
--no-standard-lib-dirs
'/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr/lib/libreadline.so.8.0'
touch
/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target/usr


I have managed to track down the error to a change brought in by the patch
0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch.

Please see
https://git.busybox.net/buildroot/tree/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch#n257,
at line 257.

At this point canonicalPath is
"/media/SSD/Toolchains/my-toolchain/target/usr/lib" but rootDir is longer:
"/media/SSD/Toolchains/my-toolchain/source/buildroot-2020.08/../../target",
hence the exception.

It seems that the tool is missing the ability to resolve the "../" components
of the rootDir path to make it canonical and I would guess that therefore the
tool cannot be working in any case since the paths inside the target executable
will never match the passed-in rootDir...

Cheers,
Andy

-- 
You are receiving this mail because:
You are on the CC list for the bug.
