From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sat, 5 Jan 2019 11:23:27 +0100
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <20190104175150.GD19623@scaer>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com> <20190104131250.GA19623@scaer>
 <25b04dd9-68de-9f1e-c830-fa6e86cb6d68@green-communications.fr>
 <20190104175150.GD19623@scaer>
Message-ID: <67b19a43-dad2-9d1a-469f-f3d979f5bf47@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/01/2019 18:51, Yann E. MORIN wrote:
> Nicolas, All,
> 
> On 2019-01-04 16:30 +0100, Nicolas Cavallari spake thusly:
>> On 04/01/2019 14:12, Yann E. MORIN wrote:
>>> On 2018-05-01 13:28 +0100, John Keeping spake thusly:
>>>> When rebuilding a package, simply appending the package's file list to
>>>> the global list means that the package list grows for every rebuild, as
>>>
>>> Is there a particular issue with those three files growing on rebuild?
>>
>> The problem is that not only does this makes the file list grow, it also
>> adds loads of incorrect data: when rebuilding a package that was
>> compiled early, all files modified since the package was built will be
>> included. So the list will include files that have been installed by
>> this package and all packages compiled after it. For some core packages,
>> this usually means "almost everything".
> 
> [...]>
> Still, I am not usre I understood your problem anyway, so can you
> explain in more details, and provide an easy reproducing sequence (based
> on the git master)?

make qemu_x86_defconfig
make
make ifupdown-scripts-reinstall
grep "ifupdown-scripts" output/build/packages-file-list.txt

=>
ifupdown-scripts,./bin/busybox
ifupdown-scripts,./etc/issue
ifupdown-scripts,./etc/init.d/S20urandom
ifupdown-scripts,./etc/init.d/S40network
ifupdown-scripts,./etc/init.d/rcK
ifupdown-scripts,./etc/init.d/rcS
ifupdown-scripts,./etc/shells
ifupdown-scripts,./etc/os-release
ifupdown-scripts,./etc/network/interfaces
ifupdown-scripts,./etc/network/nfs_check
ifupdown-scripts,./etc/profile
ifupdown-scripts,./etc/hostname
ifupdown-scripts,./etc/inittab
ifupdown-scripts,./sbin/ldconfig
ifupdown-scripts,./lib/ld-uClibc-1.0.31.so
ifupdown-scripts,./lib/libgcc_s.so.1
ifupdown-scripts,./lib/libuClibc-1.0.31.so
ifupdown-scripts,./lib/modules/4.16.7/modules.dep.bin
ifupdown-scripts,./lib/modules/4.16.7/modules.order
ifupdown-scripts,./lib/modules/4.16.7/modules.builtin.bin
ifupdown-scripts,./lib/modules/4.16.7/modules.dep
ifupdown-scripts,./lib/modules/4.16.7/modules.symbols.bin
ifupdown-scripts,./lib/modules/4.16.7/modules.softdep
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/jitterentropy_rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/sha256_generic.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/authencesn.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/drbg.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/hmac.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/crypto_engine.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/echainiv.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/crypto/authenc.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/geode-rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/amd-rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/virtio-rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/intel-rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/via-rng.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/char/hw_random/rng-core.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/crypto/virtio/virtio_crypto.ko
ifupdown-scripts,./lib/modules/4.16.7/kernel/drivers/thermal/x86_pkg_temp_thermal.ko
ifupdown-scripts,./lib/modules/4.16.7/modules.builtin
ifupdown-scripts,./lib/modules/4.16.7/modules.symbols
ifupdown-scripts,./lib/modules/4.16.7/modules.alias.bin
ifupdown-scripts,./lib/modules/4.16.7/modules.alias
ifupdown-scripts,./lib/modules/4.16.7/modules.devname
ifupdown-scripts,./lib/libatomic.so.1.2.0
ifupdown-scripts,./THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
ifupdown-scripts,./usr/bin/getconf
ifupdown-scripts,./usr/bin/ldd
ifupdown-scripts,./usr/lib/os-release
ifupdown-scripts,./usr/lib32
ifupdown-scripts,./lib32

Which is almost the whole system.

Now why is that ? The answer is here:

find . \( -type f -o -type l \) \
          -newer $($(PKG)_DIR)/.stamp_built \
          -exec printf '$(1),%s\n' {} + \
          >> $(BUILD_DIR)/packages-file-list$(3).txt

Since .stamp_built has not been modified since the first time the
package was built, this will list all files that have been installed
after ifupdown-scripts was built.

With a bigger system, the list of files can be much larger. And without
this patch, the list would grow by maybe the size of the whole system
each time an early package is reinstalled.

>>> Compared to the rest of the build tree, those three files have very
>>> small sizes in fact, and if they eventually end up big enough to be a
>>> substantial part of the build tree, it's most probably time for a clean
>>> build from scratch anyway, no?
>>
>> Having a big list would not a problem if nobody used the content of this
>> file, but some tools scans it and use it to check files. After many
>> recompiling, I remember having problems with one tool taking a
>> considerable amount of time for each build because of all the duplicates
>> in the list. But i don't remember which tool it was.
> 
> Are you talking about a tool in Buildroot? Can you try to provide more
> details, please? Are you still able to reproduce the slowness on the
> current git master?
> 
> The only two tools that make use of the packages-file-list.txt are
> check-uniq-files (which actually checks that files are not installed by
> two or more packages), and support/scripts/size-stats, which graphs a
> pie-chart representing the size contribution of each package to the
> content of target/. The former is always run at the end of the build, in
> the target-finalize step, while the latter is only run on-demand.

I don't remember which tool it was, but it was probably check-bin-arch.

It will scan the package file list and call readelf on all files. If the
package file list has duplicates, then readelf will be called multiple
times on the same files.  And it is also run at make $pkg-reinstall
times, which fits my memory of make $pkg-reinstall being slower over time.

> And in any case, if the list becomes *so big* that reading it takes an
> insane amount of time, then probably your host/ staging/ and target/
> directories are in a state that is so far from being clean that you
> probably should condider a rebuild from scratch at that point.

reinstalling a non-library package should not make the build unworkable.

In anyway, having check-bin-arch take 15s, 60s or minutes for nothing
will still be faster than rebuilding from scratch.
