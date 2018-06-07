From: davidb <davidb@230ruedubac.fr>
Date: Thu, 07 Jun 2018 14:43:46 +0200
Subject: [Buildroot] [PATCH] toolchain: GCC bug 85862
In-Reply-To: <CANQCQpazxbnb4dcvtPdoXCLL5enKTKucDhPeG50Dhho9c6Xuvg@mail.gmail.com>
References: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180522230033.0daffecb@windsurf>
 <21765fd8-362a-0534-69d9-4a2b9d197121@gmail.com>
 <CANQCQpbT7m4H6gFjPg5BNssOzUqHsBQRnNpDhH_y5t3-x-gS0g@mail.gmail.com>
 <e1330fb2-8262-d2c9-433d-d3d22b574f72@gmail.com>
 <CANQCQpazxbnb4dcvtPdoXCLL5enKTKucDhPeG50Dhho9c6Xuvg@mail.gmail.com>
Message-ID: <647b5badffcc071f204e324a62cfc8dc@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Regarding the commit id bd03966d4ebeb284ac3afb5f3b8cba13da2b9983 that 
disables qt5webengine when the bug 85862 can be triggered on microblaze 
arch, I can't enable qt5webengine when selecting QT5 Latest version 
(5.10) and x86_64 arch.

I think the test about the bug should be inverted:

diff --git a/package/qt5/qt5webengine/Config.in 
b/package/qt5/qt5webengine/Config.in
index 38486c6dcf..744d659567 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5WEBENGINE
         depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
         depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
-       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || 
BR2_PACKAGE_QT5_VERSION_5_6 # libnss
+       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || 
BR2_PACKAGE_QT5_VERSION_5_6 # libnss
         depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, 
qt5base-dbus
         depends on BR2_USE_WCHAR # libglib2
         depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, 
qt5base-eglfs

David.

Le 23/05/2018 23:55, Matthew Weber a ?crit?:
> All,
> 
> On Wed, May 23, 2018 at 4:08 PM, Romain Naour <romain.naour@gmail.com> 
> wrote:
>> Hi Matt,
>> 
>> Le 23/05/2018 ? 22:57, Matthew Weber a ?crit :
>>> Romain,
>>> 
>>> On Wed, May 23, 2018 at 3:38 PM, Romain Naour 
>>> <romain.naour@gmail.com> wrote:
>>>> 
>>>> Hi Thomas,
>>>> 
>>>> Le 22/05/2018 ? 23:00, Thomas Petazzoni a ?crit :
>>>>> Hello,
>>>>> 
>>>>> On Mon, 21 May 2018 15:29:42 -0500, Matt Weber wrote:
>>>>>> GCC < 7.x hangs while building libnss for the Microblaze Arch.
>>>>>> 
>>>>>> Discovered by
>>>>>> http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df
>>>>>> 
>>>>>> Reported:
>>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
>>>> 
>>>> This bug has been marked as a duclicate of the bug I identified.
>>>> 
>>>>>> 
>>>>>> Simlar to:
>>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=49218
>>>>>> 
>>>>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>>>> 
>>>>> Beyond the libnss issue, we do have at least three other Microblaze 
>>>>> timeouts. However, I think Romain Naour had identified a different 
>>>>> issue for those:
>>>>> 
>>>>> http://autobuild.buildroot.net/?status=TIMEOUT&arch=microblazeel
>>>>> 
>>>>> Affected packages: flare-engine, boost, gst-ffmpeg.
>>>> 
>>>> We can mark these packages affected by bug 85852 or 85180.
>>>> 
>>> 
>>> Any proposed ways to impl other then adding another 
>>> BR2_TOOLCHAIN_HAS_GCC_BUG_*
>> 
>> We can add an autobuilder exception to reject configs building these 
>> packages
>> with a microblaze toolchain.
> 
> True as we don't have GCC8 support so we can't use the kconfig method
> for filtering this one out.
> http://patchwork.ozlabs.org/patch/919409/
> 
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
