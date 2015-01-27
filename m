From: Gergely Imreh <imrehg@gmail.com>
Date: Tue, 27 Jan 2015 16:31:39 +0800
Subject: [Buildroot] [PATCH 1/1] board: add support for the VIA VAB-820
	board
In-Reply-To: <20150125190200.39f26831@free-electrons.com>
References: <1422000168-19305-1-git-send-email-imrehg@gmail.com>
 <1422000168-19305-2-git-send-email-imrehg@gmail.com>
 <20150125190200.39f26831@free-electrons.com>
Message-ID: <CAJ3iQcpmqYVuj3xg-yimp7ck98ritw0Ex71WhJf83_ZM8RPTYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks a lot for the overview, really sorry about the embarrassing
number of typos, I'll fix them for v2!

On 26 January 2015 at 02:02, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
>> new file mode 100644
>> index 0000000..167a90a
>> --- /dev/null
>> +++ b/configs/via_imx6_vab820_defconfig
>> @@ -0,0 +1,38 @@
>> +# architecture
>> +BR2_arm=y
>> +BR2_cortex_a9=y
>> +
>> +# toolchain
>> +BR2_DEPRECATED=y
>
> This is not needed.
>
>> +BR2_KERNEL_HEADERS_3_0=y
>> +BR2_DEFAULT_KERNEL_HEADERS="3.0.101"
>
> Use instead:
>
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="3.0.101"

I was trying this setting, and run into the problem that `make
defconfig` defaults to 2.6.x headers with
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y and then I run into
a compile time error:

 if ! support/scripts/check-kernel-headers.sh
/home/greg/Software/vab820-buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
 2.6; then exit 1; fi
 Incorrect selection of kernel headers: expected 2.6.x, got 3.0.x

It is fixed with BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y in the
defconfig, but I'm not sure if that is the correct way.


Also, could I set BR2_DEFAULT_KERNEL_VERSION="3.0.35" for clarity, as
that is the exact version?


So after these two issues above, now I just tested a working version with:
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.0.35"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y

What do you think?

Cheers,
  Greg
