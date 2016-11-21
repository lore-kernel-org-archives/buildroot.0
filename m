From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 21 Nov 2016 15:24:07 +0100
Subject: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if
	chosen
In-Reply-To: <1043203342.6813512.1479733854854.JavaMail.zimbra@datacom.ind.br>
References: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
 <20161118152427.16515-2-maxime.hadjinlian@gmail.com>
 <1043203342.6813512.1479733854854.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAGduivxBL8=fZafQG3odT_2_UUDruUgB1ioozn9tJvX6OPe_Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

On Mon, Nov 21, 2016 at 2:10 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
>> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>> To: buildroot at buildroot.org
>> Sent: Friday, November 18, 2016 1:24:27 PM
>> Subject: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if chosen
>
>> Since e2fsprogs depends on util-linux, it's build after it. It means
>> that if you want the fsck wrapper from util-linux (which is better
>> maintained and you are sure that it's compatible with systemd) and you
>> want e2fsck, it won't work.
>>
>> Because of the merge of /usr/bin and /bin, we end up deleting the fsck
>> from util-linux.
>>
>> This makes an attempt at fixing the issues.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>> I am cleary not satisfied by the way I handled that, I am not even sure
>> it works in all cases. I can't spend much more time on this right now,
>> so I need advice/help from the community to fix that in a proper/generic
>> manner.
> What about using something like this, instead?
It's indeed better, but you have to keep the bit about the busybox
applet due to the merge of /sbin and /usr/sbin
>
> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
> index 4db11e1..c0b48e1 100644
> --- a/package/e2fsprogs/Config.in
> +++ b/package/e2fsprogs/Config.in
> @@ -60,8 +60,12 @@ config BR2_PACKAGE_E2FSPROGS_FILEFRAG
>
>  config BR2_PACKAGE_E2FSPROGS_FSCK
>         bool "fsck"
> +       depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
>         default y
>
> +comment "the fsck from util-linux has preference over this one"
> +       depends on BR2_PACKAGE_UTIL_LINUX_FSCK
> +
>  config BR2_PACKAGE_E2FSPROGS_FUSE2FS
>         bool "fuse2fs"
>         depends on !BR2_STATIC_LIBS # libfuse
>
>
> Carlos Santos (Casantos)
> DATACOM, P&D
>
