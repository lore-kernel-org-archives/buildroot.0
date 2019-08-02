From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 2 Aug 2019 13:34:04 +0200
Subject: [Buildroot] [PATCHv2] package/mtd: needs zstd
In-Reply-To: <20190802083112.GA3083@scaer>
References: <20190802081401.2545-1-yann.morin.1998@free.fr>
 <983ab9a0-941e-0ea5-cf64-4217eda63220@armadeus.com>
 <20190802083112.GA3083@scaer>
Message-ID: <6a36d470-0597-0166-d0e0-0aea26783a45@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 02/08/2019 10:31, Yann E. MORIN wrote:
> Julien, All,
>
> On 2019-08-02 10:23 +0200, Julien Boibessot spake thusly:
>> On 02/08/2019 10:14, Yann E. MORIN wrote:
>>  From: Julien BOIBESSOT
>>  [1]<julien.boibessot@armadeus.com>
>>  For the target variant, zstd is a mandatory dependency when ubifs-tools
>>  are enabled. For the host variant, it is an unconditional dependency.
>>  Fixes:   
>>  [2]http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/
>>   (target)   
>>  [3]http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/
>>   (host)Signed-off-by: Julien BOIBESSOT
>>  [4]<julien.boibessot@armadeus.com>
>>  Tested-by: Markus Mayer
>>  [5]<mmayer@broadcom.com>[
>>  [6]yann.morin.1998 at free.fr: fix the target variant too]
>>  Signed-off-by: Yann E. MORIN
>>  [7]<yann.morin.1998@free.fr>--- package/mtd/Config.in | 1 +
>>   package/mtd/mtd.mk    | 4 ++-- 2 files changed, 3 insertions(+), 2 deletions(-)
>>  diff --git a/package/mtd/Config.in b/package/mtd/Config.in
>>  index 590ca7f5ef..1dd7dad1b3 100644--- a/package/mtd/Config.in
>>  +++ b/package/mtd/Config.in@@ -21,6 +21,7 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
>>          select BR2_PACKAGE_UTIL_LINUX   select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>>          select BR2_PACKAGE_ZLIB+        select BR2_PACKAGE_ZSTD
>>    comment "MTD tools selection" diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
>>  index 0de14dbcba..04b8ccb73f 100644--- a/package/mtd/mtd.mk
>>  +++ b/package/mtd/mtd.mk@@ -19,7 +19,7 @@ MTD_CONF_OPTS += --without-jffs
>>   endif  ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
>>  -MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
>>  +MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf zstd
>>   MTD_CONF_OPTS += --with-ubifs ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>   MTD_DEPENDENCIES += openssl@@ -46,7 +46,7 @@ else
>>   MTD_CONF_OPTS += --without-xattr endif -HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
>>  +HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
>>   HOST_MTD_CONF_OPTS = \         --with-jffs \   --with-ubifs \
>>
>> I like your version but, as ZSTD seems optional for MTD UBIFS, I had something slightly different in progress:
>>
>> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
>> index 0de14db..3477460 100644
>> --- a/package/mtd/mtd.mk
>> +++ b/package/mtd/mtd.mk
>> @@ -27,6 +27,12 @@ MTD_CONF_OPTS += --with-crypto
>> ? else
>> ? MTD_CONF_OPTS += --without-crypto
>> ? endif
>> +ifeq ($(BR2_PACKAGE_ZSTD),y)
>> +MTD_DEPENDENCIES += zstd
>> +MTD_CONF_OPTS += --with-zstd
>> +else
>> +MTD_CONF_OPTS += --without-zstd
>> +endif
> But in configure, as yhou already quoted, we can see that zstd is
> mandatory for ubifs:
>
>     AM_COND_IF([BUILD_UBIFS], [
>                 need_uuid="yes"
>                 need_xattr="yes"
>                 need_zlib="yes"
>                 need_lzo="yes"
>                 need_zstd="yes"                   <<<<<<<<
>                 need_openssl="yes"
>         ])
>
> So, zstd is not a conditional dependency when ubifs is enabled. Or do I
> still need to get more cofee? ;-)

well in configure it can also be disabled (like openssl):

    Optional Packages:
      ...
      --without-zstd          Disable support for ZSTD compression

If your patch is OK for Thomas, it is OK for me (to select zstd by
default when ubifs is choosen in mtd) ;-)

Regards,
Julien

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190802/246dcde0/attachment.html>
