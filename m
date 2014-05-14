From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 14 May 2014 23:25:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-11
In-Reply-To: <20140514205653.GL4096@tarshish>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
 <20140513075247.GZ4096@tarshish> <20140513100102.14163e6c@free-electrons.com>
 <20140514205653.GL4096@tarshish>
Message-ID: <CA+sos7-Ht2wOJC+2ToqnKazE2Bxhhffo7Ef38uRd+ZqPq+D2KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, May 14, 2014 at 10:56 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Tue, May 13, 2014 at 10:01:02AM +0200, Thomas Petazzoni wrote:
>> On Tue, 13 May 2014 10:52:47 +0300, Baruch Siach wrote:
>>
>> > On Tue, May 13, 2014 at 09:44:26AM +0200, Thomas Petazzoni wrote:
>> > > >        arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
>> > >
>> > > Missing TCP_* definitions. Weird because the toolchain has recent
>> > > kernel headers (3.12) and uses glibc. Investigation needed.
>> >
>> > http://patchwork.ozlabs.org/patch/345018/ seems applicable (but I didn't test).
>>
>> Indeed, but I'm not really convinced by the fix, seems strange that
>> --sysroot needs to be passed. More investigation is needed to validate
>> the proposed fix, I believe.
>
> Right. It just papers over the real problem which is building a target config
> test using the host toolchain, and then running it. The patch at
> http://patchwork.ozlabs.org/patch/348765/ is better, I believe.

The issue in my case was that the native toolchain used for the
configure test implicitly #included a header file, which triggered a
conflict of direct inclusion between the native and cross toolchains
header files. Passing --sysroot forces the native toolchain to only
use the header files from the cross toolchain, fixing this conflict.
This directly addresses the issue without any assumption regarding the
cross libc.

http://patchwork.ozlabs.org/patch/348765/ works too, but it removes a
configure test and it relies on the "all libc variants we support have
the netinet/tcp.h header" assumption, which might become wrong in the
future, which is why I didn't choose this solution.

Best regards,
Beno?t
