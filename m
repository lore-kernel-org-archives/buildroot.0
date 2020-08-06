From: Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com>
Date: Thu, 6 Aug 2020 09:30:00 +0000
Subject: [Buildroot] Fix OpTee PyCryptodomex Python 2 vs 3 issue
Message-ID: <a5494fd8-e371-84a5-b952-ebd6ab04a41b@brainlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I am using buildroot.2020.05.1. I am building optee with these options:

BR2_TARGET_OPTEE_OS=y
BR2_TARGET_OPTEE_OS_PLATFORM="k3-am65x"
BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee-*_v2.bin"

These leads to

Traceback (most recent call last):
File "scripts/pem_to_pub_c.py", line 61, in <module>
main()
File "scripts/pem_to_pub_c.py", line 24, in main
from Cryptodome.PublicKey import RSA
ModuleNotFoundError: No module named 'Cryptodome'

during build of optee-os. The script scripts/pem_to_pub_c.py is run with Python3, while optee-os has Python2 dependencies:

OPTEE_OS_DEPENDENCIES = host-openssl host-python-pycryptodomex host-python-pyelftools.

Thus, the Cryptodome module is not found.

What fixed that for me is to add a python3-pycryptodomex package and change `optee-os` dependencies to Python3 ones. The patches are attached.

Let me know whether adding these patches makes sense to you.

Kind regards and thanks for your great work on buildroot,

Jonatan

--
Jonatan Hatakeyama Zeidler
Software Engineer
Brainlab Robotics

T +49 89 99 15 68 ? 0
F +49 89 99 15 68 ? 5033

Medineering GmbH
Olof-Palme-Str. 1, 81829 M?nchen, Germany
Sitz d. Gesellschaft: M?nchen - Handelsregister: M?nchen HRB 212991
VAT.: DE296021936
Managing Director: Dr.-Ing. Maximilian Krinninger, Dr.-Ing. Stephan Nowatschin

This email, including its attachments, is intended only for the confidential use of the individual to whom it is addressed. If you are not the intended recipient, any use, dissemination, distribution or copying of this message or its attachments is prohibited. If you have received this message in error, please notify us immediately, and delete this message and its attachments permanently from your system.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/66267a25/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-python3-pycryptodomex-add-python3-pycryptodomex-package.patch
Type: text/x-patch
Size: 2950 bytes
Desc: 0001-package-python3-pycryptodomex-add-python3-pycryptodomex-package.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/66267a25/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-boot-optee-os-optee-os-mk-optee-op-use-python3-dependencies.patch
Type: text/x-patch
Size: 907 bytes
Desc: 0002-boot-optee-os-optee-os-mk-optee-op-use-python3-dependencies.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200806/66267a25/attachment-0001.bin>
