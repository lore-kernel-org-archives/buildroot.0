From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 14:54:28 -0500
Subject: [Buildroot] [PATCH v7 20/22] squashfs: Add xattr support
In-Reply-To: <20150706121602.402373fc@free-electrons.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-21-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150706121602.402373fc@free-electrons.com>
Message-ID: <CANn-YGTqC=bhPjybxvfbH9sVZ2Vfa6xrvKaRkVOAvKTdCV3byA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 6, 2015 at 5:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Tue,  2 Jun 2015 08:28:36 -0500, Clayton Shotwell wrote:
>
>> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
>> index 8ca9e2e..f44ef9f 100644
>> --- a/package/squashfs/squashfs.mk
>> +++ b/package/squashfs/squashfs.mk
>> @@ -10,9 +10,6 @@ SQUASHFS_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/squas
>>  SQUASHFS_LICENSE = GPLv2+
>>  SQUASHFS_LICENSE_FILES = COPYING
>>
>> -# no libattr in BR
>> -SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
>> -
>>  ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
>>  SQUASHFS_DEPENDENCIES += lz4
>>  SQUASHFS_MAKE_ARGS += LZ4_SUPPORT=1 COMP_DEFAULT=lz4
>> @@ -52,13 +49,20 @@ HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz
>>
>>  # no libattr/xz in BR
>>  HOST_SQUASHFS_MAKE_ARGS = \
>> -     XATTR_SUPPORT=0 \
>>       XZ_SUPPORT=1    \
>>       GZIP_SUPPORT=1  \
>>       LZ4_SUPPORT=1   \
>>       LZO_SUPPORT=1   \
>>       LZMA_XZ_SUPPORT=1
>>
>> +ifeq ($(BR2_PACKAGE_ATTR),y)
>> +     SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
>> +     HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=1
>> +else
>> +     SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
>> +     HOST_SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=0
>> +endif
>
> For the host package, this is clearly not correct.
>
> BR2_PACKAGE_ATTR=y tells you that the *target* attr package has been
> built. It does not tell you anything about the availability of the
> *host* attr package. Do you can certainly do:
>
> SQUASHFS_MAKE_ARGS += XATTR_SUPPORT=$(if $(BR2_PACKAGE_ATTR),1,0)
>
> However, touching HOST_SQUASHFS_MAKE_ARGS depending on BR2_PACKAGE_ATTR
> does not make sense. If you need xattr support in mksquashfs for the
> host, then you will need to add a
> BR2_PACKAGE_HOST_SQUASHFS_XATTR_SUPPORT Config.in.host option, and
> enable XATTR_SUPPORT=1 when enabled, and add host-attr to the
> dependencies.

I would really like to know what I was thinking when I put this patch
together because you are completely correct on how terrible this is. I
looked back at it and I don't believe the host xattr support should be
enabled at all. There are too many host dependencies, unrelated to the
xattr package, that need to be met for this to work properly (think
extended attributes on the filesystem itself). I am going to drop the
host changes and only enable this for the target (where I am actually
looking to use it).

> Also, your patch is incorrect because it does not add the dependency on
> the attr package, so nothing guarantees you that the attr package has
> been built before squashfs.

I'll add that in for the target package with my next set of patches.

> I'll mark your patch as Changes Requested in patchwork.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
