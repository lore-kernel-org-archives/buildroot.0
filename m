From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 18:31:12 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <d3136d0b-4214-4033-82fa-be8adffe1aa8@zimbra2.corp.accelance.fr>
References: <d3136d0b-4214-4033-82fa-be8adffe1aa8@zimbra2.corp.accelance.fr>
Message-ID: <50BF84E0.9090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/12 10:28, Jeremy Rosen wrote:
> V3 is on the way....
>
> I skip items I agree with and applied
>
>>
>>> +config BR2_TARGET_ROOTFS_LIVE_DEST
>>> +	string "live image location"
>>> +	depends on BR2_TARGET_ROOTFS_LIVE
>>> +	default "$(BINARIES_DIR)/live"
>>> +	help
>>> +	  The directory where the image should be stored.
>>> +	  this directory will be emptied and recreated, it is given
>>
>>    this ->  This
>>
>>> +	  relative to the buildroot output/images directory
>>
>>    The second part of this statement is redundant (it's true for all
>> paths in the config and is not mentioned anywhere else)
>>
>
> and the whole thing is false since that path is now absolute (which makes more sense for NFS deployement)
>
> unless you want me to make it relative again... I believe absolute (whith the possibility to use env vars to find the buildroot location) makes most sense but that might be worth discussing

  Like most other paths in buildroot, it's relative to $(TOP_DIR)
(i.e. the buildroot directory).


>>> +endef
>>> +
>>> +define ROOTFS_LIVE_INIT
>>> +  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be
>>> installed on the host system" ; false ; fi ; \
>>
>>    This really should be checked in
>>    support/dependencies/dependencies.sh.
>>
>
> I didn't know about that file, but it seems to be more about dependencies for buildroot core than dependencies for a particular config option...

  I forgot to add: similar to the java dependencies for classpath.


>
> otoh it's the only place where we check for stuff installed on the host (not compiled for host, natively installed on host)
>
> maybe the cleanest way to do it would be to have a virtual target
>
> ROOTFS_DEPENDS=native-xxx
>
> that would just check that "which xxx" exists on the system...
>
> that's a different patch I could have a look at if people think it's a good idea (I am not good at makefile so I have no idea if it's one line of code or if i'm going into makefile hell here...)

  That's not how we work - all native dependencies are checked in
support/dependencies.


[snip]
> I could also run sudo with "fail instead of asking for a password" option, and have people add the proper line in the sudo config file to allow untar without password, but i'm not sure if it's better or worse

  No, we don't want to force people to change their host config just so they
can use buildroot.


  Regards,
  Arnout

>
> i'll probably wait for your answer before sending V3
>
> Thx for the proofreading
>
> Regards
> J?r?my Rosen
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
