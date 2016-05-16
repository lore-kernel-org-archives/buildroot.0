From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 May 2016 08:57:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/android-tools: fix host tools
	dependency
In-Reply-To: <20160515213646.6530b595@free-electrons.com>
References: <1463260156-23406-1-git-send-email-s.martin49@gmail.com>
 <1463260156-23406-3-git-send-email-s.martin49@gmail.com>
 <20160515213646.6530b595@free-electrons.com>
Message-ID: <CAHXCMM+bhCK9km3EmxvcwzHihf=hh26=CRXMXr-VXpLPd0mOyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 15, 2016 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 14 May 2016 23:09:16 +0200, Samuel Martin wrote:
>> Host android-tools only makes sense when the target package is enable,
>> so make it available only when the android-tools is already part of the
>> target package selection.
>>
>> This change fixes in a simpler way the missing selection on
>> BR2_PACKAGE_ANDROID_TOOLS and the missing dependency on BR2_USE_MMU.
>>
>> This patch fixes the following kconfig warning:
>>
>>   warning: (BR2_PACKAGE_HOST_ANDROID_TOOLS) selects BR2_PACKAGE_ANDROID_TOOLS_ADB which has unmet direct dependencies (BR2_PACKAGE_ANDROID_TOOLS && BR2_USE_MMU)
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/android-tools/Config.in.host | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
>> index 4326014..7ac9636 100644
>> --- a/package/android-tools/Config.in.host
>> +++ b/package/android-tools/Config.in.host
>> @@ -1,5 +1,6 @@
>>  config BR2_PACKAGE_HOST_ANDROID_TOOLS
>>       bool "host android-tools"
>> +     depends on BR2_PACKAGE_ANDROID_TOOLS
>>       select BR2_PACKAGE_ANDROID_TOOLS_ADB if \
>>               !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
>
> This is not the correct fix, for two reasons:
>
>  1/ The intent of the "select" is to make sure that either adb or
>     fastboot support is enabled, so basically the mistake is that the
>     select are using the options of the *target* android-tools package,
>     while it should be using the options of the *host* android-tools
>     package, defined below in the same file.
>
>  2/ Your assumption that android-tools on the host are needed only if
>     android-tools are installed on the target are wrong. The original
>     reason for which I started packaging the android-tools is because
>     we wanted to have the fastboot command on our host machine, to talk
>     to a fastboot implementation in U-Boot. So there's no android-tools
>     in the target, but we need android-tools on the host.

Thanks for the clarification, I was not aware of this use-case.

>
> So, I committed a fix that simply changes the select to use the
> sub-options of the host android-tools package. See
> https://git.buildroot.net/buildroot/commit/?id=f0d995cafd0c664f436bc9d082a3bb14b683dd75.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,

-- 
Samuel
