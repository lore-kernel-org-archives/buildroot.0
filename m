From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Sat, 15 Oct 2016 15:35:13 -0300 (BRT)
Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more
 conservative	about git special refs
In-Reply-To: <20161015090018.GB3668@free.fr>
References: <cover.1470004037.git.yann.morin.1998@free.fr>
 <de318be75bdcad45f90ddb81d86911b72951e607.1470004037.git.yann.morin.1998@free.fr>
 <1396149584.763951.1472045558046.JavaMail.zimbra@datacom.ind.br>
 <20161015090018.GB3668@free.fr>
Message-ID: <936204295.1060415.1476556513870.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

----- Mensagem original -----
> De: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Para: "ricardo martincoski" <ricardo.martincoski@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Enviadas: S?bado, 15 de outubro de 2016 6:00:18
> Assunto: Re: [Buildroot] [PATCH 2/2 v2] support/download: be more conservative	about git special refs

> Ricardo, All,
> 
> Sorry for the delay...
> 
> On 2016-08-24 10:32 -0300, Ricardo Martincoski spake thusly:
>> ----- Original Message -----
>> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > To: buildroot at buildroot.org
>> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > Sent: Sunday, July 31, 2016 7:35:56 PM
>> > Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more conservative
>> >	about git special refs
>> > The git special refs (e.g. Github PRs, Gerrit changes...) are not
>> > retrieved on non-bare clones; we need to fetch them manually.
>> > 
>> > However, we need not fetch any cset that is not such a special ref; it
>> > only generates warning messages that are *really* confusing.
>> > 
>> > Instead, we now check if we have the cset we need, and only when it is
>> > missing do we explicitly request it.
>> > 
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > Cc Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>> > ---
>> > support/download/git | 8 ++++++--
>> > 1 file changed, 6 insertions(+), 2 deletions(-)
>> > 
>> > diff --git a/support/download/git b/support/download/git
>> > index e3be2e1..1c08c17 100755
>> > --- a/support/download/git
>> > +++ b/support/download/git
>> > @@ -66,8 +66,12 @@ pushd "${basename}" >/dev/null
>> > # below, if there is an issue anyway. Since most of the cset we're gonna
>> > # have to clone are not such special refs, consign the output to oblivion
>> > # so as not to alarm unsuspecting users, but still trace it as a warning.
>> > -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>> > -    printf "Could not fetch special ref '%s'; assuming it is not special.\n"
>> > "${cset}"
>> > +#
>> > +# Only try to fetch such a special ref if we do not already have the
>> > +# cset we need locally.
>> > +#
>> > +if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
>> > +    _git fetch origin "'${cset}:${cset}'"
>> 
>> A question more related to 13c89c2f than to this patch, but anyway...
>> 13c89c2f support/download/git: do not use bare clones
>> 
>> When cset is a special ref, e.g. refs/changes/80/22580/2, this 'git fetch' works
>> fine.
>> But when cset is a sha1 of a special ref, since 13c89c2f the checkout fails
>> AFAIK because git server using default configuration does not upload
>> unreachable sha1.
>> 
>> Maybe we could translate the sha1 to a named ref when we assume we are about to
>> ask for a special ref. Something like this...
>> 
>> if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
>>     named_ref=$(_git ls-remote "'${repo}'" 2>&1 | grep "^${cset}" | cut -f2)
>>     if [ -n "$named_ref" ]; then
>>         _git fetch origin "'${named_ref}:${named_ref}'"
>>     else
>>         _git fetch origin "'${cset}:${cset}'"
>>     fi
>> fi
>> 
>> What do you think?
> 
> I don't use such "special refs", so I can't really state whether it is
> good or not. If there was a publicy-reachable tree I could test against,
> that would be nice. Do you know of such atree (even for a package not in
> Buildroot)?
> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I guess openswitch project have a lot of gerrit managed repositories. This can be used as examples and tests for Ricardo suggestion.

https://review.openswitch.net/#/admin/projects/

One particular sub-project

https://review.openswitch.net/#/admin/projects/openswitch/ops

git clone

git clone https://review.openswitch.net/openswitch/ops

And then it is possible to make a buildroot recipe to download and test this package with and without special_refs.

But it is important to say that we are using Ricardo suggestion in our buildroot-upstream cloned repository, that is based in 2016.08 tag, without any problems. Indeed, the solution has solved some problems, so i can say it has been exhaustively tested.

Our buildroot-upstream repo has this deliveries related to the subject, just for the sake of completeness:

git log -n8 --oneline

6283402 support/download/git: allow sha1 of special refs (v2)
35b9416 Revert "support/download/git: allow sha1 of special refs"
81523bc support/download/git: allow sha1 of special refs
e415a54 support/download/git: Fix compatibility issue with git older than 1.8.4
11e9a47 support/download: don't over-remove files from git archives
cf98e0a support/download/git: add support for submodules
a34d5e7 support/download/git: do not use git archive, handle it manually
5fc0731 support/download/git: do not use bare clones

The first three i think are in our tree only, and are the subject of this review.

Thanks a lot
-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
