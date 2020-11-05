From: Mikhail Falaleev <Mikhail.Falaleev@synopsys.com>
Date: Thu, 5 Nov 2020 14:17:48 +0000
Subject: [Buildroot] Bug: cannot use git tag with slashes as package version
Message-ID: <MWHPR12MB1823EC3FE8467FE4B4095380A7EE0@MWHPR12MB1823.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I was trying to build kernel using custom git tag as a version of package. That works as long as there is no slashes in git tag, I reproduce following example on 2020.05:

----------->&-----------
$ make snps_archs38_hsdk_defconfig
$ make GCC_INITIAL_SITE_METHOD=git GCC_SITE=git://gcc.gnu.org/git/gcc.git BR2_GCC_VERSION=releases/gcc-10.2.0 V=1 host-gcc-initial-source
...
... support/download/dl-wrapper ... -u git+git://gcc.gnu.org/git/gcc.git/gcc-releases ...
...
fatal: remote error: no such repository: /git/gcc.git/gcc-releases
...
----------->&-----------

As you can see we were trying to use wrong url to clone git repository: git+git://gcc.gnu.org/git/gcc.git/gcc-releases (instead of git+git://gcc.gnu.org/git/gcc.git)

This url was generated at this line: https://github.com/buildroot/buildroot/blob/2020.05/package/pkg-download.mk#L83

$(1) variable here was "git+git://gcc.gnu.org/git/gcc.git/gcc-releases/gcc-10.2.0.tar.gz". Normally "dir" function cuts everything after last slash so we get correct repo url. But because of we have extra slash here we got wrong url ("git+git://gcc.gnu.org/git/gcc.git/gcc-releases" instead of "git+git://gcc.gnu.org/git/gcc.git")

Before we handle this urls in line that I've mentioned below, they are being generated here: https://github.com/buildroot/buildroot/blob/2020.05/package/pkg-generic.mk#L553

I was not able to come up with idea where exactly can I fix this issue and not to brake logic of other downloading methods. Do you have any ideas how could it be fixed or at least workarounded?

--
Best regards,
Falaleev Mikhail

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201105/ddc33943/attachment.html>
