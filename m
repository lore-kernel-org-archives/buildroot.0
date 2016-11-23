From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2016 22:47:26 +0100
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <20161123182843.GA3609@free.fr>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
 <20161123182843.GA3609@free.fr>
Message-ID: <a4e40d0e-fa6d-cbc9-0eca-52827a006e91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-16 19:28, Yann E. MORIN wrote:
> Ga?l, All,
> 
> On 2016-11-23 12:36 -0500, Ga?l PORTAY spake thusly:
[snip]
>> -exec "${0%/*}/pseudo" "${@}"
>> +# spawn server manually...
>> +"${0%/*}/pseudo" -f &
>> +pid="${!}"
> 
> There still is a little corner case I'm not too happy about... The above
> returns immediately, but we don;t know if the daemon is ready. It may
> take a bit of time for it to start compeltely (i.e. reload the DB and
> repair its now-internal state)...
> 
>> +# ... run script/command...
>> +"${0%/*}/pseudo" "${@}"
> 
> But then we (almost) immediately start a client, which may try to
> connect to the daemon while it is not yet ready, and thus the client may
> not detect it yet, and thus wmay spawn his own daemon.
> 
> And we'd be back to square one...
> 
> Of course, we could run:
> 
>     pseudo -d
> 
> which is guaranteed to return after the daemon is ready...
> 
>> +rc="${?}"
>> +
>> +# ... terminate server...
>> +"${0%/*}/pseudo" -S
>> +
>> +# ... and wait for its completion to make sure database is synced before
>> +# returning.
>> +wait "${pid}"
> 
> But then we would not have a PID to wait on... :-/

 PID is not a problem, we can get it from LOCALSTATEDIR. The problem is that the
wait builtin only works for direct children of the shell.

> 
> So, the question is: are we sure the client will talk to the daemon that
> we spawn?
> If the answer is "yes, we're sure", then all is good; id the answer is
> "no, we're not sure", then it's a problem...

 I don't think we're really sure, but I do believe that pseudo protects against
this situation, i.e. when two servers start up concurrently, only one of them
will really run. The problem is that the one that commits suicide may be the one
that we start from the pseudo wrapper, so we end up wait'ing for the wrong pid.

> 
> Thoughts?
> 
> Now, my position on all this mess is :
> 
>   - we revert back to using fakeroot for 2016.11;

 Yeah, I think we need to do that. Too bad for the Fedora users.

 Regards,
 Arnout

> 
>   - long term, we want to definitely switch to using pseudo:
>     - it is actively maintained,,
>     - it has more features than fakeroot,
>     - some of those features are very interesting for us.
> 
> Regards,
> Yann E. MORIN.
> 
>> +exit "${rc}"
>> -- 
>> 2.10.2
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
