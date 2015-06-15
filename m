From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 15 Jun 2015 12:26:02 +0200
Subject: [Buildroot] $(SED) not defined if 'make menuconfig savedefconfig'
Message-ID: <CAM+bi4tjaJB2bJuQ40_cap55ZrEmOYg4Ssz+TMM_zg5Cb0yo6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

While using buildroot-submodule (
https://github.com/Openwide-Ingenierie/buildroot-submodule) I've noticed
this happens since commit f71a621d91ec27f175fc84012962f88b1107305f was
introduced into buildroot.

$ make menuconfig savedefconfig
[Do whatever, or nothing at all and exit, there's no need to save anything]
*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

make: /BR2_DEFCONFIG=/d: Command not found
Makefile:777: recipe for target 'savedefconfig' failed
make: *** [savedefconfig] Error 127

However,
$ make menuconfig
$ make savedefconfig

does not end with that error. I've just tracked it down to the fact that
$(SED) is not defined when menuconfig savedefconfig are used in a single
make call, whereas it equals to '/bin/sed -i -e'

Simply replacing that @$(SED) by /bin/sed -i -e on line 777 of Makefile
makes it work again, but I don't think that solution is desirable. I'm
sorry I can't provide a full patch, the motive of this bug is beyond my
knowledge.

Best regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150615/e5bb3d96/attachment.html>
