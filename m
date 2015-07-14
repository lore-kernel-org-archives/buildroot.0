From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Jul 2015 10:09:59 +0200
Subject: [Buildroot] [PATCHv3 for next 2/2] toolchain: create symlink to
 'lib' from ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <55A3EDEA.7040308@mind.be>
References: <1424259375-20288-1-git-send-email-patrickdepinguin@gmail.com>
 <1424259375-20288-3-git-send-email-patrickdepinguin@gmail.com>
 <55A3EDEA.7040308@mind.be>
Message-ID: <CAAXf6LX_draMhkTRq5zdykPO1pRy6wu4tB744cJrUf7agO45_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2015 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Thomas,
>
>  Sorry that it is taking so long to make progress on this, but the external
> toolchain stuff is, as you know, horribly demotivating... We've spent quite a
> bit of time to understand what this patch does and how it could be done better...
>
> On 02/18/15 12:36, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> Currently, following symbolic links are created in both target and
>> staging directories:
>> - lib(32|64) --> lib
>> - usr/lib(32|64) --> lib
>>
>> The decision for lib32 or lib64 is based on the target architecture
>> configuration in buildroot (BR2_ARCH_IS_64).
>>
>> In at least one case this is not correct: when building for a Cavium Octeon
>> III processor using the toolchain from the Cavium Networks SDK, and
>> specifying -march=octeon3 in BR2_TARGET_OPTIMIZATION, libraries are expected
>> in directory 'lib32-fp' rather than 'lib32' (likewise for lib64-fp).
>>
>> More generally, for external toolchains, the correct symbolic link is
>> from (usr/)${ARCH_LIB_DIR} to lib. For internal toolchains, current
>> toolchains always use either lib32 or lib64.
>>
>> Fix the problem as follows:
>> - create symlink creation helpers in toolchain/helpers.mk
>> - for external toolchains, call these helpers based on ARCH_LIB_DIR
>> - for internal toolchains, call these helpers based on the existing
>>   fixed lib32/lib64 logic, moved from Makefile
>> - to fix build order problems, add the correct dependency on
>>   $(BUILD_DIR) from $(BUILD_DIR)/.root
>
>  It's not clear to us which build order problems are solved by this, and
> especially how these build order problems are introduced by this patch... Could
> you explain that a little?

If you use this patch but revert the order-only dependency of .root on
$(BUILD_DIR), then attempt building an internal toolchain using 'make
clean toolchain', output is:

rm -rf /repo/tdescham/reborn/buildroot-git/output/target
/repo/tdescham/reborn/buildroot-git/output/images
/repo/tdescham/reborn/buildroot-git/output/host \
                /repo/tdescham/reborn/buildroot-git/output/build
/repo/tdescham/reborn/buildroot-git/output/staging \
                /repo/tdescham/reborn/buildroot-git/output/legal-info
/repo/tdescham/reborn/buildroot-git/output/graphs
mkdir -p /repo/tdescham/reborn/buildroot-git/output/target
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS \
                --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
                /repo/tdescham/reborn/buildroot-git/system/skeleton/
/repo/tdescham/reborn/buildroot-git/output/target/
/usr/bin/install -m 0644 support/misc/target-dir-warning.txt
/repo/tdescham/reborn/buildroot-git/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
touch /repo/tdescham/reborn/buildroot-git/output/build/.root
touch: cannot touch
`/repo/tdescham/reborn/buildroot-git/output/build/.root': No such file
or directory
make: *** [/repo/tdescham/reborn/buildroot-git/output/build/.root] Error 1


For external toolchains there is no issue.
It is caused by the fact that the patch adds a dependency on
$(TARGET_DIR) to host-gcc-final via create-lib-symlinks, and
$(TARGET_DIR) has a dependency on $(BUILD_DIR)/.root (see Makefile).

If the host-gcc-final change is fixed in another way (I have to check)
this may not be needed after all. However, technically I think the
expression of the dependency is correct: $(BUILD_DIR)/.root indeed
needs BUILD_DIR first. Alternatively you could add a dependency on
'dirs' somewhere.

/Thomas
