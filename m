From: Cam Hutchison <cam@camh.ch>
Date: Mon, 5 Feb 2018 20:51:10 +1100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180205071820.GA2417@scaer>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk> <20180204100444.GB2411@scaer>
 <CABa6e=otTJ1GiyhBA_hXXxNcyGts0TH5=CW=abBiwa5TageAHw@mail.gmail.com>
 <20180205071820.GA2417@scaer>
Message-ID: <CABa6e=r8AWp5yBEMm7=3RQcYd4PEJK=asZ791tV58UbgMy7OJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 February 2018 at 18:18, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Cam, All,
>
> On 2018-02-05 14:52 +1100, Cam Hutchison spake thusly:

>>
>> Where the big win comes in (and is not mentioned in the official
>> documentation) is when you keep the "install && build && clean" commands
>> in a single RUN command. This matters because if you split it up over
>> multiple layers, the earlier layers still contain all the stuff the
>> later layers try to clean. The end result is a fat image that contains
>> the stuff you wanted to remove in a lower layer, with whiteout entries
>> in a higher layer, so it only looks like the files have been removed.
>>
>> Your patch set does the right thing WRT the debian install/clean, so all
>> good, but I thought I'd mention this because it did not come up in any
>> discussions here or in the linked docs.
>
> OK, so we *do* have a Docker expert, now! ;-)

Hah. I know enough to be dangerous, but I'm hardly an expert. I am
experimenting with docker in buildroot at the moment though, so
I'm sure to learn more.

> Thank you for your explanations, that was very instructive. I gues
> that's because aufs is used underneath, or something like that?

Overlayfs these days, but yes. Each layer is another overlay and
once a layer is made, it is immutable. Higher layers just modify
the ultimate view.

> I would have expected that, instead of implicit, a layer would have been
> explicit, like with a COMMIT keyword or something like that...

I've found Dockerfiles to be pretty basic really and this one layer per
command stuff seems like a shortcut that was never fixed. A commit
of some sort would make so much more sense. They have recently
added the ability to build multiple images where only the final image
is used as the output. This allows you to build up a "development"
image and build an executable, and just copy that to the final image,
leaving behind all the development infrastructure. That can make
Dockerfiles a lot cleaner, removing the need for all the && chains.
