From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Aug 2018 23:20:01 +0200
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <20180812170703.06be88df@windsurf>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <20180810225051.4f34fb06@windsurf>
 <CANQCQpYDuFNMYrwmWiJefh89NjOMoABQwCSne1sM1=-Kcjt9vA@mail.gmail.com>
 <20180811122954.15470d8a@windsurf>
 <CANQCQpZXCEBy-sxPm+dbHELJm5AD8+Mc9Q2o=C2nUFfgSenViQ@mail.gmail.com>
 <20180812094115.1a17f172@windsurf>
 <CANQCQpam_kU+CdNETW7g9N49MgRhRj6tEQNc8qayzGdJiTWC_A@mail.gmail.com>
 <20180812170703.06be88df@windsurf>
Message-ID: <56dc0519-f8e1-a3f1-8531-053624bd41e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-18 17:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 Aug 2018 07:49:19 -0500, Matthew Weber wrote:
> 
>>> So I don't think we need to wrap "ld", as ld shouldn't be used
>>> directly. The only packages that should use "ld" directly are things
>>> like the Linux kernel or bootloaders.
>>
>> The current hardening approach is trying to cover the cases where
>> packages are still using ld directly and have other incompatible flags
>> set (static/shared/r).  I don't have the exact list but I believe
>> busybox is even one of those and others like valgrind, boost, etc who
>> use the "shared" flag and adding "pie" causes a compile failure.  So
>> we do still need to cover the ld case or go patch packages.
> 
> I find it weird that those packages are using "ld" directly, because if
> that's the case, we would have build failures on some mips64
> configurations.

 In addition, if you call ld directly, the spec file is not used at all... The
spec file is only used by the gcc wrapper.


>> What I could do is move the cc1 spec file conditional add of PIE into
>> the wrapper.  Then leave the LDFLAGS as we have them and the
>> associated spec file that does a conditional add of "pie".  This would
>> prevent us from wrapping the ld tool and keep the existing wrapper
>> approach consistent.

 This indicates the crux of the problem with the wrapper: it is not easy to
detect in the wrapper that we're linking. This is "solved" by specifying the
linker spec file in LDFLAGS, but since many packages (probably) don't use
LDFLAGS, it is not really solved at all... Well, except in the sense that if a
package doesn't look at LDFLAGS, it's not going to get the -pie hardening flag
either so the problem that this patch is fixing will not occur.

 We *can* keep passing -pie in LDFLAGS, and then remove it again in the wrapper
when -shared or -r or -static is present, but it feels weird... Hm, but
apparently we can just always pass -pie in the wrapper, even when we're not
linking. That would solve the issue relatively elegantly within the wrapper.


> If we really need to do some custom logic around ld, then I believe I'd
> prefer to have a wrapper for it as well, to keep things consistent. But
> of course, Arnout's opinion on the matter would be welcome.

 I don't think an ld wrapper is needed. We've discussed this many times already,
and I see less and less reason for it.

 Regards,
 Arnout

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
