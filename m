From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 8 Jul 2015 12:52:23 -0500
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: remove busybox tune2fs when
 installing full version
In-Reply-To: <20150701234851.GB2391@tarshish>
References: <1435789556-17999-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <20150701234851.GB2391@tarshish>
Message-ID: <CAMQcK5+5RqikWua-mac0eFQt4c_XbDqyDza=vmyCcmfiwhdODg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, Jul 1, 2015 at 6:48 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ryan,
>
> On Wed, Jul 01, 2015 at 05:25:56PM -0500, Ryan Barnett wrote:
>> Currently, busybox installs a version of tune2fs in /sbin/ while
>> e2fsprogs installs at /usr/sbin/. This causes issues if a user is
>> expecting the to use the full version from a prompt via 'tune2fs'
>> since busybox's tune2fs will be found first from the default path
>> search.
>>
>> Fix this by removing the busybox version of tune2fs when a user has
>> selected the option to install tune2fs from e2fsprogs.
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> ---
>>  package/e2fsprogs/e2fsprogs.mk | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
>> index e0c4ee2..f6ac648 100644
>> --- a/package/e2fsprogs/e2fsprogs.mk
>> +++ b/package/e2fsprogs/e2fsprogs.mk
>> @@ -36,7 +36,7 @@ ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>>  E2FSPROGS_CONF_ENV += LIBS=-lintl
>>  endif
>>
>> -E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
>> +E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux busybox
>
> Should be
>
>         $(if $(BR2_PACKAGE_BUSYBOX),busybox)

Agreed.

>>  E2FSPROGS_MAKE_OPTS = \
>>       LDCONFIG=true
>> @@ -102,7 +102,9 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
>>  E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_E2FSCK_SYMLINKS
>>  endif
>>
>> +# Remove busybox tune2fs since that will take precedence full version
>>  define E2FSPROGS_TARGET_TUNE2FS_SYMLINK
>> +     rm -f $(TARGET_DIR)/sbin/tune2fs
>
> This should also depend on BR2_PACKAGE_BUSYBOX, I guess.
>
>>       ln -sf e2label $(TARGET_DIR)/usr/sbin/tune2fs
>
> Busybox seems to installs e2label in /sbin as well.

Agreed.

Will make the suggested fixes and send a v2 shortly.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
