From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 1 Jan 2015 19:14:56 +0100
Subject: [Buildroot] [PATCH 2/2 v8] pkg-download: silence downloads if
	make is silent
In-Reply-To: <20150101180804.GF4360@free.fr>
References: <cover.1420130984.git.yann.morin.1998@free.fr>
 <70490271dbf1774e87cc5dab1a5e907105afeb62.1420130984.git.yann.morin.1998@free.fr>
 <CAHkwnC_Ut0qO82jtch03bY8WYxPzfoeycO9NuvYYtO-OKRd=DQ@mail.gmail.com>
 <20150101180804.GF4360@free.fr>
Message-ID: <CAHkwnC9wB=BEBeyaWV1TV68MXBqjyoK7o7Px6FyfVwQ_cNpEGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 1, 2015 at 7:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2015-01-01 18:54 +0100, Fabio Porcedda spake thusly:
>> On Thu, Jan 1, 2015 at 5:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > From: Fabio Porcedda <fabio.porcedda@gmail.com>
>> >
>> > If it is a silent build (make -s -> QUIET=-q) silence all downloads, as
>> > well as the check-hash. Only stdout is redirected, stderr is still
>> > visible, for errors and warning.
>>
>> Hi Yann,
>> nice idea, i tried this patch but even if it works for check-hash and
>> svn it does not works for the git backend (e.g. libubox) and the wget
>> bakend (try it without the QUIET flags in the WGET variable).
>>
>> I don't understand the reason for this behavior.
>> Do you have an idea for this strange behavior?
>
> Ok, that's because git always sends its report status to stderr:
>
>     --quiet, -q
>         Operate quietly. Progress is not reported to the standard
>         error stream. [...]
>
> So, we need to pass -q to git. Sigh, fscking borked behaviour... stderr
> is for failures, not normal reporting... :-(
So that's the reason...

>
> OK, so we need to pass -q to some backends.
>
> However, what I did not like in your original patch was the fact that
> some backends were singled out in the wrapper script. We do not want
> that, we want the wrapper to be backend-agnostic (that's the whole point
> of having a wrapper and backends).

Well that it's needed only until all backends support the "-q" flag,
do you prefer a big patch to convert all backends so that check is not
needed?

> I'll rework that, then...

BR
-- 
Fabio Porcedda
