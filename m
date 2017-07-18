From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 21:58:44 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented
 config fragment
In-Reply-To: <ec7f482c-c5e2-106e-0ad3-d7b65898bf1c@mind.be>
References: <20170715224949.25598-1-yann.morin.1998@free.fr>
 <420f45cf-1f44-d85f-4373-56ca3aded94a@mind.be>
 <20170718194521.GC2583@scaer>
 <ec7f482c-c5e2-106e-0ad3-d7b65898bf1c@mind.be>
Message-ID: <20170718195844.GD2583@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-18 21:55 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 21:45, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2017-07-18 21:37 +0200, Arnout Vandecappelle spake thusly:
> [snip]
> >>  I would do this in BRTest instead of down here, so that self.config contains a
> >> correct config file. In fact, I would do it in its constructor instead of in
> >> setUp(), so that it is done only once even if a class has two test functions.
> > 
> > Meh, I have no real clue on how those class- or instance-scoped
> > variables play iwth each others... I think this is sad that we use
> > class-scoped config variable for the actual tests; they should be
> > instance-scoped instead, but that requires one to actually write an
> > __init__ function, so a classscoped is quicker to write.
> > 
> > Be if we ever want to derive a Test class into another, then we'll have
> > issues I guess...
> > 
> > But if I understand you correctly, you'd prefer (code elided for
> > brevity):
> > 
> >     class BRTest():
> >         def __init__(self):
> >             self.config = '\n'.join(map(str.lstrip, self.config.splitlines()))
> > 
> > Right?
> 
>  Exactly.
> 
>  Note that this conveniently converts the class-scoped variable to an
> instance-scoped one (the reference on the right-hand side refers to the class
> variable, the reference on the left-hand side creates the instance variable).
> Still a big Meh for you, but at least after __init__ it feels natural.

Ack.

> >>  I would also do it as a oneliner:
> >> 	self.config = '\n'.join(map(str.lstrip, self.config.splitlines()))
> >> but some people don't like oneliners :-)
> > 
> > Well, I prefer it, because it is rather self-explanatory. But I could
> > not have wrote it myself (I did not know about map() ).
> 
>  TBH, nowadays Python people prefer the [ for ] construct, so
> 
>     self.config = '\n'.join([line.lstrip for line in self.config.splitlines()])

Ah, that was the construct I wanted to write, but for the sake of me, I
could not remeber the exact syntax... That's what I'll use, because it
is more pythonic (as you also noted).

> I'm still an old LISP guy so I know map() better :-)

LISP. Meh... A whole lot of insipid and stupid parentehses, that's all I
remember of it. ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
