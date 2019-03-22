From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 22 Mar 2019 14:26:01 +0100
Subject: [Buildroot] reduce install size of SQLite module for Node.js
Message-ID: <CAJiuCcc1ccSZowLF8Esh9_SL9eFKYCXS_Z=T06Wxsc3RSChr-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot users,

I need to install a Node.js app requiring the SQLite Node.js module
and my target is a RPi Zero.

I try different method but all of them result in an heavy folder >25M
where the source are kept.
On my X86 without SQLite lib install on the machine the Node.js module
is around 4,8M.

1) I try in the makefile of the Node.js app.
### package/my-app/my-app.mk
define MY_APP_INSTALL_TARGET_CMDS
        $(NPM) --prefix $(@D) install
        mkdir -p $(TARGET_DIR)/usr/my_app
        cp -r $(@D)/* $(TARGET_DIR)/usr/my_app
endef

$(eval $(generic-package))
###

As the SQLite module is not pre-compiled for the RPi npm will built it
from source (https://www.npmjs.com/package/sqlite3)

And this will leave all the source and dependencies on the target
(folder is >25M).

2) I try with a built-in SQLite lib :
with this settings :
 BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="sqlite3"
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS="sqlite"

But same issue the folder is still huge and keep the source.

Do you know, if it's possible and how i can tell npm to only install
the release module and not keep the source ?

Thanks,
Clement
