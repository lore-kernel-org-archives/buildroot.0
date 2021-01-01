From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Fri, 1 Jan 2021 22:22:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: adds target install of
 systemd unit files
In-Reply-To: <20201231173109.7d874dc2@windsurf>
References: <20201215163610.12070-1-edmundo.ferreira@esa.int>
 <20201231154332.13ef7654@windsurf> <20201231173109.7d874dc2@windsurf>
Message-ID: <CAFv936FkPmRSQE3XnUpiwc6AP3iYMOn0w4VKAtJV8ZxETEJ8EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed I just arrived at the same conclusion, that
OPENVPN_INSTALL_TARGET_CMDS, was overriding the default autotools install.

The following items get added now correctly to the target

./usr/share/doc/openvpn
./usr/include/openvpn-msg.h
./usr/include/openvpn-plugin.h
./usr/lib/systemd/system/openvpn-server at .service
./usr/lib/systemd/system/openvpn-client at .service
./usr/lib/openvpn
./usr/lib/openvpn/plugins/openvpn-plugin-auth-pam.la
./usr/lib/openvpn/plugins/openvpn-plugin-down-root.so
./usr/lib/openvpn/plugins/openvpn-plugin-auth-pam.so
./usr/lib/openvpn/plugins/openvpn-plugin-down-root.la
./usr/lib/tmpfiles.d/openvpn.conf
./usr/sbin/openvpn

Add after the documentation, headers and statics libs (in my case shared
only) get removed.

./usr/lib/systemd/system/openvpn-server at .service
./usr/lib/systemd/system/openvpn-client at .service
./usr/lib/openvpn
./usr/lib/openvpn/plugins/openvpn-plugin-down-root.so
./usr/lib/openvpn/plugins/openvpn-plugin-auth-pam.so
./usr/lib/tmpfiles.d/openvpn.conf
./usr/sbin/openvpn

Thank you, for the fix.

Best regards,
Edmundo




On Thu, Dec 31, 2020 at 5:31 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Thu, 31 Dec 2020 15:43:32 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > Hum, I've applied, but reading again distro/systemd/Makefile.am, it
> > seems like manually copying those files is not needed. If you pass
> > --enable-systemd, which we already do when BR2_PACKAGE_SYSTEMD=y. Isn't
> > that working ?
>
> I found why: we had a custom OPENVPN_INSTALL_TARGET_CMDS instead of
> relying on the default "make install" behavior of the autotools-package
> infra. So, I made a follow-up commit that drops this as well as the
> custom systemd installation stuff, as "make install" does it all
> properly.
>
> See:
>
>
> https://git.buildroot.org/buildroot/commit/?id=30bc58d3766b240017120a25d843da0a2c5cf501
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210101/72022751/attachment.html>
