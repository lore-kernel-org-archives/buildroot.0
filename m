From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 18:32:19 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <20140307172121.GC3384@free.fr>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
Message-ID: <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 6:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-03-07 10:59 +0100, Fabio Porcedda spake thusly:
>> On Thu, Mar 6, 2014 at 10:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > On 2014-03-06 11:43 +0100, Fabio Porcedda spake thusly:
>> >> Hi all,
>> >> luajit fails to build on a Ubuntu 13.10 x86_64 with the following defconfig:
>> >>
>> >> BR2_x86_generic=y
>> >> BR2_TOOLCHAIN_EXTERNAL=y
>> >> BR2_PACKAGE_LUAJIT=y
> [--SNIP--]
>> > And this can not work on a pure 64-bit system (aka, without the 32-bit
>> > legacy stuff).
> [--SNIP--]
>> > Not sure how we can get away with this...
>>
>> I think we have two choices:
>>  - add a check to test if 32bit compiler is installed and if not print
>> a clear message about the toolchain requirement
>
> I think this would be the first package to add such a check.
>
> How would you propose we implement this:
>   - in a pre-configure hook (but that will catch the failure late in the
>     build) ?
>   - in a make ifeq-block (so we can catch it early in the build) ?

> The second solution is more appealing to me, but might be a bit more
> complex to implement.

I think a check to be added like this:

luakit.mk:

luajit-dependencies:
   shell script to check and if it fails it prints an appropriate
message and stop the building

dependencies: luajit-dependencies

So the check it's done early at same time as other dependenies check.

Right now i don't know how to check about the presence of the 32bit
support on the 64 bit host toolchain.

>
>>  - add (BR2_i386 && BR2_HOSTARCH='i386') to the config.in to exlude
>> such combination.
>
> But that would prevent the combination on systems that are setup with
> support for building 32-bit programs, which is a pity...

You are right, i think it's just the easiest solution.

Regards
-- 
Fabio Porcedda
