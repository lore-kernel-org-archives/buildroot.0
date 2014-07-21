From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 21 Jul 2014 18:25:18 +0200
Subject: [Buildroot] Silencing the build
In-Reply-To: <20140718201537.GC3630@free.fr>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140715212814.1dfcce43@free-electrons.com>
 <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
 <20140717203152.2e18fb9b@free-electrons.com> <20140717202941.GE3737@free.fr>
 <CAHkwnC_eQxDKH=V+2U+pOMZj50y4oE2B_p_G+CAk8ZFG3jSsOw@mail.gmail.com>
 <20140718201537.GC3630@free.fr>
Message-ID: <CAHkwnC-vKfLhiFF2cYcwrLHFJA0ojCL+X2okeSqODsg_gQw3fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 18, 2014 at 10:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-07-18 10:18 +0200, Fabio Porcedda spake thusly:
>> On Thu, Jul 17, 2014 at 10:29 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Thomas, All,
>> >
>> > On 2014-07-17 20:31 +0200, Thomas Petazzoni spake thusly:
>> >> On Thu, 17 Jul 2014 19:40:46 +0200, Fabio Porcedda wrote:
>> >>

<snip>

>> >> I guess we need to decide whether having a fully silent build in "make
>> >> -s" is a goal we should aim at. It seems like a good idea to me, but I
>> >> don't have a really strong opinion about this.
>> >>
>> >> What do others think about this?
>> >
>> > Here's what I use for a silent build:
>> >
>> >     brmake() {
>> >         make "${@}" \
>> >         |sed -r -e '/^.{4}>>>[[:space:]]+(.*).{5}$/!d; s//\1/;'
>> >     }
>> >
>> > Then calling 'brmake' instead of 'make', will get you only the >>> lines.
>>
>> Nice, so i'm not the only one who likes a silent build ;-)
>
> Well, I still believe the build should be verbose by default, otherwise
> we would miss a lot of important information on bug reports. The problem
> is where to store the build.log in case of a silent build, so the user
> can provide it.

I don't know a way to store the full log (stdout & stderr) and view a
filtered version of stdout & the unfiltered stderr, maybe you have an
idea?

> I think the best we can do is document a simple solution (like my little
> function above, for example).

Yes, i think it's a good idea.

I personally prefer using a line like this:
 make | grep --color=never ">>> "
to be able to distinguish more easily stdoud messages from stderr messages.

Nevertheless, I still would like that this patch will be applied because:
- using "make -s" is still simpler that using some "make | sed
........", many tools have a quiet flag for this reason.
- is a work already done.
- does not change the usual behavior.
- it's just adds 12 line of code .

>> I think that a downside of this method is that even the stderr is
>> filtered as well so messages like warning or errors are filtered as
>> well.
>
> No, because only stdout is filtered, there's no redirection of stderr.

Good point, you are right.

Regards
-- 
Fabio Porcedda
