From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jul 2015 18:46:12 +0200
Subject: [Buildroot] multiple BR2_EXTERNAL layers?
In-Reply-To: <55A92BE5.8060307@mentor.com>
References: <55A92BE5.8060307@mentor.com>
Message-ID: <20150717164612.GA3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

[Please wrap your messages to at most 80 chars, it's easier to read.]

On 2015-07-17 09:23 -0700, Hollis Blanchard spake thusly:
> Hi Yann, is it possible to specify multiple layers in BR2_EXTERNAL? When
> I try (make BR2_EXTERNAL="/foo /bar"), my second layer
> seems to be ignored.

No, Buildroot does currently support using more than one BR2_EXTERNAL
tree at a time.

I.e. it is not "stackable"; it's not "layers".

> My team has a bunch of testcases in separate directories. Many of these
> use simple bare metal executables, but some include Linux. I
> would like to adopt Buildroot, but keep testcase-specific bits (Linux
> config files, device trees, etc) in its own directory. At the
> same time, some components (e.g. test applications) should be shared
> across testcases. So I want to use
> BR2_EXTERNAL="/project/testcase /project/shared", but that doesn't
> seem to be possible right now...?

Indeed no...
 
However, I have already posted a patch series that does implement
support for multiple br2-external trees. It is not finished yet (i.e.
it is in a rather rough state) but works.

The project has not decided yet if we wanted to support multiple
br2-external trees. We have to talk about it a bit more.

But your message is a clear indication that there is a need, and that
I'm not the only one with that need. Please have a look at the series I
posted, test it and report on the list whether it Works For You (TM).
Also, voice your opinion on the cover-letter (having more than a single
user (me) with the same need will give weight to the proposal).

Note however that, *if* we ultimately decide to go for supportign
multiple br2-external trees, the final solution might be entirely
different from what I posted. Do *not* base your work on it.

The series has been posted on the list, and can be had there:
    http://lists.busybox.net/pipermail/buildroot/2015-May/128973.html

and the current state of the series can be browsed on my git tree:
    http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/multi-br2-external-3

Again: this is WIP; there's no guarantee that will ultimately land in
Buildroot; if it lands, it might be a completely different implementation.

> (I also think there's a little confusion about what "layer" means in the
> user manual, or at least I was confused. I expected "layer"
> to mean "a path which can be provided to BR2_EXTERNAL." However, reading
> closely, the user manual says "Each layer is typically
> embodied by a separate directory inside board/<company>/ . Depending on
> your projects, you could even introduce more than two
> layers." So I think "layer" really means "directory inside the single
> BR2_EXTERNAL tree".)

Well, maybe the manual is not really clear in that respect, but indeed,
we're not supporting using multiple br2-external tree at once.

The part of the manual you are quoting is not realyl related to
br2-external. And indeed, the notion of "layers" we're using there is
maybe not as appropriate as we thought. I.e. it is not a layer like in
OpenEmbedded/Yocto for example.

Rather, a "layer" is a set of files (config files, post-build/image
scripts...) that can be shared by different projects, and then used in
the .config file as the different projects see fit for their needs.

It is possible to specify more than one post-build script, more than
one post-image scripts, to use a base linux config file and expand with
additional kcofnig fragments, and so on... which can be rearded as been
"layers" on-top of a base configuration. But definitely not something
akin to Yocto, no...

But please have a look at that series of mine, nad report back on the
list what you think of it. Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
