From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 10:58:11 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190306173639.GR2721@scaer>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be> <20190305213858.GQ2721@scaer>
 <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
 <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be> <20190306173639.GR2721@scaer>
Message-ID: <ca37d641-5aae-49f9-dace-19b924c2b6cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/03/2019 18:36, Yann E. MORIN wrote:
> Arnout, Micha?, All,
> 
> On 2019-03-06 10:58 +0100, Arnout Vandecappelle spake thusly:
[snip]
>>  Instead of doing a custom install, I prefer to just do the default install and
>> remove things are not needed / wanted.
> 
> I usually prefer to whitelist rather than blacklist. I.e .I prefer a
> selective install, rather than a selective removal.
> 
> Otherwise, when we bump the version, and a new tool is installed, we can
> very easily miss it and leave it installed. While when we selectively
> install, we can't leave cruft on the target, but we will notice easily
> that something is missing.

 That knife cuts both ways: when you do custom install, you can easily miss
something new that is required. It's almost never a problem if too much gets
installed, while a missing shared library tends to be troublesome.

 Remember that we have seen this issue several times with the qt5 packages.


> Of course, the alternative is to go full-blown, which I also find
> acceptable. We can then trim down in followup patches.

 It's not a matter of trimming down, really, because it's just a few KB. It's a
matter of avoiding warnings on the console.


>>> - Invoke "install" for each file? There are quite of them.
> 
> OTOH, there are probalby quite a bunch of files to remove too, no?

 I don't know, of course, but I would expect it to be just one or two.

[snip]
>>  Maybe we should introduce a global config + variable to control this, i.e. the
>> NAME and PRETTY_NAME in /etc/os-release.
> 
> I amundecided on that one... Would you also offer a way to change the
> version, to match that of the product? IMHO, people that are concerned
> with having their names in there can just generate os-release from a
> post-build script, so that they can get the version out of their VCS for
> example.

 You can still do that with a BR2_BRANDING config variable, e.g. by setting it
to "ExampleCo $(shell get-version)"


>>>> I think this should be a sub-option of the openrc package, not the 'init'
>>>> part.
>>  I actually disagree that the various init packages depend on PID1 coming from
>> that particular package. There could be use cases to have a different init
>> system (usually _NONE) and still have the init executable there.
> 
> But then, what package is responsible for install /sbin/init ?

 Same as always: if several packages install the same file, we have to resolve
the conflict. Nowadays we do that by adding a dependency and either avoiding
installation if it's already there (busybox) or overwriting it (most other cases).

 /sbin/init is currently the big exception to that.


> If you allow to enable busybox' init, sysvinit, and systemd (and later,
> OpenRC) simultaneously, they will all compete to provide /sbin/init,
> with the latest winning over the others...
> 
> (Actually 'None' should really read as 'Custom', because there better be
> an kind of init system, or 'first'application' to start.)

 Not at all. I've used Buildroot to create chroot environment, to create a
toolchain, ...

 Actually, I would like to have an option like BR2_SYSTEM_NONE that just
disables everything (no init, no shell, no passwd, no skeleton except for the
minimal bin,lib,sbin dir/symlink, no busybox, ...). I just never got around to
implement that.


 Regards,
 Arnout
