From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Apr 2019 19:53:43 +0200
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <cacfd25b-8a0e-dfe0-185b-2cff5b0d473c@mind.be>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be>
 <20190418145344.GA21166@scaer>
 <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
 <bc9c8aa1-9c56-7c86-9b3f-2cd66a91f796@mind.be>
 <20190420205404.GC21166@scaer>
 <cacfd25b-8a0e-dfe0-185b-2cff5b0d473c@mind.be>
Message-ID: <20190421175343.GD21166@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-04-21 09:30 +0200, Arnout Vandecappelle spake thusly:
>  Hi Yann,
> 
> On 20/04/2019 22:54, Yann E. MORIN wrote:
> > Vadim, Arnout, All,
> > 
> > Here's my take on the topic (still WIP, but mostly there, needs commit
> > log):
> > 
> >     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/br2-ext-toolchain
> > 
> > I'll be off until Monday, when I'll write proper commit log before
> > submitting it.
> 
>  A few comments:
> 
> - The rule for internal variables being prefixed by BR_ instead of BR2_ is
> written down, in some BR developer days report.

I wouldn't qualify something that is hidden deep down an old dev-days
report, a rule that is documented. ;-) But OK, I'll amend the commit
log.

> - Bikeshed: call the "dir" variable "outputdir" or something that makes it clear
> it's the output.

Are you sure? I'd like more feedback on the vriable before I rename it.
Can we at least agree that this vairiable is a directory and as such
warrants being named something with 'dir' in the name? If we do agree,
then I suggest we plan on a meeting where all interested parties can
voice their opinion and suggest alternate naming? ;-)

> - For the removal of prepare-kconfig, maybe mention that it reverts
> 9429e7b698638399ecfd73aa37545594f253a074

I see reverts as a way to state "this was incorrect, so we undo it", and
this is definitely not the case here; this is technically not a revert.

> - I think it's worth adding a flag that checks if there is any external
> toolchain at all, and to put a comment in br2-external.toolchains.in why it is
> empty.

Can do too.

Thanks for the erarly feedback! :-)

But I have another pain-point to addres here: I'd like the br2-external
trees to be able to provide other types of packages for which we have a
choice. Besides toolchains, I can directly see libjpeg, where some
vendors have an optimised library that benefts from hardware
acceleration. So, rather than come up with something ad-hoc for
toolchais, I'd prefer a generic solution, like so:

    br2-external/provides/toolchain.in
    br2-external/provides/libjpeg.in
    br2-external/provides/openssl.in

And those would be included in the corresponding choices. My final
series will include this solution (which is up for debate, I agree).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
