From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 29 Nov 2016 09:02:33 -0800
Subject: [Buildroot] distributable Buildroot BSPs/SDKs
In-Reply-To: <7a64a70c-f8ff-f15d-e7b0-c1c226df96bd@mind.be>
References: <55a57fe4-1542-6b61-64ce-4ed10dd7d005@mentor.com>
 <d7467804-2f2f-d5a4-404c-113e4f788133@mentor.com>
 <7a64a70c-f8ff-f15d-e7b0-c1c226df96bd@mind.be>
Message-ID: <4d2a06e9-d9a8-ff6b-ffa6-1b2b58dadb0b@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/2016 03:17 PM, Arnout Vandecappelle wrote:
>> On 11/02/2016 10:42 AM, Hollis Blanchard wrote:
>>> Can anybody point me to an example of a prebuilt Buildroot-generated SDK/BSP
>>> distributed in the wild? I'm looking for something that includes binaries for
>>> host executables so I can see how they did it.
>   When you say SDK, I would think you mean a toolchain + some additional
> libraries that can be used to build software and images outside of Buildroot.
> It's not something that Buildroot really supports very well, but I've done it in
> a couple of projects.
>
>   What I do is basically two configs:
>
> - A toolchain config that just has the toolchain, the host tools and the
> libraries you want to make available. Since this is not relocatable, specify
> BR2_HOST_DIR=/opt/... It does mean that while building this config, you
> temporarily have to make /opt/... writeable for the building user. Example
> defconfig:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_ARM_FPU_VFPV3=y
> BR2_HOST_DIR="/opt/buildroot-cortexa8/2.0"
> BR2_KERNEL_HEADERS_3_14=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_PACKAGE_LIBFUSE=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_HOST_ANDROID_TOOLS=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
>
> - A target config that uses the above toolchain as external toolchain, but
> rebuilds the target libraries. Host tools that are needed in post-build/image
> scripts don't have to be included since they can be used from the external
> toolchain. Example defconfig:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_ARM_FPU_VFPV3=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/ssn-buildroot-cortexa8/2.1/usr"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
> BR2_PACKAGE_LIBFUSE=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_IPROUTE2=y
> BR2_TARGET_ROOTFS_UBIFS=y
> BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
> BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=300
>
>
>   You have to maintain both defconfigs and you have to provide both to the users
> (though they'll normally only use the second one).

OK, two defconfigs isn't a problem.


Non-relocatable is a problem though. Many (most?) of our users don't 
have root permission to the shared lab systems they're using, so must 
install into unusual directories.

>>>   2. I really only want to distribute a couple key host binaries, like adb and
>>>      dtc. However, since these depend on other host packages,
>>>      output/host/usr/bin ends up full of other binaries from gettext,
>>>      autoconf/automake/etc, flex, etc. That's dead weight as far as I'm
>>>      concerned; it takes up space, and encourages people to actually use them,
>>>      but I don't want to support them.
>   That's tough, because the host tools that you do use may inadvertently call
> some of these binaries... E.g. if gdb is built with python support, then it will
> call the host-python executable only when a plugin is running a python script...

That means the building user needs to know the details of each tool they 
build, to know what its real runtime dependencies will be. Of course, in 
an ideal world, the word "user" in that statement would be replaced by 
the word "recipe", which is a more appropriate location for that 
knowledge. :-)

>       3. Host tools are built with options like these:
>          --sysconfdir=/absolute/path/to/output/host/etc (so they can find
>          output/host/etc/mke2fs.conf, for example). Huh. Readelf won't help me
>          find those dependencies, and no rpath will help me relocate that. I'm
>          not even sure what directory structure I would want for those files in
>          an ideal BSP.

It looks like Poky (OpenEmbedded?) recipes install wrapper shell scripts 
into the host directory, as seen in create_wrapper() 
<https://github.com/kraj/poky/blob/master/meta/classes/utils.bbclass#L275>. 
Then a relocation script can edit the wrappers. In the case of mke2fs, I 
guess that wrapper might look like this:

    #!/bin/bash
    realpath=`readlink -fn $0`
    export MKE2FS_CONFIG=@SDK_BASE_DIRECTORY@/etc/mk
    exec -a `dirname $realpath`/$cmdname `dirname $realpath`/$cmdname.real "$@"


-- 
Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161129/583c19e9/attachment.html>
