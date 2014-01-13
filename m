From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 14 Jan 2014 12:00:11 +1300
Subject: [Buildroot] [PATCH v1] tcpreplay: bump version to 4.0.0
In-Reply-To: <CAFOYHZA+D=WYVSi2BiKr5Z47zHVvoELuAzBQhm-fQEW4u7P7sQ@mail.gmail.com>
References: <1389575003-17982-1-git-send-email-judge.packham@gmail.com>
 <87ioto179h.fsf@dell.be.48ers.dk>
 <CAFOYHZCm2AfWaQfOaHtU6M-urRb9oPFo0vU-qnymF+vSZVKxLQ@mail.gmail.com>
 <CAFOYHZA+D=WYVSi2BiKr5Z47zHVvoELuAzBQhm-fQEW4u7P7sQ@mail.gmail.com>
Message-ID: <CAFOYHZCuqiNQfN3YJMGKr=4Sek-LVY88k9-z79ARbL8tnkKLTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 14, 2014 at 9:55 AM, Chris Packham <judge.packham@gmail.com> wrote:
> On Tue, Jan 14, 2014 at 9:54 AM, Chris Packham <judge.packham@gmail.com> wrote:
>> Hi,
>>
>> On Mon, Jan 13, 2014 at 11:54 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>>> "judge" == judge packham <judge.packham@gmail.com> writes:
>>>
>>>  > From: Chris Packham <judge.packham@gmail.com>
>>>  > Update the tcpreplay package to version 4.0.0. The upstream package has
>>>  > a new maintainer and license. Version 4.0.0 brings a number of new
>>>  > features see http://tcpreplay.appneta.com/ for details.
>>>
>>>  > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>>>  > ---
>>>  > Changes since v0:
>>>  > . Updated my git configuration to use a smtp server that doesn't modify my
>>>  >   messages in-flight.
>>>
>>> There's a number of build failures on the autobuilders. Care to take a
>>> look at fixing them?
>>>
>>> http://autobuild.buildroot.net/results/fec/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/build-end.log
>>> http://autobuild.buildroot.net/results/54b/54b739bd3713de87113cbed35e05b9074282b30d/build-end.log
>>>
>>> --
>>> Bye, Peter Korsgaard
>>
>> I think the problem is things that don't define __VA_ARGS__ or things
>> that can't handle an empty argument list. And advice on how to fix
>> this?
>
> More context thanks to clang (please excuse gmail's wrapping):
>
> In file included from tcpreplay_api.c:35:0:
> tcpreplay_api.c: In function 'tcpreplay_set_verbose':
> tcpreplay_api.h:275:107: error: expected expression before ')' token
>  #define tcpreplay_seterr(x, y, ...) __tcpreplay_seterr(x,
> __FUNCTION__, __LINE__, __FILE__, y, __VA_ARGS__)
>
>                                     ^
> tcpreplay_api.c:706:5: note: in expansion of macro 'tcpreplay_seterr'
>      tcpreplay_seterr(ctx, "verbose mode not supported");

I can't actually reproduce the problem

Here's what I did

 curl http://autobuild.buildroot.net/results/54b/54b739bd3713de87113cbed35e05b9074282b30d/config
> .config
 sed -i 's|/home/test/||' .config
 make

I actually got an unrelated error the first time

  /home/chrisp/src/buildroot/output/host/usr/bin/arm-linux-ldconfig:
can't resolve /usr/X11R6/lib in chroot .: No such file or directory
  /home/chrisp/src/buildroot/output/host/usr/bin/arm-linux-ldconfig:
skipping /usr/X11R6/lib: No such file or directory

Looking in output/build it looks like tcpreplay did actually build to
confirm I ran

  make tcpreplay-dirclean
  make tcpreplay

Which worked.

Is my recipe for reproducing the build correct? Is there something
else I'm missing.
