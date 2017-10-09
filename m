From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 00:08:38 +0200
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <1613988304.12988742.1507565613269.JavaMail.zimbra@datacom.ind.br>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
 <20171004154313.25762-1-casantos@datacom.ind.br>
 <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
 <1613988304.12988742.1507565613269.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1eb061ff-7182-4ee3-15ab-8f2068db4696@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-10-17 18:13, Carlos Santos wrote:
[snip]
>> ncat itself is very small (+- 150K) compared to the rest of nmap (+- 2.5M), so
>> it's not really worth making a config option for it.
>>
>> Conversely, it *could* be worthwhile to have an option
>> BR2_PACKAGE_NMAP_NCAT_ONLY that just installs the ncat tool (+symlink) from the
>> package. So my idea would be:
>>
>> - always build with ncat and install the symlink;
>> - if BR2_PACKAGE_NMAP_NCAT_ONLY is selected, override the install commands to
>> just install ncat + symlink.
>>
>> Perhaps to be sure you can do it as two patches, first one that always enables
>> ncat and installs symlink, second one that adds the BR2_PACKAGE_NMAP_NCAT_ONLY
>> option. That kind of option is a bit controversial (it's a "negative" option
>> because it removes stuff from the nmap package; we generally  prefer additive
>> options instead, but that would be a bit complicated here).
> 
> That's what I did in https://patchwork.ozlabs.org/patch/820503/.
> I can give it a another try but I hope you guys reach an agreement
> about what you want. :-)

 Well, that patch (and its v1 and v2) introduced a virtual package for nc and
AFAICS you only got comments on the virtual package aspect. I don't think
anybody commented on having a BR2_PACKAGE_NMAP_NCAT_ONLY option. You anyway
didn't have that, you had a BR2_PACKAGE_NMAP_NMAP option, but I don't think you
got any direct comments on that choice.

 That said, it's indeed a good idea to converge on the right approach upfront.
Thomas, Peter, what do you think? I'm also adding Yann in Cc, he usually has
bright ideas about this kind of thing. The options (that I see):

1. Current patch, i.e. BR2_PACKAGE_NMAP builds just nmap and
BR2_PACKAGE_NMAP_NCAT builds nmap + ncat.

2. No specific option, always install nmap + ncat if BR2_PACKAGE_NMAP is
selected. Note that this might create a problem if both nmap and netcat-openbsd
are selected, so there should probably be a dependency introduced and a check
that nc doesn't exist yet before creating the symlink.

3. BR2_PACKAGE_NMAP_NCAT_ONLY *disables* nmap.

4. New option BR2_PACKAGE_NMAP_NMAP to build nmap (this option should default y
for backward compatibility). ncat is always built if BR2_PACKAGE_NMAP is
selected. So BR2_PACKAGE_NMAP means ncat, and BR2_PACKAGE_NMAP_NMAP means nmap +
ncat.

5. BR2_PACKAGE_NMAP builds nothing, two new options BR2_PACKAGE_NMAP_NMAP and
BR2_PACKAGE_NMAP_NCAT build nmap resp. ncat. To avoid building nothing, you
could try something like

config BR2_PACKAGE_NMAP
	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NMAP_NMAP

if BR2_PACKAGE_NMAP
config BR2_PACKAGE_NMAP_NMAP
	default y

config BR2_PACKAGE_NMAP_NCAT
endif

but that might give a circular dependency.


>> One more thing though: are the ncat options compatible with those for
>> netcat-openbsd? And I'm talking about the options that are not in busybox or GNU
>> netcat now. If they are not compatible (and a quick look at the man pages tells
>> me that only the -6 and -U options are the same), I feel awkward about creating
>> the symlink: since you need to know which netcat type you're using, you could
>> just as well call ncat directly. And for scripts that don't rely on any of
>> these, the busybox or GNU nc is enough.
> 
> This diversity is already known. Debian/Ubuntu uses netcat-openbsd
> as its nc command while Fedora/RHEL uses nmap-ncat. The user of "nc"
> that I have in mind is virt-manager, which is used to manage libvirtd
> (check https://patchwork.ozlabs.org/patch/814396/).
> 
> virt-manager accesses the target machine via ssh and there it runs nc
> connect to the unix socket on which libvirtd listens. The connection
> script tests what syntax the nc command recognizes.
> 
> Obviously the same restrictions would apply to any software depending
> on nc but already happens, since buildroot provides three different nc
> commands, so I do not consider the diversity a regression.

 OK, makes sense. Perhaps you can add something like this to the commit log.

We symlink 'nc' to ncat, even though ncat does not have the same interface as
netcat-openbsd. However, since Fedora/RHEL install nmap-ncat as 'nc', it can be
assumed that packages that depend on 'nc' know how to deal with this diversity.
For example, the virt-manager package does that. Also user-supplied scripts can
be assumed to do the right thing, since the user also selects whether nmap-ncat
or netcat-openbsd is installed.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
