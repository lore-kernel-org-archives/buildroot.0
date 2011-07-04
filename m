From: Luca Ceresoli <luca.ceresoli@comelit.it>
Date: Mon, 04 Jul 2011 11:04:26 +0200
Subject: [Buildroot] [PATCH 0/1] Bug in the boot process using mdev
In-Reply-To: <20110704085419.47aa9b62@skate>
References: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
 <20110704085419.47aa9b62@skate>
Message-ID: <4E11821A.5020003@comelit.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you very much for your reply.

Thomas Petazzoni wrote:
...
> I initially implemented mdev support as you proposed, with a separate
> static device table for the few device nodes that are mandatory to get
> the system up to a point where mdev can be started.
>
> However, after discussions on the list, we decided that both our mdev
> and udev configurations should rely on devtmpfs. So when the mdev or
> udev mechanisms are selected in Buildroot configuration, we assume that
> devtmpfs will be mounted in /dev at boot time.
>
> This is automatically ensured when Buildroot is responsible for
> building the kernel. See linux/linux.mk :
>
> ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
>          $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
> endif
>
> However, if you build your kernel separately, then indeed, it's your
> responsibility to make sure that DEVTMPFS and DEVTMPFS_MOUNT are
> enabled.

Shame on me!
My kernel _is_ built by buildroot, and the two DEVTMPFS options _are_
activated. The problem is that I was unaware of that, and went on using
the previously compiled kernel uImage I had lying in /dev/tftp.

>
> This is probably a requirement that should be better documented, at
> least in the static/devtmpfs/mdev/udev configuration option help.
>

Really, as I just proved in such a clumsy way.
But I admit I'd rather wait for it to be done by anybody seriously
knowing the issue (which is probably you). :)

Luca

--------------------------------------------------------------------------
Luca Ceresoli
Comelit R&D - Progettazione Software

Phone
Fax
Mail
Web
YouTube 

luca.ceresoli at comelit.it
http://www.comelitgroup.com/
http://www.youtube.com/comelitgroup
--------------------------------------------------------------------------
Prima di stampare pensa all'ambiente / Think about environment before printing
AVVISO DI CONFIDENZIALIT?
Questo messaggio ed i suoi eventuali allegati pu? contenere informazioni confidenziali, di propriet?, legalmente protette.? destinato all'utilizzo esclusivo del destinatario sopra indicato; privatezza e confidenzialit? non sono modificati da eventuali errori di trasmissione. Se il messaggio non ? a lei destinato, non deve utilizzarlo, diffonderlo, copiarlo con qualunque mezzo, o intraprendere azioni basandosi su di esso. Se ha ricevuto questo messaggio per errore, la preghiamo di volerlo distruggere (unitamente ad eventuali copie dello stesso) e di volerci cortesemente informare del fatto scrivendo al mittente.
CONFIDENTIALITY NOTICE
This message and its attachments (if any) may contain confidential, proprietary or legally privileged information and it is intended only for the use of the addressee named above. No confidentiality or privilege is waived or lost by any erroneous transmission. If you are not the intended recipient of this message you are hereby notified that you must not use, disseminate, copy it in any form or take any action in reliance on it. If you have received this message in error, please, delete it (and any copies of it) and kindly inform the sender.
