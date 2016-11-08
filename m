From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 02:00:46 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
 toolchain-external-package
In-Reply-To: <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-5-arnout@mind.be>
 <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
Message-ID: <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 23:16, Romain Naour wrote:
> Le 07/11/2016 ? 02:19, Arnout Vandecappelle (Essensium/Mind) a ?crit :
>> The toolchain-external-package infrastructure is just a copy of the
>> toolchain-external commands, replacing TOOLCHAIN_EXTERNAL by $(2)
>> and adding double-dollars everywhere.
>>
>> toolchain-external itself is converted to a virtual package, but it
>> is faked a little to make sue the toolchains that haven't been
>> converted to toolchain-external-package yet keep on working.
>>
>> The TOOLCHAIN_EXTERNAL_MOVE commands don't have to be redefined
>> for every toolchain-external-package instance, so that is moved
>> out into the common part of pkg-toolchain-external.mk.
>>
>> The musl-compat-headers dependency stays in the toolchain-external
>> package itself.
>>
>> The musl ld link is duplicated in the legacy toolchain-external and
>> the toolchain-external-package, because they have separate hooks.
>>
>> The handling of TOOLCHAIN_EXTERNAL_BIN deserves some special attention,
>> because its value will be different for different
>> toolchain-external-package instances. However, the value only depends
>> on variables that are set by Kconfig (BR2_TOOLCHAIN_EXTERNAL_PREFIX
>> and BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD) so it can easily be used in
>> the generic part. So we don't have to do anything specific for this
>> variable after all.
> 
> About the TOOLCHAIN_EXTERNAL_BIN definition for ADI bfin toolchains
> (BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX), I dropped it in my series but it
> looks suspicious how it can worked for me...
> 
> The tarballs contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> which themselves contain the toolchain, so we still need to add the toolchain
> prefix...

 Yes, the ADI blackfin toolchains are a kind of multilib toolchain, but instead
of multilib it's actually two toolchains installed side by side.

 I'm thinking to either:
- drop support for ADI blackfin toolchains, since our internal toolchain works
fine now and we have lots of autobuilder exceptions for this toolchain; and/or
- remove BR2_BFIN_INSTALL_FDPIC/FLAT_SHARED, which will allow us to install only
one of the two toolchains and thus avoids the issue entirely.

[snip]
>> +# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
>> +# So, add the musl-compat-headers package that will install those files,
>> +# into the staging directory:
>> +#   sys/queue.h:  header from NetBSD
>> +#   sys/cdefs.h:  minimalist header bundled in Buildroot
>> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>> +TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
>> +endif
> 
> This hunk has moved to phg-toolchain-external.mk in patch 3/22 and now come back
> to toolchain-external.mk with this patch.

 I realized that. It's a bit of historical accident, because I already had patch
2 and 3 moving this hunk around, and then in patch 4 I realized it was the wrong
place all along. But then I thought it was actually useful to have this hunk
explicitly to draw attention to it, because it is a bit special: it's about the
toolchain-external virtual package, while all the rest of the variables are
about the toolchain-external-* packages.

 I even considered renaming all the variables in pkg-toolchain-external to
something else, to make the distinction clear, but then it was 2am and I gave up :-)

 Hm, it's 2am now as well... Time to give up!

 Regards,
 Arnout

> 
> Otherwise:
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Best regards,
> Romain
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
