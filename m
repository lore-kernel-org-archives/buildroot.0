From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 9 Oct 2017 13:13:33 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
 <20171004154313.25762-1-casantos@datacom.ind.br>
 <f45e607f-ebff-129a-0064-de7fa4255be6@mind.be>
Message-ID: <1613988304.12988742.1507565613269.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Sent: Friday, October 6, 2017 4:58:19 PM
> Subject: Re: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"

> Hi Carlos,
> 
> Sorry to iterate yet another time on this patch...
> 
> On 04-10-17 17:43, Carlos Santos wrote:
>> Ncat is a much-improved reimplementation of the venerable Netcat and is
>> compatible with uClibc.
>> 
>> So far the "nc" options available to build with uClibc were the ancient
> 
> uClibc and musl.

OK

>> GNU netcat and its Busybox double (the openbsd-netcat package cannot be
> 
> The package is called netcat-openbsd.

OK

>> used because it requires GLIBC). Both lack features available in modern
>> netcats like IPv6, proxies, and Unix sockets.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> [snip]
>> diff --git a/package/nmap/Config.in b/package/nmap/Config.in
>> index 79f587afd1..a2e330dacd 100644
>> --- a/package/nmap/Config.in
>> +++ b/package/nmap/Config.in
>> @@ -11,6 +11,19 @@ config BR2_PACKAGE_NMAP
>>  
>>  	  http://nmap.org
>>  
>> +if BR2_PACKAGE_NMAP
>> +
>> +config BR2_PACKAGE_NMAP_NCAT
>> +	bool "nmap-ncat"
> 
> ncat itself is very small (+- 150K) compared to the rest of nmap (+- 2.5M), so
> it's not really worth making a config option for it.
> 
> Conversely, it *could* be worthwhile to have an option
> BR2_PACKAGE_NMAP_NCAT_ONLY that just installs the ncat tool (+symlink) from the
> package. So my idea would be:
> 
> - always build with ncat and install the symlink;
> - if BR2_PACKAGE_NMAP_NCAT_ONLY is selected, override the install commands to
> just install ncat + symlink.
> 
> Perhaps to be sure you can do it as two patches, first one that always enables
> ncat and installs symlink, second one that adds the BR2_PACKAGE_NMAP_NCAT_ONLY
> option. That kind of option is a bit controversial (it's a "negative" option
> because it removes stuff from the nmap package; we generally  prefer additive
> options instead, but that would be a bit complicated here).

That's what I did in https://patchwork.ozlabs.org/patch/820503/.
I can give it a another try but I hope you guys reach an agreement
about what you want. :-)

> One more thing though: are the ncat options compatible with those for
> netcat-openbsd? And I'm talking about the options that are not in busybox or GNU
> netcat now. If they are not compatible (and a quick look at the man pages tells
> me that only the -6 and -U options are the same), I feel awkward about creating
> the symlink: since you need to know which netcat type you're using, you could
> just as well call ncat directly. And for scripts that don't rely on any of
> these, the busybox or GNU nc is enough.

This diversity is already known. Debian/Ubuntu uses netcat-openbsd
as its nc command while Fedora/RHEL uses nmap-ncat. The user of "nc"
that I have in mind is virt-manager, which is used to manage libvirtd
(check https://patchwork.ozlabs.org/patch/814396/).

virt-manager accesses the target machine via ssh and there it runs nc
connect to the unix socket on which libvirtd listens. The connection
script tests what syntax the nc command recognizes.

Obviously the same restrictions would apply to any software depending
on nc but already happens, since buildroot provides three different nc
commands, so I do not consider the diversity a regression.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
