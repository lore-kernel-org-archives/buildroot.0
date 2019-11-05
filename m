From: jemy.zhang at gmail.com <jemy.zhang@gmail.com>
Date: Tue,  5 Nov 2019 17:04:47 +0800
Subject: [Buildroot] [PATCH 0/1] download url broken if url include '+'
Message-ID: <20191105090448.99235-1-jemy.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Jemy Zhang" <jemy.zhang@gmail.com>

While downloading pacakges, the `SITE_METHOD` will be prefixed to the download url of the main package, but the extra download url would not be. If the `SITE URL` accidentally includes '+', url link before '+' would be parsed as `SITE METHOD` by dl-wrapper, and the url broken.

Take `android-tools` package for example:
```
ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
```

while build the android-tools package, `ALL_DOWNLOADS` will be expended as:

```
for p in https+https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_4.2.2+git20130218.orig.tar.xz   https://launchpad.ne
t/ubuntu/+archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz; do \
        if test ! -e /mnt/fileroot/jun.zhang/buildroot-git/buildroot/dl/android-tools/`basename $p` ; then \
                echo ">>> android-tools 4.2.2+git20130218 Downloading" ; \
                break ; \
        fi ; \
done
```

Notice that there's no 'https+' prefixed to the url, `SITE_METHOD` missing.

and while downloading package, url corrupted:

>--2019-11-05 14:10:29--  http://archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz


Jemy Zhang (1):
  fix corrupted download url of extra packages

 package/pkg-generic.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.22.0
