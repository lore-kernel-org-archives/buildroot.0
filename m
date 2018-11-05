From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 5 Nov 2018 08:30:03 -0200 (BRST)
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <20181102110420.0f4f44f1@windsurf>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
 <20181102110420.0f4f44f1@windsurf>
Message-ID: <1795749492.59166.1541413803133.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Erico Nunes" <nunes.erico@gmail.com>
> Cc: "sumit garg" <sumit.garg@linaro.org>, "buildroot" <buildroot@buildroot.org>
> Sent: Sexta-feira, 2 de novembro de 2018 7:04:20
> Subject: Re: [Buildroot] Queries/suggestions regarding patch series "grub2: add support for arm and aarch64"

> Hello,
> 
> On Tue, 30 Oct 2018 20:23:27 +0100, Erico Nunes wrote:
> 
>> Using PARTUUID seems to be an interesting change. I'd like to hear the
>> opinion of the other Buildroot developers before making this change in
>> this patchset though, since most other platforms in Buildroot are not
>> doing this.
> 
> It is certainly a good idea to use PARTUUID when possible.
> 
>> If there is interest in it, maybe we can do this change for other
>> platforms too and in a separate patchset?
> 
> In general yes. However, my understanding was that it works only with a
> GPT partition table, because only the GPT partition table can embed a
> unique identifier per partition, not the old MBR partition table. But
> apparently this disk-signature thing allows to embed a disk-wide
> identifier, not a per-partition one, so it works only when there's a
> single partition ?

PARTUUID works with MBR partition tables too, even tough the ID is
not a true UUID. It's build from the 32-bit long disk ID plus the
partition number, e.g. "f000-baad-01", "f000-baad-02".

One can force the disk ID of a disk image to a known value with
something like this (requires host-util-linux):

    img_name="disk.img"
    disk_id="$("${HOST_DIR}/bin/uuidgen" -r | cut -d - -f 1)"
    printf 'x\ni\n0x%s\nr\nw\n' "${disk_id}" \
        | "${HOST_DIR}/sbin/fdisk" "${BINARIES_DIR}/${img_name}" \
        > /dev/null

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
