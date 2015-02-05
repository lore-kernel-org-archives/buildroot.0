From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 05 Feb 2015 14:44:55 +0100
Subject: [Buildroot] [RFC 2/4] legal-info: allow to declare the actual
 sources for binary packages
In-Reply-To: <54CFF057.2060000@mind.be>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-3-git-send-email-luca@lucaceresoli.net>
 <54CFF057.2060000@mind.be>
Message-ID: <54D373D7.3010402@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
> On 02/01/15 12:43, Luca Ceresoli wrote:
>> The FOO_SITE/FOO_SOURCE variables usually point to a tarball containing
>> source code.
>>
>> For the downloaded external toolchains this is not true, the "source"
>> tarball actually contains binaries. This is fine for making Buildroot
>> work, but for legal-info we really want to ship real source code, not
>> binaries.
>>
>> Luckily, some (hopefully all) toolchain vendors publish a downloadable
>> tarball containing the source code counterpart for their binary
>> packages.
>>
>> Here we allow the user to declare the URL of this other tarball in the
>> pair of variables FOO_ACTUAL_SOURCE_TARBALL (by default equal to
>> FOO_SOURCE) and FOO_ACTUAL_SOURCE_SITE (by default equal to FOO_SITE).
>> If the "actual source" package can be downloaded from the same
>> directory as the binary package, then only FOO_ACTUAL_SOURCE_TARBALL
>> needs to be set.
>>
>> Note this change is not strictly toolchain-specific: it might be useful
>> for other packages that happen to ship binaries in the same way.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>   It is adding even more complexity to the already too complex legal-info target,
> but it doesn't look too bad. Although I would indeed prefer a pre-legal-info
> hook. But even that wouldn't be enough, because the source reference in the
> manifest would still be wrong...

That's right.
Maybe this can be overcome in some (probably ugly) way.

Raise your hand if you'd like to see:
   FOO_TOOLCHAIN_EXTERNAL_URL_TO_WRITE_IN_LEGAL_MANIFEST = <...>

Did you discuss this patches with the other developers at the Buildroot
meeting earlier this week? Overall, what do people think about this
approach? Would it be even worth trying the hook-based implementation?

Concerning the legal-info target complexity I fully agree with you.
Some day I'd like to try to move the whole legal-info machinery out in
a helper script, much like what Yann did for the download mechanisms.
Not sure it's feasible, but it would probably make things cleaner.

>> @@ -684,13 +690,20 @@ else
>>   # Other packages
>>
>>   ifeq ($$($(2)_REDISTRIBUTE),YES)
>> +ifeq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
>> +	@$(call legal-warning,the toolchain source code has not been saved)
>
>   So, this only works for the toolchain :-)
>
>   If you keep this approach rather than the pre-legal-info-hook, then you
> probably want to use $(1) instead of toolchain. 'toolchain-external' should be
> sufficiently understandable.

Sure, will do.

>
>> +else
>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>> +	$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))
>
>   I think the $($(PKG)_SITE:/=) construct was just introduced because for some
> packages, the _SITE ends with a / and that should be stripped, and we were too
> lazy to fix the packages. Hm, looks like all the the external toolchain _SITEs
> end with a /...

So I'll remove all of those '/'s from toolchain-external.mk first...

Regards,
-- 
Luca
