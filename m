From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 18 Apr 2012 16:15:44 +0200
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <201204162338.49807.yann.morin.1998@free.fr>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LX8JkXWzHAkYV8J74sYDhsFPRJ=OdYxiB4+6PxRswx3MA@mail.gmail.com>
 <4F8C8CE2.3000702@lucaceresoli.net>
 <201204162338.49807.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU=wrhrN2cAV2WcOgvBxjXmXGDGfiKSf4Z1Y3jt_cox=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 16, 2012 at 11:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Luca, Thomas, All,
>
> On Monday 16 April 2012 23:19:30 Luca Ceresoli wrote:
>> Thomas De Schampheleire wrote:
>> > I think the distinction GPLv2 / GPLv2+ / GPLv3 / GPLv3+ etc. is
>> > common, and can be reused.
>> > So I agree with Yann here.
>> Ouch, you're right guys. And so I went back to read the original licenses once
>> more...
>>
>> This is what the GPLv2 states (LGPLv2.0 is substantially equal):
>> > ?Each version is given a distinguishing version number. ?If the Program
>> > ?specifies a version number of this License which applies to it and "any
>> > ?later version", you have the option of following the terms and conditions
>> > ?either of that version or of any later version published by the Free
>> > ?Software Foundation. ?If the Program does not specify a version number of
>> > ?this License, you may choose any version ever published by the Free Software
>> > ?Foundation.
>
> And what is import, is not that the _license text_ says "or later", but if
> the _Program_ says "or later".
>
> The _Program_ could say that in every boilerplate texts, or in an accompanying
> file, or by anyother means.
>
>> So there are indeed three cases:
>> ? 1. the Program specifies a version -> ?GPLv2 only
>> ? 2. the Program specifies a version or "any later version" -> ?GPLv2+
>> ? 3. the Program does not specify a version -> ?how to name this, simply GPL?
>
> Yes, simply GPL. "GPL" by itself means "any version of the GPL", as it is
> written explicitly in the license text.
>
>> Let's take a real case: tslib.
>>
>> The source files in src/ state:
>> > ? * This file is placed under the LGPL. ?Please see the file
>> > ? * COPYING for more details.
>> and the COPYING file in the root tslib directory contains an LGPL v2.0
>> license. The Program does not explicitly specify a version, but a specific
>> version is present in COPYING. Is this case 1 or case 3? I think the comment
>> in the source file rules, but it's only a feeling.
>>
>> OTOH, most source files in tests/ state:
>> > ? * This file is placed under the GPL. ?Please see the file
>> > ? * COPYING for more details.
>> and there is no COPYING file carrying any GPL in the whole tslib distribution!
>> So this must be case 3 (and we must assume that GPL means GNU General Public
>> License, although a good lawyer may certainly prove it means any other thing
>> from http://en.wikipedia.org/wiki/GPL_%28disambiguation%29).
>>
>> This should be taken into account by Buildroot, which builds and installs both
>> the library and the test programs.
>
> What I would suggest in this case is to not specify any known license, but
> use a 'generic' text, such as:
> ?- unknown ? ?license is unknown
> ?- depends ? ?license depends on the options selected in the Program
>
> In all three cases, only a lawyer may decide what licensing terms apply to
> such a program. For the tslib specific case, I'd use 'unknown' (which should
> be the default if no license is explictly specified, anyway).
>
> In this case, the licensing manifest should be carefully analysed, and
> packages with unknown licenses carefully reviewed with help from a lawyer.
>
>> Another example: busybox.
>>
>> This is a messy as well. The LICENSE file carries this heading:
>> > ?--- A note on GPL versions
>> >
>> > ?BusyBox is distributed under version 2 of the General Public License (included
>> > ?in its entirety, below). ?Version 2 is the only version of this license which
>> > ?this version of BusyBox (or modified versions derived from this one) may be
>> > ?distributed under.
>> >
>> > ?------------------------------------------------------------------------
>> > ? ? ? ? ? ? GNU GENERAL PUBLIC LICENSE
>> > ? ? ? ? ? ? Version 2, June 1991
>>
>> That looks clear, but many source files seem to disagree:
>> $ head coreutils/uname.c
>> > ? * Licensed under GPLv2 or later, see file LICENSE in this source tree.
>
> What this means is that the work as a whole is available under the GPLv2,
> but that if you use individual files out-side of busybox, you can use that
> file under the license that is specified (IANAL!).
>
> From the buildroot perspective, busybox is GPLv2.
>
>> I checked four packages in detail, and two of them have an unclear choice of
>> GPL version. I can't stand any more headache tonight, and I'm not sure I'll
>> have more luck with other packages. This is so frustrating...
>
> Not sure? Use 'unknown'. This can be refined at a later stage, if need be.
>
> A package with no license specified in the $(PKG)_LICENSE should default
> to 'unknown', to draw attention.
>
> IMNSHO, it is highly preferrable for the buildroot community to be
> conservative on this point, and in case there is ambiguity, default to
> 'unknown', and let a lawyer do his/her work. ;-)

Ideally, we'd try to make sure that the upstream developers clarify
their license so as to remove the ambiguity. I think it is of benefit
to no-one that such ambiguities exist.
