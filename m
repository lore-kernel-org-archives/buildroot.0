From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 14:26:40 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <147980227.jl3AtNLvoX@sagittea>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-10-git-send-email-jezz@sysmic.org>
 <7024db7a-ff5f-312d-fb00-16ed463c79e0@mind.be>
 <147980227.jl3AtNLvoX@sagittea>
Message-ID: <838b8e0f-1848-4f5b-c5cd-c8338c3324ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 14:06, J?r?me Pouiller wrote:
> On Saturday 19 November 2016 11:21:39 Arnout Vandecappelle wrote:
>> On 18-11-16 10:10, J?r?me Pouiller wrote:
> [...]
>>> +    for i in "$@"; do
>>> +        case $i in
>>> +        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)
>>
>>  We use [^-] everywhere else.
> 
> It seems this syntax is a bashism. From glob(7): "POSIX has declared
> the effect of a wildcard pattern "[^...]" to be undefined" (and I
> confirm it does not work with dash)
> 
>>  Note that this pattern will also match something
>> like -rfrood, i.e. --reference=frood. Fixing that becomes tricky without regexp.
> 
> hmmm... yes, it matches -rfrood (and it is what we want), but it does not
> match --reference=frood, isn't?

 -rfrood and --reference=frood are the same thing, so no, we don't want it to
match -rfrood.


>>  Anyway, the -d option doesn't really need to be checked. 'date -d foo -d bar'
>> will ignore the first -d, so things work OK. It's just that you get the spurious
>> warning. So we could limit to checking -f, and limit to -f|--file=*). In that
>> case, if someone passes something like -uf we'll get an error and the build will
>> most likely terminate, so that particular error can be fixed.
> 
> You are right. However, since it may produce unexpected situation, I
> prefer to identify precisely the cases where fakedate is used. 

 I would also prefer that, but I don't think it's possible without relying on
regex. This could work:

if echo "$i" | grep -qE '^-([urI]*d|-date|[urI]*f|-file)'; then

I notice now that you forgot a pattern for 'date --date yesterday' - that one is
handled as well by the regex above.

> 
> [...]
>>> +            ;;
>>> +        esac
>>> +    done
>>> +    if [ $INHIBIT -eq 0 ]; then
>>> +        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
>>
>>  Is it really needed to print this warning?
> 
> From user point of view, result of `date' when fakedate is installed
> is unexpected. I prefer to warn.

 I'm just worried that it might confuse some script that captures stderr and
tries to do something with it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
