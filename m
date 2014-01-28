From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jan 2014 08:13:35 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
 unit
In-Reply-To: <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
 <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
Message-ID: <52E7589F.7060301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/14 20:41, Ivan Sergeev wrote:
> Currently, it seems that the /etc/init.d scripts are copied over blindly
> from the target skeleton to the target even if systemd (and not busybox)
> is the chosen init system. Moving forward, having both busybox and
> systemd init files in the skeleton, like this patch would have, will
> always clutter /etc/ with some unused init files in the target system,
> since only one init system will be active.
>
> Should such init files be conditional targets in system/system.mk
> ?  Or should S40network be owned and copied over by
> package/busybox, and network.service be owned and copied over by
> package/systemd, instead of having them included statically in the target
> skeleton?

  I completely agree that the way it is done now is far from ideal.

  I think the best way to work with this would be to:

- remove the contents of the init.d directory from the skeleton;

- create a new skeleton fragment system/skeleton-init-sysv that contains 
etc/init.d;

- create a new skeleton fragment system/skeleton-init-systemd that 
contains whatever support files are needed by systemd (currently nothing, 
but your patch would add the networking unit file);

- copy the correct skeleton fragment as part of the .root target, but 
only if the default skeleton was selected - with a custom skeleton, it's 
up to the user to provide the right systemd/init.d;



  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
