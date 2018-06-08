From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 8 Jun 2018 21:58:17 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <20180608173428.GE2090@scaer>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
 <20180606185136.GA2537@scaer> <81235112-f5f8-dbed-ac99-7942c003b898@mind.be>
 <1148643526.1795245.1528413126545.JavaMail.zimbra@datacom.com.br>
 <5675dcb9-67cc-d09e-6c5b-de0522996a20@mind.be> <20180608173428.GE2090@scaer>
Message-ID: <b9477842-1454-1ac4-3676-8c62b667db0a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-06-18 19:34, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2018-06-08 09:48 +0200, Arnout Vandecappelle spake thusly:
>> On 08-06-18 01:12, Carlos Santos wrote:
> [--SNIP--]
>>> BTW, it took me some time to understand the dual personality of TARGET_DIR
>>> in fs/common.mk and the role of BASE_TARGET_DIR. Then I found the line in
>>> the top Makefile with
>>>
>>>   TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
>>>
>>> I understand that this trick avoids changing fs/*/*.mk replacing each
>>> reference to TARGET_DIR by a ROOTFS_<FOO>_TARGET_DIR but it reduces
>>> the readability a lot. I'm compelled to restore it to how it was prior
>>> to commit 7e9870ce32d.
>>
>>  The same (or a similar) trick will be applied to the normal packages for
>> per-package host/staging/target (which is ultimately needed for top-level
>> parallel build). If we want to avoid it there, we would have to change 785
>> package.mk files, and also many package definitions in BR2_EXTERNALs that we
>> don't control...
>>
>>  That said, I would also prefer to use explicit $(FOO)_TARGET_DIR variables. But
>> doing so *will* require legacy handling.
>>
>>  Maybe we should indeed use explicit ROOTFS_$(ROOTFS)_TARGET_DIR in our rootfs
>> definitions, document that that is the one to use, and wait a year or two before
>> deprecating TARGET_DIR entirely.
>>
>>  Yann?
> 
> Well, It is really cumbersome to have to prefix that directory with the
> package name or the rootfs name... TARGET_DIR is just plainly easy to
> use.d

 I don't agree with that - we use FOO_SOME_VARIABLE all over the place in
package foo, so using FOO_TARGET_DIR feels quite natural to me.

> Especially since we would break a long-established variable name.

 That's the worst reason ever :-) Except that indeed there should be a (long)
transition period where the old name is still supported, but we don't use it
internally.


> And it is not the only variable that changes its content based on the
> current package: $(@D) and $(@) et al. Yes, they are make special
> variables, but so?

 That makes a huge difference - people know those variables.

 And anyway, I wouldn't mind to use $(FOO_BUILD_DIR) instead of $(@D). I think
that is easier for people to understand. $(@D) just happens to work because the
stamp files are created in the build directory, which IMO is an implementation
detail that shouldn't leak into the packages.


 Regards,
 Arnout


> In the end, I still fail to see the problem. But I am usual pretty
> stubborn, so... ;-)
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
