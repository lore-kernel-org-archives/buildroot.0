From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Tue, 21 Mar 2017 09:19:03 -0300 (BRT)
Subject: [Buildroot] [PATCH 00/16] Enable hash checking for git downloads
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <615428903.15419757.1490098743835.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

----- Original Message -----
> From: "Arnout Vandecappelle"
> Sent: Monday, March 20, 2017 9:06:56 PM
> Subject: [Buildroot] [PATCH 00/16] Enable hash checking for git downloads
[snip]
> [PATCH 01/16] download/git: create GNU format tar files
> [PATCH 02/16] aer-inject: remove redundant _SITE_METHOD
> [PATCH 03/16] fmc: correct hash file
> [PATCH 04/16] linux-firmware: correct hash
> [PATCH 05/16] squashfs: correct hash
> [PATCH 06/16] ubus: add hash
> [PATCH 07/16] uhttpd: add hash
> [PATCH 08/16] vboot-utils: add hash
> [PATCH 09/16] linux: exclude from hash check except for latest
> [PATCH 10/16] linux-headers: rework hash exclusion
> [PATCH 11/16] uboot: exclude from hash check except for latest
> [PATCH 12/16] barebox: exclude from hash check except for latest
> [PATCH 13/16] at91bootstrap3: exclude from hash when downloading from
> [PATCH 14/16] mxs-bootlets: exclude from hash when downloading from
> [PATCH 15/16] arm-trusted-firmware: exclude from hash when
> [PATCH 16/16] pkg-download: enable hash check for git downloads

fmc-source works fine for me but host-vboot-utils-source does not.
Also arm-trusted-firmware-source falls back to sources.buildroot.net for me.
See logs below.

git clean -ffdx && make defconfig
make fmc-source
----->8-----
>>> fmc fsl-sdk-v2.0 Downloading
Doing shallow clone
Cloning into 'fmc-fsl-sdk-v2.0'...
remote: Counting objects: 69, done.
remote: Compressing objects: 100% (65/65), done.
remote: Total 69 (delta 9), reused 26 (delta 2)
Receiving objects: 100% (69/69), 276.00 KiB | 138.00 KiB/s, done.
Resolving deltas: 100% (9/9), done.
Note: checking out 'a079d2c844edd85dff85a317a63198e7988bcd09'.
[snip git detached HEAD warning]
warning: refname 'fsl-sdk-v2.0' is ambiguous.
fmc-fsl-sdk-v2.0.tar.gz: OK (sha256: a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4)
----->8-----

make host-vboot-utils-source
----->8-----
>>> host-vboot-utils bbdd62f9b030db7ad8eef789aaf58a7ff9a25656 Downloading
Doing full clone
Cloning into 'vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656'...
remote: Sending approximately 38.99 MiB ...
remote: Total 21863 (delta 14206), reused 21863 (delta 14206)
Receiving objects: 100% (21863/21863), 38.99 MiB | 1.55 MiB/s, done.
Resolving deltas: 100% (14206/14206), done.
warning: refname 'bbdd62f9b030db7ad8eef789aaf58a7ff9a25656' is ambiguous.
[snip git warning]
ERROR: vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz has wrong sha256 hash:
ERROR: expected: e119782a374655117e3d9a4e667b0056c76961c4593ba907f860d1310f6fbc2a
ERROR: got     : d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2017-03-21 09:14:38--  http://sources.buildroot.net/vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:3128... connected.
Proxy request sent, awaiting response... 200 OK
Length: 35645166 (34M) [application/x-gzip]
[snip long lines]
ERROR: vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz has wrong sha256 hash:
ERROR: expected: e119782a374655117e3d9a4e667b0056c76961c4593ba907f860d1310f6fbc2a
ERROR: got     : 2c71c3d04b9397ccb4b18202ca83d507f227e1e39c2bab6c9be2c3859155a52b
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
----->8-----

git clean -ffdx
make arm_juno_defconfig
make arm-trusted-firmware-source
----->8-----
Doing shallow clone
Cloning into 'arm-trusted-firmware-v1.2'...
remote: Counting objects: 645, done.
remote: Compressing objects: 100% (550/550), done.
remote: Total 645 (delta 240), reused 288 (delta 46), pack-reused 0
Receiving objects: 100% (645/645), 1.96 MiB | 827.00 KiB/s, done.
Resolving deltas: 100% (240/240), done.
Note: checking out 'd0c104e1e1ad0102f0f4c70997b7ee6e6fbbe273'.
[snip git warning]
warning: refname 'v1.2' is ambiguous.
ERROR: arm-trusted-firmware-v1.2.tar.gz has wrong sha256 hash:
ERROR: expected: cbdd9b770ec1ab4933fc7f9f520daea5a364bb4dc964820fb017a0cf8c7df556
ERROR: got     : 0eeba7a89028392a97fd64fc9052a36391af388ff716bd7c884cd50098a2f50c
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2017-03-21 09:04:41--  http://sources.buildroot.net/arm-trusted-firmware-v1.2.tar.gz
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:3128... connected.
Proxy request sent, awaiting response... 200 OK
Length: 1808700 (1,7M) [application/x-gzip]
Saving to: ?/tmp/git-hash/output/build/.arm-trusted-firmware-v1.2.tar.gz.clvxYW/output?
[snip long lines]
arm-trusted-firmware-v1.2.tar.gz: OK (sha256: cbdd9b770ec1ab4933fc7f9f520daea5a364bb4dc964820fb017a0cf8c7df556)
arm-trusted-firmware-v1.2.tar.gz: OK (md5: fac2c08bd74337fec2e14a98fc9f748f)
----->8-----

cat /etc/os-release | grep VERSION= ; git --version ; tar --version | grep tar
----->8-----
VERSION="14.04.5 LTS, Trusty Tahr"
git version 2.11.0
tar (GNU tar) 1.27.1
----->8-----

git log --oneline --decorate -17
----->8-----
4b9c7077a6 (HEAD) pkg-download: enable hash check for git downloads
9183c9d31e arm-trusted-firmware: exclude from hash when downloading from git
6db2b0ba07 mxs-bootlets: exclude from hash when downloading from git
69f9d1b489 at91bootstrap3: exclude from hash when downloading from git
804053ad18 barebox: exclude from hash check except for latest version
989d9b77f5 uboot: exclude from hash check except for latest version
95d5d580ea linux-headers: rework hash exclusion
524a3f8aed linux: exclude from hash check except for latest version
8c3f8dc348 vboot-utils: add hash
bfe808e92d uhttpd: add hash
885bce3fec ubus: add hash
331d44fae2 squashfs: correct hash
7c4b32dfb7 linux-firmware: correct hash
d8e8a374e6 fmc: correct hash file
1a6e356b9d aer-inject: remove redundant _SITE_METHOD
0501fe2808 download/git: create GNU format tar files
1a83dda003 (upstream/master) package/ghostscript: new package
----->8-----

Best regards,
Ricardo
