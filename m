From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 22 Nov 2016 11:59:53 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <838b8e0f-1848-4f5b-c5cd-c8338c3324ff@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <147980227.jl3AtNLvoX@sagittea>
 <838b8e0f-1848-4f5b-c5cd-c8338c3324ff@mind.be>
Message-ID: <4522057.1MXXz9PRdM@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnoult,

On Saturday 19 November 2016 14:26:40 Arnout Vandecappelle wrote:
> 
> On 19-11-16 14:06, J?r?me Pouiller wrote:
> > On Saturday 19 November 2016 11:21:39 Arnout Vandecappelle wrote:
> >> On 18-11-16 10:10, J?r?me Pouiller wrote:
> > [...]
> >>> +    for i in "$@"; do
> >>> +        case $i in
> >>> +        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)
> >>
> >>  We use [^-] everywhere else.
> > 
> > It seems this syntax is a bashism. From glob(7): "POSIX has declared
> > the effect of a wildcard pattern "[^...]" to be undefined" (and I
> > confirm it does not work with dash)
> > 
> >>  Note that this pattern will also match something
> >> like -rfrood, i.e. --reference=frood. Fixing that becomes tricky without regexp.
> > 
> > hmmm... yes, it matches -rfrood (and it is what we want), but it does not
> > match --reference=frood, isn't?
> 
>  -rfrood and --reference=frood are the same thing, so no, we don't want it to
> match -rfrood.
> 
> 
> >>  Anyway, the -d option doesn't really need to be checked. 'date -d foo -d bar'
> >> will ignore the first -d, so things work OK. It's just that you get the spurious
> >> warning. So we could limit to checking -f, and limit to -f|--file=*). In that
> >> case, if someone passes something like -uf we'll get an error and the build will
> >> most likely terminate, so that particular error can be fixed.
> > 
> > You are right. However, since it may produce unexpected situation, I
> > prefer to identify precisely the cases where fakedate is used. 
> 
>  I would also prefer that, but I don't think it's possible without relying on
> regex. This could work:
> 
> if echo "$i" | grep -qE '^-([urI]*d|-date|[urI]*f|-file)'; then

From manual page, only option -u and -R do not take arguments. In add, we
also have to inhibit fakedate is --reference (or -r) is detected. So, I
think that the expression should be:

   '^-([uR]*d|-date|[uR]*f|-file|[uR]*r|--reference)'


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
