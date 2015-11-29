From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 21:31:37 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
 installation
In-Reply-To: <20151129192708.5120d6a3@free-electrons.com>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
 <20151129185859.3fa69ae8@free-electrons.com> <20151129181007.GF3630@free.fr>
 <20151129192708.5120d6a3@free-electrons.com>
Message-ID: <565B60A9.7030706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-11-15 19:27, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 29 Nov 2015 19:10:07 +0100, Yann E. MORIN wrote:
> 
>> Well, I for one would prefer we fail right on the culprit package,
>> rather than port-pone the check until the end. This way, it is obvious
>> which package is the cuplrit.
> 
> It's a matter of trade-off between the benefits and the additional
> complexity. IMO, the benefits of failing immediately on the culprit
> package are not that big. When we'll look at the incorrectly installed
> files, it will in 99% of the cases be obvious from which packages the
> files are coming, and in the 1% remaining cases, a simple "find" on a
> file with a name that isn't too generic will give us the answer.

 And in addition, in 99% of the cases this failure will occur for a package that
was just added.

> 
>> Except we now have a file-> package mapping (thanks to your graph-size),
>> so we could re-use that in a target-inalise hook, indeed.
>>
>> Well, except maybe not... Can target-finalise be called before we have
>> all the host packages (most notably the filesystem image generators)?
> 
> The dependencies of rootfs generators are added to PACKAGES, so they
> are built before target-finalize:
> 
> in fs/common.mk:
> 
> PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
> 
> in Makefile:
> 
> target-finalize: $(PACKAGES)
> 
>>> Or alternatively, use the existing instrumentation hooks.
>>
>> Arnout did not like that, hence why I put in the common install rule.
> 
> What was Arnout reasoning?

 The hooks make it more difficult to find out where the commands that are being
executed come from. This makes it more difficult for an infra developer to
understand what's going on exactly.

 Your proposal of creating a new .mk file for the checks would significantly
decrease the impact of this issue, since in that case an infra developer knows
to look in four places:

- the _CMDS definition in the package.mk;
- the default _CMDS definition in pkg-<buildsystem>.mk
- the %-rule in pkg-generic.mk;
- the hooks in pkg-checks.mk.

 Four places is still worse than three, but we do need the hooks so we'll always
have those four places.

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
