From: Cam Hutchison <cam@camh.ch>
Date: Mon, 5 Feb 2018 14:52:30 +1100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180204100444.GB2411@scaer>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk> <20180204100444.GB2411@scaer>
Message-ID: <CABa6e=otTJ1GiyhBA_hXXxNcyGts0TH5=CW=abBiwa5TageAHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 February 2018 at 21:04, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Peter, All,
>
> On 2018-02-03 22:47 +0100, Peter Korsgaard spake thusly:
>> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> [--SNIP--]
>>  > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
>>  > index d45b23dc23..ebb471f7e5 100644
>>  > --- a/support/docker/Dockerfile
>>  > +++ b/support/docker/Dockerfile
>>  > @@ -28,3 +28,10 @@ RUN apt-get -q -y clean
>>  >  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
>>  >  RUN /usr/sbin/locale-gen
>>
>>  > +RUN useradd -ms /bin/bash br-user
>>  > +RUN chown -R br-user:br-user /home/br-user
>>
>> I don't know much about Docker, but I was of the understanding that each
>> run statement creates a new layer and the number of layers should be
>> minimized, which is why you normally see stuff like:
>>
>> RUN foo && \
>>     bar && \
>>     foz && \
>>     baz
>
> Well, I am no docker expert either, and I just mimicked whatever the
> file already looked like, as you can see for the previous two lines...

Minimizing the number of layers for simple layers like the "RUN useradd"
and "RUN chown" really doesn't save very much.

Where the big win comes in (and is not mentioned in the official
documentation) is when you keep the "install && build && clean" commands
in a single RUN command. This matters because if you split it up over
multiple layers, the earlier layers still contain all the stuff the
later layers try to clean. The end result is a fat image that contains
the stuff you wanted to remove in a lower layer, with whiteout entries
in a higher layer, so it only looks like the files have been removed.

Your patch set does the right thing WRT the debian install/clean, so all
good, but I thought I'd mention this because it did not come up in any
discussions here or in the linked docs.
