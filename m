From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Apr 2018 19:49:04 +0200
Subject: [Buildroot] Per-package download folders and Git caching
In-Reply-To: <87k1top74p.fsf@dell.be.48ers.dk>
References: <20180403141703.21cd24fe@windsurf>
 <041a5a2a-3f9d-c76e-4c6d-d22ef11cad43@mind.be>
 <876058qvi4.fsf@dell.be.48ers.dk> <20180403162324.GB2335@scaer>
 <87k1top74p.fsf@dell.be.48ers.dk>
Message-ID: <20180403174904.GE2335@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-03 18:49 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Should we do a cp if ln fails, then?
> That sounds like a sensible fallback, yes.

I was about to do so, but then we're back to a situation where we have
to guarantee the atomicity.

This is currently possible, because the dl-wrapper now runs under flock.
But we are going to optimise the locking with a more fine-grained
solution soonish.

To be noted: the current code is not atomic-safe either, because we do
have a TOCTTOU situation...

So, we'll have to again play tricks with atomicity...

We can't use flock again, because the destination directory is already
locked, and there is not destination file to lock to start with...

So, maybe the full solution will in fact to really implement the more
fine-grained solution... I'll see to it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
