From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 2 Apr 2017 11:30:37 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck if
	chosen
In-Reply-To: <CAGduivyWyX-d_hCJKaVi5LWLP33W+4Hc8G64myJf81ZWqHBEHg@mail.gmail.com>
References: <1491100601-7867-1-git-send-email-casantos@datacom.ind.br>
 <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
 <263644142.17286378.1491134582819.JavaMail.zimbra@datacom.ind.br>
 <CAGduivyWyX-d_hCJKaVi5LWLP33W+4Hc8G64myJf81ZWqHBEHg@mail.gmail.com>
Message-ID: <1429239756.17288393.1491143437663.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Sunday, April 2, 2017 9:10:45 AM
> Subject: Re: [PATCH v2] e2fsprogs: keep util-linux's fsck if chosen

> On Sun, Apr 2, 2017 at 2:03 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
>>> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>>> To: "Carlos Santos" <casantos@datacom.ind.br>
>>> Cc: "buildroot" <buildroot@buildroot.org>
>>> Sent: Sunday, April 2, 2017 7:13:18 AM
>>> Subject: Re: [PATCH v2] e2fsprogs: keep util-linux's fsck if chosen
>>
>>> Hi all,
>>>
>>> On Sun, Apr 2, 2017 at 4:36 AM, Carlos Santos <casantos@datacom.ind.br> wrote:
>>>> Since e2fsprogs depends on util-linux, it's built after it. So you can't
>>>> have e2fsck from e2fsprogs along with the fsck wrapper from util-linux
>>>> (which is better maintained and compatible with systemd) because we end
>>>> up deleting the fsck from util-linux.
>>>>
>>>> Fix this issue by disabling e2fsprogs' fsck if the one from util-linux
>>>> is selected.
>>>>
>>>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>>>> ---
>>>> Changes v1->v2
>>>>   - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
>>>>     BR2_PACKAGE_E2FSPROGS_FSCK
>>>>   - Add comment telling that the fsck from util-linux has preference.
>>>>   - Pass "--enable-fsck" conditionally to configure
>>>>   - Remove the guard around the removal of /usr/sbin/fsck, since the
>>>>     fsck from busybox and util-linux are installed at /sbin
>>>>   - Improve comments and commit message
>>>>
>>>> In the long run the e2fsprogs recipe deserves an extreme overhauling
>>>> like we did for util-linux but right now these changes are enough to
>>>> fix the specific problem of fsck.
>>>> ---
>>> It's almost working, but there's a trick for systemd (*tadaaa*)
>>> To have fsck work at boot time, you *MUST* have the fsck (the wrapper)
>>> from util-linux, because systemd passes arguments that do not exists
>>> in the e2fsprogs wrapper. But you should use the e2fsck program and
>>> its link.
>>> So for this to truly work, if systemd is selected, you should select
>>> util-linux's fsck, disable e2fsprogs fsck wrapper and enable e2fsck.
>>
>> Do you mean something like this in package/systemd/Config.in?
>>
>>         select BR2_PACKAGE_UTIL_LINUX_FSCK
>>         select BR2_PACKAGE_E2FSPROGS
>>         select BR2_PACKAGE_E2FSPROGS_E2FSCK
>>
>> I agree, but that must be done in a subsequent commit.
> Oh yes, absolutely. Also, the busybox's fsck won't work with systemd,
> so you must also take that into account.

That could be handled in the util-linux recipe building busybox before,
like e2fsprogs does. However, util-linux installs fsck unconditionally
while busybox avoids overriding an existing /sbin/fsck, so their build
and installation should be irrelevant. A good test is to run

    $ make clean systemd busybox
    $ make clean busybox systemd

after making the required changes in the systemd recipe and Config.in,
of course. In both cases $(TARGET_DIR)/sbin/fsck should have come from
util-linux and no $(TARGET_DIR)/usr/sbin/fsck should exist.

>>> Note that in case of failure, systemd will try to run emergency.target
>>> and all kinds of things may happen if you haven't created some
>>> post-build or other scripts.
>>
>> I'm not well versed on systemd (not even poorly versed, in fact). Feel
>> free to educate me. :-)
> Well, in this case, I am just putting this here to share the
> knowledge, but I don't think Buildroot specifically should do anything
> about this. It's not our role I think. Maybe we could add a pointer in
> the "Help" in the menuconfig to the systemd's documentation or
> something.

I agree, but I don't feel confident to change the systemd recipe beyond
the minimal requirements to fix the fsck issue.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
