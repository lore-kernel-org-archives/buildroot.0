From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 01:27:29 +0200
Subject: [Buildroot] [RFC PATCH] package/util-linux: build libraries as
 a separate package
In-Reply-To: <CAJ4jsaeNW-W_K-tu1g1hFrtkO9wy6p=spe4ccwOjkbukmpvsJg@mail.gmail.com>
References: <20190507165158.10427-1-unixmania@gmail.com>
 <20190507215424.791e69d3@windsurf> <20190507204018.GH6887@scaer>
 <CAJ4jsaeNW-W_K-tu1g1hFrtkO9wy6p=spe4ccwOjkbukmpvsJg@mail.gmail.com>
Message-ID: <a430a07e-e29f-8878-27c5-4fc89d63af85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/05/2019 00:12, Carlos A. M. dos Santos wrote:
> On Tue, May 7, 2019 at 5:40 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> On 2019-05-07 21:54 +0200, Thomas Petazzoni spake thusly:
>>> Hello Carlos,
>>>
>>> On Tue,  7 May 2019 13:51:58 -0300
>>> unixmania at gmail.com wrote:
>>>
>>>> The findmount and lsblk utilities need udev to work correctly but cannot
>>>> be built with udev support because the packages providing libudev (eudev
>>>> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
>>>> it by means of the following changes:
>>>
>>> Thanks a lot for working on this topic. It is obviously becoming a
>>> nightmare :-/
>>
>> Indeed, this is not a nice situation.
>>
>> However, here is what I propose we do
>>
>>  1- introduce util-linux-libs as you did, with a blind kconfig option
>>     (i.e. BR2_PACKAGE_UTIL_LINUX_LIBS exists but has no a prompt)
>>  2- update util-linux to depend on util=linux-libs when it is enabled
>>  3- change the existing udev providers (eudev and systemd) to depend on
>>     and select util-linux-libs instead of util-linux
>>
>> So yes, this means that we end up with the libs installed twice. That
>> would be reported by the check-uniq-file step.
>>
>> However, I believe this is really not a problem in fact. chekc-uniq-file
>> was initially introduced in preparation of top-level parallel build, but
>> the reason it was introduced is no longer 100% valid, as the trend is
>> now to install to a per-package target/ dir, and assemble the whole at
>> the end, in a reproducible order.
> 
> I think it's a risky approach because we end up building some packages
> with the libraries created by util-linux-libs and other packages with
> the libraries from util-linux.

 True, but it is well-defined which package will use which version:
eudev/systemd will use util-linux-libs, all the rest uses util-linux.

> I theory both builds would generate the
> same code but in fact we don't know. Think about analyzing a core
> dump, for instance.

 If it is a shared library, the version from util-linux wil always be used.

 If it is a static library, it's linked into the executable so even if it's a
different version, the executable will be internally consistent.

 And we can be sure that the source code is identical, so any debug symbols will
point to the right source.


 So, assuming that upstream will go in the right direction, Yann's proposal is
not bad as a temporary solution.


 Regards,
 Arnout
