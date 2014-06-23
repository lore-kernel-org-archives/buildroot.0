From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 23 Jun 2014 11:51:01 +0200
Subject: [Buildroot] [PATCH v2 3/3] Makefile: do not add to targets
	common dependencies
In-Reply-To: <53A4C860.7090601@mind.be>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-4-git-send-email-fabio.porcedda@gmail.com>
 <53A4C860.7090601@mind.be>
Message-ID: <CAHkwnC8OEjEchUSmgXeVpwg6jiPc1WCt4YF4CmPGJZwBrBVTxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 21, 2014 at 1:48 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/06/14 10:26, Fabio Porcedda wrote:
>> Remove the rule that add common dependencies to every targets in the
>> "TARGETS" variable because all those targets are packages that use the package
>> framework that already add common dependencies.

I will update the description with a better description:

Remove the rule that add common dependencies to every targets in the
"TARGETS" variable because all those targets are packages that use the
package framework or they depends on targets that use the package
framework, because the package framework already add common dependencies
this rule it's useless.

>  There are still two targets that don't:
>
> - target-generatelocales - should probably be converted to a
> TARGET_FINALIZE_HOOK as well;

I will do:

ifneq ($(GENERATE_LOCALE),)
TARGETS+=host-localedef
define GENERATE_LOCALE_HOOK
...
endif
TARGET_FINALIZE_HOOKS += GENERATE_LOCALE_HOOK
endif

> - toolchain-eclipse-register - doesn't need to depend on anything I think, but
> anyway could also be converted to a TARGET_FINALIZE_HOOK.

It depends on the toolchain target, but the toolchain is always built
so it's safe to convert to a hook.

>
>  So neither of these are really critical.

The only advantage to convert those targets to hooks is for consistency?

BTW: Both of those targets depends on the toolchain target that use
the package framework so they have already the common dependencies.

>  Also, you forgot you Sob.

Yes, thanks.

BR
-- 
Fabio Porcedda
