From: matthew.amlogic shyu <matthew.shyu.amlogic@gmail.com>
Date: Thu, 18 Feb 2016 09:05:09 +0800
Subject: [Buildroot] [PATCH 1/1] fix host-openssl binary installation
In-Reply-To: <8737sr1ise.fsf@dell.be.48ers.dk>
References: <1455705686-20822-1-git-send-email-matthew.shyu.amlogic@gmail.com>
 <8737sr1ise.fsf@dell.be.48ers.dk>
Message-ID: <CAJjDOTnPLk-zo4+fxFtrbfUCWo+q9fcHcPE3fRQxUscXHkfjKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wednesday, February 17, 2016, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Matthew" == Matthew Shyu <matthew.shyu.amlogic@gmail.com
> <javascript:;>> writes:
>
>  > From: Matthew Shyu <matthew.shyu@amlogic.com <javascript:;>>
>  > The Configure script in openssl takes install_prefix from env by default
>  > $install_prefix= "$ENV{'INSTALL_PREFIX'}"
>  > However, the INSTALL_PREFIX points to *TARGET* folder instead of
>  > *HOST* folder.
>  > This is fixed by intentionally setting install_prefix to blank.
>
> Sorry, I'm not following you here. Do you mean that you have exported
> INSTALL_PREFIX=<something> in your environment outside Buildroot? We do
> indeed pass INSTALL_PREFIX to make install when we install the target
> version to staging/target, but I don't see the relation to the host
> variant?
>
> Yes, the INSTALL_PREFIX env is passed in  from buildroot.  However,  as
you said, it points to output/staging/usr.  For host variant, the correct
installation path should be output/host/usr, which is set by --prefix.  The
idea of this patch is for host-openssl not to use --install-prefix but to
use --prefix.


>
> > Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com <javascript:;>>
>  > ---
>  >  package/openssl/openssl.mk |    1 +
>  >  1 file changed, 1 insertion(+)
>
>  > diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
>  > index b7498a7..c35e93f 100644
>  > --- a/package/openssl/openssl.mk
>  > +++ b/package/openssl/openssl.mk
>  > @@ -63,6 +63,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
>  >              $(HOST_CONFIGURE_OPTS) \
>  >              ./config \
>  >              --prefix=$(HOST_DIR)/usr \
>  > +            --install_prefix= \
>  >              --openssldir=$(HOST_DIR)/etc/ssl \
>  >              --libdir=/lib \
>  >              shared \
>  > --
>  > 1.7.9.5
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net <javascript:;>
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
> Bye, Peter Korsgaard
>

Regards,
Matthew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160218/c159dbe7/attachment.html>
