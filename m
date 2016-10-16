From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 16 Oct 2016 04:10:16 -0200
Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more
 conservative about git special refs
References: <936204295.1060415.1476556513870.JavaMail.zimbra@datacom.ind.br>
Message-ID: <580319c8a5afc_267712db530502f8@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 15, 2016 at 03:35 PM, Henrique Marks wrote:

> Hello all
> 
> ----- Mensagem original -----
>> De: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Para: "ricardo martincoski" <ricardo.martincoski@datacom.ind.br>
>> Cc: buildroot at buildroot.org
>> Enviadas: S?bado, 15 de outubro de 2016 6:00:18
>> Assunto: Re: [Buildroot] [PATCH 2/2 v2] support/download: be more conservative	about git special refs
> 
>> Ricardo, All,
>> 
>> Sorry for the delay...
>> 
>> On 2016-08-24 10:32 -0300, Ricardo Martincoski spake thusly:
[snip]
>>> Maybe we could translate the sha1 to a named ref when we assume we are about to
>>> ask for a special ref. Something like this...
>>> 
>>> if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
>>>     named_ref=$(_git ls-remote "'${repo}'" 2>&1 | grep "^${cset}" | cut -f2)
>>>     if [ -n "$named_ref" ]; then
>>>         _git fetch origin "'${named_ref}:${named_ref}'"
>>>     else
>>>         _git fetch origin "'${cset}:${cset}'"
>>>     fi
>>> fi
>>> 
>>> What do you think?
>> 
>> I don't use such "special refs", so I can't really state whether it is
>> good or not. If there was a publicy-reachable tree I could test against,
>> that would be nice. Do you know of such atree (even for a package not in
>> Buildroot)?
>> 
[snip]

Thank you for your response.

I see Henrique already answered your question.

> 
> I guess openswitch project have a lot of gerrit managed repositories. This can
> be used as examples and tests for Ricardo suggestion.
> 
> https://review.openswitch.net/#/admin/projects/
> 
> One particular sub-project
> 
> https://review.openswitch.net/#/admin/projects/openswitch/ops
> 
> git clone
> 
> git clone https://review.openswitch.net/openswitch/ops
> 
> And then it is possible to make a buildroot recipe to download and test this
> package with and without special_refs.
> 
> But it is important to say that we are using Ricardo suggestion in our
> buildroot-upstream cloned repository, that is based in 2016.08 tag, without
> any problems. Indeed, the solution has solved some problems, so i can say it
> has been exhaustively tested.
> 
> Our buildroot-upstream repo has this deliveries related to the subject, just
> for the sake of completeness:
> 
> git log -n8 --oneline
> 
> 6283402 support/download/git: allow sha1 of special refs (v2)
> 35b9416 Revert "support/download/git: allow sha1 of special refs"
> 81523bc support/download/git: allow sha1 of special refs
> e415a54 support/download/git: Fix compatibility issue with git older than 1.8.4
> 11e9a47 support/download: don't over-remove files from git archives
> cf98e0a support/download/git: add support for submodules
> a34d5e7 support/download/git: do not use git archive, handle it manually
> 5fc0731 support/download/git: do not use bare clones
> 
> The first three i think are in our tree only, and are the subject of this review.

Actually only the topmost of the 3 local patches matters. In the first version I
didn't cover a corner case, so I reverted it and then I integrated the corrected
version ;)
The second version uses awk, just like Bryce Ferguson does in his patch [1].

I can send the full corrected patch to the mailing list for review, but I will 
do it on a weekday, since I don't have the patch at hand right now.

[1] http://patchwork.ozlabs.org/patch/681841/

Regards,
Ricardo
