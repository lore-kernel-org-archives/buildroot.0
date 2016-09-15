From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 23:25:31 +0200
Subject: [Buildroot] Unsafe header/library path issue with
 <pkg>_OVERRIDE_SRCDIR
In-Reply-To: <1473888651.1807.14.camel@embedded.rocks>
References: <1473798580.17229.35.camel@embedded.rocks>
 <e6dd0208-3c72-762b-799c-cc8b9ecfb79f@mind.be>
 <1473888651.1807.14.camel@embedded.rocks>
Message-ID: <3464c58b-d2e4-2b36-f8f5-ee94ff3cbb1e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-16 23:30, J?rg Krause wrote:
> Hi,
> 
> On Mi, 2016-09-14 at 02:13 +0200, Arnout Vandecappelle wrote:
>>
>> On 13-09-16 22:29, J?rg Krause wrote:
>>>
>>> Hi,
>>>
>>> I have an issue when using an autotools package cloned with git.
>>> The
>>> clone is added to <pkg>_OVERRIDE_SRCDIR, e.g.
>>>
>>> LIBUPNPP_OVERRIDE_SRCDIR=/home/me/override/libupnpp
>>>
>>> As this git clone has no configure file autoreconf needs to be run
>>> first. This is currently not supported by the autotools
>>> infrastructure.
>>> So I have to choices:
>>>
>>> 1) Add <pkg>_AUTORECONF=YES
>>> 2) Add <pkg>_PRE_CONFIGURE_HOOKS which runs the packages autogen.sh
>>
>>  Or the third choice: run autogen manually (once) in your override
>> source dir.
>> This way the libtool patch will still be applied and your worries are
>> over. And
>> it completely avoids the need to patch buildroot just because you
>> have an
>> override sourcedir.
> 
> Yes, that would propably be the best option. However, Buildroot does
> not apply the libtool patch for the override source directory build -
> there is no "Patching libtool" message printed and the install process
> aborts with the unsafe header/library error.

 Ah, that's right, the libtool patch is a post-patch hook.

 Perhaps it would be better to always make it a pre-configure hook.

[snip]
>>> Is it possible for Buildroot to detect if autoreconf has to be run
>>> for
>>> override sources?
>>
>>  Yes: use _AUTORECONF = YES. That will make sure that libtool is
>> patched after
>> autoreconf has run, and it will also add the required dependencies to
>> the package.
> 
> Sorry, but I meant without setting AUTORECONF. I would prefer not to
> alter the .mk file for each override package.

 Er, your alternative was to add a PRE_CONFIGURE_HOOK, so you still need to
change the package, no?


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
