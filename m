From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Mar 2016 15:37:22 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <871t7j205g.fsf@dell.be.48ers.dk>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <87a8m721lk.fsf@dell.be.48ers.dk> <56E02D83.9020402@zacarias.com.ar>
 <871t7j205g.fsf@dell.be.48ers.dk>
Message-ID: <56E03522.8060609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/09/16 15:31, Peter Korsgaard wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>   > On 09/03/16 11:00, Peter Korsgaard wrote:
>   >> Well, we cannot really break existing features to add new ones. The
>   >> relative location between the pkg-config wrapper script and the staging
>   >> directory is constant (or rather known at build time), so I guess we can
>   >> do something with /proc/self/exe. We might need to implement the wrapper
>   >> in C instead for that to work as /proc/self/exe for a shell script seems
>   >> to return /bin/dash here.
>
>   > That's overly complicated for no value at all.
>   > You know the sysroot is in the host directory as well, so you just
>   > need to filter out /usr/bin from $0 and hardcode the tuple in the
>   > wrapper -
>   > that's guaranteed to not change, otherwise you're in serious trouble.
>
> Yes, that's basically what I'm saying +/- the question if you want to
> rely on $0 containing the full path to the wrapper or if you use
> /proc/self/exe instead.

  $0 will always contain the full relative path to the wrapper, no? Even if it 
was found through PATH, the PATH search is done by libc so the shell will be 
invoked with the full (absolute or relative) path to the wrapper and use that as 
$0. Or am I missing something?

  I think the /proc/self/exe thing was something to deal with symlinks, which 
isn't the issue here.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
