From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Jun 2014 16:11:19 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140615124216.2c3c1428@free-electrons.com>
References: <20140615063014.70ACF100EAC@stock.ovh.net>
 <20140615122040.6effbc93@free-electrons.com>
 <01b1dd01-35b7-40d8-bb70-56a33e20f1a6@email.android.com>
 <20140615124216.2c3c1428@free-electrons.com>
Message-ID: <CAAXf6LUiX3JRwr-cWKNG55ip2bnUAO91v+WBPG=n_dnT0mxZyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 15, 2014 at 12:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sun, 15 Jun 2014 12:36:44 +0200, Thomas De Schampheleire wrote:
>
>> Could you clarify why we need a timeout in the first place? Have
>> there been occurrences of builds that get stuck (in a loop or
>> otherwise)? According to me, it doesn't matter that a build takes ten
>> hours for a given configuration, as long as it progresses and doesn't
>> get stuck...
>
> The reason a timeout was introduced is because there used to be an old
> PowerPC toolchain in which 'ld' had a bug, and this bug caused ld to
> enter an infinite loop, consuming 100% of the CPU forever, when linking
> a specific piece of code. There have been occurrences where my build
> server has remained stuck for several days in this infinite loop before
> I realized that the builds were no longer occurring, and figured out
> what was going on.
>
> I don't think we still have this toolchain tested in the current
> configurations, but the timeout mechanism has remained in place, and I
> believe it's still possible to have similar issues in the future.
>

If we can agree that the situation is rare, than we could keep things
simple and make the timeout relatively large, say 10 hours. This
reduces the false positives due to big configurations, but still
prevent endless builds. In the good cases, no timeout is effectively
present and all builds can run to completion. In the exceptional bad
case of an endless loop, there is a large penalty of 10 hours (or
whatever the timeout value) but since this should only happen
exceptionally it is acceptable. These situations should be
investigated in detail anyway and resolved shortly after (ideally).

The other solutions you proposed have their value too, but make things
more complex while not really necessary IMO.

Best regards,
Thomas
