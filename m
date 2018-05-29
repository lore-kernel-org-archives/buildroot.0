From: Martin Bark <martin@barkynet.com>
Date: Tue, 29 May 2018 10:48:48 +0100
Subject: [Buildroot] [PATCH 1/2] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <87a7sjuf97.fsf@dell.be.48ers.dk>
References: <20180506161944.7451-1-martin@barkynet.com>
 <87a7sjuf97.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxf5Nn5AKMJ6-n8Ue_qvoE-O9x09yoC9T1nbz5OOp5781g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 29 May 2018 at 07:50, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
>  > Copy certificates.crt to /etc/ssl/certs after we run c_rehash to
>  > prevent it getting hashed by mistake.
>
> What is the effect of running c_rehash on it? Just an extra symlink or
> any functional difference?
>

c_rehash hashes certificates.crt by mistake and that symlink clashes with
one of the CA certificates.  The end result is one of the hashes
incorrectly points to certificates.crt instead of the CA certificate.  I
noticed this during testing because i checked /etc/ssl/certs was the same
as under ubuntu.

Thanks Martin


>
>  > Signed-off-by: Martin Bark <martin@barkynet.com>
>  > ---
>  >  package/ca-certificates/ca-certificates.mk | 8 +++++++-
>  >  1 file changed, 7 insertions(+), 1 deletion(-)
>
>  > diff --git a/package/ca-certificates/ca-certificates.mk
> b/package/ca-certificates/ca-certificates.mk
>  > index cb0e961465..b99e6f47ca 100644
>  > --- a/package/ca-certificates/ca-certificates.mk
>  > +++ b/package/ca-certificates/ca-certificates.mk
>  > @@ -30,14 +30,20 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
>
>  >      # Create symlinks to certificates under /etc/ssl/certs
>  >      # and generate the bundle
>  > +    rm -f $(@D)/ca-certificates.crt
>  >      cd $(TARGET_DIR) ;\
>  >      for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
>  >              ln -sf ../../../$$i etc/ssl/certs/`basename $${i}
> .crt`.pem ;\
>  > -            cat $$i >>etc/ssl/certs/ca-certificates.crt ;\
>  > +            cat $$i >>$(@D)/ca-certificates.crt ;\
>  >      done
>
> Alternatively we could redirect the entire for loop to the bundle, E.G.
>
> done > $(@D)/ca-certificates.crt
>
> While this seems like an improvement for when ca-certificates-reinstall
> is run, I'm not sure what the relation is to $SUBJECT?
>
>  >      # Create symlinks to the certificates by their hash values
>  >      $(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
>  > +
>  > +    # Install the certificates bundle we just created
>  > +    $(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
>  > +            $(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
>  > +
>  >  endef
>
>  >  $(eval $(generic-package))
>  > --
>  > 2.17.0
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/44c60e85/attachment.html>
