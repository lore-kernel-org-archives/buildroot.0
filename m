From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 08:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917104048.GA13723@pc-eric>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be> <20130917104048.GA13723@pc-eric>
Message-ID: <52394DBD.1030300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/09/13 12:40, Eric Le Bihan wrote:
> On Tue, Sep 10, 2013 at 10:24:40PM +0200, Arnout Vandecappelle wrote:
> Hi!
>
> Thanks for the review, it is very instructive.
>
>>> Systemd has been updated to version 206. Eudev v1.2 is forked from this
>>> version.
>>
>>   I don't know if it is important, but I would have split the systemd
>> bump from the eudev patch. Or would systemd 44 fail to function with
>> eudev?
>
> Next time, I will make a series of patch, but I want to keep eudev and systemd
> in sync, as the developpers of eudev do: on Friday September 13th, Systemd
> v207 was released and the next day eudev was bumped to 1.3. Systemd v44 is
> supposed to be compliant with udev v182, but there is no eudev equivalent for
> this version. In order not to provide a broken system, I suggest:
>
>   1) first patch bumps systemd and replaces udev with a virtual package.
>   2) second patch adds eudev as a "udev provider".

  No, in that case, don't bother. Splitting patches is good, but if it 
makes your life (much) harder: there are better ways to spend your time.

[snip]
>>> +if BR2_PACKAGE_SYSTEMD
>>> +
>>> +config BR2_PACKAGE_SYSTEMD_ACL
>>> +	bool "Enable ACL"
>>> +	default n
>>
>>   n is the default, so remove this line (same below).
>>
>>   Is it really useful to have this option, rather than depending on
>> acl automatically when BR2_PACKAGE_ACL is set? Same for some of the
>> other config options below.
>
> I was wondering what was the best for the user:
>
>   1) offering him some fine-grained choices.
>   2) offering only one "enable all extras" option.
>
> Besides, between Systemd extra feature and ACL, which depends on which?
> As a user, I prefer to choose explicitly the features of my system, not having
> them activated unknowingly because I selected other packages. Gudev, Gcrypt,
> ACL and journal compression can be grouped in "enable all extras", but I'll
> keep the journal gateway as a separate option, as adding it to a firmware
> image really eat up resources (image size and memory consumption): it is a big
> feature. Enabling all extras will select Gudev, Gcrypt, ACL, xz, not the other
> way round.

  Specifically for acl, the buildroot "standard" is to not give the user 
an option, but just build systemd with acl if BR2_PACKAGE_ACL is y. If we 
would make a general rule of creating Config options for all the optional 
dependencies of a package, the number of options would explode - and the 
.config is already close to 100K.

  For gudev, it is probably best to take a similar approach, i.e. enable 
it automatically if libglib2 is selected. Most likely gudev is pretty 
small compared to libglib2, and almost certainly you'll only need it when 
there is some other package that already selects libglib2.

  For the journal compression and the journal gateway, I agree that it 
makes sense to have config options for them.

[snip]
>>   We currently have the reverse: systemd can only be selected if udev
>> was selected.  Any specific reason why you change that?  I'm not
>> opposed to modifying that, but then the INIT choice should probably
>> come before the DEVICE_CREATION option. And it probably should be a
>> separate patch.
>
> Yes. I'm in favor of selecting the init system first, then selecting the /dev
> management method. Also, the password encoding selection should be put before
> selecting the root password.

  About the init system, as Thomas said it's a matter of taste - though 
in the case of systemd it certainly does make a lot of sense to select 
that first and avoid an unnecessary choice of /dev system.

  Regarding the root password, you're probably right, and the method 
should probably depend on the password being non-empty.

>
>>   In this case, I would hide the choice if BR2_INIT_SYSTEMD is
>> selected. Like so:
>>
>> choice
>>          prompt "/dev management" if !BR2_INIT_SYSTEMD
>> 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV if BR2_INIT_SYSTEMD
>>          default BR2_ROOTFS_DEVICE_CREATION_STATIC
>>
>> ...
>> endchoice
>
> I tried it, but the problem is that if the "prompt" is hidden, then the
> "config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV" variable will not get defined
> in the generated ".config": so some packages depending on it will not be
> selected.

  Huh? I didn't expect that... But anyway, these packages should probably 
depend on BR2_PACKAGE_UDEV instead of the system option. I think 
depending on system options in packages is generally a bad idea.


> I want the selection of udev to be explicit to the user, not hidden. That's
> why I came up with this solution of providing only one choice for /dev
> management when systemd is selected. Maybe a comment will be better...

  I'm not sure if that is needed. The user will either know about the 
udev dependency, or not care.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
