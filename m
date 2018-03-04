From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 4 Mar 2018 22:41:31 +0200
Subject: [Buildroot] [PATCH 1/1] czmq: bump to version v4.1.0
In-Reply-To: <61e3571e-d247-7c16-a80c-59317228247f@mind.be>
References: <20180224164305.6133-1-asafka7@gmail.com>
 <d43c54d6-2c1b-c2fb-06ee-e396490fbb69@mind.be>
 <CALFsTFWDLH5gJuPRLtYEqV8fJSs0Rt9mMg4BpMFmKSJp-Nvjow@mail.gmail.com>
 <61e3571e-d247-7c16-a80c-59317228247f@mind.be>
Message-ID: <CALFsTFURrVY9gk2nQMQmbzq14M5yFO2BAa7iWawbzeSJ9RcWjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, thanks again. Though I still don't see the patch on next... DId you
apply it?

Asaf.

On Fri, Mar 2, 2018 at 10:38 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>  Hi Asaf,
>
> On 26-02-18 20:20, Asaf Kahlon wrote:
> > Hi Arnout, thanks for the productive comments.
> > I fixed all, but didn't change CZMQ_AUTORECONF because it seems all the
> > autotools-related files were generated and expect autotools version of
> 1.14 and
> > can't be compiled with 1.15.
>
>  This statement doesn't make sense to me. But I understand why it is
> needed, see
> below.
>
> > I uploaded a new patch here. Tell me if there's something else you want
> to change.
>
>  Thank you for that. However, you should still submit it as a proper patch
> in a
> separate e-mail, using git send-email (not just pasting it in a mail). If
> you
> send it like this, it gets incorrectly line-wrapped and can't be applied.
>
> > Signed-off-by: Asaf Kahlon <asafka7 at gmail.com <mailto:asafka7@gmail.com
> >>
>
>  If you want to keep me in Cc of new versions, you can add here a line:
>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> and git send-email will also send it to me directly.
>
> > ---
>
>  The additional remarks (i.e. "I fixed all comments, but didn't
> change...") you
> can put directly in the git commit message, here, below the --- line. That
> way,
> they will be in the mail but will not be included in the final git history.
>
> >  package/czmq/czmq.hash |  6 +++++-
> >  package/czmq/czmq.mk <http://czmq.mk>   | 10 ++--------
> >  2 files changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
> > index 526ea594b9..c0a7176f8d 100644
> > --- a/package/czmq/czmq.hash
> > +++ b/package/czmq/czmq.hash
> > @@ -1,2 +1,6 @@
> > +# From https://github.com/zeromq/czmq/releases
> > +md5 d29baef1079f19a2c6a360eb6be984f8 czmq-4.1.0.tar.gz
> > +sha1 1d201a87205811367f7c92cbbd36a899edda68bf czmq-4.1.0.tar.gz
> >  # Locally calculated
> > -sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555
> > czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
> > +sha256 3befa35b4886b5298e8329b4f0aa5bb9bde0e7439bd3c5c53295cb988371fc11
> > czmq-4.1.0.tar.gz
> > +sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5
> LICENCE
> > diff --git a/package/czmq/czmq.mk <http://czmq.mk> b/package/czmq/
> czmq.mk
> > <http://czmq.mk>
> > index 5305789d7a..3c07845d9c 100644
> > --- a/package/czmq/czmq.mk <http://czmq.mk>
> > +++ b/package/czmq/czmq.mk <http://czmq.mk>
> > @@ -4,8 +4,8 @@
> >  #
> >  ###########################################################
> #####################
> >
> > -CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
> > -CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
> > +CZMQ_VERSION = 4.1.0
> > +CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(
> CZMQ_VERSION)
> >
> >  # Autoreconf required as we use the git tree
>
>  If autoreconf really is required, then this comment has to change, since
> now we
> are no longer using the git tree but we're using a tarball that does
> contain the
> configure script. However, now I see why it is needed. So change this
> comment into:
>
> # 0001-configure.ac-remove-Werror.patch touches configure.ac
>
>  I have made this small modification and applied to next, thanks! So there
> is no
> need to resubmit now.
>
>  Regards,
>  Arnout
>
> >  CZMQ_AUTORECONF = YES
> > @@ -18,10 +18,4 @@ CZMQ_LICENSE_FILES = LICENSE
> >  # host-python, so disable asciidoc entirely.
> >  CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
> >
> > -define CZMQ_CREATE_CONFIG_DIR
> > -mkdir -p $(@D)/config
> > -endef
> > -
> > -CZMQ_POST_PATCH_HOOKS += CZMQ_CREATE_CONFIG_DIR
> > -
> >  $(eval $(autotools-package))
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180304/39dca0ae/attachment.html>
