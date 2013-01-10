From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 10 Jan 2013 21:52:38 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
	*-config files
Message-ID: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will add <pkg>_CONFIG_FIXUP variable to buildroot infra.
It's purpose is to inform buildroot that the package in question
contains some $(STAGING_DIR)/usr/bin/*-config files and that we
want to automatically fix prefixes of such files.

It is often the case that many pckages call these
files during their configuration step to determine 3rd party
library package locations and any flags needed to link against them.

For example:
Some package might try to check the existence and linking flags
of NSPR package by calling $(STAGING_DIR)/usr/bin/nspr-config --prefix
Without this fix, NSPR would return /usr as it's prefix which is
wrong when cross-compiling.
Correct would be $(STAGING_DIR)/usr.

All packages that have <pkg>_INSTALL_STAGING = YES defined and
also install some config file(s) into $(STAGING_DIR)/usr/bin must
hereafter also define <pkg>_CONFIG_FIXUP with the corresponding
filename(s).

For example:

DIVINE_CONFIG_FIXUP = divine-config

or for multiple files:

IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config

Changes v1 -> v2:
- remove if-statement for file checking (Thomas Petazzoni)
- remove redundant '\ from sed line (Arnout Vandecappelle)
- use $(addprefix ... ) in sed line (Arnout Vandecappelle)
- add $(Q) to front of variable cheking if-statement (Stefan Fr?berg)
