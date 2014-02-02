From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Feb 2014 18:53:28 +0100
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host
 tools separately
In-Reply-To: <20140131092259.6ce95cd4@skate>
References: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
 <20140131092259.6ce95cd4@skate>
Message-ID: <52EE8618.7040708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/14 09:22, Thomas Petazzoni wrote:
> Dear Jeroen De Wachter,
>
> On Thu, 30 Jan 2014 14:52:23 +0100 (CET), Jeroen De Wachter wrote:
>
>> If the squashfs image is selected, it automatically selects the
>> squahsfs host tools as well. Consequently, I've removed
>> host-squashfs from ROOTFS_SQUASHFS_DEPENDENCIES.
>
> In the other filesystems, we do not necessarily select
> BR2_PACKAGE_HOST_<utilities to build the filesystem>, and therefore we
> keep the <pkg>_DEPENDENCIES that contains host-<utilities to build the
> filesystem>.

  I would actually prefer to have both the select and the dependencies, 
since that's what we do for target packages.

  In addition (but that's just a small consideration), if at some point 
we make TARGETS contain only the target targets (heh), then the 
dependency chain for filesystems is still correct.

  Regards,
  Arnout

>
> I don't have a very strong opinion on which solution we should use, but
> I am sure that we want things to be consistent across the different
> filesystems. So for the time being:
>
>>   config BR2_TARGET_ROOTFS_SQUASHFS
>>          bool "squashfs root filesystem"
>> +       select BR2_PACKAGE_HOST_SQUASHFS
>
> This is not necessary.
>
>>          help
>>            Build a squashfs root filesystem
>>
>> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
>> index eb5fc3e..b5ece9d 100644
>> --- a/fs/squashfs/squashfs.mk
>> +++ b/fs/squashfs/squashfs.mk
>> @@ -4,8 +4,6 @@
>>   #
>>   ################################################################################
>>
>> -ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
>
> And this should be preserved.
>
> Unless of course we decide to change our strategy.
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
