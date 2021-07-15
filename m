From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 15 Jul 2021 03:40:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: enable nfsv4/nfsv4.1
 support
In-Reply-To: <CADvTj4qsw+XDgbY-3kRHC3pAGJdpbr0z+tusmVkmk+nkTZckQw@mail.gmail.com>
References: <CADvTj4qsw+XDgbY-3kRHC3pAGJdpbr0z+tusmVkmk+nkTZckQw@mail.gmail.com>
Message-ID: <0F79AE80-35AC-4A12-A577-96ED1281D54B@benettiengineering.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210715014046.R5QYMlfvrdq3FLuAGeWIhSv_a3fDZHDWNs7qMPHy-xw@z>

Hi James,

> Il giorno 15 lug 2021, alle ore 01:19, James Hilliard <james.hilliard1@gmail.com> ha scritto:
> 
> ?On Tue, Jul 13, 2021 at 3:28 AM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>> 
>> 
>> Il giorno 13 lug 2021, alle ore 10:19, James Hilliard <james.hilliard1@gmail.com> ha scritto:
>> 
>> ?On Tue, Jul 13, 2021 at 2:03 AM Giulio Benetti
>> <giulio.benetti@benettiengineering.com> wrote:
>> 
>> 
>> Hello James,
>> 
>> 
>> Il giorno 13 lug 2021, alle ore 05:14, James Hilliard <james.hilliard1@gmail.com> ha scritto:
>> 
>> 
>> ?Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> 
>> ---
>> 
>> package/nfs-utils/Config.in    | 10 ++++++++++
>> 
>> package/nfs-utils/nfs-utils.mk |  9 +++++++--
>> 
>> 2 files changed, 17 insertions(+), 2 deletions(-)
>> 
>> 
>> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
>> 
>> index da563db0f1..b736f6c973 100644
>> 
>> --- a/package/nfs-utils/Config.in
>> 
>> +++ b/package/nfs-utils/Config.in
>> 
>> @@ -14,6 +14,16 @@ config BR2_PACKAGE_NFS_UTILS
>> 
>> 
>> if BR2_PACKAGE_NFS_UTILS
>> 
>> 
>> +config BR2_PACKAGE_NFS_UTILS_NFSV4
>> 
>> +    bool "NFSv4/NFSv4.1"
>> 
>> +    depends on !BR2_STATIC_LIBS # keyutils, lvm2
>> 
>> +    select BR2_PACKAGE_KEYUTILS
>> 
>> +    select BR2_PACKAGE_LIBEVENT
>> 
>> +    select BR2_PACKAGE_LVM2
>> 
>> +    select BR2_PACKAGE_SQLITE
>> 
>> +    help
>> 
>> +      Enable NFSv4/NFSv4.1 support
>> 
>> +
>> 
>> config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
>> 
>>  bool "rpcdebug"
>> 
>>  help
>> 
>> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>> 
>> index c384e939d8..2598f0908b 100644
>> 
>> --- a/package/nfs-utils/nfs-utils.mk
>> 
>> +++ b/package/nfs-utils/nfs-utils.mk
>> 
>> @@ -16,8 +16,6 @@ NFS_UTILS_AUTORECONF = YES
>> 
>> NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
>> 
>> 
>> NFS_UTILS_CONF_OPTS = \
>> 
>> -    --disable-nfsv4 \
>> 
>> -    --disable-nfsv41 \
>> 
>> 
>> Is this ^^^ what prevents uuid.h build error?
>> 
>> 
>> No idea, have some background on that issue?
>> 
>> 
>> Yes, I had that issue on this commit:
>> 
>> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=blobdiff;f=support/export/v4root.c;h=c12a7d8562b22616fbc7840faf6719443dac64d3;hp=3654bd7c10c059d6a6ae32001ca979d671ef38f2;hb=c5528f40f9db5061e06dcf1f9b7fce5185b376c6;hpb=ed83085ff310fdc95badb06a26289efb70f99ccd
>> 
>> But it seems that ?disable-nfsv4 avoid building it,
>> so we should have no problem.
>> 
>> Can you double check building with nfsv4 support and find it failing wi uuid.h? I don?t have time at the moment.
> 
> I wasn't seeing a failure but I sent a patch enabling it when available here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210714231702.850078-1-james.hilliard1 at gmail.com/

This patch can work for building libblkid but nfs-utils still declare its support buggy here:

http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=blob;f=configure.ac;h=93520a8052bcbc2a4f57090f89f606d8aa76c801;hb=HEAD#l169

So maybe it?s better ask upstream about it.
Can you do it?

Thanks in advance
Giulio

> 
>> 
>> Thanks a lot
>> 
>> Giulio
>> 
>> 
>> 
>> Giulio
>> 
>> 
>>  --disable-gss \
>> 
>>  --disable-uuid \
>> 
>>  --enable-tirpc \
>> 
>> @@ -46,6 +44,13 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
>> 
>> NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
>> 
>>  usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
>> 
>> 
>> +ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
>> 
>> +NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
>> 
>> +NFS_UTILS_DEPENDENCIES += keyutils libevent lvm2 sqlite
>> 
>> +else
>> 
>> +NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
>> 
>> +endif
>> 
>> +
>> 
>> ifeq ($(BR2_PACKAGE_LIBCAP),y)
>> 
>> NFS_UTILS_CONF_OPTS += --enable-caps
>> 
>> NFS_UTILS_DEPENDENCIES += libcap
>> 
>> --
>> 
>> 2.25.1
>> 
>> 
>> 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210715/79d37820/attachment-0002.html>
