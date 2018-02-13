From: Auke Oosterhoff <a.oosterhoff@climotion.com>
Date: Tue, 13 Feb 2018 13:46:41 +0100
Subject: [Buildroot] Bugs in patch [v2,7/7] package/mender: new package
In-Reply-To: <CAGkEsZy33hDrAeY3Cq+_w2Z_EH5WTMqF1fw4dL5q21G1_ev+=Q@mail.gmail.com>
References: <CAGkEsZy33hDrAeY3Cq+_w2Z_EH5WTMqF1fw4dL5q21G1_ev+=Q@mail.gmail.com>
Message-ID: <CAGkEsZz0uiR95Q7QSbOQC1GCccsy2vCm=1n8w3wXYbbOqwPvNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think Mender should be started at boot. It's otherwise not very useful.
To achieve this I suggest to add this line to MENDER_INSTALL_TARGET_CMDS
variable:

+       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+       ln -fs ../../../../usr/lib/systemd/system/memder.service \
+
$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mender.service


2018-01-30 15:27 GMT+01:00 Auke Oosterhoff <a.oosterhoff@climotion.com>:

> Hello,
>
> I tested a series of patches which add a new infrastructure for go
> packages[1] and patch 7[2] of this series contains a few bugs. The patch
> add support for the package Mender.
>
> The MENDER_INSTALL_TARGET_CMDS copies 2 different files to the same
> location, which is wrong. Both files should keep their name in target.
>
> +	$(INSTALL) -D -m 0644 package/mender/mender.conf \+		$(TARGET_DIR)/etc/mender/mender.conf+	$(INSTALL) -D -m 0644 package/mender/tenant.conf \+		$(TARGET_DIR)/etc/mender/mender.conf
>
> And also, the mender binary isn't copied to the target.
> I think the content of MENDER_INSTALL_TARGET_CMDS should be extended with:
>
> +	$(INSTALL) -D -m 0755 $(@D)/$(MENDER_BINDIR)/mender $(TARGET_DIR)/usr/bin/mender
>
> --
> Met vriendelijke groet,
>
> Auke Willem Oosterhoff
>
>
> [1]: https://patchwork.ozlabs.org/cover/854079/
> [2]: https://patchwork.ozlabs.org/patch/854085/
>
>
> <http://www.climotion.com/>
>



-- 
Met vriendelijke groet,

Auke Willem Oosterhoff
023 576 88 55
06 8360 935 50

<http://www.climotion.com/>

Climotion bv | +31 (0)23 576 88 55 | Wilhelminastraat 51 | 2011VL | Postbus
5241 | 2000 CE | Haarlem | www.climotion.com




<http://www.climotion.com/>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180213/7e47e390/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 2656 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180213/7e47e390/attachment.jpg>
