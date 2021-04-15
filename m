From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 21:02:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: allow disabling default
 services
In-Reply-To: <101e-60780880-3-3d17a340@6714720>
References: <101e-60780880-3-3d17a340@6714720>
Message-ID: <64232bf4-4811-35ef-f9fa-d44f662a003a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2021 11:34, Michael Nosthoff via buildroot wrote:
> Florian, All
> 
> On Friday, December 04, 2020 18:45 CET, Florian Larysch <fl@n621.de> wrote: 
>  
>> By default, Avahi installs service definitions for SSH and SFTP, but
>> those might not be present on all systems. Add an option for disabling
>> them.
>>
> 
> I have this removal in all my post-build scripts. So it would be great to have it as an option.
> I would even suggest to always remove the .service files and make it optional. I think an embedded system should
> explicitly enable services.
> 
>>  
>> +config BR2_PACKAGE_AVAHI_DEFAULT_SERVICES
>> +	bool "install default service definitions"
>> +	depends on BR2_PACKAGE_AVAHI_DAEMON
>> +	default y
> 
> If kept as an Option: default this to n?

 To make it easy to upgrade Buildroot, we want as much as possible to make sure
that existing configurations still work. If you have an existing configuration
that actually relies on these services to be installed, then it would be very
annoying if they just disappear under your feet... So in general, we want the
default to reflect the old situation. That means that adding an option that
removes something will generally have to default y.

 This policy is far from ideal, because it means people will often have to
explicitly unset this option. In many cases, even for existing configs,
unsetting it is in fact the right thing to do.

 So maybe we should consider changing this policy.

 I think we should only do that if we also add a prominent file in the root,
e.g. UPGRADING, that makes explicit note of such changes. Some time ago, I tried
to keep something like that going by editing CHANGES, but it didn't amount to
much, and that file is so full that it's hard to find the relevant bits.


 I've added a bunch of random people in Cc whom I think might have a relevant
opinion about this. I hope nobody will feel offended because I didn't include
them :-)

 If this idea gains traction, I volunteer to write a skeleton UPGRADING file,
and refer to it from the manual. I've been thinking for a long time already that
I really should add a section to the manual about what to do when you upgrade
Buildroot, and this would be the ideal push for me.


 Regards,
 Arnout
