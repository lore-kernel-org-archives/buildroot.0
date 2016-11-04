From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Nov 2016 23:17:49 +0100
Subject: [Buildroot] distributable Buildroot BSPs/SDKs
In-Reply-To: <d7467804-2f2f-d5a4-404c-113e4f788133@mentor.com>
References: <55a57fe4-1542-6b61-64ce-4ed10dd7d005@mentor.com>
 <d7467804-2f2f-d5a4-404c-113e4f788133@mentor.com>
Message-ID: <7a64a70c-f8ff-f15d-e7b0-c1c226df96bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Hollis,

On 04-11-16 16:36, Hollis Blanchard wrote:
> Can I force the host tools to be built static? That would avoid the rpath and
> the "recursively copy library dependencies by hand" problems.

 No you can't. You could try building with 'make HOSTCC="gcc -static"' but YMMV.

> 
> Hollis Blanchard <hollis_blanchard@mentor.com>
> Mentor Graphics Emulation Division
> 
> On 11/02/2016 10:42 AM, Hollis Blanchard wrote:
>> Can anybody point me to an example of a prebuilt Buildroot-generated SDK/BSP
>> distributed in the wild? I'm looking for something that includes binaries for
>> host executables so I can see how they did it.

 When you say SDK, I would think you mean a toolchain + some additional
libraries that can be used to build software and images outside of Buildroot.
It's not something that Buildroot really supports very well, but I've done it in
a couple of projects.

 What I do is basically two configs:

- A toolchain config that just has the toolchain, the host tools and the
libraries you want to make available. Since this is not relocatable, specify
BR2_HOST_DIR=/opt/... It does mean that while building this config, you
temporarily have to make /opt/... writeable for the building user. Example
defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3=y
BR2_HOST_DIR="/opt/buildroot-cortexa8/2.0"
BR2_KERNEL_HEADERS_3_14=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_LIBFUSE=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_HOST_ANDROID_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set


- A target config that uses the above toolchain as external toolchain, but
rebuilds the target libraries. Host tools that are needed in post-build/image
scripts don't have to be included since they can be used from the external
toolchain. Example defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV3=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/ssn-buildroot-cortexa8/2.1/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_PACKAGE_LIBFUSE=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_IPROUTE2=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=300


 You have to maintain both defconfigs and you have to provide both to the users
(though they'll normally only use the second one).


>> My users primarily care about target code. I want to both provide prebuilt
>> target binaries and let my users patch/rebuild them. That part seems to be
>> pretty clear; I can 'make && cp output/images/* prebuilt/', and also provide
>> the defconfig.
>>
>> However, I also want to provide a few host executables, and that's raising a
>> lot of questions for me:
>>
>>  1. The fact that host binaries are non-relocatable (can only be run where
>>     they were built) seems to be well-known. For now I'm content to manually
>>     run "output/host/usr/bin/patchelf --set-rpath '$ORIGIN/../lib'" in a
>>     post-processing step...

 You can also apply the series of Romain Naour that does this within Buildroot.

>>  2. I really only want to distribute a couple key host binaries, like adb and
>>     dtc. However, since these depend on other host packages,
>>     output/host/usr/bin ends up full of other binaries from gettext,
>>     autoconf/automake/etc, flex, etc. That's dead weight as far as I'm
>>     concerned; it takes up space, and encourages people to actually use them,
>>     but I don't want to support them.

 That's tough, because the host tools that you do use may inadvertently call
some of these binaries... E.g. if gdb is built with python support, then it will
call the host-python executable only when a plugin is running a python script...

>>  3. That suggests I should manually extract the things I care about from
>>     inside output/host, just like I did with the "prebuilt" directory I
>>     mentioned above for target code.

 I wouldn't do that. Use BR2_HOST_DIR and remove the things you don't want in a
post-build/image script, just like you would do for the target.

>>      1. Simplest would be to symlink, but then a "make clean" will suddenly
>>         make the host tools disappear, which would be unexpected.
>>      2. So I should copy them out, again like the "prebuilt" directory. But
>>         then I'd also need to copy out the output/host/usr/lib files they
>>         depend on (and the libs the libs depend on...). I could write a
>>         readelf-based script to find the dependencies and copy them, but
>>         that's starting to sound complicated. If only I had a tool that could
>>         build me an SDK... ;-)
>>      3. Host tools are built with options like these:
>>         --sysconfdir=/absolute/path/to/output/host/etc (so they can find
>>         output/host/etc/mke2fs.conf, for example). Huh. Readelf won't help me
>>         find those dependencies, and no rpath will help me relocate that. I'm
>>         not even sure what directory structure I would want for those files in
>>         an ideal BSP.

 Yes, that bit will never be relocatable.

>>  4. The likelihood that my users will need to rebuild host tools is slim, and
>>     they take a long time to rebuild, since they pull in dependencies like
>>     host-autoconf, host-flex, and even host-python. Again, unnecessary
>>     overhead. So should the defconfig I distribute include BR2_PACKAGE_HOST_*?
>>      1. Yes: but then users typing "make" will spend lots of time rebuilding
>>         host executables that they're extremely unlikely to change.
>>      2. No: OK, I can treat the host tools completely separately, and nobody
>>         even needs to know they came from Buildroot. But then I need to
>>         maintain two defconfigs, one that builds target code and one that
>>         builds host code.

 Why is it difficult to maintain two defconfigs?

 Regards,
 Arnout

>>
>>
>> So anyways, that's why I'm looking for examples of how others have dealt with
>> these problems.
>>
>> I'd appreciate thoughts on any of these points, even if no one person has The
>> Answers to all of them. Thanks!
>> -- 
>> Hollis Blanchard <hollis_blanchard@mentor.com>
>> Mentor Graphics Emulation Division
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
