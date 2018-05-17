From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 17 May 2018 20:53:39 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-16
References: <CAPP7BN2g6Wr6NE9C0ALM9YHf1RcwzFTQ=tyhnpJwR=4rBMxHrg@mail.gmail.com>
Message-ID: <5afe16031511a_a612ac2d925f5644458@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Yann

On Thu, May 17, 2018 at 03:51 AM, Erik Larsson wrote:

>>          arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/7c63ab1188a45d4684e159456f561a4e7c39e612 |
> 
> This error is because the hash is incorrect. But I don't really
> understand why. I've downloaded the new source and compared it with
> the old source that I had in my dl folder and it's the same. There are
> no changes in the git-repo but when I compare the tar.gz file in the
> dl folder they differs, just as the test notice. So the simple
> solution would be to update the hash value and commit it. But I don't
> really like not understanding why this error happens at the first
> place.

By inspecting the tarball [1] with 'tar -tvf' I can see it contains:
"imx-mkimage-rel_imx_4.9.51_8mq_ga\\/Makefile"
instead of
"imx-mkimage-rel_imx_4.9.51_8mq_ga/Makefile"

I believe the hash was calculated (and the tarball [1] was generated) using tar
1.27.1 before 6e2f5d0254 "download/git: fix transform regexp for older tar
versions" (Fri Apr 20 09:36:32 2018 +0200), see my tests below.

I think we can safely update the hash value and commit it.

When the patch fixing the hash get applied, should the tarball [1] be manually
removed? Will it be automatically overwritten by an autobuilder instance?

[1] http://sources.buildroot.net/imx-mkimage/imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz
    2018-Apr-10 08:10:35    118.1K    application/x-gtar-compressed

Tests:
$ git checkout origin/master # 45cf64ca0c
$ make defconfig
$ ./utils/config --set-str BR2_BACKUP_SITE ""
$ rm package/tar/tar.hash
$ sed -e 's,^TAR_VERSION .*,TAR_VERSION = 1.27.1,g' -i package/tar/tar.mk
$ make host-tar
$ BR2_DL_DIR=$(mktemp -d) make host-imx-mkimage-dirclean host-imx-mkimage-source
ERROR: expected: 17e8285a346eb19d00780b13916dc281421c5b955707b9f2a662a6734142f1fb
ERROR: got     : bc79e11cfbde303e200287fa6624028c8ce5344f8a35ed179b3fe217d74155da
$ git revert 6e2f5d0254 # download/git: fix transform regexp for older tar versions
$ BR2_DL_DIR=$(mktemp -d) make host-imx-mkimage-dirclean host-imx-mkimage-source
imx-mkimage-rel_imx_4.9.51_8mq_ga.tar.gz: OK (sha256: 17e8285a346eb19d00780b13916dc281421c5b955707b9f2a662a6734142f1fb)

Regards,
Ricardo
