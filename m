From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 16:07:12 -0700
Subject: [Buildroot] [PATCH 00/23] xtensa overlay application rework
In-Reply-To: <20170314212024.0585e0e8@free-electrons.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
 <20170314212024.0585e0e8@free-electrons.com>
Message-ID: <CAMo8BfLC0QxVYj=SOB7cCW_B04uM13YVPZA5stq5-WmKrJjtEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 14, 2017 at 1:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 14 Mar 2017 11:30:29 -0700, Max Filippov wrote:
>
>> This series cleans up xtensa overlay application code, making
>> it uniform across its users in the toolchain, reducing the number of
>> configuration variables and making it possible to use compressed
>> overlays and download overlays from network.
>> This is a subset of a series initially submitted by Yann E. MORIN
>> in 2015, I've forward-ported the original submission, addressed the
>> posted comments and added overlay application to linux and U-Boot.
>
> A big question is: why do we have this weird overlay mechanism,
> specifically for this CPU architecture? Why don't they use patches like
> everybody else?

Primarily for historical reasons. There are two parts of the problem: both
toolchain and user code need to be adjusted for the specific xtensa core.
Toolchain needs to be able to generate code for it. User code needs a way
to know core characteristics at compile time.

So the part of a toolchain source that deals with xtensa ISA is isolated
from the rest of the code by a stable API and its code is generated.
Having a default code for this part in every toolchain component is good
for toolchain testing. Copying this part over the toolchain source is a
future-proof way of configuring the toolchain, because the default code
present in the toolchain may change (and have changed) over time.
A possible better way to configure the toolchain is moving
configuration-specific part into a shared library loaded as plugin into
the toolchain components. We're currently looking into this approach.

For the user code we have a library, part of which is also generated.
So far open source projects like linux kernel or U-Boot use parts of
that library copied into their code. Configuration-specific parts of that
code still need to be copied over from the generated source. The
hardware itself does not provide any information about the configured
features.
A possible way to isolate software running on xtensa from the
configuration specific properties is distribution of that library with the
toolchain and removal of its copies from the projects that have them.
That will replace the requirement of adjusting the software for specific
xtensa core with the requirement of building it with additional external
library.

> It has always bothered me that we had this mechanism, and I'd like to
> challenge the fact that we need this, and see if a better solution is
> possible.

Toolchain plugins and hardware abstraction library are the ways we're
exploring. Do you have any suggestions?

-- 
Thanks.
-- Max
