From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 25 May 2018 20:24:58 +0200
Subject: [Buildroot] [PATCH] package/nss-myhostname: Add package
In-Reply-To: <87sh6f8y8t.fsf@dell.be.48ers.dk>
References: <1527168341-29387-1-git-send-email-vincent.prince.fr@gmail.com>
 <87sh6f8y8t.fsf@dell.be.48ers.dk>
Message-ID: <CAB2nKc8k8qc2=9vON1vzyJ0LwNAAkyLFm=kYUVahkwoLkQR7oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I'll send V2 on monday with:
  - patch split
  - DEVELOPERS
  - fix indentation
  - sha256 sig
  - AUTORECONF removed

nsswitch.conf resolve hosts in entries order, so it is important that it
resides after files and before the other entries.
Sed command comes from Yocto recipe
https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

Best regards,
Vincent



2018-05-25 19:02 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:
>
>  > Also fix nss-mdns hook to work with nss-myhostname
>
>  > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>
> Thanks for you contribution! Can you please split this in two patches,
> E.G. one to change nss-mdns and one to add nss-myhostname?
>
> Also please add an entries to the DEVELOPERS file and run
> ./utils/check-package on your new files, I see a number of strange
> indentation issues.
>
> While you are at it, please also add a sha256 hash for the license file.
>
>  > +
>  > +NSS_MYHOSTNAME_VERSION = 0.3
>  > +NSS_MYHOSTNAME_SITE = http://0pointer.de/lennart/
> projects/nss-myhostname
>  > +NSS_MYHOSTNAME_LICENSE = LGPL-2.1
>  > +NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
>  > +NSS_MYHOSTNAME_AUTORECONF = YES
>
> Why? Does the tarball not contain a configure script?
>
> > +
>  > +define MYHOSTNAME_SET_NSSWITCH
>  > +    $(SED) '/^hosts:/s/\s*\<myhostname\>//' \
>  > +            -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2
> myhostname \3\4\5/' -r $(TARGET_DIR)/etc/nsswitch.conf
>  > +endef
>
> Doesn't nss-myhostname just need to go to the end of the file?
> E.G. something like:
>
>      grep -qw myhostname $(TARGET_DIR)/etc/nsswwitch.conf || \
>           $(SED) '/\(^hosts:.*\)/\1 myhostname/'
> $(TARGET_DIR)/etc/nsswitch.conf
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180525/c8c9a336/attachment.html>
