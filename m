From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Nov 2018 20:57:41 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
Message-ID: <20181116195741.GV10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2018-11-16 16:22 +0100, Thomas De Schampheleire spake thusly:
> On Fri, Nov 16, 2018, 14:47 Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com wrote:
>   On Thu, 15 Nov 2018 17:41:35 +0100, Andreas Naumann wrote:
[--SNIP--]
>   > I made a patch which moves the _FINAL_DEPENDENCIES preparation to an
>   > additional .stamp-configure-prepare step just before .stamp_configured.
>   > That works but is not particularly beautiful.
> 
>   That is not too bad actually. Semantically speaking, preparing the
>   per-package folders is not really part of the configuration step. It
>   could be logical to do it in a "prepare" step.

And IIRC, you alreqady proposed such a step, specifically to be able to
do the autopreconf for OOT building (which I am still working on, btw).

Maybe this step can be re-used for various pacakges infras, like the
kconfig one, to add preparation steps.

>   The only thing that I dislike a bit with this is that it would no
>   longer be consistent with what we do for download and extract
>   dependencies: we prepare the per-package folders with download and
>   extract dependencies respectively in the download and extract steps. So
>   it would be quite logical to also do the same for the "configuration
>   dependencies" (which we name just "dependencies" in Buildroot).
> 
>   So, this leaves us with 3 options:
> 
>   ?- Keep the dependency preparation within the download, extract and
>   ? ?configure step, as proposed in this v4. This will require changing
>   ? ?the kconfig logic to prepare the configuration file inside the
>   ? ?"configure" step and not as a additional step injected before the
>   ? ?"configure" step.
> 
>   ?- Keep the dependency preparation within the download and extract
>   ? ?steps, and make an exception for the configure step, with a separate
>   ? ?"prepare" step that comes before. Not nice in terms of consistency,
>   ? ?as explained above.
> 
>   ?- Introduce "prepare download", "prepare extract" and "prepare
>   ? ?configure" steps that would do the dependency preparation.
> 
>   > I guess a more proper solution would be to somehow move the
>   > kconfig_fixup code into the configure-step. Maybe use the
>   > pre-configure-hook, any suggestions?
> 
>   I don't recall why they need to be done before the configuration step,
>   but I'm pretty sure there is a reason for that.
> 
>   Yann, Thomas, do you remember ?
> 
> My mind triggers a big red warning light right now, so let's be careful :-)

Yes, we got bitten pretty hard when preparing the kconfig infra. But
what can we remember from an almost-5-year old work initiated after
FOSDEM? ;-)

> The goal is that one can run 'make foo-menuconfig' from a clean tree,
> without first processing (downloading, building, ...) the dependencies
> of foo first.
> If you put this stuff in the configure step of foo, you are bound byi
> its dependencies. There may be other reasons too, not sure.

I am all in favour of simplifying it if it can be made simpler by adding
an official extra 'prepare' step, that exists for all types of package
infras. This we'd have 4 levels of dependencies:

 1- download dependencies
 2- extract dependencies
 3- prepare dependencies
 4- configure dependencies

Currently, 1, 2, and 4 are implemented in a generic way and thus
available to all types of packages, while 3 is implemented only for
kconfig-package, in an ad-hoc way, and used only by the linux kernel to
ensure the toolchain is available before its kconfig is called.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
