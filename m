From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 11:42:08 +0200
Subject: [Buildroot] [PATCH 4/8 v4] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <552C54AC.9050905@mind.be>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <1f4a021bb2826f296ae7b2876f8ae8ab57cde349.1428512075.git.yann.morin.1998@free.fr>
 <552C54AC.9050905@mind.be>
Message-ID: <20150419094208.GF4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-14 01:43 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/15 18:57, Yann E. MORIN wrote:
> > In very constrained cases, it might be needed to not fail if a hash is
> > missing. This is notably the case for custom external toolchains to be
> > downloaded, because we do have a .hash file for external toolchains,
> > but we oviously can not have hashes for all existing cutom toolchains
>          obviously                                     custom
> 
> > (he, "custom"!).
> 
>  So what is it going to be cutom or custom? :-)

I pondered using 'coton', but that had no meaning. So I've decided for
'custom' instead. ;-)

All typoes fixed. Well, at least the ones you pointed out! ;-)

[--SNIP--]
> > diff --git a/support/download/check-hash b/support/download/check-hash
> > index d37f1cd..ca81f00 100755
> > --- a/support/download/check-hash
> > +++ b/support/download/check-hash
> > @@ -99,6 +99,11 @@ while read t h f; do
> >  done <"${h_file}"
> >  
> >  if [ ${nb_checks} -eq 0 ]; then
> > +    for f in ${BR_NO_CHECK_HASH_FOR}; do
> > +        if [ "${f}" = "${base}" ]; then
> > +            exit 0
> > +        fi
> > +    done
> 
>  I can't stop myself from micro-optimising :-)
> 
> if [ ${nb_checks} -eq 0 ]; then
> 	case " ${BR_NO_CHECK_HASH_FOR} " in
> 	"* ${base} *")
> 		exit 0
> 		;;
> 	esac
> 	printf "ERROR: No hash found for %s\n" "${base}" >&2
> 	exit 0
> fi
> 
> But maybe that's not really more readable...

Yeah, I can read that no problem. I don't care which to use, so I'll
switch over to using case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
