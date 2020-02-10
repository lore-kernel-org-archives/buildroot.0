From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 10 Feb 2020 18:36:06 +0200
Subject: [Buildroot] [PATCH v2] package/libcurl: rename curl binary
 config symbol
In-Reply-To: <CANQCQpZ51iNN1AFB-8nTYiyqa3OH_T9sgB9+PuUGxcpNX-6X4w@mail.gmail.com>
References: <c26bb4f7c24adf02f3260fafaa70536472d255e3.1581336419.git.baruch@tkos.co.il>
 <CANQCQpZ51iNN1AFB-8nTYiyqa3OH_T9sgB9+PuUGxcpNX-6X4w@mail.gmail.com>
Message-ID: <878sla2ydl.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, Feb 10 2020, Matthew Weber wrote:
> On Mon, Feb 10, 2020 at 6:08 AM Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> Package optional or choice config symbols are usually prefixed with the
>> package config symbol name. Rename BR2_PACKAGE_CURL to
>> BR2_PACKAGE_LIBCURL_CURL to conform.
>>
>> Update references to the old name.
>>
>> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks.

>> v2:
>>
>> Rebase on current master:
>>
>>   * Move legacy entry to 2020.02
>>
>>   * Handle glslsandbox-player select
>
> and dehydrated

Handled in v1 already:

  http://patchwork.ozlabs.org/patch/1177708/

baruch

>
>> ---
>>  Config.in.legacy                     | 8 ++++++++
>>  docs/manual/adding-packages-tips.txt | 2 +-
>>  package/dehydrated/Config.in         | 2 +-
>>  package/glslsandbox-player/Config.in | 2 +-
>>  package/libcurl/Config.in            | 2 +-
>>  package/libcurl/libcurl.mk           | 2 +-
>>  6 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/Config.in.legacy b/Config.in.legacy
>> index 563f6d39e366..b26dcde53813 100644
>> --- a/Config.in.legacy
>> +++ b/Config.in.legacy
>> @@ -146,6 +146,14 @@ endif
>>
>>  comment "Legacy options removed in 2020.02"
>>
>> +config BR2_PACKAGE_CURL
>> +       bool "BR2_PACKAGE_CURL was renamed"
>> +       select BR2_PACKAGE_LIBCURL_CURL
>> +       select BR2_LEGACY
>> +       help
>> +         The BR2_PACKAGE_CURL config symbol was renamed to
>> +         BR2_PACKAGE_LIBCURL_CURL.
>> +
>>  config BR2_PACKAGE_GSTREAMER
>>         bool "gstreamer-0.10 removed"
>>         select BR2_LEGACY
>> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
>> index d10f276e83bd..95a1d599ef74 100644
>> --- a/docs/manual/adding-packages-tips.txt
>> +++ b/docs/manual/adding-packages-tips.txt
>> @@ -98,7 +98,7 @@ config snippet. For example, here's how you would test +libcurl+ with
>>  ----
>>  $ cat libcurl.config
>>  BR2_PACKAGE_LIBCURL=y
>> -BR2_PACKAGE_CURL=y
>> +BR2_PACKAGE_LIBCURL_CURL=y
>>  BR2_PACKAGE_OPENSSL=y
>>  ----
>>
>> diff --git a/package/dehydrated/Config.in b/package/dehydrated/Config.in
>> index f14ae0f6110c..979938d70ca6 100644
>> --- a/package/dehydrated/Config.in
>> +++ b/package/dehydrated/Config.in
>> @@ -4,7 +4,7 @@ config BR2_PACKAGE_DEHYDRATED
>>         select BR2_PACKAGE_BASH
>>         select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>>         select BR2_PACKAGE_LIBCURL
>> -       select BR2_PACKAGE_CURL
>> +       select BR2_PACKAGE_LIBCURL_CURL
>>         select BR2_PACKAGE_OPENSSL
>>         select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
>>         select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
>> diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
>> index 32239d29d0d5..dc0d2c07f1b9 100644
>> --- a/package/glslsandbox-player/Config.in
>> +++ b/package/glslsandbox-player/Config.in
>> @@ -41,7 +41,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
>>         select BR2_PACKAGE_BASH # runtime
>>         select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
>>         select BR2_PACKAGE_COREUTILS # runtime (timeout)
>> -       select BR2_PACKAGE_CURL # runtime
>> +       select BR2_PACKAGE_LIBCURL_CURL # runtime
>>         select BR2_PACKAGE_IMAGEMAGICK # runtime
>>         select BR2_PACKAGE_JPEG # runtime
>>         select BR2_PACKAGE_LIBCURL # runtime
>> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
>> index 652285c0f863..d05cbedf77df 100644
>> --- a/package/libcurl/Config.in
>> +++ b/package/libcurl/Config.in
>> @@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBCURL
>>
>>  if BR2_PACKAGE_LIBCURL
>>
>> -config BR2_PACKAGE_CURL
>> +config BR2_PACKAGE_LIBCURL_CURL
>>         bool "curl binary"
>>         help
>>           Install curl binary as well
>> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
>> index a7f10ddde5fd..16b11ca9444e 100644
>> --- a/package/libcurl/libcurl.mk
>> +++ b/package/libcurl/libcurl.mk
>> @@ -162,7 +162,7 @@ define LIBCURL_FIX_DOT_PC
>>  endef
>>  LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
>>
>> -ifeq ($(BR2_PACKAGE_CURL),)
>> +ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
>>  define LIBCURL_TARGET_CLEANUP
>>         rm -rf $(TARGET_DIR)/usr/bin/curl
>>  endef

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
