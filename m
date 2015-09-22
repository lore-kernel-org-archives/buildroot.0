From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 22 Sep 2015 19:02:14 +0200
Subject: [Buildroot] [PATCH 1/2] imx-kobs: add new package
In-Reply-To: <56003D03.1040500@mind.be>
References: <1442839899-18044-1-git-send-email-gary.bisson@boundarydevices.com>
 <1442839899-18044-2-git-send-email-gary.bisson@boundarydevices.com>
 <56003D03.1040500@mind.be>
Message-ID: <CAAMH-ys5ORiRoMzzu_9ZxyHFq3w4mfmbqjjoicNnhUu-w=eiAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Sep 21, 2015 at 7:23 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21-09-15 14:51, Gary Bisson wrote:
>> Based on the Yocto 3.14.28-1.0.0_ga update:
>> https://github.com/Freescale/meta-fsl-arm/commit/6c44744
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>  package/freescale-imx/Config.in                    |  1 +
>>  .../imx-kobs/0001-Fix-musl-build.patch             | 43 ++++++++++++++++++++++
>>  package/freescale-imx/imx-kobs/Config.in           | 10 +++++
>>  package/freescale-imx/imx-kobs/imx-kobs.hash       |  2 +
>>  package/freescale-imx/imx-kobs/imx-kobs.mk         | 12 ++++++
>>  5 files changed, 68 insertions(+)
>>  create mode 100644 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
>>  create mode 100644 package/freescale-imx/imx-kobs/Config.in
>>  create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.hash
>>  create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.mk
>>
>> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
>> index dffe76f..a958dbd 100644
>> --- a/package/freescale-imx/Config.in
>> +++ b/package/freescale-imx/Config.in
>> @@ -42,6 +42,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>>       default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>>       default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>>
>> +source "package/freescale-imx/imx-kobs/Config.in"
>>  source "package/freescale-imx/imx-lib/Config.in"
>>  source "package/freescale-imx/imx-vpu/Config.in"
>>  source "package/freescale-imx/firmware-imx/Config.in"
>> diff --git a/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
>> new file mode 100644
>> index 0000000..4e9c72b
>> --- /dev/null
>> +++ b/package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
>> @@ -0,0 +1,43 @@
>> +[PATCH] Fix musl build
>> +
>> +Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> +---
>> + src/mtd.c | 5 +++++
>> + src/mtd.h | 5 +++++
>> + 2 files changed, 10 insertions(+)
>> +
>> +diff --git a/src/mtd.c b/src/mtd.c
>> +index 1edc441..2d3824e 100644
>> +--- a/src/mtd.c
>> ++++ b/src/mtd.c
>> +@@ -34,6 +34,11 @@
>> + #include <sys/types.h>
>> + #include <sys/ioctl.h>
>> +
>> ++// musl offsetof macro is located in stddef.h
>> ++#if !defined(__GLIBC__) && !defined(__UCLIBC__)
>
>  Since C99 (and probably C90 as well) specifies that offsetof is in stddef.h, I
> don't think it's necessary to do this conditionally.

You're right. I just didn't think it through, when the build
complained at offsetof I just looked at its location in the musl
toolchain.

I'll submit a V2 soon. Thanks for the feedback.

Regards,
Gary
