From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 2 Apr 2017 09:03:02 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck if
	chosen
In-Reply-To: <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
References: <1491100601-7867-1-git-send-email-casantos@datacom.ind.br>
 <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
Message-ID: <263644142.17286378.1491134582819.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Sunday, April 2, 2017 7:13:18 AM
> Subject: Re: [PATCH v2] e2fsprogs: keep util-linux's fsck if chosen

> Hi all,
> 
> On Sun, Apr 2, 2017 at 4:36 AM, Carlos Santos <casantos@datacom.ind.br> wrote:
>> Since e2fsprogs depends on util-linux, it's built after it. So you can't
>> have e2fsck from e2fsprogs along with the fsck wrapper from util-linux
>> (which is better maintained and compatible with systemd) because we end
>> up deleting the fsck from util-linux.
>>
>> Fix this issue by disabling e2fsprogs' fsck if the one from util-linux
>> is selected.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>> Changes v1->v2
>>   - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
>>     BR2_PACKAGE_E2FSPROGS_FSCK
>>   - Add comment telling that the fsck from util-linux has preference.
>>   - Pass "--enable-fsck" conditionally to configure
>>   - Remove the guard around the removal of /usr/sbin/fsck, since the
>>     fsck from busybox and util-linux are installed at /sbin
>>   - Improve comments and commit message
>>
>> In the long run the e2fsprogs recipe deserves an extreme overhauling
>> like we did for util-linux but right now these changes are enough to
>> fix the specific problem of fsck.
>> ---
> It's almost working, but there's a trick for systemd (*tadaaa*)
> To have fsck work at boot time, you *MUST* have the fsck (the wrapper)
> from util-linux, because systemd passes arguments that do not exists
> in the e2fsprogs wrapper. But you should use the e2fsck program and
> its link.
> So for this to truly work, if systemd is selected, you should select
> util-linux's fsck, disable e2fsprogs fsck wrapper and enable e2fsck.

Do you mean something like this in package/systemd/Config.in?

        select BR2_PACKAGE_UTIL_LINUX_FSCK
        select BR2_PACKAGE_E2FSPROGS
        select BR2_PACKAGE_E2FSPROGS_E2FSCK

I agree, but that must be done in a subsequent commit.

> Note that in case of failure, systemd will try to run emergency.target
> and all kinds of things may happen if you haven't created some
> post-build or other scripts.

I'm not well versed on systemd (not even poorly versed, in fact). Feel
free to educate me. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
