From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 08:57:46 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917203726.5b02fe08@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be> <20130917203726.5b02fe08@skate>
Message-ID: <52394EEA.4000603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/09/13 20:37, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 10 Sep 2013 22:24:40 +0200, Arnout Vandecappelle wrote:
>
>>> +comment "eudev requires /dev mgmnt set to udev under System configuration"
>>> +	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>>> +
>>> +comment "eudev not available with Systemd as init system"
>>> +	depends on BR2_PACKAGE_SYSTEMD
>>
>>    I think these comments are not really necessary. Actually, I would say
>> that the only reason that eudev has a user-visible Config option is for
>> the "enable all extras". And that config option is slightly redundant,
>> since the additional size of gudev is almost nothing compared to
>> libglib2, so you could just as well use an automatic dependency.
>
> No, I disagree with this. There are some other packages (currently
> udisks and network-manager) that explicitly need the udev extras. So I
> believe it's useful for these packages to be able to 'select
> BR2_PACKAGE_UDEV_ALL_EXTRAS'. Of course, they could 'select
> BR2_PACKAGE_LIBGLIB2' and depend on udev, but this means that they have
> internal knowledge of the fact that udev needs libglib2 to enable 'all
> extras', an internal knowledge that could very well be broken if
> tomorrow udev needs another dependency to build its 'all extras' things.
>
> So, the BR2_PACKAGE_(E)UDEV_ALL_EXTRAS option should remain in place, I
> believe.

  I didn't write the network-manager and udisks integration, but I think 
that they _actually_ need gudev, not some vague "all extras". And for 
gudev it's pretty darn obvious that there is a relation with libglib2. In 
fact, both of them should probably select libglib2 directly, because they 
are based on gobject classes.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
