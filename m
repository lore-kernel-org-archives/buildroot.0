From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jul 2014 17:53:49 +0200
Subject: [Buildroot] [PATCH 4/5] support/download: only create final
 temp file when needed
In-Reply-To: <20140707215350.GD3806@free.fr>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <399c6d6d31d5b3dbe337ce97bb18c3e19f224422.1404681878.git.yann.morin.1998@free.fr>
 <53BAC5FA.50004@mind.be> <20140707215350.GD3806@free.fr>
Message-ID: <53BC140D.80004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/07/14 23:53, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-07-07 18:08 +0200, Arnout Vandecappelle spake thusly:
>> On 06/07/14 23:27, Yann E. MORIN wrote:
[snip]
>>> +# Upon failure, git cleans behind itself, so no need to catch failures here.
>>> +# The only case when git would not clean up, is if it gets killed with SIGKILL.
>>
>>  I think the SIGKILL is reason enough to do the rm explicitly in the script. Of
>> course, this is only valid if you use the trap, otherwise you never reach the rm
> 
> Well, SIGKILL is not catchable. That's the main selling point of SIGKILL.
> ;-)

 If git gets SIGKILLed, the shell script is still running.

> 
>> (due to 'set -e').
> 
> Well, 'set -e' only kicks in for the final 'mv', since all other
> commands and conditions in an if statement.

 The call to git clone isn't, though.

> 
> Also, I'm not a big fan of traps, although I can be abusing them from
> time to time.

 I do agree that trap is mightily confusing: it has obscure syntax, and you can
easily accidentally replace an earlier trap. So in fact, it would be better not
to use 'set -e' but to put everything in conditions. But that just moves the
problem elsewhere...


 Regards,
 Arnout

> 
> But OK, I'll add this to the TODO...
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
