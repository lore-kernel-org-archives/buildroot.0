From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 25 Feb 2018 13:18:57 +0100
Subject: [Buildroot] How to install Perl install.pl based package to
 target
In-Reply-To: <CAPi4xiWQtndML7mb_n2HCXn3WMcK3afwj-bJaDQ=Gwk7nyBZFg@mail.gmail.com>
References: <CAPi4xiWQtndML7mb_n2HCXn3WMcK3afwj-bJaDQ=Gwk7nyBZFg@mail.gmail.com>
Message-ID: <CAB0FRsuPAYQt7nzHQV6Lasgjd0Ys=zVurdqkMN_+N9kcbbbiJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-02-24 18:53 GMT+01:00 Sam <samiswt@gmail.com>:

> Hey everyone,
>
> I'm trying to add a package named fwsnort to my buildroot package, what
> should I do? Or it's impossible?
>
> I tried to use generic-package and put command line ' Perl ./install.pl'
> into CONFIGURE_CMDS block, and it didn't work by throwing an error message:
> /bin/sh, unrecognized command end.
>
> Thanks,
>
>
generic-package is the good way, an INSTALL_TARGET_CMDS will do all the job

FWSNORT_VERSION = 1.6.7
FWSNORT_SITE = http://www.cipherdyne.org/fwsnort/download
FWSNORT_DEPENDENCIES = perl-netaddr-ip perl-iptables-parse

define FWSNORT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/fwsnort $(TARGET_DIR)/usr/bin/fwsnort
	$(INSTALL) -m 0644 -D $(@D)/fwsnort.conf $(TARGET_DIR)/etc/fwsnort/fwsnort.conf
	mkdir -p $(TARGET_DIR)/etc/snort/rules
	$(INSTALL) -m 0644 $(@D)/deps/snort_rules/*.rules $(TARGET_DIR)/etc/snort/rules
endef

$(eval $(generic-package))

The missing dependency (perl-iptables-parse) could be created by the
following command:
$ utils/scancpan IPTables-Parse

Fran?ois


>
> Tao
> --
> Sent from Gmail Mobile
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180225/b61b97c9/attachment.html>
