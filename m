From: Denis Mingulov <denis@mingulov.com>
Date: Thu, 17 Oct 2013 09:05:16 +0300
Subject: [Buildroot] [PATCH] rsync: use system zlib and popt,
 also do not lose debug options
In-Reply-To: <525F0956.1040406@mind.be>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
 <525F0956.1040406@mind.be>
Message-ID: <CAB++i-LMOO8owKF2V9eJdi_vX5W6LETLF-ywJ+x5bUMiGeoU+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> building only rsync before and after your patch, and although the binary
becomes smaller with your patch, the overall filesystem becomes larger.

Yes, in case of the only selected package it will be so. Due to overhead of
shared library / not removed unused components.
But for this particular case - you most probably have openssh (depends to
zlib) or dropbear (depends to zlib if not 'small' version is selected
separately) also already.

> I'd therefore propose to only use the system library if it is anyway
selected.

Sorry I am disagree, even without considering the security issue, just
because zlib/popt for rsync are not optional libraries, they are mandatory,
and will be compiled in any case.
In the current buildroot .mk files such 'if' use case might be useful for
optional components only, something like 'nice to have, will be supported
if already present'. Otherwise there might be tens of components compiling
its own 'zlib' version (tens different versions) - and the Buildroot user
must somehow found FAQ or understand himself, that he must 'include zlib to
the package manually' (zlib or tens of other libraries).

Also it will be opposite to the current Buildroot configuration. In the
latest master there are 9 packages with 'select BR2_PACKAGE_POPT'
(cryptsetup, gptfdisk, libiscsi, librsync, logrotate, lttng-tools,
oprofile, rpm, samba) and 50 packages with the same for zlib (of course not
every one has its own zlib/popt).

Might be, later it would be nice to have something like
'select_if_multiple' in Config files, to select other package if more than
1 component is selecting it, but it will do Configs more complex, and the
use case is quite rare.



On Thu, Oct 17, 2013 at 12:47 AM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 16/10/13 13:40, Denis Mingulov wrote:
>
>> rsync by default compiles statically its own zlib and popt
>> libraries, it is better to use system wide libraries instead -
>> both for disk and memory consumption. Change rsync package
>> accordingly.
>>
>> Also previously a debug configure option has been lost, as
>> overwritten by '--with-included-popt' option - fixed.
>>
>> For example, on ARMv5 rsync binary size is reduced by about 25%.
>>
>
>  I just did a check by building only rsync before and after your patch,
> and although the binary becomes smaller with your patch, the overall
> filesystem becomes larger. I'd therefore propose to only use the system
> library if it is anyway selected. So:
>
>
>
>
>> Signed-off-by: Denis Mingulov <denis@mingulov.com>
>> ---
>>   package/rsync/Config.in | 2 ++
>>   package/rsync/rsync.mk  | 4 +++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/rsync/Config.in b/package/rsync/Config.in
>> index be95a7c..b952974 100644
>> --- a/package/rsync/Config.in
>> +++ b/package/rsync/Config.in
>> @@ -2,6 +2,8 @@ config BR2_PACKAGE_RSYNC
>>         bool "rsync"
>>         # fork()
>>         depends on BR2_USE_MMU
>> +       select BR2_PACKAGE_ZLIB
>> +       select BR2_PACKAGE_POPT
>>
>
>  Remove this.
>
>
>          help
>>           File transfer program to keep remote files in sync.
>>
>> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
>> index d8e5f3f..4f336bc 100644
>> --- a/package/rsync/rsync.mk
>> +++ b/package/rsync/rsync.mk
>> @@ -8,7 +8,9 @@ RSYNC_VERSION = 3.1.0
>>   RSYNC_SITE = http://rsync.samba.org/ftp/**rsync/src<http://rsync.samba.org/ftp/rsync/src>
>>   RSYNC_LICENSE = GPLv3+
>>   RSYNC_LICENSE_FILES = COPYING
>> +RSYNC_DEPENDENCIES = zlib popt
>>
>
>  Remove this.
>
>
>    RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-**
>> debug,--disable-debug)
>> -RSYNC_CONF_OPT = --with-included-popt
>> +RSYNC_CONF_OPT += --with-included-zlib=no
>> +RSYNC_CONF_OPT += --with-included-popt=no
>>
>
>  Replace this with something like:
>
> ifeq($(BR2_PACKAGE_ZLIB),y)
> RSYNC_CONF_OPT += --with-included-zlib=no
> RSYNC_DEPENDENCIES += zlib
> else
> RSYNC_CONF_OPT += --with-included-zlib=yes
> endif
>
> And similar for popt.
>
>  Of course, this is untested and YMMV.
>
>  Regards,
>  Arnout
>
>
>>   $(eval $(autotools-package))
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
Best Regards,
Denis Mingulov
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131017/ba4a2d01/attachment-0001.html>
