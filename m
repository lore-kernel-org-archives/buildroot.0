From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Jan 2019 21:34:04 +0100
Subject: [Buildroot] [PATCH 00/19] support: limit install-time
 instrumentation to current package's files (branch yem/files-list-2)
In-Reply-To: <20190109181001.GL4022@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWsWTntZdve0sGs8HDJSS9=RKeupaYTYO2TuG3oEHdf+A@mail.gmail.com>
 <CAAXf6LXj1_YNqd4N9Jr=ygi2YgN3fYYCEjkhzD=xaH5Lco6Pqg@mail.gmail.com>
 <20190108213037.GI4022@scaer>
 <CAAXf6LUZ6OouT40zROoSZ6h-ws2u4b8zY0+OwQmyvUgT9Kz9HQ@mail.gmail.com>
 <20190109181001.GL4022@scaer>
Message-ID: <CAAXf6LX4QgRPkYMyi4UeM7fQBK=kGG4mdfWcfyH5EYyvV0+_VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 9 ene. 2019 a las 19:10, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-01-09 14:39 +0100, Thomas De Schampheleire spake thusly:
> > El mar., 8 ene. 2019 a las 22:30, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> [--SNIP--]
> > > But for a more generic solution, we'd need a way to detect files that
> > > were not previously present but now are.
> > >
> > > So we'd need to maintain a list of files from before the installation
> > > and another for after the installation. And oh wait, isn't that
> > > basically what we previously did (modulo the md5)? ;-)
> >
> > Without md5sum, there is only a find before and after each package
> > installation, which shouldn't take long.
> >
> > The md5 is only necessary if you care about changing existing files.
> > And normally, if you change existing files, their timestamp will be
> > updated, so your solution with '-newer-than foo_before' should be
> > fine. Only when you change files and still keep their old timestamps,
> > would something be missed.
> >
> > So, a possible solution could be a combination of the original 'find
> > before+after' solution and your new 'newer-than foo_before' solution.
> > Am I talking gibberish?
>
> Now that I slept on it, detecting and fixing this problem appropriately
> is impossible, unless we re-instate the leading md5sum as well.
>
> If you allow for a package to install a file in the past, how do you
> know that the file indeed did not previously exist?
>
> That is, if the file did not previously exist, then comparing the list
> before/after would indeed detect it. However, if the file did previously
> exist, then your package would overwrite it *and* set it in the past,
> and then comparing the list before/after would not detect it.
>
> And in either case, our find -newer would not detect it either.
>
> So, the only way to properly account for this situation would be, guess
> what, to reinstate an md5sum before and after the installation and
> compare them file by file.
>
> However, as we've seen, this is totally unacceptable.
>
> So, I hereby declare that I think that I believe that in my opinion I
> can only think that a package which installs a file in the past is
> broken (or borked, as you may prefer). ;-)

I have hacked my buildroot repo to use the old (find+md5sum) and
mtime-based solutions to get the list of installed files, and compare
them for each package. While I need to run this test on more
defconfigs to get a full picture, I already have following feedback:

- some packages use 'cp -dpf' to install files, where '-p' means
preserve (among other things) timestamp. Examples are dmalloc and
libfuse. In both cases the cp command is in the .mk file, not in the
package sources itself.

- for emlog, in my testrun, 'nbcat' was _not_ included in the list
based on mtime while it was installed. Inspection with 'ls -l
--full-time' revealed that nbcat had the exact same timestamp as the
_before file, meaning that 'find -newer' did not consider it a match.
We would actually need to allow the same timestamp as well, or make
sure that there is at least some time between the creation of the
_before target and the actual installs (usleep 1 or similar). The
first option has the theoretical problem than on an sufficiently fast
machine, you could match files of the previous package if they also
get the same timestamp as _before (e.g. no compilation just copying of
files).
I had the same situation with 'mtd':

-rw-r--r-- 1 tdescham tdescham      0 2019-01-10 20:28:13.376158950
+0100 output/build/mtd-2.0.1/.stamp_target_installed_before
-rwxr-xr-x 1 tdescham tdescham 115436 2019-01-10 20:28:13.376158950
+0100 output/target/usr/sbin/flashcp*
-rwxr-xr-x 1 tdescham tdescham 149696 2019-01-10 20:28:13.376158950
+0100 output/target/usr/sbin/flash_erase*
-rwxr-xr-x 1 tdescham tdescham  80912 2019-01-10 20:28:13.377158950
+0100 output/target/usr/sbin/flash_lock*
-rwxr-xr-x 1 tdescham tdescham  80896 2019-01-10 20:28:13.377158950
+0100 output/target/usr/sbin/flash_unlock*

Here flashcp and flash_erase have the same timestamp as the stamp
file, and flash_lock and flash_unlock are indeed newer. The latter two
are in the mtime-based list, the former two not.

- unionfs is a pure cmake package, but installs files in the future:

-rw-r--r-- 1 tdescham tdescham     0 2019-01-10 20:29:10.720156598
+0100 output/build/unionfs-2.0/.stamp_target_installed_before
-rwxr-xr-x 1 tdescham tdescham 75968 2019-01-10 20:29:08.000000000
+0100 output/target/usr/bin/unionfsctl*

Note that as far as I could trace, the install of this file is carried
out by cmake itself, not via an external command like 'cp' or
'install'. At least, in 'strace' I could not see any call, just an
open, read/write, close.


So, many borked packages :-)

Regardless if we can find a solution to the issues we encounter, the
fact that we do not notice _that_ there is an issue concerns me. I
think we have to implement such detection into Buildroot itself to
avoid accidents.


For reference, here is the hacked code I was using for this detection.
This is based on 2018.02.x with reverted instrumentation code still
based on find+md5sum:

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -90,8 +90,14 @@ define step_pkg_size_end
     comm -13 $($(PKG)_DIR)/.br_filelist_before
$($(PKG)_DIR)/.br_filelist_after | \
         while read hash file ; do \
             echo "$(1),$${file}" ; \
-        done >> $(BUILD_DIR)/packages-file-list$(3).txt
+        done | sort > $(BUILD_DIR)/.list-$(1)-orig
     rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
+    ( cd $(2); find . \( -type f -o -type l -o -type d \) \
+        -newer $@_before \
+        -exec printf '$(1),%s\n' {} + \
+        |sort > $(BUILD_DIR)/.list-$(1)-new \
+    )
+        diff -u $(BUILD_DIR)/.list-$(1)-orig
$(BUILD_DIR)/.list-$(1)-new > $(BUILD_DIR)/.diff-list-$(1) || true
 endef

 define step_pkg_size
@@ -324,6 +330,7 @@ endif
 $(BUILD_DIR)/%/.stamp_target_installed:
     @$(call step_start,install-target)
     @$(call MESSAGE,"Installing to target")
+    $(Q)touch $@_before
     $(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
     +$($(PKG)_INSTALL_TARGET_CMDS)
     $(if $(BR2_INIT_SYSTEMD),\


Best regards,
Thomas
