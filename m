From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 10 Apr 2017 13:30:38 +0200
Subject: [Buildroot] [PATCH v5 2/2] systemd: select util-linux/fsck and
	e2fsprogs/e2fsck
In-Reply-To: <f30c9756-7b98-ec8c-90dd-612d31d81491@mind.be>
References: <1491794596-8454-1-git-send-email-casantos@datacom.ind.br>
 <1491794596-8454-3-git-send-email-casantos@datacom.ind.br>
 <CAGduivxv5seLe6Oz7j+DBjA3kX=b5ksKfTPbStTYezhrKqo7Yg@mail.gmail.com>
 <f30c9756-7b98-ec8c-90dd-612d31d81491@mind.be>
Message-ID: <CAGduivzjdtVRrKJbfD3TZpoNDX=rEUP_d42dErCid-eg1UQySw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Apr 10, 2017 at 1:13 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Maxime,
>
> On 10-04-17 13:02, Maxime Hadjinlian wrote:
>> Hi all, Carlos
>>
>> Thanks for pushing with this, it's really neat :)
>>
>> On Mon, Apr 10, 2017 at 5:23 AM, Carlos Santos <casantos@datacom.ind.br> wrote:
>>> e2fsprogs does not override/remove the fsck from util-linux anymore when
>>> /sbin and /usr/sbin are merged. So we can select the fsck tools required
>>> by systemd provided by those packages. This also prevents ending up with
>>> the fsck from busybox, which is incompatible with systemd.
>>>
>>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>>> ---
>>>  package/systemd/Config.in | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>>> index 0f54686..f5eb9d0 100644
>>> --- a/package/systemd/Config.in
>>> +++ b/package/systemd/Config.in
>>> @@ -22,6 +22,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
>>>         select BR2_PACKAGE_UTIL_LINUX_BINARIES
>>>         select BR2_PACKAGE_UTIL_LINUX_MOUNT
>>>         select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
>>> +       select BR2_PACKAGE_UTIL_LINUX_FSCK
>>> +       select BR2_PACKAGE_E2FSPROGS
>>> +       select BR2_PACKAGE_E2FSPROGS_E2FSCK
>>>         select BR2_PACKAGE_KMOD
>>>         select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
>>>         select BR2_PACKAGE_KMOD_TOOLS
>>> --
>> I haven't tested it but this looks good to me.
>>
>> Reviewed-by: "Maxime Hadjinlian <maxime.hadjinlian@gmail.com>"
>
>  Do you agree with me that selecting e2fsprogs shouldn't be necessary, because
> you actually only need them when you mount an ext2 filesystem (which isn't
> necessarily the case)?
>
>  I'm not sure what happens exactly when you have util-linux fsck but no e2fsck
> and you try to mount an ext2 filesystem...
It would error out I think.

You are absolutely right, I only saw my own usecase but this only
works with an extX filesystem, if you want another fs, you need to
select the right tool for the job.
Then, how do we know what the user want ? There is the obivous ext
filesystem option, but you can always select this, and another
filesystem images and use them in different scenario or something.
So, should that be a choice menu and we let the user decide ? Or do we
just put a comment in the documentation or the help message of systemd
and let the user do the correct choice ?

I would go for the choice, with a default to extX as I think it's
easier and is pretty safe to assume lot of people are using that
theses filessytems now.
>  Regards,
>  Arnout
>
>>
>>> 2.7.4
>>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
