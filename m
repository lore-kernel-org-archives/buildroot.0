From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 12:26:03 +0200
Subject: [Buildroot] [PATCH] relocate-sdk: Allow relocating to any
 location
In-Reply-To: <CADjhFRDi9hOA7u9xinmPSuoWvNhyZDBErbfpSwpOO4o+Gh3v4g@mail.gmail.com>
References: <20200328234945.12552-1-glex.spb@gmail.com>
 <20210717093954.GJ12203@scaer>
 <CADjhFRDi9hOA7u9xinmPSuoWvNhyZDBErbfpSwpOO4o+Gh3v4g@mail.gmail.com>
Message-ID: <20210717102603.GQ12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Gleb, All,

Thanks for the feedback.

On 2021-07-17 11:08 +0100, Gleb Mazovetskiy spake thusly:
> This fixes a minor frustrating issue. It addresses the following scenario:
> 1. I'm the SDK maintainer. I tell users to unpack to a specific directory. E.g. /opt/mysdk.
> 2. I build the SDK in such a way that the users do not need to run relocate-sdk.sh if they unpack to /opt/mysdk.
> The problem is with step 2: currently it requires the build process to move the SDK to /opt/mysdk, then run relocate-sdk.sh, before
> producing the final tarball.
> This is often problematic because on the SDK maintainer's machine, `/opt/mysdk` usually already exists and contains the latest
> stable release.
> With this new argument, the build process can be simplified for the SDK maintainer.

The problem with that, is that users are not free to have the SDK where
they want.

That would prevents them from having multiple versions of the SDK
installed at once (e.g. when they have to work on a maintenance branch
to fix bugs in an older releae for example), without removing an SDK
before they install a new one.

And as a consequence, that also prevents the person responsible for the
SDK, to work on older SDK to pinpoint issues without removing the
"latest" SDK first...

I don't think this is a good way to use the SDK... I think the
relocation step should really be run by the person extracting and using
the SDK, on their machine.

I'm still leaving this patch pending, because I still feel the burn from
last time, so if another maintainer is interested in this, they will
have to apply it (and expand the commit log to carry the explanations
you provided in this reply, thanks!).

Regards,
Yann E. MORIN.

> On Sat, Jul 17, 2021 at 10:39 AM Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
> 
>   Gleb, All,
> 
>   On 2020-03-28 23:49 +0000, Gleb Mazovetskiy spake thusly:
>   > Previously, the script could only relocate to the current location.
> 
>   I am not sure to understand what you mean...
> 
>   The SDK can already be relocated to any location:
> 
>   ? ? $ cd /path/to/anywhere
>   ? ? $ tar xf /path/to/sdk.tar
>   ? ? $ ./relocate-sdk
> 
>   > This caused issues for SDK maintainers, as the default target location
>   > (e.g. /opt/my-sdk) would need to be created and the content copied
>   > to it during the build process, which is error-prone.
>   >
>   > With this change you can now pass a target location argument to
>   > ./relocate-sdk.sh (this does not move the directory).
> 
>   I fail to see the purpose for that... If the SDK is not there, what is
>   the point of relocating to a location where the SDK is not?
> 
>   Eventually, the user will have to either extract the SDK in the proper
>   location, or move it there, so whether they are able to run the script
>   prior to the move does not seem very interesting...
> 
>   So, I am far from convinced by this change... :-(
> 
>   Additionally, last time I had to touch on the SDK topic, I got seriously
>   burnt, so I'd like that people that have a better grasp, the history, and
>   some beliefs, in the SDK, look at that patch, please...
> 
>   Regards,
>   Yann E. MORIN.
> 
>   > ---
>   >? support/misc/relocate-sdk.sh | 19 ++++++++++++-------
>   >? 1 file changed, 12 insertions(+), 7 deletions(-)
>   >
>   > diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
>   > index caabeaa6f6..981d272425 100755
>   > --- a/support/misc/relocate-sdk.sh
>   > +++ b/support/misc/relocate-sdk.sh
>   > @@ -1,15 +1,20 @@
>   >? #!/bin/sh
>   > -#
>   > -if [ "$#" -ne 0 ]; then
>   > -? ? echo "Run this script to relocate the buildroot SDK at that location"
>   > +
>   > +if [ "$#" -gt 1 ]; then
>   > +? ? echo "Usage: $0 [path]"
>   > +? ? echo "Run this script to relocate the buildroot SDK to the current location"
>   > +? ? echo "If [path] is given, sets the location to [path] (without moving it)"
>   >? ? ? exit 1
>   >? fi
>   >?
>   > -LOCFILE="share/buildroot/sdk-location"
>   > -FILEPATH="$(readlink -f "$0")"
>   > -NEWPATH="$(dirname "${FILEPATH}")"
>   > +cd "$(dirname "$(readlink -f "$0")")"
>   > +if [ "$#" -eq 1 ]; then
>   > +? ? NEWPATH="$1"
>   > +else
>   > +? ? NEWPATH="${PWD}"
>   > +fi
>   >?
>   > -cd "${NEWPATH}"
>   > +LOCFILE="share/buildroot/sdk-location"
>   >? if [ ! -r "${LOCFILE}" ]; then
>   >? ? ? echo "Previous location of the buildroot SDK not found!"
>   >? ? ? exit 1
>   > --
>   > 2.20.1
>   >
>   > _______________________________________________
>   > buildroot mailing list
>   > [2]buildroot at busybox.net
>   > [3]http://lists.busybox.net/mailman/listinfo/buildroot
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 561 099 427 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [4]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. mailto:buildroot at busybox.net
> 3. http://lists.busybox.net/mailman/listinfo/buildroot
> 4. http://ymorin.is-a-geek.org/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
