From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Dec 2018 10:35:05 +0100
Subject: [Buildroot] Stack protector choices [was: [PATCH v2,
 2/2] lxc: fix build without stack protector]
In-Reply-To: <20181204091029.01a78c0e@windsurf>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
 <20181204091029.01a78c0e@windsurf>
Message-ID: <42790e46-35a7-299a-cbae-4b83383287a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/12/2018 09:10, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout, Peter, Yann in Cc.
> 
> On Tue, 4 Dec 2018 07:54:39 +0200, Baruch Siach wrote:
> 
>>> +LXC_CONF_ENV = ax_cv_check_cflags__Werror__fstack_protector_strong=no  
>>
>> Can't we make this depend on BR2_TOOLCHAIN_HAS_SSP? See the packages ntp or 
>> sox, for example.
> 
> The question is whether we want SSP support to be enabled as soon as
> the toolchain *has* SSP support, or only when the user explicitly
> request SSP support using BR2_SSP_{REGULAR,STRONG,ALL} ?
> 
> This is a real policy decision:
> 
>  - Do we let the packages default to what they think is good (of course
>    as long as the toolchain provides what's needed) ?
> 
>  - Or do we enforce the system-level configuration options that
>    Buildroot has ?

 If you look at it from a practical point of view, we can only do option (1), or
"we sometimes enforce the system-level configuration options, but not
consistently". Indeed, if a package does the stack protector detection
correctly, chances are we'll never even notice that it enables stack protector.
So option (2) is simply not realistic.

 So in practice, I think the policy should be (as it is for other policy
options, e.g. debug):

1. If there is no configuration option for it, let the package decide.

2. If there is a configuration option that does the same as our option, disable
it and let the toolchain wrapper apply the correct option.

3. If there is a configuration option and it does something more, enable it
automatically based on the global Buildroot option.

4. In very exceptional cases where (3) is even more invasive, offer an option to
the user (but only if the toolchain supports it, of course).

 An example of (3) would be the kernel's stack protector which is a little more
than just -fstack-protector so it needs to be enabled explicitly. An example of
(4) would be -fsanitize=address vs. KASAN - KASAN is a way more invasive
operation than gcc's address sanitizer. Note that specifically for the kernel,
we of course always do (4) - kernel config is provided separately. But the
kernel is just an easy example that everybody knows.

 Regards,
 Arnout
