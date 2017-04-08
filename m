From: Dustin Johnson <dustin.r.johnson@gmail.com>
Date: Fri, 7 Apr 2017 23:04:43 -0400
Subject: [Buildroot] [PATCH 1/1] mono: remove copy of host etc files on
	install
In-Reply-To: <CA+TH9VnNgxSvsUiSTPUstqpa3uuEbKbMxR+OfK1xMEdDqq3Z0w@mail.gmail.com>
References: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
 <20170318153923.56903d45@free-electrons.com>
 <CABAk6Mp6C8v=JFiQAnRJPc+NYDoLaRrx7L5YrakC9wJfQbzMFQ@mail.gmail.com>
 <CA+TH9VnNgxSvsUiSTPUstqpa3uuEbKbMxR+OfK1xMEdDqq3Z0w@mail.gmail.com>
Message-ID: <CABAk6MqZAMCDiwPm1MNJn-XnptG7iXUXQJLh91ddya-cN4yAvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is a simple defconfig for the specific board I am using with a fresh
checkout from latest Git:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_VFPV3=y
BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic
imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_MONO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="SPL"
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

And here is what I get from the differences between Staging and Target

$ diff -u output/target/etc/mono/ output/staging/etc/mono/
Common subdirectories: output/target/etc/mono/2.0 and
output/staging/etc/mono/2.0
Common subdirectories: output/target/etc/mono/4.0 and
output/staging/etc/mono/4.0
Common subdirectories: output/target/etc/mono/4.5 and
output/staging/etc/mono/4.5
diff -u output/target/etc/mono/config output/staging/etc/mono/config
--- output/target/etc/mono/config       2017-04-08 01:46:12.883008999 +0000
+++ output/staging/etc/mono/config      2017-04-08 01:57:03.535008999 +0000
@@ -1,9 +1,9 @@
 <configuration>
-       <dllmap dll="i:cygwin1.dll" target="libc.so.6" os="!windows" />
-       <dllmap dll="libc" target="libc.so.6" os="!windows"/>
+       <dllmap dll="i:cygwin1.dll" target="libc.so.0" os="!windows" />
+       <dllmap dll="libc" target="libc.so.0" os="!windows"/>
        <dllmap dll="intl" target="libc.so.6" os="!windows"/>
-       <dllmap dll="intl" name="bind_textdomain_codeset"
target="libc.so.6" os="solaris"/>
-       <dllmap dll="libintl" name="bind_textdomain_codeset"
target="libc.so.6" os="solaris"/>
+       <dllmap dll="intl" name="bind_textdomain_codeset"
target="libc.so.0" os="solaris"/>
+       <dllmap dll="libintl" name="bind_textdomain_codeset"
target="libc.so.0" os="solaris"/>
        <dllmap dll="libintl" target="libc.so.6" os="!windows"/>
        <dllmap dll="i:libxslt.dll" target="libxslt.so" os="!windows"/>
        <dllmap dll="i:odbc32.dll" target="libodbc.so" os="!windows"/>
@@ -11,11 +11,11 @@
        <dllmap dll="oci" target="libclntsh.so" os="!windows"/>
        <dllmap dll="db2cli" target="libdb2_36.so" os="!windows"/>
        <dllmap dll="MonoPosixHelper"
target="$mono_libdir/libMonoPosixHelper.so" os="!windows" />
-       <dllmap dll="i:msvcrt" target="libc.so.6" os="!windows"/>
-       <dllmap dll="i:msvcrt.dll" target="libc.so.6" os="!windows"/>
+       <dllmap dll="i:msvcrt" target="libc.so.0" os="!windows"/>
+       <dllmap dll="i:msvcrt.dll" target="libc.so.0" os="!windows"/>
        <dllmap dll="sqlite" target="libsqlite.so.0" os="!windows"/>
        <dllmap dll="sqlite3" target="libsqlite3.so.0" os="!windows"/>
-       <dllmap dll="libX11" target="libX11.so.6" os="!windows" />
+       <dllmap dll="libX11" target="libX11.so" os="!windows" />
        <dllmap dll="libgdk-x11-2.0" target="libgdk-x11-2.0.so.0"
os="!windows"/>
        <dllmap dll="libgtk-x11-2.0" target="libgtk-x11-2.0.so.0"
os="!windows"/>
        <dllmap dll="libXinerama" target="libXinerama.so.1" os="!windows" />
Only in output/target/etc/mono/: mconfig



On Thu, Apr 6, 2017 at 1:08 PM, Angelo Compagnucci <
angelo.compagnucci@gmail.com> wrote:

> Dusty,
>
> 2017-03-19 17:17 GMT+01:00 Dusty <dustin.r.johnson@gmail.com>:
>
>> Angelo,
>>
>> Below is the diff between staging and host. I am using a Ubuntu VM to
>> compile for an ARM target with uCLibc.
>> The appropriate .so files (libc.so.0) are referenced in the config file
>> in the staging directory but not in the host.
>> The patch I referenced in my commit is:
>>   * package/mono/0002-Adjust-libc.so-path-depending-on-C-library
>> -being-use.patch
>> This patch addresses the proper generation of the /etc/mono/config file
>> in the staging directory, I believe.
>>
>> Thanks!
>>
>
> Could you send me a minimal example that exibits the problem?!
>
> Thanks!
>
>
>>
>> Dusty
>>
>>
>> diff -u output/host/etc/mono/ output/staging/etc/mono/
>> Common subdirectories: output/host/etc/mono/2.0 and
>> output/staging/etc/mono/2.0
>> Common subdirectories: output/host/etc/mono/4.0 and
>> output/staging/etc/mono/4.0
>> Common subdirectories: output/host/etc/mono/4.5 and
>> output/staging/etc/mono/4.5
>> diff -u output/host/etc/mono/config output/staging/etc/mono/config
>> --- output/host/etc/mono/config 2017-03-12 22:53:07.450555843 +0000
>> +++ output/staging/etc/mono/config      2017-03-15 02:31:40.272008856
>> +0000
>> @@ -1,9 +1,9 @@
>>  <configuration>
>> -       <dllmap dll="i:cygwin1.dll" target="libc.so.6" os="!windows" />
>> -       <dllmap dll="libc" target="libc.so.6" os="!windows"/>
>> +       <dllmap dll="i:cygwin1.dll" target="libc.so.0" os="!windows" />
>> +       <dllmap dll="libc" target="libc.so.0" os="!windows"/>
>>         <dllmap dll="intl" target="libc.so.6" os="!windows"/>
>> -       <dllmap dll="intl" name="bind_textdomain_codeset"
>> target="libc.so.6" os="solaris"/>
>> -       <dllmap dll="libintl" name="bind_textdomain_codeset"
>> target="libc.so.6" os="solaris"/>
>> +       <dllmap dll="intl" name="bind_textdomain_codeset"
>> target="libc.so.0" os="solaris"/>
>> +       <dllmap dll="libintl" name="bind_textdomain_codeset"
>> target="libc.so.0" os="solaris"/>
>>         <dllmap dll="libintl" target="libc.so.6" os="!windows"/>
>>         <dllmap dll="i:libxslt.dll" target="libxslt.so" os="!windows"/>
>>         <dllmap dll="i:odbc32.dll" target="libodbc.so" os="!windows"/>
>> @@ -11,11 +11,11 @@
>>         <dllmap dll="oci" target="libclntsh.so" os="!windows"/>
>>         <dllmap dll="db2cli" target="libdb2_36.so" os="!windows"/>
>>         <dllmap dll="MonoPosixHelper" target="$mono_libdir/libMonoPosixHelper.so"
>> os="!windows" />
>> -       <dllmap dll="i:msvcrt" target="libc.so.6" os="!windows"/>
>> -       <dllmap dll="i:msvcrt.dll" target="libc.so.6" os="!windows"/>
>> +       <dllmap dll="i:msvcrt" target="libc.so.0" os="!windows"/>
>> +       <dllmap dll="i:msvcrt.dll" target="libc.so.0" os="!windows"/>
>>         <dllmap dll="sqlite" target="libsqlite.so.0" os="!windows"/>
>>         <dllmap dll="sqlite3" target="libsqlite3.so.0" os="!windows"/>
>> -       <dllmap dll="libX11" target="libX11.so.6" os="!windows" />
>> +       <dllmap dll="libX11" target="libX11.so" os="!windows" />
>>         <dllmap dll="libgdk-x11-2.0" target="libgdk-x11-2.0.so.0"
>> os="!windows"/>
>>         <dllmap dll="libgtk-x11-2.0" target="libgtk-x11-2.0.so.0"
>> os="!windows"/>
>>         <dllmap dll="libXinerama" target="libXinerama.so.1" os="!windows"
>> />
>> Only in output/host/etc/mono/: mconfig
>>
>>
>> On Sat, Mar 18, 2017 at 10:39 AM, Thomas Petazzoni <
>> thomas.petazzoni at free-electrons.com> wrote:
>>
>>> Hello,
>>>
>>> Angelo, could you comment on this patch touching the Mono package?
>>>
>>> Copying $(HOST_DIR)/etc/mono to $(TARGET_DIR)/etc has been there since
>>> you contributed the package, but apparently causes some issues. It
>>> would be nice if you could have a look at the patch proposed by Dustin.
>>>
>>> Thanks a lot!
>>>
>>> Thomas
>>>
>>> On Tue, 14 Mar 2017 22:24:58 -0400, Dustin Johnson wrote:
>>> > When the mono package is installed, the autotools installer installs
>>> > the /etc/mono files to the target. A post_install hook then copies
>>> > over the mono libraries to the target as well as the host /etc/mono
>>> > files which overrides the target files. The target specific mono
>>> > configuration file (/etc/mono/config) is overridden with the host
>>> > settings. This causes mono on the target to be unable to locate target
>>> > specific .so files as it overrides the changes enacted by the patches
>>> > for the package.
>>> >
>>> > Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
>>> > ---
>>> >  package/mono/mono.mk | 1 -
>>> >  1 file changed, 1 deletion(-)
>>> >
>>> > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
>>> > index 20b920568..4996b7c60 100644
>>> > --- a/package/mono/mono.mk
>>> > +++ b/package/mono/mono.mk
>>> > @@ -31,7 +31,6 @@ MONO_CONF_OPTS = --disable-gtk-doc \
>>> >  define MONO_INSTALL_LIBS
>>> >       rsync -av --exclude=*.so --exclude=*.mdb \
>>> >               $(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
>>> > -     rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
>>> >  endef
>>> >
>>> >  MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
>>>
>>>
>>>
>>> --
>>> Thomas Petazzoni, CTO, Free Electrons
>>> Embedded Linux and Kernel engineering
>>> http://free-electrons.com
>>>
>>
>>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/ff1a6dc5/attachment.html>
