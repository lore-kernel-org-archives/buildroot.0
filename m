From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 25 Jun 2014 09:51:57 +0200
Subject: [Buildroot] [PATCH v2 3/3] Makefile: do not add to targets
	common dependencies
In-Reply-To: <53A81ED0.5070309@mind.be>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
 <53A4C860.7090601@mind.be>
 <CAHkwnC8OEjEchUSmgXeVpwg6jiPc1WCt4YF4CmPGJZwBrBVTxA@mail.gmail.com>
 <53A81ED0.5070309@mind.be>
Message-ID: <CAHkwnC_cfWo7MiDnXT+yN4OxNkUxQ_TJW0cmfSo1Sv=0+PgqVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2014 at 2:34 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 23/06/14 11:51, Fabio Porcedda wrote:
>> On Sat, Jun 21, 2014 at 1:48 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 20/06/14 10:26, Fabio Porcedda wrote:
>>>> Remove the rule that add common dependencies to every targets in the
>>>> "TARGETS" variable because all those targets are packages that use the package
>>>> framework that already add common dependencies.
>>
>> I will update the description with a better description:
>>
>> Remove the rule that add common dependencies to every targets in the
>> "TARGETS" variable because all those targets are packages that use the
>> package framework or they depends on targets that use the package
>> framework, because the package framework already add common dependencies
>> this rule it's useless.
>
>  Several spelling issues here; corrected text:
>
> Remove the rule that adds common dependencies to every target in the
> "TARGETS" variable, because all those targets are packages that use the
> package infrastructure or they depend on targets that use the package
> infrastructure. The package infrastructure already adds common dependencies.
> Therefore, this rule is useless.

Thanks a lot, I've updated the description.

>
>>
>>>  There are still two targets that don't:
>>>
>>> - target-generatelocales - should probably be converted to a
>>> TARGET_FINALIZE_HOOK as well;
>>
>> I will do:
>>
>> ifneq ($(GENERATE_LOCALE),)
>> TARGETS+=host-localedef
>
>  Spaces around +=
>
>  Otherwise it's perfect.

Ok.

>> define GENERATE_LOCALE_HOOK
>> ...
>> endif
>> TARGET_FINALIZE_HOOKS += GENERATE_LOCALE_HOOK
>> endif
>>
>>> - toolchain-eclipse-register - doesn't need to depend on anything I think, but
>>> anyway could also be converted to a TARGET_FINALIZE_HOOK.
>>
>> It depends on the toolchain target, but the toolchain is always built
>> so it's safe to convert to a hook.
>
>  Actually, the toolchain is not always built, e.g. 'make host-foo' will not
> build it. Also if you haven't selected any target package, it won't be built.
> But that's a bit far-fetched I guess.

With "the toolchain is always built" I was speaking about when
$(TARGET_FINALIZE_HOOKS) are executed because those hooks are executed
only after $(TARGETS) are built.
The "toolchain" is always built, even when no target packages are
selected because in "toolchain/Config.in" there is:

# Invisible option that makes sure the toolchain package always gets
# built
config BR2_TOOLCHAIN
        bool
        default y

>  And anyway, the toolchain-eclipse-register target doesn't really depend on the
> toolchain - it just creates a file that refers to it. Right?
<snip>

Well, it seems to depend on it, it fails if the toolchain dependency is removed:

./support/scripts/eclipse-register-toolchain `readlink -f output`
i686-buildroot-linux-uclibc- "i686"
Cannot find the cross-compiler in the project directory
make: *** [toolchain-eclipse-register] Error 1


I will send two additional patches to convert those targets.

Best regards
-- 
Fabio Porcedda
